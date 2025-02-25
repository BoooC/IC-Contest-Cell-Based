module SET ( 
	input 				clk, 
	input 				rst,
	input 				en,
	input 		[23:0] 	central,
	input 		[11:0] 	radius,
	input 		[1:0] 	mode,
	output reg 			busy,
	output reg			valid,
	output reg	[7:0]	candidate
);

localparam IDLE = 'd0;
localparam EXE 	= 'd1;
localparam DOUT = 'd2;

reg [1:0] state, next_state;

// input regs
reg [23:0] central_reg;
reg [11:0] radius_reg;
reg [1:0]  mode_reg;

// counter
reg [3:0] count_x, count_y;
reg [5:0] in_count;

wire [3:0] A_X = central_reg[23:20];
wire [3:0] A_Y = central_reg[19:16];
wire [3:0] B_X = central_reg[15:12];
wire [3:0] B_Y = central_reg[11:8];
wire [3:0] C_X = central_reg[7:4];
wire [3:0] C_Y = central_reg[3:0];

wire [3:0] A_R = radius_reg[11:8];
wire [3:0] B_R = radius_reg[7:4];
wire [3:0] C_R = radius_reg[3:0];

wire is_inside_A, is_inside_B, is_inside_C;

det_inside det_inside_A (.X(A_X), .Y(A_Y), .R(A_R), .point_x(count_x), .point_y(count_y), .is_inside(is_inside_A));
det_inside det_inside_B (.X(B_X), .Y(B_Y), .R(B_R), .point_x(count_x), .point_y(count_y), .is_inside(is_inside_B));
det_inside det_inside_C (.X(C_X), .Y(C_Y), .R(C_R), .point_x(count_x), .point_y(count_y), .is_inside(is_inside_C));

// Control
reg in_count_en;

wire count_x_done = count_x == 'd8;
wire count_y_done = count_y == 'd8;

wire exe_done = count_x_done & count_y_done;

// FSM
always @(*) begin
	case(state)
		IDLE 	: next_state = en 		? EXE 	: IDLE;
		EXE		: next_state = exe_done	? DOUT 	: EXE;
		DOUT 	: next_state = IDLE;
		default	: next_state = IDLE;
	endcase
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

// input regs
always @(posedge clk) begin
	if (en) begin
		central_reg	<= central;
		radius_reg	<= radius;
		mode_reg	<= mode;
	end
end

// counter
always @(posedge clk or posedge rst) begin
	if (rst) begin
		count_x <= 'd1;
	end
	else if (state == EXE) begin
		count_x <= count_x_done ? 'd1 : (count_x + 'd1);
	end
	else if (state == DOUT) begin
		count_x <= 'd1;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		count_y <= 'd1;
	end
	else if (state == EXE & count_x_done) begin
		count_y <= count_y_done ? 'd1 : (count_y + 'd1);
	end
	else if (state == DOUT) begin
		count_y <= 'd1;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		in_count <= 'd0;
	end
	else if (state == EXE & in_count_en) begin
		in_count <= in_count + 'd1;
	end
	else if (state == DOUT) begin
		in_count <= 'd0;
	end
end

always @(*) begin
	case(mode_reg)
		2'b00 : in_count_en = is_inside_A;
		2'b01 : in_count_en = is_inside_A & is_inside_B;
		2'b10 : in_count_en = is_inside_A ^ is_inside_B;
		2'b11 : in_count_en = (is_inside_A & is_inside_B & !is_inside_C) | 
							  (is_inside_A & !is_inside_B & is_inside_C) | (!is_inside_A & is_inside_B & is_inside_C);
		default : in_count_en = 1'b0;
	endcase
end

// output
always @(posedge clk or posedge rst) begin
	if (rst) begin
		busy <= 1'b0;
	end
	else if (en) begin
		busy <= 1'b1;
	end
	else if (state == DOUT) begin
		busy <= 1'b0;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		candidate <= 'd0;
	end
	else if (state == DOUT) begin
		candidate <= in_count;
	end
	else begin
		candidate <= 'd0;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		valid <= 1'b0;
	end
	else if (state == DOUT) begin
		valid <= 1'b1;
	end
	else begin
		valid <= 1'b0;
	end
end

endmodule



module det_inside (
	input [3:0] X,
	input [3:0] Y,
	input [3:0] R,
	input [3:0] point_x,
	input [3:0] point_y,
	output is_inside
);

wire signed [4:0] d_x_signed = X - point_x;
wire signed [4:0] d_y_signed = Y - point_y;

wire [3:0] d_x = d_x_signed[4] ? (~d_x_signed + 'd1) : d_x_signed;
wire [3:0] d_y = d_y_signed[4] ? (~d_y_signed + 'd1) : d_y_signed;

wire [7:0] d_x_2 = d_x * d_x;
wire [7:0] d_y_2 = d_y * d_y;

wire [8:0] distance_2 = d_x_2 + d_y_2;
wire [7:0] R_2 = R * R;

assign is_inside = distance_2 <= R_2;

endmodule
