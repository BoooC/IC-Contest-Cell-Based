module geofence (
	input 			clk,
	input			reset,
	input	[9:0] 	X,
	input	[9:0] 	Y, 
    input   [10:0]   R,
	output 	reg		valid,
	output 	reg		is_inside
);

localparam DIN 	    = 'd0;
localparam SORT	    = 'd1;
localparam FIND_SIDE= 'd2;
localparam FIND_AREA= 'd3;
localparam DOUT	    = 'd4;

reg [2:0] state, next_state;

reg [9:0] receiver_x [0:5];
reg [9:0] receiver_y [0:5];
reg [10:0] R_reg [0:5];
reg [2:0] count;
reg [2:0] current_limit;
reg [2:0] area_count;
reg [3:0] hex_count;

reg exchange_flag_reg;
reg first_done;

reg signed [21:0] product_reg;

reg [10:0] a;
reg [10:0] b;
reg [10:0] c;
reg [9:0] sqrt_out_reg;
reg [22:0] tri_area_reg;
reg signed [22:0] hex_area_reg;
reg compute_hex_flag;

wire [2:0] next_count = (count == 'd5) ? 'd0 : (count + 'd1);

wire [9:0] x0 = receiver_x[0];
wire [9:0] y0 = receiver_y[0];
wire [9:0] x1 = receiver_x[count+1];
wire [9:0] y1 = receiver_y[count+1];
wire [9:0] x2 = receiver_x[next_count+1];
wire [9:0] y2 = receiver_y[next_count+1];

// cross operation
wire [9:0] point_x0 = x0;
wire [9:0] point_y0 = y0;
wire [9:0] point_x1 = first_done ? x2 : x1;
wire [9:0] point_y1 = first_done ? y1 : y2;

wire signed [10:0] vecter_1 = point_x1 - point_x0;
wire signed [10:0] vecter_2 = point_y1 - point_y0;
reg [9:0] hex_in_1;
reg [9:0] hex_in_2;
wire signed [10:0] cross_mult_1 = (state == SORT) ? vecter_1 : {1'b0, hex_in_1};
wire signed [10:0] cross_mult_2 = (state == SORT) ? vecter_2 : {1'b0, hex_in_2};

wire signed [21:0] product_wire = cross_mult_1 * cross_mult_2;
wire signed [22:0] cross_result = product_wire - product_reg;

wire exchange_flag = ~cross_result[22] & first_done;

// Find side
wire [20:0] side_2 = (receiver_x[count] - receiver_x[next_count])**2 + (receiver_y[count] - receiver_y[next_count])**2;


// Herons formula
wire [10:0] R_1 = R_reg[count];
wire [10:0] R_2 = R_reg[next_count];

wire [11:0] sum = a + b + c;
wire [10:0] s = sum >> 1;
wire [9:0] sub_1 = first_done ? b : 0;
wire [9:0] sub_2 = first_done ? c : a;

wire signed [11:0] mult_1 = s - sub_1;
wire signed [11:0] mult_2 = s - sub_2;
wire signed [23:0] s_product = mult_1 * mult_2;
wire [19:0] sqrt_in_abs = s_product[23] ? (~s_product + 'd1) : s_product;
wire [19:0] sqrt_in = (state == FIND_SIDE) ? side_2 : sqrt_in_abs;
wire [9:0] sqrt_out_wire;
wire [19:0] area_wire = sqrt_out_wire * sqrt_out_reg;

DW_sqrt #(.width(20), .tc_mode(0)) DW_sqrt_inst(.a(sqrt_in), .root(sqrt_out_wire));

wire [21:0] tri_area = tri_area_reg + area_wire;
wire [21:0] hex_area = hex_area_reg >> 1;

// control
wire in_count_done 		= count == 'd5;
wire sort_count_done 	= count == current_limit & first_done;
wire area_count_done    = area_count == 'd1;
wire current_limit_done = current_limit == 'd0;

wire din_done 	= in_count_done;
wire sort_done 	= sort_count_done & current_limit_done;
wire side_done 	= 1'b1;
wire area_done 	= area_count_done;
wire all_area_done = count == 'd6;
wire find_hex_done = hex_count == 'd12;

always @(*) begin
	case(state)
		DIN 	    : next_state = din_done     ? SORT	    : DIN;
		SORT	    : next_state = sort_done    ? FIND_SIDE : SORT;
		FIND_SIDE   : next_state = side_done    ? FIND_AREA : FIND_SIDE;
		FIND_AREA   : next_state = area_done    ? all_area_done ? DOUT : FIND_SIDE : FIND_AREA;
		DOUT	    : next_state = DIN;
		default	    : next_state = DIN;
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
integer i;
always @(posedge clk or posedge reset) begin
	if (reset) begin
		for (i=0; i<6; i=i+1) begin
			receiver_x[i] <= 'd0;
			receiver_y[i] <= 'd0;
            R_reg[i] <= 'd0;
		end
	end
	else if (state == DIN) begin
		receiver_x[0] <= X;
		receiver_y[0] <= Y;
        R_reg[0] <= R;
		for (i=0; i<5; i=i+1) begin
			receiver_x[i+1] <= receiver_x[i];
			receiver_y[i+1] <= receiver_y[i];
            R_reg[i+1] <= R_reg[i];
		end
	end
	else if (state == SORT & exchange_flag & first_done) begin
		receiver_x[count+1] <= receiver_x[count+2];
		receiver_y[count+1] <= receiver_y[count+2];
		receiver_x[count+2] <= receiver_x[count+1];
		receiver_y[count+2] <= receiver_y[count+1];
        R_reg[count+2] <= R_reg[count+1];
        R_reg[count+1] <= R_reg[count+2];
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
	else if (state == FIND_SIDE) begin
		count <= count + 'd1;
	end
	else if (state == DOUT) begin
		count <= 'd0;
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
		area_count <= 'd0;
	end
	else if (state == DOUT) begin
		area_count <= 'd0;
	end
	else if (state == FIND_AREA) begin
		area_count <= area_count_done ? 'd0 : (area_count + 'd1);
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		hex_count <= 'd0;
	end
	else if (state == DOUT) begin
		hex_count <= 'd0;
	end
	else if (compute_hex_flag) begin
		hex_count <= find_hex_done ? 'd0 : (hex_count + 'd1);
	end
end

always @(*) begin
	case(hex_count)
        'd0 : begin
            hex_in_1 = receiver_x[0];
            hex_in_2 = receiver_y[1];
        end
        'd1 : begin
            hex_in_1 = receiver_x[1];
            hex_in_2 = receiver_y[0];
        end
        'd2 : begin
            hex_in_1 = receiver_x[1];
            hex_in_2 = receiver_y[2];
        end
        'd3 : begin
            hex_in_1 = receiver_x[2];
            hex_in_2 = receiver_y[1];
        end
        'd4 : begin
            hex_in_1 = receiver_x[2];
            hex_in_2 = receiver_y[3];
        end
        'd5 : begin
            hex_in_1 = receiver_x[3];
            hex_in_2 = receiver_y[2];
        end
        'd6 : begin
            hex_in_1 = receiver_x[3];
            hex_in_2 = receiver_y[4];
        end
        'd7 : begin
            hex_in_1 = receiver_x[4];
            hex_in_2 = receiver_y[3];
        end
        'd8 : begin
            hex_in_1 = receiver_x[4];
            hex_in_2 = receiver_y[5];
        end
        'd9 : begin
            hex_in_1 = receiver_x[5];
            hex_in_2 = receiver_y[4];
        end
        'd10 : begin
            hex_in_1 = receiver_x[5];
            hex_in_2 = receiver_y[0];
        end
        'd11 : begin
            hex_in_1 = receiver_x[0];
            hex_in_2 = receiver_y[5];
        end
        default : begin
            hex_in_1 = 'd0;
            hex_in_2 = 'd0;
        end
    endcase
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		product_reg <= 'd0;
	end
	else begin
		product_reg <= product_wire;
	end
end


always @(posedge clk or posedge reset) begin
	if (reset) begin
		a <= 'd0;
	end
	else if (state == FIND_SIDE) begin
		a <= sqrt_out_wire;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		b <= 'd0;
	end
	else if (state == FIND_SIDE) begin
		b <= R_1;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		c <= 'd0;
	end
	else if (state == FIND_SIDE) begin
		c <= R_2;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		sqrt_out_reg <= 'd0;
	end
	else begin
		sqrt_out_reg <= sqrt_out_wire;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		tri_area_reg <= 'd0;
	end
	else if (state == DOUT) begin
		tri_area_reg <= 'd0;
	end
	else if (state == FIND_AREA & first_done) begin
		tri_area_reg <= tri_area_reg + area_wire;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		hex_area_reg <= 'd0;
	end
	else if (state == DOUT) begin
		hex_area_reg <= 'd0;
	end
	else if (compute_hex_flag & hex_count[0]) begin
		hex_area_reg <= hex_area_reg + cross_result;
	end
	else if (compute_hex_flag & hex_count == 'd12) begin
		hex_area_reg <= hex_area_reg[22] ? (~hex_area_reg + 'd1) : hex_area_reg;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		compute_hex_flag <= 1'b0;
	end
	else if (find_hex_done | state == DOUT) begin
		compute_hex_flag <= 1'b0;
	end
	else if (next_state == FIND_SIDE & count == 'd0) begin
		compute_hex_flag <= 1'b1;
	end
end




// control
always @(posedge clk or posedge reset) begin
	if (reset) begin
		first_done <= 1'b0;
	end
	else if (state == SORT | state == FIND_AREA) begin
		first_done <= ~first_done;
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
		is_inside <= ~(hex_area < tri_area);
	end
	else begin
		is_inside <= 1'b0;
	end
end

endmodule
