module geofence (
	input 			clk,
	input			reset,
	input	[9:0] 	X,
	input	[9:0] 	Y,
	output 	reg		valid,
	output 	reg		is_inside
);

localparam DIN 	= 'd0;
localparam SORT	= 'd1;
localparam DET	= 'd2;
localparam DOUT	= 'd3;

reg [1:0] state, next_state;

reg [9:0] object_x, object_y;
reg [9:0] receiver_x [0:5];
reg [9:0] receiver_y [0:5];
reg [2:0] count;
reg [2:0] current_limit;

reg is_inside_reg;
reg exchange_flag_reg;
reg first_done;

reg signed [21:0] product_reg;


wire [2:0] next_count = (count == 'd5) ? 'd0 : (count + 'd1);

wire [9:0] x0 = (state == SORT) ? receiver_x[0]			 	: object_x;
wire [9:0] y0 = (state == SORT) ? receiver_y[0]			 	: object_y;
wire [9:0] x1 = (state == SORT) ? receiver_x[count+1]	 	: receiver_x[count];
wire [9:0] y1 = (state == SORT) ? receiver_y[count+1]	 	: receiver_y[count];
wire [9:0] x2 = (state == SORT) ? receiver_x[next_count+1]	: receiver_x[next_count];
wire [9:0] y2 = (state == SORT) ? receiver_y[next_count+1]	: receiver_y[next_count];

// cross operation
wire [9:0] point_x0 = x0;
wire [9:0] point_y0 = y0;
wire [9:0] point_x1 = first_done ? x2 : x1;
wire [9:0] point_y1 = first_done ? y1 : y2;

wire signed [10:0] vecter_1 = point_x1 - point_x0;
wire signed [10:0] vecter_2 = point_y1 - point_y0;
wire signed [21:0] product_wire = vecter_1 * vecter_2;
wire signed [22:0] cross_result = product_wire - product_reg;

wire exchange_flag = ~cross_result[22] & first_done;

// control
wire in_count_done 		= count == 'd6;
wire sort_count_done 	= count == current_limit & first_done;
wire det_count_done 	= count == 'd5 & first_done;
wire current_limit_done = current_limit == 'd0;

wire din_done 	= in_count_done;
wire sort_done 	= sort_count_done & current_limit_done;
wire det_done 	= det_count_done;

always @(*) begin
	case(state)
		DIN 	: next_state = din_done  ? SORT	: DIN;
		SORT	: next_state = sort_done ? DET 	: SORT;
		DET		: next_state = det_done  ? DOUT : DET;
		DOUT	: next_state = DIN;
		default	: next_state = DIN;
	endcase
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		state <= DIN;
	end
	else begin
		state <= next_state;
	end
end

// input regs
always @(posedge clk or posedge reset) begin
	if (reset) begin
		object_x <= 'd0;
		object_y <= 'd0;
	end
	else if (state == DIN & count == 'd0) begin
		object_x <= X;
		object_y <= Y;
	end
end

integer i;
always @(posedge clk or posedge reset) begin
	if (reset) begin
		for (i=0; i<6; i=i+1) begin
			receiver_x[i] <= 'd0;
			receiver_y[i] <= 'd0;
		end
	end
	else if (state == DIN & count != 'd0) begin
		receiver_x[0] <= X;
		receiver_y[0] <= Y;
		for (i=0; i<5; i=i+1) begin
			receiver_x[i+1] <= receiver_x[i];
			receiver_y[i+1] <= receiver_y[i];
		end
	end
	else if (state == SORT & exchange_flag & first_done) begin
		receiver_x[count+1] <= receiver_x[count+2];
		receiver_y[count+1] <= receiver_y[count+2];
		receiver_x[count+2] <= receiver_x[count+1];
		receiver_y[count+2] <= receiver_y[count+1];
	end
end

// counter
always @(posedge clk or posedge reset) begin
	if (reset) begin
		count <= 'd0;
	end
	else if (state == DIN) begin
		count <= in_count_done ? 'd0 : (count + 'd1);
	end
	else if (state == SORT & first_done) begin
		count <= sort_count_done ? 'd0 : (count + 'd1);
	end
	else if (state == DET & first_done) begin
		count <= det_count_done ? 'd0 : (count + 'd1);
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		current_limit <= 'd3;
	end
	else if (state == DOUT) begin
		current_limit <= 'd3;
	end
	else if (state == SORT & sort_count_done) begin
		current_limit <= current_limit - 'd1;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		product_reg <= 'd0;
	end
	else begin
		product_reg <= product_wire;
	end
end

// control
always @(posedge clk or posedge reset) begin
	if (reset) begin
		first_done <= 1'b0;
	end
	else if (state == SORT | state == DET) begin
		first_done <= ~first_done;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		exchange_flag_reg <= 1'b0;
	end
	else if (state == DET & first_done) begin
		exchange_flag_reg <= exchange_flag;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		is_inside_reg <= 1'b1;
	end
	else if (state == DET & count != 'd0 & first_done) begin
		is_inside_reg <= is_inside_reg & (exchange_flag_reg == exchange_flag);
	end
	else if (state == DOUT) begin
		is_inside_reg <= 1'b1;
	end
end

// output
always @(posedge clk or posedge reset) begin
	if (reset) begin
		valid <= 1'b0;
	end
	else if (next_state == DOUT) begin
		valid <= 1'b1;
	end
	else begin
		valid <= 1'b0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		is_inside <= 1'b0;
	end
	else if (next_state == DOUT) begin
		is_inside <= is_inside_reg & (exchange_flag_reg == exchange_flag);
	end
	else begin
		is_inside <= 1'b0;
	end
end

endmodule
