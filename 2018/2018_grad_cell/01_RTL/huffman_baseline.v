module huffman(
	input 				clk,
	input 				reset,
	input 				gray_valid,
	input 		[7:0] 	gray_data,
	output 				CNT_valid,
	output 		[7:0] 	CNT1, CNT2, CNT3, CNT4, CNT5, CNT6,
	output 				code_valid,
	output 		[7:0] 	HC1, HC2, HC3, HC4, HC5, HC6,
	output		[7:0] 	M1, M2, M3, M4, M5, M6
);


localparam IDLE 	= 'd0;
localparam DIN 		= 'd1;
localparam OUT_CNT	= 'd2;
localparam SORT		= 'd3;
localparam COMBINE	= 'd4;
localparam SPLIT	= 'd5;
localparam DOUT		= 'd6;

reg [2:0] state, next_state;

reg  [23:0] symbol_S [1:6];
reg  [6:0] 	symbol_P [1:6];
reg  [23:0] symbol_C0 [1:6];
reg  [23:0] symbol_C1 [1:6];
reg  [23:0] symbol_C2 [1:6];
reg  [23:0] symbol_C3 [1:6];
reg  [23:0] symbol_C4 [1:6];

reg [4:0] encode_reg [1:6];
reg [4:0] encode_len [1:6];

reg  [2:0] combine_count;
reg  [2:0] split_count;

wire [23:0] sorted_S [1:6];
wire [6:0] 	sorted_P [1:6];
wire sort_done;

SORT SORT_inst (
	.clk		(clk),
	.reset		(reset),
	.start		(state == SORT),
	.symbol_1_P	(symbol_P[1]), .symbol_2_P(symbol_P[2]), .symbol_3_P(symbol_P[3]), .symbol_4_P(symbol_P[4]), .symbol_5_P(symbol_P[5]), .symbol_6_P(symbol_P[6]), 
	.symbol_1_S	(symbol_S[1]), .symbol_2_S(symbol_S[2]), .symbol_3_S(symbol_S[3]), .symbol_4_S(symbol_S[4]), .symbol_5_S(symbol_S[5]), .symbol_6_S(symbol_S[6]), 
	.sorted_1_P	(sorted_P[1]), .sorted_2_P(sorted_P[2]), .sorted_3_P(sorted_P[3]), .sorted_4_P(sorted_P[4]), .sorted_5_P(sorted_P[5]), .sorted_6_P(sorted_P[6]), 
	.sorted_1_S	(sorted_S[1]), .sorted_2_S(sorted_S[2]), .sorted_3_S(sorted_S[3]), .sorted_4_S(sorted_S[4]), .sorted_5_S(sorted_S[5]), .sorted_6_S(sorted_S[6]), 
	.done 		(sort_done)
);

wire [23:0] combined_group;
group_combine group_combine_inst (.group_1(symbol_S[5]), .group_2(symbol_S[6]), .combined_group(combined_group));

// control
wire combine_done = combine_count == 'd6;
wire split_done = split_count == 'd4;

// output
assign CNT1 = CNT_valid ? symbol_P[1] : 'd0;
assign CNT2 = CNT_valid ? symbol_P[2] : 'd0;
assign CNT3 = CNT_valid ? symbol_P[3] : 'd0;
assign CNT4 = CNT_valid ? symbol_P[4] : 'd0;
assign CNT5 = CNT_valid ? symbol_P[5] : 'd0;
assign CNT6 = CNT_valid ? symbol_P[6] : 'd0;
assign CNT_valid = state == OUT_CNT;

assign HC1 = {3'd0, encode_reg[1]};
assign HC2 = {3'd0, encode_reg[2]};
assign HC3 = {3'd0, encode_reg[3]};
assign HC4 = {3'd0, encode_reg[4]};
assign HC5 = {3'd0, encode_reg[5]};
assign HC6 = {3'd0, encode_reg[6]};
assign M1  = {3'd0, encode_len[1]};
assign M2  = {3'd0, encode_len[2]};
assign M3  = {3'd0, encode_len[3]};
assign M4  = {3'd0, encode_len[4]};
assign M5  = {3'd0, encode_len[5]};
assign M6  = {3'd0, encode_len[6]};
assign code_valid = state == DOUT;

// FSM
always @(*) begin
	case(state)
		IDLE 	: next_state = gray_valid 	? DIN 		: IDLE;
		DIN 	: next_state = !gray_valid 	? OUT_CNT 	: DIN;
		OUT_CNT	: next_state = SORT;
		SORT	: next_state = sort_done 	? COMBINE	: SORT;
		COMBINE	: next_state = combine_done	? SPLIT		: SORT;
		SPLIT	: next_state = split_done	? DOUT		: SPLIT;
		DOUT	: next_state = IDLE;
		default	: next_state = IDLE;
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

always @(posedge clk or posedge reset) begin
	if (reset) begin
		symbol_P[1] <= 'd0;
		symbol_P[2] <= 'd0;
		symbol_P[3] <= 'd0;
		symbol_P[4] <= 'd0;
		symbol_P[5] <= 'd0;
		symbol_P[6] <= 'd0;
	end
	else if (gray_valid) begin
		symbol_P[1] <= (gray_data == 'd1) ? (symbol_P[1] + 'd1) : symbol_P[1];
		symbol_P[2] <= (gray_data == 'd2) ? (symbol_P[2] + 'd1) : symbol_P[2];
		symbol_P[3] <= (gray_data == 'd3) ? (symbol_P[3] + 'd1) : symbol_P[3];
		symbol_P[4] <= (gray_data == 'd4) ? (symbol_P[4] + 'd1) : symbol_P[4];
		symbol_P[5] <= (gray_data == 'd5) ? (symbol_P[5] + 'd1) : symbol_P[5];
		symbol_P[6] <= (gray_data == 'd6) ? (symbol_P[6] + 'd1) : symbol_P[6];
	end
	else if (sort_done) begin
		symbol_P[1] <= sorted_P[1];
		symbol_P[2] <= sorted_P[2];
		symbol_P[3] <= sorted_P[3];
		symbol_P[4] <= sorted_P[4];
		symbol_P[5] <= sorted_P[5];
		symbol_P[6] <= sorted_P[6];
	end
	else if (state == COMBINE) begin
		symbol_P[1] <= symbol_P[1];
		symbol_P[2] <= symbol_P[2];
		symbol_P[3] <= symbol_P[3];
		symbol_P[4] <= symbol_P[4];
		symbol_P[5] <= symbol_P[5] + symbol_P[6];
		symbol_P[6] <= 'd127;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		symbol_S[1] <= 'd1;
		symbol_S[2] <= 'd2;
		symbol_S[3] <= 'd3;
		symbol_S[4] <= 'd4;
		symbol_S[5] <= 'd5;
		symbol_S[6] <= 'd6;
	end
	else if (sort_done) begin
		symbol_S[1] <= sorted_S[1];
		symbol_S[2] <= sorted_S[2];
		symbol_S[3] <= sorted_S[3];
		symbol_S[4] <= sorted_S[4];
		symbol_S[5] <= sorted_S[5];
		symbol_S[6] <= sorted_S[6];
	end
	else if (state == COMBINE) begin
		symbol_S[5] <= combined_group;
		symbol_S[6] <= 'd0;
	end
end

always @(posedge clk) begin
	if (state == COMBINE & combine_count == 'd0) begin
		symbol_C0[1] <= symbol_S[1];
		symbol_C0[2] <= symbol_S[2];
		symbol_C0[3] <= symbol_S[3];
		symbol_C0[4] <= symbol_S[4];
		symbol_C0[5] <= symbol_S[5];
		symbol_C0[6] <= symbol_S[6];
	end
end

always @(posedge clk) begin
	if (state == COMBINE & combine_count == 'd1) begin
		symbol_C1[1] <= symbol_S[1];
		symbol_C1[2] <= symbol_S[2];
		symbol_C1[3] <= symbol_S[3];
		symbol_C1[4] <= symbol_S[4];
		symbol_C1[5] <= symbol_S[5];
		symbol_C1[6] <= symbol_S[6];
	end
end

always @(posedge clk) begin
	if (state == COMBINE & combine_count == 'd2) begin
		symbol_C2[1] <= symbol_S[1];
		symbol_C2[2] <= symbol_S[2];
		symbol_C2[3] <= symbol_S[3];
		symbol_C2[4] <= symbol_S[4];
		symbol_C2[5] <= symbol_S[5];
		symbol_C2[6] <= symbol_S[6];
	end
end

always @(posedge clk) begin
	if (state == COMBINE & combine_count == 'd3) begin
		symbol_C3[1] <= symbol_S[1];
		symbol_C3[2] <= symbol_S[2];
		symbol_C3[3] <= symbol_S[3];
		symbol_C3[4] <= symbol_S[4];
		symbol_C3[5] <= symbol_S[5];
		symbol_C3[6] <= symbol_S[6];
	end
end

always @(posedge clk) begin
	if (state == COMBINE & combine_count == 'd4) begin
		symbol_C4[1] <= symbol_S[1];
		symbol_C4[2] <= symbol_S[2];
		symbol_C4[3] <= symbol_S[3];
		symbol_C4[4] <= symbol_S[4];
		symbol_C4[5] <= symbol_S[5];
		symbol_C4[6] <= symbol_S[6];
	end
	else if (state == SPLIT) begin
		case(split_count)
			'd0 : begin
				symbol_C4[1] <= symbol_C3[1];
				symbol_C4[2] <= symbol_C3[2];
				symbol_C4[3] <= symbol_C3[3];
				symbol_C4[4] <= symbol_C3[4];
				symbol_C4[5] <= symbol_C3[5];
				symbol_C4[6] <= symbol_C3[6];
			end
			'd1 : begin
				symbol_C4[1] <= symbol_C2[1];
				symbol_C4[2] <= symbol_C2[2];
				symbol_C4[3] <= symbol_C2[3];
				symbol_C4[4] <= symbol_C2[4];
				symbol_C4[5] <= symbol_C2[5];
				symbol_C4[6] <= symbol_C2[6];
			end
			'd2 : begin
				symbol_C4[1] <= symbol_C1[1];
				symbol_C4[2] <= symbol_C1[2];
				symbol_C4[3] <= symbol_C1[3];
				symbol_C4[4] <= symbol_C1[4];
				symbol_C4[5] <= symbol_C1[5];
				symbol_C4[6] <= symbol_C1[6];
			end
			'd3 : begin
				symbol_C4[1] <= symbol_C0[1];
				symbol_C4[2] <= symbol_C0[2];
				symbol_C4[3] <= symbol_C0[3];
				symbol_C4[4] <= symbol_C0[4];
				symbol_C4[5] <= symbol_C0[5];
				symbol_C4[6] <= symbol_C0[6];
			end
		endcase
	end
end


always @(posedge clk or posedge reset) begin
	if (reset) begin
		combine_count <= 'd0;
	end
	else if (state == COMBINE) begin
		combine_count <= combine_count + 'd1;
	end
	else if (state == DOUT) begin
		combine_count <= 'd0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		split_count <= 'd0;
	end
	else if (state == SPLIT) begin
		split_count <= split_count + 'd1;
	end
	else if (state == DOUT) begin
		split_count <= 'd0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		encode_reg[1] <= 'd0;
		encode_reg[2] <= 'd0;
		encode_reg[3] <= 'd0;
		encode_reg[4] <= 'd0;
		encode_reg[5] <= 'd0;
		encode_reg[6] <= 'd0;
	end
	else if (state == SPLIT) begin
		encode_reg[1] <= encode_fn(symbol_C4[6], 4'd1) ? {encode_reg[1], 1'b1} : encode_fn(symbol_C4[5], 4'd1) ? {encode_reg[1], 1'b0} : encode_reg[1];
		encode_reg[2] <= encode_fn(symbol_C4[6], 4'd2) ? {encode_reg[2], 1'b1} : encode_fn(symbol_C4[5], 4'd2) ? {encode_reg[2], 1'b0} : encode_reg[2];
		encode_reg[3] <= encode_fn(symbol_C4[6], 4'd3) ? {encode_reg[3], 1'b1} : encode_fn(symbol_C4[5], 4'd3) ? {encode_reg[3], 1'b0} : encode_reg[3];
		encode_reg[4] <= encode_fn(symbol_C4[6], 4'd4) ? {encode_reg[4], 1'b1} : encode_fn(symbol_C4[5], 4'd4) ? {encode_reg[4], 1'b0} : encode_reg[4];
		encode_reg[5] <= encode_fn(symbol_C4[6], 4'd5) ? {encode_reg[5], 1'b1} : encode_fn(symbol_C4[5], 4'd5) ? {encode_reg[5], 1'b0} : encode_reg[5];
		encode_reg[6] <= encode_fn(symbol_C4[6], 4'd6) ? {encode_reg[6], 1'b1} : encode_fn(symbol_C4[5], 4'd6) ? {encode_reg[6], 1'b0} : encode_reg[6];
	end
	else if (state == DOUT) begin
		encode_reg[1] <= 'd0;
		encode_reg[2] <= 'd0;
		encode_reg[3] <= 'd0;
		encode_reg[4] <= 'd0;
		encode_reg[5] <= 'd0;
		encode_reg[6] <= 'd0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		encode_len[1] <= 'd0;
		encode_len[2] <= 'd0;
		encode_len[3] <= 'd0;
		encode_len[4] <= 'd0;
		encode_len[5] <= 'd0;
		encode_len[6] <= 'd0;
	end
	else if (state == SPLIT) begin
		encode_len[1] <= (encode_fn(symbol_C4[6], 4'd1) | encode_fn(symbol_C4[5], 4'd1)) ? {encode_len[1], 1'b1} : encode_len[1];
		encode_len[2] <= (encode_fn(symbol_C4[6], 4'd2) | encode_fn(symbol_C4[5], 4'd2)) ? {encode_len[2], 1'b1} : encode_len[2];
		encode_len[3] <= (encode_fn(symbol_C4[6], 4'd3) | encode_fn(symbol_C4[5], 4'd3)) ? {encode_len[3], 1'b1} : encode_len[3];
		encode_len[4] <= (encode_fn(symbol_C4[6], 4'd4) | encode_fn(symbol_C4[5], 4'd4)) ? {encode_len[4], 1'b1} : encode_len[4];
		encode_len[5] <= (encode_fn(symbol_C4[6], 4'd5) | encode_fn(symbol_C4[5], 4'd5)) ? {encode_len[5], 1'b1} : encode_len[5];
		encode_len[6] <= (encode_fn(symbol_C4[6], 4'd6) | encode_fn(symbol_C4[5], 4'd6)) ? {encode_len[6], 1'b1} : encode_len[6];
	end
	else if (state == DOUT) begin
		encode_len[1] <= 'd0;
		encode_len[2] <= 'd0;
		encode_len[3] <= 'd0;
		encode_len[4] <= 'd0;
		encode_len[5] <= 'd0;
		encode_len[6] <= 'd0;
	end
end



function encode_fn (
    input [23:0] symbol_C,
	input [3:0]  find_num
);
    begin
        encode_fn = symbol_C[3:0]  == find_num | symbol_C[7:4]   == find_num | 
				   	symbol_C[11:8] == find_num | symbol_C[15:12] == find_num | symbol_C[19:16] == find_num;
    end
endfunction


endmodule



module SORT (
	input clk,
	input reset,
	input start,
	input 	[6:0] 	symbol_1_P, symbol_2_P, symbol_3_P, symbol_4_P, symbol_5_P, symbol_6_P, 
	input 	[23:0] 	symbol_1_S, symbol_2_S, symbol_3_S, symbol_4_S, symbol_5_S, symbol_6_S, 
	output 	[6:0] 	sorted_1_P, sorted_2_P, sorted_3_P, sorted_4_P, sorted_5_P, sorted_6_P, 
	output 	[23:0] 	sorted_1_S, sorted_2_S, sorted_3_S, sorted_4_S, sorted_5_S, sorted_6_S, 
	output done
);

reg [2:0] 	count;
reg [6:0] 	sorted_P [1:6];
reg [23:0] 	sorted_S [1:6];

// output
assign sorted_1_P = done ? sorted_P[1] : 'd0;
assign sorted_2_P = done ? sorted_P[2] : 'd0;
assign sorted_3_P = done ? sorted_P[3] : 'd0;
assign sorted_4_P = done ? sorted_P[4] : 'd0;
assign sorted_5_P = done ? sorted_P[5] : 'd0;
assign sorted_6_P = done ? sorted_P[6] : 'd0;

assign sorted_1_S = done ? sorted_S[1] : 'd0;
assign sorted_2_S = done ? sorted_S[2] : 'd0;
assign sorted_3_S = done ? sorted_S[3] : 'd0;
assign sorted_4_S = done ? sorted_S[4] : 'd0;
assign sorted_5_S = done ? sorted_S[5] : 'd0;
assign sorted_6_S = done ? sorted_S[6] : 'd0;

assign done = count == 'd6;

// counter
always @(posedge clk or posedge reset) begin
	if (reset) begin
		count <= 'd0;
	end
	else if(done) begin
		count <= 'd0;
	end
	else if(start | count != 'd0) begin
		count <= count + 'd1;
	end
end

// sorting network
always @(posedge clk) begin
	case(count)
		'd0 : begin
			sorted_P[1] <= symbol_1_P;
			sorted_P[2] <= symbol_2_P;
			sorted_P[3] <= symbol_3_P;
			sorted_P[4] <= symbol_4_P;
			sorted_P[5] <= symbol_5_P;
			sorted_P[6] <= symbol_6_P;

			sorted_S[1] <= symbol_1_S;
			sorted_S[2] <= symbol_2_S;
			sorted_S[3] <= symbol_3_S;
			sorted_S[4] <= symbol_4_S;
			sorted_S[5] <= symbol_5_S;
			sorted_S[6] <= symbol_6_S;
		end
		'd1 : begin
			sorted_P[1] <= (symbol_1_P > symbol_6_P) ? symbol_1_P : symbol_6_P;
			sorted_P[2] <= (symbol_2_P > symbol_4_P) ? symbol_2_P : symbol_4_P;
			sorted_P[3] <= (symbol_3_P > symbol_5_P) ? symbol_3_P : symbol_5_P;
			sorted_P[4] <= (symbol_2_P < symbol_4_P) ? symbol_2_P : symbol_4_P;
			sorted_P[5] <= (symbol_3_P < symbol_5_P) ? symbol_3_P : symbol_5_P;
			sorted_P[6] <= (symbol_1_P < symbol_6_P) ? symbol_1_P : symbol_6_P;

			sorted_S[1] <=  exchange(symbol_1_P, symbol_6_P, symbol_1_S, symbol_6_S) ? symbol_1_S : symbol_6_S;
			sorted_S[2] <=  exchange(symbol_2_P, symbol_4_P, symbol_2_S, symbol_4_S) ? symbol_2_S : symbol_4_S;
			sorted_S[3] <=  exchange(symbol_3_P, symbol_5_P, symbol_3_S, symbol_5_S) ? symbol_3_S : symbol_5_S;
			sorted_S[4] <= !exchange(symbol_2_P, symbol_4_P, symbol_2_S, symbol_4_S) ? symbol_2_S : symbol_4_S;
			sorted_S[5] <= !exchange(symbol_3_P, symbol_5_P, symbol_3_S, symbol_5_S) ? symbol_3_S : symbol_5_S;
			sorted_S[6] <= !exchange(symbol_1_P, symbol_6_P, symbol_1_S, symbol_6_S) ? symbol_1_S : symbol_6_S;
		end
		'd2 : begin
			sorted_P[1] <= sorted_P[1];
			sorted_P[2] <= (sorted_P[2] > sorted_P[3]) ? sorted_P[2] : sorted_P[3];
			sorted_P[3] <= (sorted_P[2] < sorted_P[3]) ? sorted_P[2] : sorted_P[3];
			sorted_P[4] <= (sorted_P[4] > sorted_P[5]) ? sorted_P[4] : sorted_P[5];
			sorted_P[5] <= (sorted_P[4] < sorted_P[5]) ? sorted_P[4] : sorted_P[5];
			sorted_P[6] <= sorted_P[6];

			sorted_S[1] <= sorted_S[1];
			sorted_S[2] <=  exchange(sorted_P[2], sorted_P[3], sorted_S[2], sorted_S[3]) ? sorted_S[2] : sorted_S[3];
			sorted_S[3] <= !exchange(sorted_P[2], sorted_P[3], sorted_S[2], sorted_S[3]) ? sorted_S[2] : sorted_S[3];
			sorted_S[4] <=  exchange(sorted_P[4], sorted_P[5], sorted_S[4], sorted_S[5]) ? sorted_S[4] : sorted_S[5];
			sorted_S[5] <= !exchange(sorted_P[4], sorted_P[5], sorted_S[4], sorted_S[5]) ? sorted_S[4] : sorted_S[5];
			sorted_S[6] <= sorted_S[6];
		end
		'd3 : begin
			sorted_P[1] <= (sorted_P[1] > sorted_P[4]) ? sorted_P[1] : sorted_P[4];
			sorted_P[2] <= sorted_P[2];
			sorted_P[3] <= (sorted_P[3] > sorted_P[6]) ? sorted_P[3] : sorted_P[6];
			sorted_P[4] <= (sorted_P[1] < sorted_P[4]) ? sorted_P[1] : sorted_P[4];
			sorted_P[5] <= sorted_P[5];
			sorted_P[6] <= (sorted_P[3] < sorted_P[6]) ? sorted_P[3] : sorted_P[6];

			sorted_S[1] <=  exchange(sorted_P[1], sorted_P[4], sorted_S[1], sorted_S[4]) ? sorted_S[1] : sorted_S[4];
			sorted_S[2] <= sorted_S[2];
			sorted_S[3] <=  exchange(sorted_P[3], sorted_P[6], sorted_S[3], sorted_S[6]) ? sorted_S[3] : sorted_S[6];
			sorted_S[4] <= !exchange(sorted_P[1], sorted_P[4], sorted_S[1], sorted_S[4]) ? sorted_S[1] : sorted_S[4];
			sorted_S[5] <= sorted_S[5];
			sorted_S[6] <= !exchange(sorted_P[3], sorted_P[6], sorted_S[3], sorted_S[6]) ? sorted_S[3] : sorted_S[6];
		end
		'd4 : begin
			sorted_P[1] <= (sorted_P[1] > sorted_P[2]) ? sorted_P[1] : sorted_P[2];
			sorted_P[2] <= (sorted_P[1] < sorted_P[2]) ? sorted_P[1] : sorted_P[2];
			sorted_P[3] <= (sorted_P[3] > sorted_P[4]) ? sorted_P[3] : sorted_P[4];
			sorted_P[4] <= (sorted_P[3] < sorted_P[4]) ? sorted_P[3] : sorted_P[4];
			sorted_P[5] <= (sorted_P[5] > sorted_P[6]) ? sorted_P[5] : sorted_P[6];
			sorted_P[6] <= (sorted_P[5] < sorted_P[6]) ? sorted_P[5] : sorted_P[6];
			
			sorted_S[1] <=  exchange(sorted_P[1], sorted_P[2], sorted_S[1], sorted_S[2]) ? sorted_S[1] : sorted_S[2];
			sorted_S[2] <= !exchange(sorted_P[1], sorted_P[2], sorted_S[1], sorted_S[2]) ? sorted_S[1] : sorted_S[2];
			sorted_S[3] <=  exchange(sorted_P[3], sorted_P[4], sorted_S[3], sorted_S[4]) ? sorted_S[3] : sorted_S[4];
			sorted_S[4] <= !exchange(sorted_P[3], sorted_P[4], sorted_S[3], sorted_S[4]) ? sorted_S[3] : sorted_S[4];
			sorted_S[5] <=  exchange(sorted_P[5], sorted_P[6], sorted_S[5], sorted_S[6]) ? sorted_S[5] : sorted_S[6];
			sorted_S[6] <= !exchange(sorted_P[5], sorted_P[6], sorted_S[5], sorted_S[6]) ? sorted_S[5] : sorted_S[6];
		end
		'd5 : begin
			sorted_P[1] <= sorted_P[1];
			sorted_P[2] <= (sorted_P[2] > sorted_P[3]) ? sorted_P[2] : sorted_P[3];
			sorted_P[3] <= (sorted_P[2] < sorted_P[3]) ? sorted_P[2] : sorted_P[3];
			sorted_P[4] <= (sorted_P[4] > sorted_P[5]) ? sorted_P[4] : sorted_P[5];
			sorted_P[5] <= (sorted_P[4] < sorted_P[5]) ? sorted_P[4] : sorted_P[5];
			sorted_P[6] <= sorted_P[6];
			
			sorted_S[1] <= sorted_S[1];
			sorted_S[2] <=  exchange(sorted_P[2], sorted_P[3], sorted_S[2], sorted_S[3]) ? sorted_S[2] : sorted_S[3];
			sorted_S[3] <= !exchange(sorted_P[2], sorted_P[3], sorted_S[2], sorted_S[3]) ? sorted_S[2] : sorted_S[3];
			sorted_S[4] <=  exchange(sorted_P[4], sorted_P[5], sorted_S[4], sorted_S[5]) ? sorted_S[4] : sorted_S[5];
			sorted_S[5] <= !exchange(sorted_P[4], sorted_P[5], sorted_S[4], sorted_S[5]) ? sorted_S[4] : sorted_S[5];
			sorted_S[6] <= sorted_S[6];
		end
	endcase
end

function exchange (
    input [6:0] P_1, P_2,
    input [23:0] S_1, S_2
);
    begin
        exchange = (P_1 == P_2 & S_1[23:4] == 20'd0 & (S_1[3:0] < S_2[3:0] | S_2[23:4] != 20'd0)) | (P_1 > P_2);
    end
endfunction

endmodule


module group_combine (
	input  [23:0] group_1, group_2,
	output [23:0] combined_group
);

assign combined_group = (group_2[23:4]  == 'd0) ? {group_1, group_2[3:0]}  : 
						(group_2[23:8]  == 'd0) ? {group_1, group_2[7:0]}  : 
						(group_2[23:12] == 'd0) ? {group_1, group_2[11:0]} : 
						(group_2[23:16] == 'd0) ? {group_1, group_2[15:0]} : 
						(group_2[23:20] == 'd0) ? {group_1, group_2[19:0]} : group_2[23:0];

endmodule
