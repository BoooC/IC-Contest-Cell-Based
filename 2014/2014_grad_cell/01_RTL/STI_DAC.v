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

STI STI_inst (
	.clk		(clk		),
	.reset		(reset		),
	.load		(load		),
	.pi_msb		(pi_msb		),
	.pi_low		(pi_low		),
	.pi_end		(pi_end		),
	.pi_data	(pi_data	),
	.pi_length	(pi_length	),
	.pi_fill	(pi_fill	),
	.so_data	(so_data	),
	.so_valid	(so_valid	),
	.so_end		(so_end		)
);

DAC DAC_inst (
	.clk		(clk		),
	.reset		(reset		),
	.so_data	(so_data	),
	.so_valid	(so_valid	),
	.so_end		(so_end		),
	.oem_finish	(oem_finish	),
	.odd1_wr	(odd1_wr	),
	.odd2_wr	(odd2_wr	),
	.odd3_wr	(odd3_wr	),
	.odd4_wr	(odd4_wr	),
	.even1_wr	(even1_wr	),
	.even2_wr	(even2_wr	),
	.even3_wr	(even3_wr	),
	.even4_wr	(even4_wr	),
	.oem_addr	(oem_addr	),
	.oem_dataout(oem_dataout)
);

endmodule



module STI (
	input			clk, 
	input 			reset,
	input			load, pi_msb, pi_low, pi_end,
	input	[15:0]	pi_data,
	input	[1:0]	pi_length,
	input			pi_fill,
	output reg		so_data, so_valid, so_end
);

parameter LEN_08 = 2'b00;
parameter LEN_16 = 2'b01;
parameter LEN_24 = 2'b10;
parameter LEN_32 = 2'b11;

localparam IDLE = 'd0;
localparam DOUT	= 'd1;

reg [1:0] state, next_state;

// input regs
reg [31:0] data_buffer;
reg [4:0]  pi_length_reg;

reg [4:0] count;
reg count_done_reg;

wire [15:0] reverse_data = {pi_data[0],  pi_data[1],  pi_data[2],  pi_data[3], 
							pi_data[4],  pi_data[5],  pi_data[6],  pi_data[7], 
							pi_data[8],  pi_data[9],  pi_data[10], pi_data[11], 
							pi_data[12], pi_data[13], pi_data[14], pi_data[15]};

wire [4:0] ptr = 'd31 - count;

wire count_done = count == pi_length_reg;
wire out_done = count_done;

// FSM
always @(*) begin
	case(state)
		IDLE : next_state = load 	? DOUT : IDLE;
		DOUT : next_state = out_done? IDLE : DOUT; 
		default : next_state = IDLE;
	endcase
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

// input reg
always @(posedge clk) begin
	if (load) begin
		if (pi_msb) begin
			case (pi_length) 
				LEN_08 : data_buffer <= pi_low 	? {pi_data[15:8], 24'd0} : {pi_data[7:0], 24'd0};
				LEN_16 : data_buffer <= {pi_data, 16'd0};
				LEN_24 : data_buffer <= pi_fill ? {pi_data, 8'd0, 8'd0}  : {8'd0,  pi_data, 8'd0};
				LEN_32 : data_buffer <= pi_fill ? {pi_data, 16'd0} : {16'd0, pi_data};
				default : data_buffer <= 32'd0;
			endcase
		end
		else begin
			case (pi_length) 
				LEN_08 : data_buffer <= pi_low 	? {reverse_data[7:0], 24'd0} : {reverse_data[15:8], 24'd0};
				LEN_16 : data_buffer <= {reverse_data, 16'd0};
				LEN_24 : data_buffer <= pi_fill ? {8'd0,  reverse_data, 8'd0} : {reverse_data, 8'd0, 8'd0};
				LEN_32 : data_buffer <= pi_fill ? {16'd0, reverse_data} : {reverse_data, 16'd0};
				default : data_buffer <= 32'd0;
			endcase
		end
	end
end

always @(posedge clk) begin
	if (load) begin
		case (pi_length)
			LEN_08 : pi_length_reg <= 'd7;
			LEN_16 : pi_length_reg <= 'd15;
			LEN_24 : pi_length_reg <= 'd23;
			LEN_32 : pi_length_reg <= 'd31;
		endcase
	end
end

// counter
always @(posedge clk or posedge reset) begin
	if (reset) begin
		count <= 'd0;
	end
	else if(state == DOUT) begin
		count <= count_done ? 'd0 : (count + 'd1);
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		count_done_reg <= 1'b0;
	end
	else if(count_done) begin
		count_done_reg <= 1'b1;
	end
	else begin
		count_done_reg <= 1'b0;
	end
end

// output
always @(posedge clk or posedge reset) begin
	if (reset) begin
		so_data <= 1'b0;
	end
	else if(state == DOUT) begin
		so_data <= data_buffer[ptr];
	end
	else begin
		so_data <= 1'b0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		so_valid <= 1'b0;
	end
	else if(state == DOUT) begin
		so_valid <= 1'b1;
	end
	else begin
		so_valid <= 1'b0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		so_end <= 1'b0;
	end
	else if(pi_end & count_done_reg) begin
		so_end <= 1'b1;
	end
end


endmodule



module DAC (
	input			clk, 
	input 			reset,
	input 			so_data, so_valid,
	input			so_end,
	output  		oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr,
	output  [4:0] 	oem_addr,
	output  [7:0] 	oem_dataout
);

reg [7:0] data_buffer;
reg [2:0] count;

// mem
reg [4:0] mem_addr;
reg wr_flag;
reg even_col_flag, even_row_flag;
reg [1:0] mem_idx; // 1 ~ 4

reg finish_reg;
reg so_end_toggle;

wire count_done = count == 'd7;

// output
assign odd1_wr = wr_flag & (even_row_flag ~^ even_col_flag) & mem_idx == 'd0;
assign odd2_wr = wr_flag & (even_row_flag ~^ even_col_flag) & mem_idx == 'd1;
assign odd3_wr = wr_flag & (even_row_flag ~^ even_col_flag) & mem_idx == 'd2;
assign odd4_wr = wr_flag & (even_row_flag ~^ even_col_flag) & mem_idx == 'd3;

assign even1_wr = wr_flag & (even_row_flag ^ even_col_flag) & mem_idx == 'd0;
assign even2_wr = wr_flag & (even_row_flag ^ even_col_flag) & mem_idx == 'd1;
assign even3_wr = wr_flag & (even_row_flag ^ even_col_flag) & mem_idx == 'd2;
assign even4_wr = wr_flag & (even_row_flag ^ even_col_flag) & mem_idx == 'd3;

assign oem_addr 	= mem_addr;
assign oem_dataout 	= data_buffer;
assign oem_finish 	= finish_reg;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		data_buffer <= 'd0;
	end
	else if(so_end) begin
		data_buffer <= 'd0;
	end
	else if(so_valid) begin
		data_buffer[0] <= so_data;
		data_buffer[1] <= data_buffer[0];
		data_buffer[2] <= data_buffer[1];
		data_buffer[3] <= data_buffer[2];
		data_buffer[4] <= data_buffer[3];
		data_buffer[5] <= data_buffer[4];
		data_buffer[6] <= data_buffer[5];
		data_buffer[7] <= data_buffer[6];
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		count <= 'd0;
	end
	else if(so_valid) begin
		count <= count + 'd1;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		wr_flag <= 1'b0;
	end
	else if(count_done | so_end_toggle) begin
		wr_flag <= 1'b1;
	end
	else begin
		wr_flag <= 1'b0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		so_end_toggle <= 1'b0;
	end
	else if(so_end) begin
		so_end_toggle <= ~so_end_toggle;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		mem_addr <= 'd0;
	end
	else if(wr_flag & even_col_flag) begin
		mem_addr <= mem_addr + 'd1;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		even_col_flag <= 1'b0;
	end
	else if(wr_flag) begin
		even_col_flag <= ~even_col_flag;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		even_row_flag <= 1'b0;
	end
	else if(wr_flag & even_col_flag & (mem_addr % 'd4 == 'd3)) begin
		even_row_flag <= ~even_row_flag;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		mem_idx <= 'd0;
	end
	else if(wr_flag & even_col_flag & mem_addr == 'd31) begin
		mem_idx <= mem_idx + 'd1;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		finish_reg <= 1'b0;
	end
	else if(wr_flag & even_col_flag & mem_addr == 'd31 & mem_idx == 'd3) begin
		finish_reg <= 1'b1;
	end
end

endmodule
