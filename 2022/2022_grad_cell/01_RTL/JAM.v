module JAM (
	input				CLK,
	input				RST,
	output 	reg [2:0]	W,
	output 	reg	[2:0]	J,
	input 		[6:0]	Cost,
	output 	reg [3:0]	MatchCount,
	output	reg	[9:0]	MinCost,
	output  reg			Valid 
);

reg [2:0] current_perm [0:7];
reg [9:0] min_reg;

wire [2:0] next_W = W + 'd1;
wire [9:0] next_min = min_reg + Cost;

wire [2:0] next_perm [0:7];

find_next_perm find_next_perm_inst (
	.current_perm_0	(current_perm[0]), 
	.current_perm_1	(current_perm[1]), 
	.current_perm_2	(current_perm[2]), 
	.current_perm_3	(current_perm[3]), 
	.current_perm_4	(current_perm[4]), 
	.current_perm_5	(current_perm[5]), 
	.current_perm_6	(current_perm[6]), 
	.current_perm_7	(current_perm[7]),
	.next_perm_0	(next_perm[0]	), 
	.next_perm_1	(next_perm[1]	), 
	.next_perm_2	(next_perm[2]	), 
	.next_perm_3	(next_perm[3]	), 
	.next_perm_4	(next_perm[4]	), 
	.next_perm_5	(next_perm[5]	), 
	.next_perm_6	(next_perm[6]	), 
	.next_perm_7	(next_perm[7]	)
);

wire perm_done = current_perm[7] == 'd7 & 
				 current_perm[6] == 'd6 & 
				 current_perm[5] == 'd5 & 
				 current_perm[4] == 'd4 & 
				 current_perm[3] == 'd3 & 
				 current_perm[2] == 'd2 & 
				 current_perm[1] == 'd1 & current_perm[0] == 'd0;

wire W_done = W == 'd7;

// permutation
integer i;
always @(posedge CLK or posedge RST) begin
	if (RST) begin
		for (i=0; i<8; i=i+1) begin
			current_perm[i] <= 7-i;
		end
	end
	else if (W == 'd6) begin
		for (i=0; i<8; i=i+1) begin
			current_perm[i] <= next_perm[i];
		end
	end
end

// min temp
always @(posedge CLK or posedge RST) begin
	if (RST) begin
		min_reg <= 'd0;
	end
	else if (W == 'd0) begin
		min_reg <= Cost;
	end
	else begin
		min_reg <= next_min;
	end
end

// output
always @(posedge CLK or posedge RST) begin
	if (RST) begin
		W <= 'd0;
		J <= 'd7;
	end
	else begin
		W <= next_W;
		J <= current_perm[next_W];
	end
end

always @(posedge CLK or posedge RST) begin
	if (RST) begin
		MatchCount <= 'd0;
	end
	else if (W_done) begin
		MatchCount <= (next_min < MinCost) 	? 'd1 : 
					  (next_min == MinCost)	? (MatchCount + 'd1) : MatchCount;
	end
end

always @(posedge CLK or posedge RST) begin
	if (RST) begin
		MinCost <= 'd1023;
	end
	else if (W_done) begin
		MinCost <= (next_min < MinCost) ? next_min : MinCost;
	end
end

always @(posedge CLK or posedge RST) begin
	if (RST) begin
		Valid <= 1'b0;
	end
	else if (W_done & perm_done) begin
		Valid <= 1'b1;
	end
end

endmodule


module find_next_perm (
	input [2:0] current_perm_0, current_perm_1, current_perm_2, current_perm_3, 
	input [2:0] current_perm_4, current_perm_5, current_perm_6, current_perm_7,
	
	output [2:0] next_perm_0, next_perm_1, next_perm_2, next_perm_3, 
	output [2:0] next_perm_4, next_perm_5, next_perm_6, next_perm_7
);

wire [2:0] current_perm 	[0:7];
wire [3:0] perm_temp 		[0:7];
reg  [2:0] next_perm_temp 	[0:7];
reg  [2:0] next_perm 		[0:7];

assign current_perm[0] = current_perm_0;
assign current_perm[1] = current_perm_1;
assign current_perm[2] = current_perm_2;
assign current_perm[3] = current_perm_3;
assign current_perm[4] = current_perm_4;
assign current_perm[5] = current_perm_5;
assign current_perm[6] = current_perm_6;
assign current_perm[7] = current_perm_7;
assign next_perm_0 = next_perm[0];
assign next_perm_1 = next_perm[1];
assign next_perm_2 = next_perm[2];
assign next_perm_3 = next_perm[3];
assign next_perm_4 = next_perm[4];
assign next_perm_5 = next_perm[5];
assign next_perm_6 = next_perm[6];
assign next_perm_7 = next_perm[7];

wire [2:0] exchange_point_1	= 	(current_perm[0] > current_perm[1]) ? 'd1 : 
								(current_perm[1] > current_perm[2]) ? 'd2 : 
								(current_perm[2] > current_perm[3]) ? 'd3 : 
								(current_perm[3] > current_perm[4]) ? 'd4 : 
								(current_perm[4] > current_perm[5]) ? 'd5 : 
								(current_perm[5] > current_perm[6]) ? 'd6 : 'd7;

wire [2:0] exchange_num_1	= current_perm[exchange_point_1];

assign perm_temp[0] = (exchange_point_1 < 3'd0 | current_perm[0] <= exchange_num_1) ? 4'b1000 : {1'b0, current_perm[0]};
assign perm_temp[1] = (exchange_point_1 < 3'd1 | current_perm[1] <= exchange_num_1) ? 4'b1000 : {1'b0, current_perm[1]};
assign perm_temp[2] = (exchange_point_1 < 3'd2 | current_perm[2] <= exchange_num_1) ? 4'b1000 : {1'b0, current_perm[2]};
assign perm_temp[3] = (exchange_point_1 < 3'd3 | current_perm[3] <= exchange_num_1) ? 4'b1000 : {1'b0, current_perm[3]};
assign perm_temp[4] = (exchange_point_1 < 3'd4 | current_perm[4] <= exchange_num_1) ? 4'b1000 : {1'b0, current_perm[4]};
assign perm_temp[5] = (exchange_point_1 < 3'd5 | current_perm[5] <= exchange_num_1) ? 4'b1000 : {1'b0, current_perm[5]};
assign perm_temp[6] = (exchange_point_1 < 3'd6 | current_perm[6] <= exchange_num_1) ? 4'b1000 : {1'b0, current_perm[6]};
assign perm_temp[7] = (exchange_point_1 < 3'd7 | current_perm[7] <= exchange_num_1) ? 4'b1000 : {1'b0, current_perm[7]};

wire [2:0] exchange_point_2 = 	(perm_temp[1] > perm_temp[0]) ? 3'd0 :
								(perm_temp[2] > perm_temp[1]) ? 3'd1 :
								(perm_temp[3] > perm_temp[2]) ? 3'd2 :
								(perm_temp[4] > perm_temp[3]) ? 3'd3 :
								(perm_temp[5] > perm_temp[4]) ? 3'd4 :
								(perm_temp[6] > perm_temp[5]) ? 3'd5 :
								(perm_temp[7] > perm_temp[6]) ? 3'd6 : 3'd7;

wire [2:0] exchange_num_2	= current_perm[exchange_point_2];

integer i;
always@(*) begin
	for(i=0; i<8; i=i+1) begin
		if(i == exchange_point_1) begin		
			next_perm_temp[i] = current_perm[exchange_point_2];
		end
		else if(i == exchange_point_2) begin 	
			next_perm_temp[i] = current_perm[exchange_point_1];
		end
		else begin
			next_perm_temp[i] = current_perm[i];
		end
	end
end

always@(*) begin
	for(i=0; i<8; i=i+1) begin
		if(i >= exchange_point_1) begin
			next_perm[i] = next_perm_temp[i];
		end
		else begin
			next_perm[i] = next_perm_temp[exchange_point_1 - 1 - i];
		end
	end
end

endmodule
