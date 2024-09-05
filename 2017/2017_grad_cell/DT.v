module DT(
	input 			clk, 
	input			reset,
	output			done,

	// Read from ROM
	output			sti_rd,
	output	reg 	[9:0]	sti_addr,  // 0 ~ 1023
	input			[15:0]	sti_di,

	// Write / READ RAM 
	output			res_wr,
	output			res_rd,
	output	reg 	[13:0]	res_addr,
	output		 	[7:0]	res_do,
	input			[7:0]	res_di
);

// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
localparam IDLE  	= 1'd0;
localparam EXE 		= 1'd1;

// forward index encoding
localparam READ_W 	= 3'd0;
localparam READ_NW 	= 3'd1;
localparam READ_N 	= 3'd2;
localparam READ_NE 	= 3'd3;

// backward index encoding
localparam READ_MID	= 3'd0;
localparam READ_E 	= 3'd1;
localparam READ_SE 	= 3'd2;
localparam READ_S 	= 3'd3;
localparam READ_SW 	= 3'd4;
localparam WR_ADDR	= 3'd5;

// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg state, next_state;
reg [2:0] count;
reg [15:0] sti_di_buffer;
reg flag;
reg [7:0] min_temp;

// ====================================================================	//
// 							Combination (Wires)  						//
// ====================================================================	//
wire forward_flag 	= flag == 1'b0;
wire backward_flag 	= flag == 1'b1;

wire IDLE_wire 		= state == IDLE;
wire EXE_wire 		= state == EXE;

wire sti_addr_done 	= sti_addr 		== 10'd967;	// 1023-8*7
wire sti_addr_start	= sti_addr 		== 10'd56;	// 8*7
wire buffer_no_obj	= sti_di_buffer == 16'd0;
wire sti_no_obj		= sti_di 		== 16'd0;

wire count_done 	= (forward_flag & (count == 3'd4)) | (backward_flag & (count == 3'd5));

wire object_flag 	= forward_flag ? sti_di_buffer[15] : sti_di_buffer[0];

wire backward_cal_flag 		= (res_di != 8'd1) | (count != 3'd0);
wire res_do_updata_flag 	= (res_di + 8'd1) < res_do;

wire shift_buffer_forward 	= ~object_flag | count_done;
wire shift_buffer_backward 	= ~object_flag | ~backward_cal_flag | count_done;

// output
assign sti_rd 	= 1'b1;
assign res_rd 	= 1'b1;
assign res_wr 	= count_done;
assign res_do 	= min_temp;
assign done 	= IDLE_wire & backward_flag & sti_addr_start;

// next state logic
always@(*)begin
	case(state) 
		IDLE	: next_state = sti_no_obj 		? IDLE : EXE;
		EXE		: next_state = buffer_no_obj	? IDLE : EXE;
		default	: next_state = IDLE;
	endcase
end

// ====================================================================	//
// 						 		Sequential  							//
// ====================================================================	//
// FSM
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

// forward pass or backward pass flag
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		flag <= 1'b0;
	end
	else if (sti_addr_done) begin
		flag <= 1'b1;
	end
	else if(done) begin
		flag <= 1'b0;
	end
end

// output sti_addr
always @(posedge clk or negedge reset) begin
	if (!reset)
		sti_addr <= 10'd8;
	else if (IDLE_wire) begin
		sti_addr <= forward_flag ? (sti_addr + 10'd1) : (sti_addr - 10'd1);
	end
end

// input buffer
always @(posedge clk or negedge reset) begin
	if (!reset)
		sti_di_buffer <= 16'd0;
	else if (IDLE_wire) begin
		sti_di_buffer <= sti_di;
	end
	else if (EXE_wire) begin
		if (forward_flag & shift_buffer_forward) begin
			sti_di_buffer <= sti_di_buffer << 1;
		end
		else if (backward_flag & shift_buffer_backward) begin
			sti_di_buffer <= sti_di_buffer >> 1;
		end
	end
end

// global counter
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		count <= 3'd0;
	end
	else if (IDLE_wire) begin
		count <= 3'd0;
	end
	else if (EXE_wire & object_flag) begin
		if(forward_flag) begin 
			count <= (count == 3'd4) ? 3'd0 : (count + 3'd1);
		end
		else if (backward_cal_flag) begin
			count <= (count == 3'd5) ? 3'd0 : (count + 3'd1);
		end
	end
end

// output res_addr
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		res_addr <= 14'd0;
	end
	else if (IDLE_wire) begin
		res_addr <= forward_flag ? ((sti_addr << 4) - 14'd1) : ((sti_addr << 4) + 14'd15);
	end
	else if (EXE_wire) begin
		if(forward_flag) begin
			if(object_flag) begin
				case(count)
					READ_W 	: res_addr <= res_addr - 14'd128;	// W 	-> NW
					READ_NW : res_addr <= res_addr + 14'd1;		// NW 	-> N
					READ_N 	: res_addr <= res_addr + 14'd1;		// N 	-> NE
					READ_NE	: res_addr <= res_addr + 14'd127;	// NE 	-> wr_addr (next_W)
				endcase
			end
			else begin
				res_addr <= res_addr + 14'd1;
			end
		end
		else begin
			if(object_flag & backward_cal_flag) begin
				case(count)
					READ_MID: res_addr <= res_addr + 14'd1;		// mid		-> E
					READ_E 	: res_addr <= res_addr + 14'd128;	// E		-> SE
					READ_SE : res_addr <= res_addr - 14'd1;		// SE		-> S
					READ_S 	: res_addr <= res_addr - 14'd1;		// S		-> SW
					READ_SW : res_addr <= res_addr - 14'd127;	// SW		-> wr_addr
					WR_ADDR	: res_addr <= res_addr - 14'd1;		// wr_addr	-> next_mid
				endcase
			end
			else begin
				res_addr <= res_addr - 14'd1;
			end
		end
	end
end

// min_temp
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		min_temp <= 8'd0;
	end
	else if (forward_flag) begin
		min_temp <= (count == 3'd0 | res_do_updata_flag) ? (res_di + 8'd1) : min_temp;
	end
	else if (backward_cal_flag) begin
		min_temp <= res_do_updata_flag ? (res_di + 8'd1) : ((count == 3'd0) ? res_di : min_temp);
	end
end

endmodule
