module DT (
	input 				clk, 
	input				reset,
	output				done, 
	output				sti_rd,
	output	reg	[9:0]	sti_addr,
	input		[15:0]	sti_di,
	output				res_wr,
	output				res_rd ,
	output	reg [13:0]	res_addr,
	output		[7:0]	res_do,
	input		[7:0]	res_di/*,
	output				fw_stop*/
);

// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
localparam IDLE 			= 3'd0;
localparam READ_STI_MEM 	= 3'd1;
localparam FORWARD 			= 3'd2;
localparam FOR_WRITE_MEM	= 3'd3;
localparam BACKEARD 		= 3'd4;
localparam BACK_WRITE_MEM 	= 3'd5;
localparam DONE 			= 3'd6;

// forward index encoding
localparam READ_NW 	= 3'd0;
localparam READ_N 	= 3'd1;
localparam READ_NE 	= 3'd2;
localparam READ_W 	= 3'd3;

// backward index encoding
localparam READ_MID	= 3'd0;
localparam READ_SE 	= 3'd1;
localparam READ_S 	= 3'd2;
localparam READ_SW 	= 3'd3;
localparam READ_E 	= 3'd4;


// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [2:0] state, next_state;

// coordinate
reg [6:0] X, Y;

reg [3:0] index;
reg [3:0] count;

reg [7:0] min_temp;

reg sti_object_flag_reg;
reg res_object_flag_reg;


// ====================================================================	//
// 							Combination (Wires)  						//
// ====================================================================	//
wire IDLE_wire			= state == IDLE;
wire READ_STI_MEM_wire	= state == READ_STI_MEM;
wire FORWARD_wire		= state == FORWARD;
wire FOR_WRITE_MEM_wire	= state == FOR_WRITE_MEM;
wire BACKEARD_wire		= state == BACKEARD;
wire BACK_WRITE_MEM_wire= state == BACK_WRITE_MEM;
wire DONE_wire			= state == DONE;

wire FORWARD_STATE_WIRE = READ_STI_MEM_wire | FORWARD_wire | FOR_WRITE_MEM_wire;
wire BACKWARD_STATE_WIRE= BACKEARD_wire | BACK_WRITE_MEM_wire;

wire X_done = X == 7'd127;
wire Y_done = Y == 7'd127;
wire X_zero = X == 7'd0;
wire Y_zero = Y == 7'd0;

wire count_done = (FORWARD_wire & count == 3'd3) | (BACKEARD_wire & count == 3'd4);
wire index_done = index == 4'd0;

wire sti_object_flag	= sti_di[index];
wire res_object_flag	= res_object_flag | res_object_flag_reg; 
wire object_flag		= sti_object_flag | res_object_flag;

wire [7:0] res_di_plus1 = res_di + 8'd1; // for backward pass

wire for_all_pix_done	= (X_done & Y_done) & (sti_addr == 10'd1023);
wire back_all_pix_done	= (X_zero & Y_zero);

wire mem_forward_done	= index_done;

wire forward_done		= (~sti_object_flag) | count_done;
wire backward_done		= (~res_object_flag) | count_done;

assign sti_rd 	= READ_STI_MEM_wire;
assign res_rd	= FORWARD_wire | BACKEARD_wire;
assign res_wr	= FOR_WRITE_MEM_wire | BACK_WRITE_MEM_wire;
assign res_do	= (FOR_WRITE_MEM_wire & sti_object_flag) ? (min_temp + sti_object_flag_reg) : (BACK_WRITE_MEM_wire ? min_temp : 8'd0);
assign done		= DONE_wire;
// assign fw_stop	= X_done & Y_done & FOR_WRITE_MEM;

always@(*) begin
	if(FORWARD_wire) begin
		case(count)
			READ_NW : res_addr = {X-7'd1, Y-7'd1};
			READ_N 	: res_addr = {X-7'd1, Y};
			READ_NE : res_addr = {X-7'd1, Y+7'd1};
			READ_W 	: res_addr = {X, Y-7'd1};
			default	: res_addr = 14'd0;
		endcase
	end
	else if(BACKEARD_wire) begin
		case(count)
			READ_MID: res_addr = {X, Y};
			READ_SE : res_addr = {X+7'd1, Y+7'd1};
			READ_S 	: res_addr = {X+7'd1, Y};
			READ_SW : res_addr = {X+7'd1, Y-7'd1};
			READ_E 	: res_addr = {X, Y+7'd1};
			default	: res_addr = 14'd0;
		endcase
	end
	else if(FOR_WRITE_MEM_wire | BACK_WRITE_MEM_wire) begin
		res_addr = {X, Y};
	end
	else begin
		res_addr = 14'd0;
	end
end

// next state logic
always@(*) begin
	case(state)
		IDLE 			: next_state = READ_STI_MEM;
		READ_STI_MEM 	: next_state = FORWARD;
		FORWARD 		: next_state = forward_done  		? FOR_WRITE_MEM 	: FORWARD;
		FOR_WRITE_MEM	: next_state = for_all_pix_done  	? BACKEARD	 		: (mem_forward_done ? READ_STI_MEM : FORWARD);
		
		BACKEARD 		: next_state = backward_done 		? BACK_WRITE_MEM 	: BACKEARD;
		BACK_WRITE_MEM 	: next_state = back_all_pix_done  	? DONE	 			: BACKEARD;
		DONE 			: next_state = IDLE;
		default			: next_state = IDLE;
	endcase
end


// ====================================================================	//
// 						 		Sequential  							//
// ====================================================================	//
// FSM
always@(posedge clk or negedge reset) begin
	if(!reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

always@(posedge clk or negedge reset) begin
	if(!reset) begin
		sti_addr <= 10'd0;
	end
	else if(FOR_WRITE_MEM_wire & mem_forward_done) begin
		sti_addr <= sti_addr + 10'd1;
	end
end

always@(posedge clk or negedge reset) begin
	if(!reset) begin
		Y <= 7'd0;
	end
	else if(FOR_WRITE_MEM_wire) begin
		Y <= (X_done & Y_done) ? 7'd127 : (Y_done ? 7'd0 : (Y + 7'd1));
	end
	else if(BACK_WRITE_MEM_wire) begin
		Y <= Y_zero ? 7'd127 : (Y - 7'd1);
	end
end

always@(posedge clk or negedge reset) begin
	if(!reset) begin
		X <= 7'd0;
	end
	else if(FOR_WRITE_MEM_wire) begin
		X <= (X_done & Y_done) ? 7'd127 : (Y_done ? (X + 7'd1) : X);
	end
	else if(BACK_WRITE_MEM_wire) begin
		X <= Y_zero ? (X - 7'd1) : X;
	end
end

always@(posedge clk or negedge reset) begin
	if(!reset) begin
		count <= 3'd0;
	end
	else if((FORWARD_wire & sti_object_flag) | (BACKEARD_wire & res_object_flag)) begin
		count <= count_done ? 3'd0 : (count + 3'd1);
	end
end

always@(posedge clk or negedge reset) begin
	if(!reset) begin
		index <= 4'd15;
	end
	else if(FOR_WRITE_MEM_wire | BACK_WRITE_MEM_wire) begin
		index <= index_done ? 4'd15 : (index - 4'd1);
	end
	else if(READ_STI_MEM_wire) begin
		index <= 4'd15;
	end
end

always@(posedge clk or negedge reset) begin
	if(!reset) begin
		min_temp <= 8'd255;
	end
	else if(FORWARD_wire) begin
		min_temp <= (res_di < min_temp) ? res_di : min_temp;
	end
	else if(BACKEARD_wire) begin
		if(count == 3'd0) begin
			min_temp <= res_di;
		end
		else begin
			min_temp <= (res_di_plus1 < min_temp) ? res_di_plus1 : min_temp;
		end
	end
	else begin
		min_temp <= 8'd255;
	end
end

always@(posedge clk or negedge reset) begin
	if(!reset) begin
		sti_object_flag_reg <= 1'b0;
	end
	else begin
		sti_object_flag_reg <= sti_object_flag;
	end
end

always@(posedge clk or negedge reset) begin
	if(!reset) begin
		res_object_flag_reg <= 1'b0;
	end
	else if(count == 3'd0 & res_di != 8'd0) begin
		res_object_flag_reg <= 1'b1;
	end
	else if(count_done) begin
		res_object_flag_reg <= 1'b0;
	end
end


endmodule
