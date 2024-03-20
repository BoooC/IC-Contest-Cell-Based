module SET ( 
	input 				clk, 
	input 				rst,
	input 				en,
	input 		[23:0] 	central,
	input 		[11:0] 	radius,
	input 		[1:0] 	mode,
	output  			busy,
	output reg			valid,
	output reg	[7:0]	candidate
);

// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
// FSM state
localparam IDLE 	= 2'd0;
localparam DATA_IN	= 2'd1;
localparam CALCULATE= 2'd2;
localparam DATA_OUT	= 2'd3;


// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [1:0] state, next_state;

// plane idx
reg [3:0] ptr_X, ptr_Y;

reg count_en; 


// ====================================================================	//
// 							Combination (Wires)  						//
// ====================================================================	//
// state wire
wire IDLE_wire		= state == IDLE;
wire DATA_IN_wire	= state == DATA_IN;
wire CALCULATE_wire	= state == CALCULATE;
wire DATA_OUT_wire 	= state == DATA_OUT;

// set encoding
wire [3:0] SET_A_X	= central[23:20];
wire [3:0] SET_A_Y	= central[19:16];
wire [3:0] SET_B_X	= central[15:12];
wire [3:0] SET_B_Y	= central[11:8];
wire [3:0] SET_C_X	= central[7:4];
wire [3:0] SET_C_Y	= central[3:0];

wire [3:0] SET_A_R	= radius[11:8];
wire [3:0] SET_B_R	= radius[7:4];
wire [3:0] SET_C_R	= radius[3:0];

// determine is inside circle, use Pythagorean theorem
// 3 set are processed parallelly
wire [3:0] A_X_distance = SET_A_X - ptr_X;
wire [3:0] A_Y_distance = SET_A_Y - ptr_Y;
wire [3:0] B_X_distance = SET_B_X - ptr_X;
wire [3:0] B_Y_distance = SET_B_Y - ptr_Y;
wire [3:0] C_X_distance = SET_C_X - ptr_X;
wire [3:0] C_Y_distance = SET_C_Y - ptr_Y;

wire [3:0] A_X_distance_abs = A_X_distance[3] ? (~A_X_distance + 3'd1) : A_X_distance;
wire [3:0] A_Y_distance_abs = A_Y_distance[3] ? (~A_Y_distance + 3'd1) : A_Y_distance;
wire [3:0] B_X_distance_abs = B_X_distance[3] ? (~B_X_distance + 3'd1) : B_X_distance;
wire [3:0] B_Y_distance_abs = B_Y_distance[3] ? (~B_Y_distance + 3'd1) : B_Y_distance;
wire [3:0] C_X_distance_abs = C_X_distance[3] ? (~C_X_distance + 3'd1) : C_X_distance;
wire [3:0] C_Y_distance_abs = C_Y_distance[3] ? (~C_Y_distance + 3'd1) : C_Y_distance;

wire [7:0] A_X_square = A_X_distance_abs * A_X_distance_abs;
wire [7:0] A_Y_square = A_Y_distance_abs * A_Y_distance_abs;
wire [7:0] B_X_square = B_X_distance_abs * B_X_distance_abs;
wire [7:0] B_Y_square = B_Y_distance_abs * B_Y_distance_abs;
wire [7:0] C_X_square = C_X_distance_abs * C_X_distance_abs;
wire [7:0] C_Y_square = C_Y_distance_abs * C_Y_distance_abs;

wire [7:0] SET_A_R_aquare = SET_A_R * SET_A_R;
wire [7:0] SET_B_R_aquare = SET_B_R * SET_B_R;
wire [7:0] SET_C_R_aquare = SET_C_R * SET_C_R;

wire is_inside_A = (A_X_square + A_Y_square) <= SET_A_R_aquare;
wire is_inside_B = (B_X_square + B_Y_square) <= SET_B_R_aquare;
wire is_inside_C = (C_X_square + C_Y_square) <= SET_C_R_aquare;

// control signals
wire ptr_X_done = ptr_X == 4'd8;
wire ptr_Y_done = ptr_Y == 4'd8;

wire calculate_done = ptr_X_done & ptr_Y_done;

// output
assign busy = ~IDLE_wire;

// next state logic
always@(*) begin
	case(state)
		IDLE 	    : next_state = en ? DATA_IN : IDLE;
		DATA_IN	    : next_state = CALCULATE;
		CALCULATE	: next_state = calculate_done ? DATA_OUT : CALCULATE;
		DATA_OUT	: next_state = IDLE;
		default		: next_state = IDLE;
	endcase
end

always@(*) begin
	if(rst) begin
		count_en = 1'b0;
	end
	else begin
		case(mode)
			2'b00	: count_en = is_inside_A;
			2'b01	: count_en = is_inside_A & is_inside_B;
			2'b10	: count_en = (is_inside_A & ~is_inside_B) | (~is_inside_A & is_inside_B);
			2'b11	: count_en = (is_inside_A & is_inside_B & ~is_inside_C) | 
								 (is_inside_A & ~is_inside_B & is_inside_C) | 
								 (~is_inside_A & is_inside_B & is_inside_C);
			default : count_en = 1'b0;
		endcase
	end
end


// ====================================================================	//
// 						 		Sequential  							//
// ====================================================================	//
// FSM
always@(posedge clk or posedge reset) begin
	if(rst) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

always@(posedge clk or posedge reset) begin
	if(rst) begin
		ptr_X <= 4'd1;
	end
	else if(CALCULATE_wire) begin
		ptr_X <= ptr_X_done ? 4'd1 : (ptr_X + 4'd1);
	end
end

always@(posedge clk or posedge reset) begin
	if(rst) begin
		ptr_Y <= 4'd1;
	end
	else if(CALCULATE_wire & ptr_X_done) begin
		ptr_Y <= ptr_Y_done ? 4'd1 : (ptr_Y + 4'd1);
	end
end

always@(posedge clk or posedge reset) begin
	if(rst) begin
		candidate <= 8'd0;
	end
	else if(IDLE_wire) begin
		candidate <= 8'd0;
	end
	else if(~DATA_IN_wire & ~DATA_OUT_wire & count_en) begin
		candidate <= candidate + 8'd1;
	end
end

always@(posedge clk or posedge reset) begin
	if(rst) begin
		valid <= 1'b0;
	end
	else if(DATA_OUT_wire) begin
		valid <= 1'b1;
	end
	else if(IDLE_wire) begin
		valid <= 1'b0;
	end
end


endmodule
