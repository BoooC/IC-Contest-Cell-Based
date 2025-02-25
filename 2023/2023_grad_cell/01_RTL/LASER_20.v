module LASER (
	input				CLK,
	input				RST,
	input 		[3:0] 	X,
	input 		[3:0] 	Y,
	output	 	[3:0] 	C1X,
	output	 	[3:0] 	C1Y,
	output	 	[3:0] 	C2X,
	output	 	[3:0] 	C2Y,
	output	 			DONE
);

localparam DIN 		= 'd0;
localparam FIND_C1	= 'd1;
localparam FIND_C2	= 'd2;
localparam DOUT		= 'd3;


reg [1:0] state, next_state;

reg [3:0] X_reg [0:39];
reg [3:0] Y_reg [0:39];
reg [5:0] count;

reg [3:0] current_cx;
reg [3:0] current_cy;
reg [3:0] opt_C1X;
reg [3:0] opt_C1Y;
reg [3:0] opt_C2X;
reg [3:0] opt_C2Y;
reg [4:0] opt_count;

reg [4:0] inside_count;
reg c_update_flag;
reg [1:0] unchange_count;

wire [3:0] current_C1X = (state == FIND_C1) ? current_cx : opt_C1X;
wire [3:0] current_C1Y = (state == FIND_C1) ? current_cy : opt_C1Y;
wire [3:0] current_C2X = (state == FIND_C2) ? current_cx : opt_C2X;
wire [3:0] current_C2Y = (state == FIND_C2) ? current_cy : opt_C2Y;

wire [5:0] point_count = count;

wire [19:0] is_inside;

genvar gen_i;
generate
    for (gen_i = 0; gen_i < 20; gen_i = gen_i + 1) begin
        det_inside det_inside_inst (
            .C1X		(current_C1X		),
            .C1Y		(current_C1Y		),
            .C2X		(current_C2X		),
            .C2Y		(current_C2Y		),
            .X			(X_reg[gen_i]		),
            .Y			(Y_reg[gen_i]		),
            .is_inside	(is_inside[gen_i]	)
        );
    end
endgenerate

wire [5:0] next_inside_count = inside_count + 
						is_inside[0]  + is_inside[1]  + is_inside[2]  + is_inside[3]  + is_inside[4]  + is_inside[5]  + is_inside[6]  + is_inside[7]  + 
                        is_inside[8]  + is_inside[9]  + is_inside[10] + is_inside[11] + is_inside[12] + is_inside[13] + is_inside[14] + is_inside[15] +
                        is_inside[16] + is_inside[17] + is_inside[18] + is_inside[19];

wire update_flag = next_inside_count >= opt_count;

wire current_cx_done = current_cx >= 'd12;
wire current_cy_done = current_cy >= 'd12;

// control
wire din_done = count == 'd39;
wire current_c_done = count == 'd20;
wire find_c_done = current_c_done & current_cx_done & current_cy_done;
wire converge = unchange_count == 'd2;

// output
assign C1X = opt_C1X;
assign C1Y = opt_C1Y;
assign C2X = opt_C2X;
assign C2Y = opt_C2Y;
assign DONE = state == DOUT;

always @(*) begin
	case(state)
		DIN 	: next_state = din_done 	? FIND_C1 	: DIN;
		FIND_C1	: next_state = converge 	? DOUT 		: find_c_done ? FIND_C2 : FIND_C1;
		FIND_C2	: next_state = converge 	? DOUT 		: find_c_done ? FIND_C1 : FIND_C2;
		DOUT	: next_state = DIN;
		default	: next_state = DIN;
	endcase
end

always @(posedge CLK) begin
	if (RST) begin
		state <= DIN;
	end
	else begin
		state <= next_state;
	end
end

// input regs
integer i;
always @(posedge CLK) begin
	if (state == DIN) begin
		X_reg[0] <= X;
		Y_reg[0] <= Y;
		for (i=0; i<39; i=i+1) begin
			X_reg[i+1] <= X_reg[i];
			Y_reg[i+1] <= Y_reg[i];
		end
	end
	else begin
		for (i=0; i<20; i=i+1) begin
			X_reg[i+20] <= X_reg[i];
			Y_reg[i+20] <= Y_reg[i];
			X_reg[i] <= X_reg[i+20];
			Y_reg[i] <= Y_reg[i+20];
		end
	end
end

reg [2:0] jump_value;
always @(posedge CLK) begin
	if (RST) begin
		jump_value <= 'd6;
	end
	else if (state == DOUT) begin
		jump_value <= 'd6;
	end
	else if ((state == FIND_C2) & current_c_done) begin
		jump_value <= (jump_value == 'd1) ? 'd1 : (jump_value - 'd1);
	end
	else begin
		jump_value <= jump_value;
	end
end

always @(posedge CLK) begin
	if (RST) begin
		current_cx <= 'd0;
	end
	else if (state == DOUT) begin
		current_cx <= 'd0;
	end
	else if ((state == FIND_C1 | state == FIND_C2) & current_c_done) begin
		current_cx <= current_cx_done ? 'd3 : (current_cx + jump_value);
	end
	else begin
		current_cx <= current_cx;
	end
end

always @(posedge CLK) begin
	if (RST) begin
		current_cy <= 'd0;
	end
	else if (state == DOUT) begin
		current_cy <= 'd0;
	end
	else if ((state == FIND_C1 | state == FIND_C2) & current_cx_done & current_c_done) begin
		current_cy <= current_cy_done ? 'd3 : (current_cy + jump_value);
	end
	else begin
		current_cy <= current_cy;
	end
end


// counter
always @(posedge CLK) begin
	if (RST) begin
		count <= 'd0;
	end
	else if (state == DOUT) begin
		count <= 'd0;
	end
	else if (state == DIN) begin
		count <= din_done ? 'd0 : (count + 'd1);
	end
	else if (state == FIND_C1 | state == FIND_C2) begin
		count <= current_c_done ? 'd0 : (count + 'd20);
	end
	else begin
		count <= count;
	end
end

always @(posedge CLK) begin
	if (RST) begin
		inside_count <= 'd0;
	end
	else if (current_c_done) begin
		inside_count <= 'd0;
	end
	else if (state == FIND_C1 | state == FIND_C2) begin
		inside_count <= next_inside_count;
	end
	else begin
		inside_count <= inside_count;
	end
end

always @(posedge CLK) begin
	if (RST) begin
		opt_C1X <= 'd0;
		opt_C1Y <= 'd0;
	end
	else if (state == DOUT) begin
		opt_C1X <= 'd0;
		opt_C1Y <= 'd0;
	end
	else if (state == FIND_C1 & current_c_done & update_flag) begin
		opt_C1X <= current_cx;
		opt_C1Y <= current_cy;
	end
	else begin
		opt_C1X <= opt_C1X;
		opt_C1Y <= opt_C1Y;
	end
end

always @(posedge CLK) begin
	if (RST) begin
		opt_C2X <= 'd0;
		opt_C2Y <= 'd0;
	end
	else if (state == DOUT) begin
		opt_C2X <= 'd0;
		opt_C2Y <= 'd0;
	end
	else if (state == FIND_C2 & current_c_done & update_flag) begin
		opt_C2X <= current_cx;
		opt_C2Y <= current_cy;
	end
	else begin
		opt_C2X <= opt_C2X;
		opt_C2Y <= opt_C2Y;
	end
end

always @(posedge CLK) begin
	if (RST) begin
		opt_count <= 'd0;
	end
	else if (state == DOUT) begin
		opt_count <= 'd0;
	end
	else if (current_c_done & update_flag) begin
		opt_count <= next_inside_count;
	end
end

always @(posedge CLK) begin
	if (RST) begin
		c_update_flag <= 1'b0;
	end
	else if (state == DOUT | find_c_done) begin
		c_update_flag <= 1'b0;
	end
	else if (current_c_done & next_inside_count > opt_count) begin
		c_update_flag <= 1'b1;
	end
end

always @(posedge CLK) begin
	if (RST) begin
		unchange_count <= 'd0;
	end
	else if (state == DOUT) begin
		unchange_count <= 'd0;
	end
	else if (find_c_done) begin
		unchange_count <= c_update_flag ? 'd0 : (unchange_count + 'd1);
	end
end

endmodule


module det_inside (
	input [3:0] C1X, C1Y,
	input [3:0] C2X, C2Y,
	input [3:0] X, Y,
	output is_inside
);

wire is_inside_1;
wire is_inside_2;

assign is_inside = is_inside_1 | is_inside_2;

det_inside_single det_inside_1 (
	.C_X(C1X), 
	.C_Y(C1Y),
	.X	(X), 
	.Y	(Y),
	.is_inside(is_inside_1)
);

det_inside_single det_inside_2 (
	.C_X(C2X), 
	.C_Y(C2Y),
	.X	(X), 
	.Y	(Y),
	.is_inside(is_inside_2)
);

endmodule


module det_inside_single (
	input [3:0] C_X, C_Y,
	input [3:0] X, Y,
	output is_inside
);

wire signed [4:0] diff_x = X - C_X;
wire signed [4:0] diff_y = Y - C_Y;

wire [3:0] dis_x = diff_x[4] ? (~diff_x + 'd1) : diff_x;
wire [3:0] dis_y = diff_y[4] ? (~diff_y + 'd1) : diff_y;

assign is_inside = 	(dis_x == 'd4 & dis_y <= 'd0) | 
					(dis_x == 'd3 & dis_y <= 'd2) | 
					(dis_x == 'd2 & dis_y <= 'd3) | 
					(dis_x == 'd1 & dis_y <= 'd3) | 
					(dis_x == 'd0 & dis_y <= 'd4);

endmodule
