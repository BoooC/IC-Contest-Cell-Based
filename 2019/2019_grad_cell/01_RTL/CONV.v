module  CONV(
	input						clk, 
	input						reset, 
	output						busy,	
	input						ready,				
	output reg			[11:0]	iaddr,
	input 		signed	[19:0]	idata,	
	output reg	 		 		cwr,
	output reg			[11:0] 	caddr_wr,
	output reg	signed	[19:0] 	cdata_wr,	
	output 				 		crd,
	output reg			[11:0]	caddr_rd,
	input		signed	[19:0]	cdata_rd,
	output reg			[2:0] 	csel
);

parameter signed	KERNEL0_00 = 20'h0A89E, KERNEL0_01 = 20'h092D5, KERNEL0_02 = 20'h06D43,
					KERNEL0_10 = 20'h01004, KERNEL0_11 = 20'hF8F71, KERNEL0_12 = 20'hF6E54,
					KERNEL0_20 = 20'hFA6D7, KERNEL0_21 = 20'hFC834, KERNEL0_22 = 20'hFAC19,
					KERNEL0_BIAS = 20'h01310;

parameter signed	KERNEL1_00 = 20'hFDB55, KERNEL1_01 = 20'h02992, KERNEL1_02 = 20'hFC994,
					KERNEL1_10 = 20'h050FD, KERNEL1_11 = 20'h02F20, KERNEL1_12 = 20'h0202D,
					KERNEL1_20 = 20'h03BD7, KERNEL1_21 = 20'hFD369, KERNEL1_22 = 20'h05E68,
					KERNEL1_BIAS = 20'hF7295;

localparam IDLE 	= 'd0;
localparam CONV_0 	= 'd1;
localparam WAIT_0	= 'd2;
localparam CONV_1 	= 'd3;
localparam WAIT_1	= 'd4;
localparam POOL_0 	= 'd5;
localparam POOL_1 	= 'd6;
localparam FLATTEN 	= 'd7;

reg [2:0] state, next_state;

reg [5:0] addr_x, addr_y;
reg [3:0] count;

reg conv_done_reg1, conv_done_reg2, conv_done_reg;
reg fla_done_reg;
reg count_done_reg, count_done_reg2;
reg signed [39:0] psum_reg;
reg [19:0] round_out_reg;
reg [18:0] pool_reg;

// conv operation
reg  signed [19:0] ifmap_reg;
reg  signed [19:0] weight_reg;
wire signed [39:0] psum_wire = ifmap_reg * weight_reg;
wire signed [39:0] bias = (state == CONV_0 | state == WAIT_0) ? {4'd0, KERNEL0_BIAS, 16'd0} : {4'd15, KERNEL1_BIAS, 16'd0};
wire signed [40:0] psum_bias = psum_reg + bias;
wire [39:0] relu_out = psum_bias[40] ? 40'd0 : psum_bias[39:0];
wire [19:0] round_out = relu_out[15] ? ({relu_out[35:32], relu_out[31:16]} + 'd1) : {relu_out[35:32], relu_out[31:16]};

// control
wire caddr_wr_done = (state == CONV_0 | state == CONV_1) ? (caddr_wr == 'd4095) : 
					 (state == POOL_0 | state == POOL_1) ? (caddr_wr == 'd1023) : (caddr_wr == 'd2047);

wire addr_x_done = (state == CONV_0 | state == CONV_1) ? (addr_x == 'd63) : 
				   (state == POOL_0 | state == POOL_1) ? (addr_x == 'd62) : (addr_x == 'd31);
wire addr_y_done = (state == CONV_0 | state == CONV_1) ? (addr_y == 'd63) : 
				   (state == POOL_0 | state == POOL_1) ? (addr_y == 'd62) : (addr_y == 'd31);
wire count_done  = (state == CONV_0 | state == CONV_1) ? (count == 'd8) : 
				   (state == POOL_0 | state == POOL_1) ? (count == 'd4) : (count == 'd3);

wire conv_done = addr_x_done & addr_y_done & count_done;
wire pool_done = addr_x_done & addr_y_done & count_done;
wire flatten_done = caddr_wr == 'd2047;

// output
assign busy = state != IDLE;
assign crd = ~cwr;

// FSM
always@(*) begin
	case(state)
		IDLE 	: next_state = ready 		? CONV_0 	: IDLE;
		CONV_0 	: next_state = conv_done 	? WAIT_0 	: CONV_0;
		WAIT_0	: next_state = conv_done_reg? CONV_1 	: WAIT_0;
		CONV_1 	: next_state = conv_done 	? WAIT_1 	: CONV_1;
		WAIT_1	: next_state = conv_done_reg? POOL_0 	: WAIT_1;
		POOL_0 	: next_state = pool_done 	? POOL_1 	: POOL_0;
		POOL_1 	: next_state = pool_done 	? FLATTEN 	: POOL_1;
		FLATTEN	: next_state = fla_done_reg	? IDLE		: FLATTEN;
		default	: next_state = IDLE;
	endcase
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

// counter
always@(posedge clk or posedge reset) begin
	if(reset) begin
		addr_x <= 'd0;
	end
	else if ((state == CONV_0 | state == CONV_1) & count_done) begin
		addr_x <= addr_x_done ? 'd0 : (addr_x + 'd1);
	end
	else if ((state == POOL_0 | state == POOL_1) & count_done) begin
		addr_x <= addr_x_done ? 'd0 : (addr_x + 'd2);
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		addr_y <= 'd0;
	end
	else if ((state == CONV_0 | state == CONV_1) & count_done & addr_x_done) begin
		addr_y <= addr_y_done ? 'd0 : (addr_y + 'd1);
	end
	else if ((state == POOL_0 | state == POOL_1) & count_done & addr_x_done) begin
		addr_y <= addr_y_done ? 'd0 : (addr_y + 'd2);
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		count <= 'd0;
	end
	else if (state == WAIT_0 | state == WAIT_1) begin
		count <= 'd0;
	end
	else if (state != IDLE) begin
		count <= count_done ? 'd0 : (count + 'd1);
	end
end


always@(posedge clk or posedge reset) begin
	if(reset) begin
		count_done_reg 	<= 'd0;
		count_done_reg2	<= 'd0;

		conv_done_reg1 	<= 'd0;
		conv_done_reg2 	<= 'd0;
		conv_done_reg 	<= 'd0;

		fla_done_reg 	<= 'd0;
	end
	else begin
		count_done_reg 	<= count_done;
		count_done_reg2	<= count_done_reg;

		conv_done_reg1 	<= conv_done;
		conv_done_reg2 	<= conv_done_reg1;
		conv_done_reg 	<= conv_done_reg2;

		fla_done_reg 	<= flatten_done;
	end
end

wire padding_flag = (addr_x == 'd0  & addr_y == 'd0  & (count == 'd0 | count == 'd1 | count == 'd2 | count == 'd3 | count == 'd6)) | 
					(addr_x == 'd63 & addr_y == 'd0  & (count == 'd0 | count == 'd1 | count == 'd2 | count == 'd5 | count == 'd8)) |
					(addr_x == 'd0  & addr_y == 'd63 & (count == 'd0 | count == 'd3 | count == 'd6 | count == 'd7 | count == 'd8)) |
					(addr_x == 'd63 & addr_y == 'd63 & (count == 'd2 | count == 'd5 | count == 'd6 | count == 'd7 | count == 'd8)) |
					(addr_x == 'd0  & (count == 'd0 | count == 'd3 | count == 'd6)) |
					(addr_x == 'd63 & (count == 'd2 | count == 'd5 | count == 'd8)) |
					(addr_y == 'd0  & (count == 'd0 | count == 'd1 | count == 'd2)) |
					(addr_y == 'd63 & (count == 'd6 | count == 'd7 | count == 'd8));

always@(*) begin
	if (state == CONV_0) begin
		case(count)
			'd1 : weight_reg = KERNEL0_00;
			'd2 : weight_reg = KERNEL0_01;
			'd3 : weight_reg = KERNEL0_02;
			'd4 : weight_reg = KERNEL0_10;
			'd5 : weight_reg = KERNEL0_11;
			'd6 : weight_reg = KERNEL0_12;
			'd7 : weight_reg = KERNEL0_20;
			'd8 : weight_reg = KERNEL0_21;
			'd0 : weight_reg = KERNEL0_22;
			default : weight_reg = 'd0;
		endcase
	end
	else begin
		case(count)
			'd1 : weight_reg = KERNEL1_00;
			'd2 : weight_reg = KERNEL1_01;
			'd3 : weight_reg = KERNEL1_02;
			'd4 : weight_reg = KERNEL1_10;
			'd5 : weight_reg = KERNEL1_11;
			'd6 : weight_reg = KERNEL1_12;
			'd7 : weight_reg = KERNEL1_20;
			'd8 : weight_reg = KERNEL1_21;
			'd0 : weight_reg = KERNEL1_22;
			default : weight_reg = 'd0;
		endcase
	end
end

always@(posedge clk) begin
	ifmap_reg <= padding_flag ? 'd0 : idata;
end

always@(posedge clk) begin
	if (count == 'd1) begin
		psum_reg <= psum_wire;
	end
	else begin
		psum_reg <= psum_reg + psum_wire;
	end
end

always@(posedge clk) begin
	round_out_reg <= round_out;
end


always@(posedge clk or posedge reset) begin
	if(reset) begin
		pool_reg <= 'd0;
	end
	else if (state == POOL_0 | state == POOL_1) begin
		if (count == 'd0) begin
			pool_reg <= cdata_rd;
		end
		else begin
			pool_reg <= (pool_reg > cdata_rd) ? pool_reg : cdata_rd;
		end
	end
end




// output
always@(*) begin
	case(count)
		'd0 : iaddr = {addr_y - 6'd1, addr_x - 6'd1};
		'd1 : iaddr = {addr_y - 6'd1, addr_x - 6'd0};
		'd2 : iaddr = {addr_y - 6'd1, addr_x + 6'd1};
		'd3 : iaddr = {addr_y - 6'd0, addr_x - 6'd1};
		'd4 : iaddr = {addr_y - 6'd0, addr_x - 6'd0};
		'd5 : iaddr = {addr_y - 6'd0, addr_x + 6'd1};
		'd6 : iaddr = {addr_y + 6'd1, addr_x - 6'd1};
		'd7 : iaddr = {addr_y + 6'd1, addr_x - 6'd0};
		'd8 : iaddr = {addr_y + 6'd1, addr_x + 6'd1};
		default	: iaddr = 6'd0;
	endcase
end

always@(*) begin
	case(state)
		IDLE 	: csel = 3'b000;
		CONV_0 	: csel = 3'b001;
		WAIT_0	: csel = 3'b001;
		CONV_1 	: csel = 3'b010;
		WAIT_1	: csel = 3'b010;
		POOL_0 	: csel = (count == 'd4) ? 3'b011 : 3'b001;
		POOL_1 	: csel = (count == 'd4) ? 3'b100 : 3'b010;
		FLATTEN	: csel = (count == 'd0) ? 3'b011 : 
						 (count == 'd2) ? 3'b100 : 3'b101;
		default	: csel = 3'b000;
	endcase
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		cwr <= 1'b0;
	end
	else if (state == CONV_0 | state == CONV_1 | state == WAIT_0 | state == WAIT_1) begin
		cwr <= count_done_reg2;
	end
	else if (state == POOL_0 | state == POOL_1) begin
		cwr <= count == 'd3;
	end
	else if (state == FLATTEN) begin
		cwr <= count == 'd0 | count == 'd2;
	end
	else begin
		cwr <= 1'b0;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		caddr_wr <= 'd0;
	end
	else if (cwr) begin
		caddr_wr <= caddr_wr_done ? 'd0 : (caddr_wr + 'd1);
	end
end

always@(*) begin
	if (state == CONV_0 | state == CONV_1 | state == WAIT_0 | state == WAIT_1) begin
		cdata_wr = round_out_reg;
	end
	else if (state == POOL_0 | state == POOL_1) begin
		cdata_wr = pool_reg;
	end
	else if (state == FLATTEN) begin
		cdata_wr = cdata_rd;
	end
	else begin
		cdata_wr = 'd0;
	end
end

always@(*) begin
	if (state == POOL_0 | state == POOL_1) begin
		case(count)
			'd0 : caddr_rd = {addr_y + 6'd0, addr_x + 6'd0};
			'd1 : caddr_rd = {addr_y + 6'd0, addr_x + 6'd1};
			'd2 : caddr_rd = {addr_y + 6'd1, addr_x + 6'd0};
			'd3 : caddr_rd = {addr_y + 6'd1, addr_x + 6'd1};
			'd4 : caddr_rd = {addr_y + 6'd0, addr_x + 6'd0};
			default : caddr_rd = 'd0;
		endcase
	end
	else if (state == FLATTEN) begin
		caddr_rd = caddr_wr >> 1;
	end
	else begin
		caddr_rd = 'd0;
	end
end

endmodule
