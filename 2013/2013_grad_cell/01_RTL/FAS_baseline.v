module FAS (
	input 			clk, rst,
	input 			data_valid,
	input 	[15:0] 	data,
	output 			fir_valid, fft_valid,
	output 	[15:0] 	fir_d,
	output 	[31:0] 	fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7, fft_d8,
	output 	[31:0] 	fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15, fft_d0,
	output 			done,
	output 	[3:0] 	freq
);

wire fir_x_n_valid;
wire fir_y_n_valid;
wire S2P_in_valid;
wire S2P_out_valid;
wire fft_x_valid;
wire fft_y_valid;
wire analysis_in_valid;
wire analysis_freq_valid;

wire signed [15:0] fir_x_n;
wire signed [31:0] fir_y_n;

wire [23:0] S2P_in = {fir_d, 8'd0};
wire [23:0] S2P_out [0:15];

wire [23:0] FFT_x [0:15];
wire [31:0] FFT_y [0:15];

wire [31:0] Analysis_in [0:15];
wire [3:0] analysis_freq;

assign fir_x_n_valid= data_valid;
assign fir_x_n = data;

assign S2P_in_valid = fir_y_n_valid;
assign fft_x_valid = S2P_out_valid;
assign analysis_in_valid = fft_y_valid;

assign FFT_x[0]  = S2P_out[0];  assign FFT_x[1]  = S2P_out[1];  assign FFT_x[2]  = S2P_out[2];  assign FFT_x[3]  = S2P_out[3];
assign FFT_x[4]  = S2P_out[4];  assign FFT_x[5]  = S2P_out[5];  assign FFT_x[6]  = S2P_out[6];  assign FFT_x[7]  = S2P_out[7];
assign FFT_x[8]  = S2P_out[8];  assign FFT_x[9]  = S2P_out[9];  assign FFT_x[10] = S2P_out[10]; assign FFT_x[11] = S2P_out[11];
assign FFT_x[12] = S2P_out[12]; assign FFT_x[13] = S2P_out[13]; assign FFT_x[14] = S2P_out[14]; assign FFT_x[15] = S2P_out[15];

assign Analysis_in[0]  = FFT_y[0];  assign Analysis_in[1]  = FFT_y[1];  assign Analysis_in[2]  = FFT_y[2];  assign Analysis_in[3]  = FFT_y[3];
assign Analysis_in[4]  = FFT_y[4];  assign Analysis_in[5]  = FFT_y[5];  assign Analysis_in[6]  = FFT_y[6];  assign Analysis_in[7]  = FFT_y[7];
assign Analysis_in[8]  = FFT_y[8];  assign Analysis_in[9]  = FFT_y[9];  assign Analysis_in[10] = FFT_y[10]; assign Analysis_in[11] = FFT_y[11];
assign Analysis_in[12] = FFT_y[12]; assign Analysis_in[13] = FFT_y[13]; assign Analysis_in[14] = FFT_y[14]; assign Analysis_in[15] = FFT_y[15];


// output
assign fir_valid 	= fir_y_n_valid;
assign fir_d		= (fir_y_n[31] == 1'd1) ? {fir_y_n[31],fir_y_n[30:16]} + 16'd1 : {fir_y_n[31],fir_y_n[30:16]};

assign fft_valid 	= fft_y_valid;
assign fft_d0 		= FFT_y[ 0];
assign fft_d1 		= FFT_y[ 1];
assign fft_d2 		= FFT_y[ 2];
assign fft_d3 		= FFT_y[ 3];
assign fft_d4 		= FFT_y[ 4];
assign fft_d5 		= FFT_y[ 5];
assign fft_d6 		= FFT_y[ 6];
assign fft_d7 		= FFT_y[ 7];
assign fft_d8 		= FFT_y[ 8];
assign fft_d9 		= FFT_y[ 9];
assign fft_d10 		= FFT_y[10];
assign fft_d11 		= FFT_y[11];
assign fft_d12 		= FFT_y[12];
assign fft_d13 		= FFT_y[13];
assign fft_d14 		= FFT_y[14];
assign fft_d15 		= FFT_y[15];

assign freq = analysis_freq;
assign done = analysis_freq_valid;

FIR FIR_inst (
	.clk		(clk			),
	.rst		(rst			),
	.x_n_valid	(fir_x_n_valid	),
	.y_n_valid	(fir_y_n_valid	),
	.x_n		(fir_x_n		),
	.y_n		(fir_y_n		)
);

S2P S2P_inst (
	.clk		(clk),
	.rst		(rst),
	.fir_valid	(S2P_in_valid),
	.fir_d		(S2P_in),
	.x_valid	(S2P_out_valid),
	.x_0(S2P_out[0]), .x_1(S2P_out[1]), .x_2 (S2P_out[ 2]), .x_3 (S2P_out[ 3]), .x_4 (S2P_out[ 4]), .x_5 (S2P_out[ 5]), .x_6 (S2P_out[ 6]), .x_7 (S2P_out[ 7]),
	.x_8(S2P_out[8]), .x_9(S2P_out[9]), .x_10(S2P_out[10]), .x_11(S2P_out[11]), .x_12(S2P_out[12]), .x_13(S2P_out[13]), .x_14(S2P_out[14]), .x_15(S2P_out[15])
);

FFT FFT_inst (
	.clk	(clk), 
	.rst	(rst),
	.x_valid(fft_x_valid),
	.y_valid(fft_y_valid),
	.x_0(FFT_x[0]), .x_1(FFT_x[1]), .x_2 (FFT_x[ 2]), .x_3 (FFT_x[ 3]), .x_4 (FFT_x[ 4]), .x_5 (FFT_x[ 5]), .x_6 (FFT_x[ 6]), .x_7 (FFT_x[ 7]),
	.x_8(FFT_x[8]), .x_9(FFT_x[9]), .x_10(FFT_x[10]), .x_11(FFT_x[11]), .x_12(FFT_x[12]), .x_13(FFT_x[13]), .x_14(FFT_x[14]), .x_15(FFT_x[15]),
	.y_0(FFT_y[0]), .y_1(FFT_y[1]), .y_2 (FFT_y[ 2]), .y_3 (FFT_y[ 3]), .y_4 (FFT_y[ 4]), .y_5 (FFT_y[ 5]), .y_6 (FFT_y[ 6]), .y_7 (FFT_y[ 7]),
	.y_8(FFT_y[8]), .y_9(FFT_y[9]), .y_10(FFT_y[10]), .y_11(FFT_y[11]), .y_12(FFT_y[12]), .y_13(FFT_y[13]), .y_14(FFT_y[14]), .y_15(FFT_y[15])
);

Analysis Analysis_inst (
	.clk	  	(clk), 
	.rst	  	(rst),
	.x_valid	(analysis_in_valid),
	.x_0(Analysis_in[0]), .x_1(Analysis_in[1]), .x_2 (Analysis_in[ 2]), .x_3 (Analysis_in[ 3]), .x_4 (Analysis_in[ 4]), .x_5 (Analysis_in[ 5]), .x_6 (Analysis_in[ 6]), .x_7 (Analysis_in[ 7]),
	.x_8(Analysis_in[8]), .x_9(Analysis_in[9]), .x_10(Analysis_in[10]), .x_11(Analysis_in[11]), .x_12(Analysis_in[12]), .x_13(Analysis_in[13]), .x_14(Analysis_in[14]), .x_15(Analysis_in[15]),
	.freq_valid	(analysis_freq_valid),
	.freq 		(analysis_freq)
);

endmodule



module FIR (
	input 						clk, 
	input 						rst,
	input 						x_n_valid,
	input 		signed	[15:0] 	x_n,
	output 	reg					y_n_valid,
	output 	reg	signed 	[31:0] 	y_n
);

// 16-bit fraction
parameter signed [19:0] FIR_C00 = 20'hFFF9E;
parameter signed [19:0] FIR_C01 = 20'hFFF86;
parameter signed [19:0] FIR_C02 = 20'hFFFA7;
parameter signed [19:0] FIR_C03 = 20'h0003B;
parameter signed [19:0] FIR_C04 = 20'h0014B;
parameter signed [19:0] FIR_C05 = 20'h0024A;
parameter signed [19:0] FIR_C06 = 20'h00222;
parameter signed [19:0] FIR_C07 = 20'hFFFE4;
parameter signed [19:0] FIR_C08 = 20'hFFBC5;
parameter signed [19:0] FIR_C09 = 20'hFF7CA;
parameter signed [19:0] FIR_C10 = 20'hFF74E;
parameter signed [19:0] FIR_C11 = 20'hFFD74;
parameter signed [19:0] FIR_C12 = 20'h00B1A;
parameter signed [19:0] FIR_C13 = 20'h01DAC;
parameter signed [19:0] FIR_C14 = 20'h02F9E;
parameter signed [19:0] FIR_C15 = 20'h03AA9;
parameter signed [19:0] FIR_C16 = 20'h03AA9;
parameter signed [19:0] FIR_C17 = 20'h02F9E;
parameter signed [19:0] FIR_C18 = 20'h01DAC;
parameter signed [19:0] FIR_C19 = 20'h00B1A;
parameter signed [19:0] FIR_C20 = 20'hFFD74;
parameter signed [19:0] FIR_C21 = 20'hFF74E;
parameter signed [19:0] FIR_C22 = 20'hFF7CA;
parameter signed [19:0] FIR_C23 = 20'hFFBC5;
parameter signed [19:0] FIR_C24 = 20'hFFFE4;
parameter signed [19:0] FIR_C25 = 20'h00222;
parameter signed [19:0] FIR_C26 = 20'h0024A;
parameter signed [19:0] FIR_C27 = 20'h0014B;
parameter signed [19:0] FIR_C28 = 20'h0003B;
parameter signed [19:0] FIR_C29 = 20'hFFFA7;
parameter signed [19:0] FIR_C30 = 20'hFFF86;
parameter signed [19:0] FIR_C31 = 20'hFFF9E;

// 8-bit int, 8-bit fraction
reg signed [15:0] x_reg [0:31];
reg [4:0] count;
reg x_n_valid_reg, x_n_valid_reg2;

integer i;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		for (i=0; i<32; i=i+1) begin
			x_reg[i] <= 'd0;
		end
	end
	else if (x_n_valid) begin
		x_reg[0] <= x_n;
		for (i=0; i<31; i=i+1) begin
			x_reg[i+1] <= x_reg[i];
		end
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		x_n_valid_reg  <= 1'b0;
		x_n_valid_reg2 <= 1'b0;
	end
	else begin
		x_n_valid_reg  <= x_n_valid;
		x_n_valid_reg2 <= x_n_valid_reg;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		count <= 'd0;
	end
	else if (x_n_valid_reg2) begin
		count <= (count == 'd31) ? 'd31 : (count + 'd1);
	end
end

// 24-bit fraction
always @(posedge clk or posedge rst) begin
	if (rst) begin
		y_n <= 'd0;
	end
	else begin
		y_n <= 	(x_reg[0]  * FIR_C00) + (x_reg[1]  * FIR_C01) + (x_reg[2]  * FIR_C02) + (x_reg[3]  * FIR_C03) +
        		(x_reg[4]  * FIR_C04) + (x_reg[5]  * FIR_C05) + (x_reg[6]  * FIR_C06) + (x_reg[7]  * FIR_C07) +
        		(x_reg[8]  * FIR_C08) + (x_reg[9]  * FIR_C09) + (x_reg[10] * FIR_C10) + (x_reg[11] * FIR_C11) +
        		(x_reg[12] * FIR_C12) + (x_reg[13] * FIR_C13) + (x_reg[14] * FIR_C14) + (x_reg[15] * FIR_C15) +
        		(x_reg[16] * FIR_C16) + (x_reg[17] * FIR_C17) + (x_reg[18] * FIR_C18) + (x_reg[19] * FIR_C19) +
        		(x_reg[20] * FIR_C20) + (x_reg[21] * FIR_C21) + (x_reg[22] * FIR_C22) + (x_reg[23] * FIR_C23) +
        		(x_reg[24] * FIR_C24) + (x_reg[25] * FIR_C25) + (x_reg[26] * FIR_C26) + (x_reg[27] * FIR_C27) +
        		(x_reg[28] * FIR_C28) + (x_reg[29] * FIR_C29) + (x_reg[30] * FIR_C30) + (x_reg[31] * FIR_C31);
	end
end
always @(posedge clk or posedge rst) begin
	if (rst) begin
		y_n_valid <= 1'b0;
	end
	else begin
		y_n_valid <= count == 'd31;
	end
end

endmodule



module S2P (
	input 					clk, 
	input 					rst,
	input 					fir_valid,
	input 	signed	[23:0] 	fir_d,
	output 	reg				x_valid,
	output 	signed 	[23:0] 	x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9, x_10, x_11, x_12, x_13, x_14, x_15
);

reg signed [23:0] x_reg [0:15];
reg [3:0] count;

assign x_0  = x_valid ? x_reg[0]  : 'd0;
assign x_1  = x_valid ? x_reg[1]  : 'd0;
assign x_2  = x_valid ? x_reg[2]  : 'd0;
assign x_3  = x_valid ? x_reg[3]  : 'd0;
assign x_4  = x_valid ? x_reg[4]  : 'd0;
assign x_5  = x_valid ? x_reg[5]  : 'd0;
assign x_6  = x_valid ? x_reg[6]  : 'd0;
assign x_7  = x_valid ? x_reg[7]  : 'd0;
assign x_8  = x_valid ? x_reg[8]  : 'd0;
assign x_9  = x_valid ? x_reg[9]  : 'd0;
assign x_10 = x_valid ? x_reg[10] : 'd0;
assign x_11 = x_valid ? x_reg[11] : 'd0;
assign x_12 = x_valid ? x_reg[12] : 'd0;
assign x_13 = x_valid ? x_reg[13] : 'd0;
assign x_14 = x_valid ? x_reg[14] : 'd0;
assign x_15 = x_valid ? x_reg[15] : 'd0;

integer i;
always @(posedge clk or posedge rst) begin
	if (rst) begin
		for (i=0; i<32; i=i+1) begin
			x_reg[i] <= 'd0;
		end
	end
	else if (fir_valid) begin
		x_reg[15] <= fir_d;
		for (i=0; i<15; i=i+1) begin
			x_reg[i] <= x_reg[i+1];
		end
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		count <= 'd0;
	end
	else if (fir_valid) begin
		count <= count + 'd1;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		x_valid <= 1'b0;
	end
	else begin
	 	x_valid <= count == 'd15;
	end
end

endmodule


module FFT (
	input 			clk, 
	input 			rst,
	input 			x_valid,
	input 	[23:0] 	x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9, x_10, x_11, x_12, x_13, x_14, x_15,
	output 			y_valid,
	output 	[31:0] 	y_0, y_1, y_2, y_3, y_4, y_5, y_6, y_7, y_8, y_9, y_10, y_11, y_12, y_13, y_14, y_15
);

parameter W_R_0 = 32'h00010000;
parameter W_R_1 = 32'h0000EC83;
parameter W_R_2 = 32'h0000B504;
parameter W_R_3 = 32'h000061F7;
parameter W_R_4 = 32'h00000000;
parameter W_R_5 = 32'hFFFF9E09;
parameter W_R_6 = 32'hFFFF4AFC;
parameter W_R_7 = 32'hFFFF137D;
parameter W_I_0 = 32'h00000000;
parameter W_I_1 = 32'hFFFF9E09;
parameter W_I_2 = 32'hFFFF4AFC;
parameter W_I_3 = 32'hFFFF137D;
parameter W_I_4 = 32'hFFFF0000;
parameter W_I_5 = 32'hFFFF137D;
parameter W_I_6 = 32'hFFFF4AFC;
parameter W_I_7 = 32'hFFFF9E09;

parameter NUM_0 = 32'h00000000;
parameter NUM_1 = 32'h00010000;

reg [2:0] count;
wire count_done = count == 'd4;
assign y_valid = count_done;

reg signed [23:0] stage01_r_reg [0:15];
reg signed [23:0] stage01_i_reg [0:15];
reg signed [23:0] stage12_r_reg [0:15];
reg signed [23:0] stage12_i_reg [0:15];
reg signed [23:0] stage23_r_reg [0:15];
reg signed [23:0] stage23_i_reg [0:15];
reg signed [23:0] stage34_r_reg [0:15];
reg signed [23:0] stage34_i_reg [0:15];

wire signed [23:0] stage_0_r [0:15];
wire signed [23:0] stage_0_i [0:15];
wire signed [23:0] stage_1_r [0:15];
wire signed [23:0] stage_1_i [0:15];
wire signed [23:0] stage_2_r [0:15];
wire signed [23:0] stage_2_i [0:15];
wire signed [23:0] stage_3_r [0:15];
wire signed [23:0] stage_3_i [0:15];

assign y_0  = {stage34_r_reg[ 0][23], stage34_r_reg[ 0][22:16], stage34_r_reg[ 0][15:8], stage34_i_reg[ 0][23], stage34_i_reg[ 0][22:16], stage34_i_reg[ 0][15:8]};
assign y_8  = {stage34_r_reg[ 1][23], stage34_r_reg[ 1][22:16], stage34_r_reg[ 1][15:8], stage34_i_reg[ 1][23], stage34_i_reg[ 1][22:16], stage34_i_reg[ 1][15:8]};
assign y_4  = {stage34_r_reg[ 2][23], stage34_r_reg[ 2][22:16], stage34_r_reg[ 2][15:8], stage34_i_reg[ 2][23], stage34_i_reg[ 2][22:16], stage34_i_reg[ 2][15:8]};
assign y_12 = {stage34_r_reg[ 3][23], stage34_r_reg[ 3][22:16], stage34_r_reg[ 3][15:8], stage34_i_reg[ 3][23], stage34_i_reg[ 3][22:16], stage34_i_reg[ 3][15:8]};
assign y_2  = {stage34_r_reg[ 4][23], stage34_r_reg[ 4][22:16], stage34_r_reg[ 4][15:8], stage34_i_reg[ 4][23], stage34_i_reg[ 4][22:16], stage34_i_reg[ 4][15:8]};
assign y_10 = {stage34_r_reg[ 5][23], stage34_r_reg[ 5][22:16], stage34_r_reg[ 5][15:8], stage34_i_reg[ 5][23], stage34_i_reg[ 5][22:16], stage34_i_reg[ 5][15:8]};
assign y_6  = {stage34_r_reg[ 6][23], stage34_r_reg[ 6][22:16], stage34_r_reg[ 6][15:8], stage34_i_reg[ 6][23], stage34_i_reg[ 6][22:16], stage34_i_reg[ 6][15:8]};
assign y_14 = {stage34_r_reg[ 7][23], stage34_r_reg[ 7][22:16], stage34_r_reg[ 7][15:8], stage34_i_reg[ 7][23], stage34_i_reg[ 7][22:16], stage34_i_reg[ 7][15:8]};
assign y_1  = {stage34_r_reg[ 8][23], stage34_r_reg[ 8][22:16], stage34_r_reg[ 8][15:8], stage34_i_reg[ 8][23], stage34_i_reg[ 8][22:16], stage34_i_reg[ 8][15:8]};
assign y_9  = {stage34_r_reg[ 9][23], stage34_r_reg[ 9][22:16], stage34_r_reg[ 9][15:8], stage34_i_reg[ 9][23], stage34_i_reg[ 9][22:16], stage34_i_reg[ 9][15:8]};
assign y_5  = {stage34_r_reg[10][23], stage34_r_reg[10][22:16], stage34_r_reg[10][15:8], stage34_i_reg[10][23], stage34_i_reg[10][22:16], stage34_i_reg[10][15:8]};
assign y_13 = {stage34_r_reg[11][23], stage34_r_reg[11][22:16], stage34_r_reg[11][15:8], stage34_i_reg[11][23], stage34_i_reg[11][22:16], stage34_i_reg[11][15:8]};
assign y_3  = {stage34_r_reg[12][23], stage34_r_reg[12][22:16], stage34_r_reg[12][15:8], stage34_i_reg[12][23], stage34_i_reg[12][22:16], stage34_i_reg[12][15:8]};
assign y_11 = {stage34_r_reg[13][23], stage34_r_reg[13][22:16], stage34_r_reg[13][15:8], stage34_i_reg[13][23], stage34_i_reg[13][22:16], stage34_i_reg[13][15:8]};
assign y_7  = {stage34_r_reg[14][23], stage34_r_reg[14][22:16], stage34_r_reg[14][15:8], stage34_i_reg[14][23], stage34_i_reg[14][22:16], stage34_i_reg[14][15:8]};
assign y_15 = {stage34_r_reg[15][23], stage34_r_reg[15][22:16], stage34_r_reg[15][15:8], stage34_i_reg[15][23], stage34_i_reg[15][22:16], stage34_i_reg[15][15:8]};

Butterfly Butterfly_stage_0_0 (.a(x_0), .b(24'd0), .c(x_8),  .d(24'd0), .W_r(W_R_0), .W_i(W_I_0), .fft_a_r(stage_0_r[0]), .fft_a_i(stage_0_i[0]), .fft_b_r(stage_0_r[ 8]), .fft_b_i(stage_0_i[ 8]));
Butterfly Butterfly_stage_0_1 (.a(x_1), .b(24'd0), .c(x_9),  .d(24'd0), .W_r(W_R_1), .W_i(W_I_1), .fft_a_r(stage_0_r[1]), .fft_a_i(stage_0_i[1]), .fft_b_r(stage_0_r[ 9]), .fft_b_i(stage_0_i[ 9]));
Butterfly Butterfly_stage_0_2 (.a(x_2), .b(24'd0), .c(x_10), .d(24'd0), .W_r(W_R_2), .W_i(W_I_2), .fft_a_r(stage_0_r[2]), .fft_a_i(stage_0_i[2]), .fft_b_r(stage_0_r[10]), .fft_b_i(stage_0_i[10]));
Butterfly Butterfly_stage_0_3 (.a(x_3), .b(24'd0), .c(x_11), .d(24'd0), .W_r(W_R_3), .W_i(W_I_3), .fft_a_r(stage_0_r[3]), .fft_a_i(stage_0_i[3]), .fft_b_r(stage_0_r[11]), .fft_b_i(stage_0_i[11]));
Butterfly Butterfly_stage_0_4 (.a(x_4), .b(24'd0), .c(x_12), .d(24'd0), .W_r(W_R_4), .W_i(W_I_4), .fft_a_r(stage_0_r[4]), .fft_a_i(stage_0_i[4]), .fft_b_r(stage_0_r[12]), .fft_b_i(stage_0_i[12]));
Butterfly Butterfly_stage_0_5 (.a(x_5), .b(24'd0), .c(x_13), .d(24'd0), .W_r(W_R_5), .W_i(W_I_5), .fft_a_r(stage_0_r[5]), .fft_a_i(stage_0_i[5]), .fft_b_r(stage_0_r[13]), .fft_b_i(stage_0_i[13]));
Butterfly Butterfly_stage_0_6 (.a(x_6), .b(24'd0), .c(x_14), .d(24'd0), .W_r(W_R_6), .W_i(W_I_6), .fft_a_r(stage_0_r[6]), .fft_a_i(stage_0_i[6]), .fft_b_r(stage_0_r[14]), .fft_b_i(stage_0_i[14]));
Butterfly Butterfly_stage_0_7 (.a(x_7), .b(24'd0), .c(x_15), .d(24'd0), .W_r(W_R_7), .W_i(W_I_7), .fft_a_r(stage_0_r[7]), .fft_a_i(stage_0_i[7]), .fft_b_r(stage_0_r[15]), .fft_b_i(stage_0_i[15]));

Butterfly Butterfly_stage_1_0 (.a(stage01_r_reg[ 0]), .b(stage01_i_reg[ 0]), .c(stage01_r_reg[ 4]), .d(stage01_i_reg[ 4]), .W_r(W_R_0), .W_i(W_I_0), .fft_a_r(stage_1_r[ 0]), .fft_a_i(stage_1_i[ 0]), .fft_b_r(stage_1_r[ 4]), .fft_b_i(stage_1_i[ 4]));
Butterfly Butterfly_stage_1_1 (.a(stage01_r_reg[ 1]), .b(stage01_i_reg[ 1]), .c(stage01_r_reg[ 5]), .d(stage01_i_reg[ 5]), .W_r(W_R_2), .W_i(W_I_2), .fft_a_r(stage_1_r[ 1]), .fft_a_i(stage_1_i[ 1]), .fft_b_r(stage_1_r[ 5]), .fft_b_i(stage_1_i[ 5]));
Butterfly Butterfly_stage_1_2 (.a(stage01_r_reg[ 2]), .b(stage01_i_reg[ 2]), .c(stage01_r_reg[ 6]), .d(stage01_i_reg[ 6]), .W_r(W_R_4), .W_i(W_I_4), .fft_a_r(stage_1_r[ 2]), .fft_a_i(stage_1_i[ 2]), .fft_b_r(stage_1_r[ 6]), .fft_b_i(stage_1_i[ 6]));
Butterfly Butterfly_stage_1_3 (.a(stage01_r_reg[ 3]), .b(stage01_i_reg[ 3]), .c(stage01_r_reg[ 7]), .d(stage01_i_reg[ 7]), .W_r(W_R_6), .W_i(W_I_6), .fft_a_r(stage_1_r[ 3]), .fft_a_i(stage_1_i[ 3]), .fft_b_r(stage_1_r[ 7]), .fft_b_i(stage_1_i[ 7]));
Butterfly Butterfly_stage_1_4 (.a(stage01_r_reg[ 8]), .b(stage01_i_reg[ 8]), .c(stage01_r_reg[12]), .d(stage01_i_reg[12]), .W_r(W_R_0), .W_i(W_I_0), .fft_a_r(stage_1_r[ 8]), .fft_a_i(stage_1_i[ 8]), .fft_b_r(stage_1_r[12]), .fft_b_i(stage_1_i[12]));
Butterfly Butterfly_stage_1_5 (.a(stage01_r_reg[ 9]), .b(stage01_i_reg[ 9]), .c(stage01_r_reg[13]), .d(stage01_i_reg[13]), .W_r(W_R_2), .W_i(W_I_2), .fft_a_r(stage_1_r[ 9]), .fft_a_i(stage_1_i[ 9]), .fft_b_r(stage_1_r[13]), .fft_b_i(stage_1_i[13]));
Butterfly Butterfly_stage_1_6 (.a(stage01_r_reg[10]), .b(stage01_i_reg[10]), .c(stage01_r_reg[14]), .d(stage01_i_reg[14]), .W_r(W_R_4), .W_i(W_I_4), .fft_a_r(stage_1_r[10]), .fft_a_i(stage_1_i[10]), .fft_b_r(stage_1_r[14]), .fft_b_i(stage_1_i[14]));
Butterfly Butterfly_stage_1_7 (.a(stage01_r_reg[11]), .b(stage01_i_reg[11]), .c(stage01_r_reg[15]), .d(stage01_i_reg[15]), .W_r(W_R_6), .W_i(W_I_6), .fft_a_r(stage_1_r[11]), .fft_a_i(stage_1_i[11]), .fft_b_r(stage_1_r[15]), .fft_b_i(stage_1_i[15]));

Butterfly Butterfly_stage_2_0 (.a(stage12_r_reg[ 0]), .b(stage12_i_reg[ 0]), .c(stage12_r_reg[ 2]), .d(stage12_i_reg[ 2]), .W_r(W_R_0), .W_i(W_I_0), .fft_a_r(stage_2_r[ 0]), .fft_a_i(stage_2_i[ 0]), .fft_b_r(stage_2_r[ 2]), .fft_b_i(stage_2_i[ 2]));
Butterfly Butterfly_stage_2_1 (.a(stage12_r_reg[ 1]), .b(stage12_i_reg[ 1]), .c(stage12_r_reg[ 3]), .d(stage12_i_reg[ 3]), .W_r(W_R_4), .W_i(W_I_4), .fft_a_r(stage_2_r[ 1]), .fft_a_i(stage_2_i[ 1]), .fft_b_r(stage_2_r[ 3]), .fft_b_i(stage_2_i[ 3]));
Butterfly Butterfly_stage_2_2 (.a(stage12_r_reg[ 4]), .b(stage12_i_reg[ 4]), .c(stage12_r_reg[ 6]), .d(stage12_i_reg[ 6]), .W_r(W_R_0), .W_i(W_I_0), .fft_a_r(stage_2_r[ 4]), .fft_a_i(stage_2_i[ 4]), .fft_b_r(stage_2_r[ 6]), .fft_b_i(stage_2_i[ 6]));
Butterfly Butterfly_stage_2_3 (.a(stage12_r_reg[ 5]), .b(stage12_i_reg[ 5]), .c(stage12_r_reg[ 7]), .d(stage12_i_reg[ 7]), .W_r(W_R_4), .W_i(W_I_4), .fft_a_r(stage_2_r[ 5]), .fft_a_i(stage_2_i[ 5]), .fft_b_r(stage_2_r[ 7]), .fft_b_i(stage_2_i[ 7]));
Butterfly Butterfly_stage_2_4 (.a(stage12_r_reg[ 8]), .b(stage12_i_reg[ 8]), .c(stage12_r_reg[10]), .d(stage12_i_reg[10]), .W_r(W_R_0), .W_i(W_I_0), .fft_a_r(stage_2_r[ 8]), .fft_a_i(stage_2_i[ 8]), .fft_b_r(stage_2_r[10]), .fft_b_i(stage_2_i[10]));
Butterfly Butterfly_stage_2_5 (.a(stage12_r_reg[ 9]), .b(stage12_i_reg[ 9]), .c(stage12_r_reg[11]), .d(stage12_i_reg[11]), .W_r(W_R_4), .W_i(W_I_4), .fft_a_r(stage_2_r[ 9]), .fft_a_i(stage_2_i[ 9]), .fft_b_r(stage_2_r[11]), .fft_b_i(stage_2_i[11]));
Butterfly Butterfly_stage_2_6 (.a(stage12_r_reg[12]), .b(stage12_i_reg[12]), .c(stage12_r_reg[14]), .d(stage12_i_reg[14]), .W_r(W_R_0), .W_i(W_I_0), .fft_a_r(stage_2_r[12]), .fft_a_i(stage_2_i[12]), .fft_b_r(stage_2_r[14]), .fft_b_i(stage_2_i[14]));
Butterfly Butterfly_stage_2_7 (.a(stage12_r_reg[13]), .b(stage12_i_reg[13]), .c(stage12_r_reg[15]), .d(stage12_i_reg[15]), .W_r(W_R_4), .W_i(W_I_4), .fft_a_r(stage_2_r[13]), .fft_a_i(stage_2_i[13]), .fft_b_r(stage_2_r[15]), .fft_b_i(stage_2_i[15]));

Butterfly Butterfly_stage_3_0 (.a(stage23_r_reg[ 0]), .b(stage23_i_reg[ 0]), .c(stage23_r_reg[ 1]),  .d(stage23_i_reg[ 1]), .W_r(NUM_1), .W_i(NUM_0), .fft_a_r(stage_3_r[ 0]), .fft_a_i(stage_3_i[ 0]), .fft_b_r(stage_3_r[ 1]), .fft_b_i(stage_3_i[ 1]));
Butterfly Butterfly_stage_3_1 (.a(stage23_r_reg[ 2]), .b(stage23_i_reg[ 2]), .c(stage23_r_reg[ 3]),  .d(stage23_i_reg[ 3]), .W_r(NUM_1), .W_i(NUM_0), .fft_a_r(stage_3_r[ 2]), .fft_a_i(stage_3_i[ 2]), .fft_b_r(stage_3_r[ 3]), .fft_b_i(stage_3_i[ 3]));
Butterfly Butterfly_stage_3_2 (.a(stage23_r_reg[ 4]), .b(stage23_i_reg[ 4]), .c(stage23_r_reg[ 5]),  .d(stage23_i_reg[ 5]), .W_r(NUM_1), .W_i(NUM_0), .fft_a_r(stage_3_r[ 4]), .fft_a_i(stage_3_i[ 4]), .fft_b_r(stage_3_r[ 5]), .fft_b_i(stage_3_i[ 5]));
Butterfly Butterfly_stage_3_3 (.a(stage23_r_reg[ 6]), .b(stage23_i_reg[ 6]), .c(stage23_r_reg[ 7]),  .d(stage23_i_reg[ 7]), .W_r(NUM_1), .W_i(NUM_0), .fft_a_r(stage_3_r[ 6]), .fft_a_i(stage_3_i[ 6]), .fft_b_r(stage_3_r[ 7]), .fft_b_i(stage_3_i[ 7]));
Butterfly Butterfly_stage_3_4 (.a(stage23_r_reg[ 8]), .b(stage23_i_reg[ 8]), .c(stage23_r_reg[ 9]),  .d(stage23_i_reg[ 9]), .W_r(NUM_1), .W_i(NUM_0), .fft_a_r(stage_3_r[ 8]), .fft_a_i(stage_3_i[ 8]), .fft_b_r(stage_3_r[ 9]), .fft_b_i(stage_3_i[ 9]));
Butterfly Butterfly_stage_3_5 (.a(stage23_r_reg[10]), .b(stage23_i_reg[10]), .c(stage23_r_reg[11]),  .d(stage23_i_reg[11]), .W_r(NUM_1), .W_i(NUM_0), .fft_a_r(stage_3_r[10]), .fft_a_i(stage_3_i[10]), .fft_b_r(stage_3_r[11]), .fft_b_i(stage_3_i[11]));
Butterfly Butterfly_stage_3_6 (.a(stage23_r_reg[12]), .b(stage23_i_reg[12]), .c(stage23_r_reg[13]),  .d(stage23_i_reg[13]), .W_r(NUM_1), .W_i(NUM_0), .fft_a_r(stage_3_r[12]), .fft_a_i(stage_3_i[12]), .fft_b_r(stage_3_r[13]), .fft_b_i(stage_3_i[13]));
Butterfly Butterfly_stage_3_7 (.a(stage23_r_reg[14]), .b(stage23_i_reg[14]), .c(stage23_r_reg[15]),  .d(stage23_i_reg[15]), .W_r(NUM_1), .W_i(NUM_0), .fft_a_r(stage_3_r[14]), .fft_a_i(stage_3_i[14]), .fft_b_r(stage_3_r[15]), .fft_b_i(stage_3_i[15]));

integer i;
always @(posedge clk) begin
	for (i=0; i<16; i=i+1) begin
		stage01_r_reg[i]<= stage_0_r[i];
		stage01_i_reg[i]<= stage_0_i[i];
		stage12_r_reg[i]<= stage_1_r[i];
		stage12_i_reg[i]<= stage_1_i[i];
		stage23_r_reg[i]<= stage_2_r[i];
		stage23_i_reg[i]<= stage_2_i[i];
		stage34_r_reg[i]<= stage_3_r[i];
		stage34_i_reg[i]<= stage_3_i[i];
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		count <= 'd0;
	end
	else if (x_valid | count != 'd0) begin
		count <= count_done ? 'd0 : (count + 'd1);
	end
end

endmodule


module Butterfly (
	input 	signed	[23:0] 	a, b, c, d,	// 8-bit int, 16-bit fraction
	input 	signed	[31:0] 	W_r, W_i, 	// 16-bit int, 16-bit fraction
	output 	signed 	[23:0] 	fft_a_r, fft_a_i, fft_b_r, fft_b_i // 8-bit, 16-bit fraction
);

// fft_a = (a+c) + (b+d)j
// fft_b = [(a-c)*Wn_real+(d-b)*Wn_imag] + [(a-c)*Wn_imag+(b-d)*Wn_real]j

wire signed [24:0] a_plus_c = a + c; // 9-bit int, 16-bit fraction
wire signed [24:0] b_plus_d = b + d;
wire signed [24:0] a_minus_c = a - c;
wire signed [24:0] b_minus_d = b - d;

wire signed [56:0] ac_wr = a_minus_c * W_r; // 25-bit int, 32-bit fraction
wire signed [56:0] ac_wi = a_minus_c * W_i;
wire signed [56:0] bd_wr = b_minus_d * W_r;
wire signed [56:0] bd_wi = b_minus_d * W_i;

wire signed [57:0] fft_b_r_temp = ac_wr - bd_wi; // 26-bit int, 32-bit fraction
wire signed [57:0] fft_b_i_temp = ac_wi + bd_wr;

assign fft_a_r = {a_plus_c[24], a_plus_c[22:16], a_plus_c[15:0]};
assign fft_a_i = {b_plus_d[24], b_plus_d[22:16], b_plus_d[15:0]};

assign fft_b_r = {fft_b_r_temp[57], fft_b_r_temp[38:32], fft_b_r_temp[31:16]};
assign fft_b_i = {fft_b_i_temp[57], fft_b_i_temp[38:32], fft_b_i_temp[31:16]};

endmodule


module Analysis (
	input 			clk,
	input 			rst,
	input 			x_valid,
	input	[31:0] 	x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7, x_8, x_9, x_10, x_11, x_12, x_13, x_14, x_15,
	output 			freq_valid,
	output 	[3:0]	freq
);

reg [2:0] count;
wire signed [15:0] x_r [0:15];
wire signed [15:0] x_i [0:15];

reg signed [32:0] square_sum_reg [0:15]; 

reg signed [32:0] sort_stage_1_reg [0:7];
reg signed [32:0] sort_stage_2_reg [0:3];
reg signed [32:0] sort_stage_3_reg [0:1];
reg signed [32:0] sort_stage_4_reg;

reg [3:0] sort_stage_1_idx_reg [0:7];
reg [3:0] sort_stage_2_idx_reg [0:3];
reg [3:0] sort_stage_3_idx_reg [0:1];
reg [3:0] sort_stage_4_idx_reg;

wire count_done = count == 'd5;

assign freq_valid = count_done;
assign freq = sort_stage_4_idx_reg;

assign x_r[ 0] = x_0 [31:16];	assign x_i[ 0] = x_0 [15:0];
assign x_r[ 1] = x_1 [31:16];	assign x_i[ 1] = x_1 [15:0];
assign x_r[ 2] = x_2 [31:16];	assign x_i[ 2] = x_2 [15:0];
assign x_r[ 3] = x_3 [31:16];	assign x_i[ 3] = x_3 [15:0];
assign x_r[ 4] = x_4 [31:16];	assign x_i[ 4] = x_4 [15:0];
assign x_r[ 5] = x_5 [31:16];	assign x_i[ 5] = x_5 [15:0];
assign x_r[ 6] = x_6 [31:16];	assign x_i[ 6] = x_6 [15:0];
assign x_r[ 7] = x_7 [31:16];	assign x_i[ 7] = x_7 [15:0];
assign x_r[ 8] = x_8 [31:16];	assign x_i[ 8] = x_8 [15:0];
assign x_r[ 9] = x_9 [31:16];	assign x_i[ 9] = x_9 [15:0];
assign x_r[10] = x_10[31:16];	assign x_i[10] = x_10[15:0];
assign x_r[11] = x_11[31:16];	assign x_i[11] = x_11[15:0];
assign x_r[12] = x_12[31:16];	assign x_i[12] = x_12[15:0];
assign x_r[13] = x_13[31:16];	assign x_i[13] = x_13[15:0];
assign x_r[14] = x_14[31:16];	assign x_i[14] = x_14[15:0];
assign x_r[15] = x_15[31:16];	assign x_i[15] = x_15[15:0];

always @(posedge clk) begin
	if (x_valid) begin
		square_sum_reg[ 0] <= (x_r[ 0] * x_r[ 0]) + (x_i[ 0] * x_i[ 0]);
		square_sum_reg[ 1] <= (x_r[ 1] * x_r[ 1]) + (x_i[ 1] * x_i[ 1]);
		square_sum_reg[ 2] <= (x_r[ 2] * x_r[ 2]) + (x_i[ 2] * x_i[ 2]);
		square_sum_reg[ 3] <= (x_r[ 3] * x_r[ 3]) + (x_i[ 3] * x_i[ 3]);
		square_sum_reg[ 4] <= (x_r[ 4] * x_r[ 4]) + (x_i[ 4] * x_i[ 4]);
		square_sum_reg[ 5] <= (x_r[ 5] * x_r[ 5]) + (x_i[ 5] * x_i[ 5]);
		square_sum_reg[ 6] <= (x_r[ 6] * x_r[ 6]) + (x_i[ 6] * x_i[ 6]);
		square_sum_reg[ 7] <= (x_r[ 7] * x_r[ 7]) + (x_i[ 7] * x_i[ 7]);
		square_sum_reg[ 8] <= (x_r[ 8] * x_r[ 8]) + (x_i[ 8] * x_i[ 8]);
		square_sum_reg[ 9] <= (x_r[ 9] * x_r[ 9]) + (x_i[ 9] * x_i[ 9]);
		square_sum_reg[10] <= (x_r[10] * x_r[10]) + (x_i[10] * x_i[10]);
		square_sum_reg[11] <= (x_r[11] * x_r[11]) + (x_i[11] * x_i[11]);
		square_sum_reg[12] <= (x_r[12] * x_r[12]) + (x_i[12] * x_i[12]);
		square_sum_reg[13] <= (x_r[13] * x_r[13]) + (x_i[13] * x_i[13]);
		square_sum_reg[14] <= (x_r[14] * x_r[14]) + (x_i[14] * x_i[14]);
		square_sum_reg[15] <= (x_r[15] * x_r[15]) + (x_i[15] * x_i[15]);
	end
end

always @(posedge clk) begin
	sort_stage_1_reg[0] 	<= (square_sum_reg[ 0] > square_sum_reg[ 1]) ? square_sum_reg[ 0] : square_sum_reg[ 1];
	sort_stage_1_reg[1] 	<= (square_sum_reg[ 2] > square_sum_reg[ 3]) ? square_sum_reg[ 2] : square_sum_reg[ 3];
	sort_stage_1_reg[2] 	<= (square_sum_reg[ 4] > square_sum_reg[ 5]) ? square_sum_reg[ 4] : square_sum_reg[ 5];
	sort_stage_1_reg[3] 	<= (square_sum_reg[ 6] > square_sum_reg[ 7]) ? square_sum_reg[ 6] : square_sum_reg[ 7];
	sort_stage_1_reg[4] 	<= (square_sum_reg[ 8] > square_sum_reg[ 9]) ? square_sum_reg[ 8] : square_sum_reg[ 9];
	sort_stage_1_reg[5] 	<= (square_sum_reg[10] > square_sum_reg[11]) ? square_sum_reg[10] : square_sum_reg[11];
	sort_stage_1_reg[6] 	<= (square_sum_reg[12] > square_sum_reg[13]) ? square_sum_reg[12] : square_sum_reg[13];
	sort_stage_1_reg[7] 	<= (square_sum_reg[14] > square_sum_reg[15]) ? square_sum_reg[14] : square_sum_reg[15];
	sort_stage_1_idx_reg[0] <= (square_sum_reg[ 0] > square_sum_reg[ 1]) ? 4'd0  : 4'd1;
	sort_stage_1_idx_reg[1] <= (square_sum_reg[ 2] > square_sum_reg[ 3]) ? 4'd2  : 4'd3;
	sort_stage_1_idx_reg[2] <= (square_sum_reg[ 4] > square_sum_reg[ 5]) ? 4'd4  : 4'd5;
	sort_stage_1_idx_reg[3] <= (square_sum_reg[ 6] > square_sum_reg[ 7]) ? 4'd6  : 4'd7;
	sort_stage_1_idx_reg[4] <= (square_sum_reg[ 8] > square_sum_reg[ 9]) ? 4'd8  : 4'd9;
	sort_stage_1_idx_reg[5] <= (square_sum_reg[10] > square_sum_reg[11]) ? 4'd10 : 4'd11;
	sort_stage_1_idx_reg[6] <= (square_sum_reg[12] > square_sum_reg[13]) ? 4'd12 : 4'd13;
	sort_stage_1_idx_reg[7] <= (square_sum_reg[14] > square_sum_reg[15]) ? 4'd14 : 4'd15;
end

always @(posedge clk) begin
	sort_stage_2_reg[0]     <= (sort_stage_1_reg[0] > sort_stage_1_reg[1]) ? sort_stage_1_reg[0] 	 : sort_stage_1_reg[1];
	sort_stage_2_reg[1]     <= (sort_stage_1_reg[2] > sort_stage_1_reg[3]) ? sort_stage_1_reg[2] 	 : sort_stage_1_reg[3];
	sort_stage_2_reg[2]     <= (sort_stage_1_reg[4] > sort_stage_1_reg[5]) ? sort_stage_1_reg[4] 	 : sort_stage_1_reg[5];
	sort_stage_2_reg[3]     <= (sort_stage_1_reg[6] > sort_stage_1_reg[7]) ? sort_stage_1_reg[6] 	 : sort_stage_1_reg[7];
	sort_stage_2_idx_reg[0] <= (sort_stage_1_reg[0] > sort_stage_1_reg[1]) ? sort_stage_1_idx_reg[0] : sort_stage_1_idx_reg[1];
	sort_stage_2_idx_reg[1] <= (sort_stage_1_reg[2] > sort_stage_1_reg[3]) ? sort_stage_1_idx_reg[2] : sort_stage_1_idx_reg[3];
	sort_stage_2_idx_reg[2] <= (sort_stage_1_reg[4] > sort_stage_1_reg[5]) ? sort_stage_1_idx_reg[4] : sort_stage_1_idx_reg[5];
	sort_stage_2_idx_reg[3] <= (sort_stage_1_reg[6] > sort_stage_1_reg[7]) ? sort_stage_1_idx_reg[6] : sort_stage_1_idx_reg[7];
end

always @(posedge clk) begin
	sort_stage_3_reg[0]     <= (sort_stage_2_reg[0] > sort_stage_2_reg[1]) ? sort_stage_2_reg[0]     : sort_stage_2_reg[1];
	sort_stage_3_reg[1]     <= (sort_stage_2_reg[2] > sort_stage_2_reg[3]) ? sort_stage_2_reg[2]     : sort_stage_2_reg[3];
	sort_stage_3_idx_reg[0] <= (sort_stage_2_reg[0] > sort_stage_2_reg[1]) ? sort_stage_2_idx_reg[0] : sort_stage_2_idx_reg[1];
	sort_stage_3_idx_reg[1] <= (sort_stage_2_reg[2] > sort_stage_2_reg[3]) ? sort_stage_2_idx_reg[2] : sort_stage_2_idx_reg[3];
end

always @(posedge clk) begin
	sort_stage_4_reg     <= (sort_stage_3_reg[0] > sort_stage_3_reg[1]) ? sort_stage_3_reg[0] 	 : sort_stage_3_reg[1];
	sort_stage_4_idx_reg <= (sort_stage_3_reg[0] > sort_stage_3_reg[1]) ? sort_stage_3_idx_reg[0] : sort_stage_3_idx_reg[1];
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		count <= 'd0;
	end
	else if (x_valid | count != 'd0) begin
		count <= count_done ? 'd0 : (count + 'd1);
	end
end

endmodule
