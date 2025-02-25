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

localparam IDLE 	= 'd0;
localparam FIND_OBJ	= 'd1;
localparam EXE 		= 'd2;
localparam DONE 	= 'd3;

reg [2:0] state, next_state;

reg [15:0] rom_buffer;
reg [2:0] count;
reg back_flag;

reg [7:0] min_temp;

wire backward_remain = res_di == 'd1;
wire count_done = back_flag ? (count == 'd5) : (count == 'd4);

// control
wire find_obj 		= sti_di != 16'd0;
wire current_obj	= back_flag ? (rom_buffer[0] & !(backward_remain & count == 'd0)) : rom_buffer[15];
wire obj_done 		= count_done;
wire buffer_empty	= rom_buffer == 16'd0;
wire forward_done	= sti_addr == 'd1023-'d8;
wire backward_done	= sti_addr == 'd8 & back_flag;

// output
assign sti_rd 	= 1'b1;
assign res_wr 	= count_done;
assign res_rd 	= ~res_wr;
assign res_do 	= min_temp;
assign done		= state == DONE;
assign fw_finish=back_flag;

// FSM
always @(*) begin
	case(state)
		IDLE 		: next_state = FIND_OBJ;
		FIND_OBJ	: next_state = backward_done? DONE 		: (find_obj ? EXE : FIND_OBJ);
		EXE 		: next_state = buffer_empty ? FIND_OBJ	: EXE;
		DONE 		: next_state = IDLE;
		default		: next_state = IDLE;
	endcase
end

always @(posedge clk or negedge reset) begin
	if (!reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

// input regs
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		rom_buffer <= 'd0;
	end
	else if (state == FIND_OBJ) begin
		rom_buffer <= sti_di;
	end
	else if (state == EXE & (!current_obj | obj_done)) begin
		rom_buffer <= back_flag ? (rom_buffer >> 1) : (rom_buffer << 1);
	end
end

always @(posedge clk or negedge reset) begin
	if (!reset) begin
		back_flag <= 1'b0;
	end
	else if (forward_done) begin
		back_flag <= 1'b1;
	end
end

// counter
always @(posedge clk or negedge reset) begin
	if (!reset) begin
		count <= 'd0;
	end
	else if (state == EXE & current_obj) begin
		count <= count_done ? 'd0 : (count + 'd1);
	end
end

always @(posedge clk or negedge reset) begin
	if (!reset) begin
		sti_addr <= 'd0;
	end
	else if (state == FIND_OBJ & buffer_empty) begin
		sti_addr <= back_flag ? (sti_addr - 'd1) : (sti_addr + 'd1);
	end
end

always @(posedge clk or negedge reset) begin
	if (!reset) begin
		res_addr <= 'd0;
	end
	else if (state == FIND_OBJ) begin
		res_addr <= back_flag ? ((sti_addr << 4) + 'd15) : ((sti_addr << 4) - 'd1);
	end
	else if (state == EXE) begin
		if (!current_obj) begin
			res_addr <= back_flag ? (res_addr - 'd1) : (res_addr + 'd1);
		end
		else if (back_flag) begin
			case(count)
				'd0 : res_addr <= res_addr + 'd1;
				'd1 : res_addr <= res_addr + 'd128;
				'd2 : res_addr <= res_addr - 'd1;
				'd3 : res_addr <= res_addr - 'd1;
				'd4 : res_addr <= res_addr - 'd127;
				'd5 : res_addr <= res_addr - 'd1;
			endcase
		end
		else begin
			case(count)
				'd0 : res_addr <= res_addr - 'd128;
				'd1 : res_addr <= res_addr + 'd1;
				'd2 : res_addr <= res_addr + 'd1;
				'd3 : res_addr <= res_addr + 'd127;
			endcase
		end
	end
end

always @(posedge clk or negedge reset) begin
	if (!reset) begin
		min_temp <= 'd0;
	end
	else if (state == EXE) begin
		if (count == 'd0) begin
			min_temp <= back_flag ? res_di : (res_di + 'd1);
		end
		else begin
			min_temp <= ((res_di + 'd1) < min_temp) ? (res_di + 'd1) : min_temp;
		end
	end
end

endmodule
