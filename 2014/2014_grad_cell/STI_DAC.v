module STI_DAC(
	input			clk, 
	input 			reset,
	input			load, pi_msb, pi_low, pi_end,
	input	[15:0]	pi_data,
	input	[1:0]	pi_length,
	input			pi_fill,
	output 			so_data, so_valid,
	output  		oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr,
	output  [4:0] 	oem_addr,
	output  [7:0] 	oem_dataout
);

STI STI_inst(
	.clk		(clk		),
	.reset      (reset      ),
	.load       (load       ),
	.pi_msb     (pi_msb     ),
	.pi_low     (pi_low     ),
	.pi_data    (pi_data    ),
	.pi_length  (pi_length  ),
	.pi_fill    (pi_fill    ),
	.so_data    (so_data    ),
	.nxt_so_data(nxt_so_data),
	.so_valid   (so_valid   )
);

DAC DAC_inst(
	.clk		(clk		),
	.reset      (reset      ),
	.pi_end     (pi_end     ),
	.so_data    (so_data    ),
	.nxt_so_data(nxt_so_data),
	.so_valid   (so_valid   ),
	.oem_finish (oem_finish ),
	.odd1_wr    (odd1_wr    ),
	.odd2_wr    (odd2_wr    ),
	.odd3_wr    (odd3_wr    ),
	.odd4_wr    (odd4_wr    ),
	.even1_wr   (even1_wr   ),
	.even2_wr   (even2_wr   ),
	.even3_wr   (even3_wr   ),
	.even4_wr   (even4_wr   ),
	.oem_addr   (oem_addr   ),
	.oem_dataout(oem_dataout)
);

endmodule


module STI (
	input				clk, 
	input 				reset,
	input				load, 
	input				pi_msb, 
	input				pi_low, 
	input		[15:0]	pi_data,
	input		[1:0]	pi_length,
	input				pi_fill,
	output 				so_data, 
	output				nxt_so_data,
	output 				so_valid
);

// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
localparam IDLE 	= 1'd0;
localparam DATA_OUT	= 1'd1;

// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [1:0] state, next_state;
reg [4:0] count;

reg load_reg;

reg [31:0] pi_data_reg; 

// ====================================================================	//
// 							Combination (Wires)  						//
// ====================================================================	//
// state wire
wire IDLE_wire 		= state == IDLE;
wire DATA_OUT_wire 	= state == DATA_OUT;

// output length encoding
wire OUT_8b_wire  = pi_length == 2'b00;
wire OUT_16b_wire = pi_length == 2'b01;
wire OUT_24b_wire = pi_length == 2'b10;
wire OUT_32b_wire = pi_length == 2'b11;

reg [4:0] data_length;

wire [4:0] LSB_start_point 	= 5'd0;
wire [4:0] next_count 		= pi_msb ? count - 5'd1 : count + 5'd1;
// control signals
wire count_done		= (~pi_msb & count == data_length) | (pi_msb & count == LSB_start_point);
wire data_out_done	= count_done;

wire send_zero_flag = (OUT_24b_wire & pi_fill & count < 5'd8)  | (OUT_24b_wire & ~pi_fill & count > 5'd15) | 
					  (OUT_32b_wire & pi_fill & count < 5'd16) | (OUT_32b_wire & ~pi_fill & count > 5'd15);

// output
assign so_data 		= send_zero_flag ? 1'b0 : pi_data_reg[count];
assign nxt_so_data 	= send_zero_flag ? 1'b0 : pi_data_reg[next_count];
assign so_valid		= DATA_OUT_wire;

always@(*) begin
	case(pi_length)
		2'b00	: data_length = 5'd7;
		2'b01	: data_length = 5'd15;
		2'b10	: data_length = 5'd23;
		2'b11	: data_length = 5'd31;
		default	: data_length = 5'd0;
	endcase
end

// next state logic
always@(*) begin
	case(state)
		IDLE	: next_state = load_reg ? DATA_OUT : IDLE;
		DATA_OUT: next_state = data_out_done ? IDLE : DATA_OUT;
		default	: next_state = IDLE;
	endcase
end

// ====================================================================	//
// 						 		Sequential  							//
// ====================================================================	//
// FSM
always@(posedge clk or posedge reset) begin
	if(reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end


always@(posedge clk or posedge reset) begin
	if(reset) begin
		count <= 5'd0;
	end
	else if(load_reg) begin
		count <= pi_msb ? data_length : LSB_start_point;
	end
	else if(DATA_OUT) begin
		if(pi_msb) begin
			count <= count - 5'd1;
		end
		else begin
			count <= count + 5'd1;
		end
	end
	else begin
		count <= 5'd0;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		pi_data_reg <= 32'd0;
	end
	else if(load_reg) begin
		if(OUT_24b_wire) begin
			if(pi_fill) begin
				pi_data_reg[23:8]	<= pi_data;
				pi_data_reg[7:0] 	<= 8'd0;
			end
			else begin
				pi_data_reg[23:16]	<= 8'd0;
				pi_data_reg[15:0]	<= pi_data;
			end
		end
		else if(OUT_32b_wire) begin
			if(pi_fill) begin
				pi_data_reg[31:16]<= pi_data;
				pi_data_reg[15:0] <= 16'd0;
			end
			else begin
				pi_data_reg[31:16]<= 16'd0;
				pi_data_reg[15:0] <= pi_data;
			end
		end
		else if(OUT_8b_wire) begin
			if(pi_low) begin
				pi_data_reg[7:0] <= pi_data[15:8];
			end
			else begin
				pi_data_reg[7:0] <= pi_data[7:0];
			end
		end
		else begin
			pi_data_reg[16:0] <= pi_data;
		end
	end
	else if(IDLE_wire) begin
		pi_data_reg <= 32'd0;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		load_reg <= 1'b0;
	end
	else begin
		load_reg <= load;
	end
end


endmodule



module DAC (
	input				clk, 
	input 				reset,
	input				pi_end,
	input 				so_data, 
	input 				nxt_so_data,
	input				so_valid,
	output reg 			oem_finish, 
	output 				odd1_wr, 
	output 				odd2_wr, 
	output 				odd3_wr, 
	output 				odd4_wr, 
	output 				even1_wr, 
	output 				even2_wr, 
	output 				even3_wr, 
	output 				even4_wr,
	output reg 	[4:0] 	oem_addr,
	output  	[7:0] 	oem_dataout
);

// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [7:0] Buffer;
reg [2:0] ptr;

reg [1:0] mem_count;
reg [2:0] X;
reg odd_mem_flag;
reg even_mem_flag;

reg pi_end_reg;
reg ptr_done_reg;

// ====================================================================	//
// 							Combination (Wires)  						//
// ====================================================================	//
wire one_mem_full_flag 	= oem_addr == 5'd31;
wire ptr_done 			= ptr == 3'd0;
wire change_mem_pix 	= X[0];
wire mem_exchange_flag	= change_mem_pix & ptr_done;						// odd and even mem exchange
wire mem_change_flag 	= one_mem_full_flag & change_mem_pix & ptr_done;	// mem 1~4 change
wire X_done 			= X == 3'd7; 

wire mem_1_en = mem_count == 2'd0;
wire mem_2_en = mem_count == 2'd1;
wire mem_3_en = mem_count == 2'd2;
wire mem_4_en = mem_count == 2'd3;

wire mem_odd_en = ptr_done & odd_mem_flag;
wire mem_even_en= ptr_done & even_mem_flag;

assign odd1_wr  = mem_odd_en  & mem_1_en;
assign odd2_wr  = mem_odd_en  & mem_2_en;
assign odd3_wr  = mem_odd_en  & mem_3_en;
assign odd4_wr  = mem_odd_en  & mem_4_en;
assign even1_wr = mem_even_en & mem_1_en;
assign even2_wr = mem_even_en & mem_2_en;
assign even3_wr = mem_even_en & mem_3_en;
assign even4_wr = mem_even_en & mem_4_en;

assign oem_dataout = pi_end_reg ? 8'd0 : Buffer;

// ====================================================================	//
// 						 		Sequential  							//
// ====================================================================	//
// TODO : 
always@(posedge clk or posedge reset) begin
	if(reset) begin
		Buffer <= 8'd0;
	end
	else if(so_valid) begin
		Buffer[ptr] <= so_data;
		Buffer[0] 	<= nxt_so_data;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		ptr <= 3'd7;
	end
	else if(so_valid | pi_end_reg) begin
		ptr <= ptr - 3'd1;
	end
	else begin
		ptr <= 3'd7;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		oem_addr <= 5'd0;
	end
	else if(mem_exchange_flag) begin
		oem_addr <= oem_addr + 5'd1;
	end
	else if(mem_change_flag) begin
		oem_addr <= 5'd0;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		X <= 3'd0;
	end
	else if(ptr_done) begin
		X <= X_done ? 3'd0 : (X + 3'd1);
	end
end


always@(posedge clk or posedge reset) begin
	if(reset) begin
		odd_mem_flag <= 1'b1;
	end
	else if(ptr_done & ~X_done) begin
		odd_mem_flag <= ~odd_mem_flag;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		even_mem_flag <= 1'b0;
	end
	else if(ptr_done & ~X_done) begin
		even_mem_flag <= ~even_mem_flag;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		mem_count <= 2'd0;
	end
	else if(mem_change_flag) begin
		mem_count <= mem_count + 2'd1;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		pi_end_reg <= 1'b0;
	end
	else if(pi_end & mem_exchange_flag) begin
		pi_end_reg <= 1'b1;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		ptr_done_reg <= 1'b0;
	end
	else begin
		ptr_done_reg <= ptr_done;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		oem_finish <= 1'b0;
	end
	else if(mem_4_en & mem_change_flag) begin
		oem_finish <= 1'b1;
	end
end


endmodule

