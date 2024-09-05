module  FAS (
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



FIR_Filter FIR_Filter_inst (
	.clk		(clk		),
	.rst        (rst        ),
	.data_valid	(data_valid	),
	.data       (data       ),
	.fir_valid  (fir_valid  ),
	.fir_data  	(fir_d		)
);

FFT FFT_inst (
	.clk		(clk		),
	.rst        (rst        ),
	.fir_valid	(fir_valid	),
	.fir_data   (fir_d   	),
	.fft_valid  (fft_valid  ),
	.fft_d0     (fft_d0     ),
	.fft_d1     (fft_d1     ),
	.fft_d2     (fft_d2     ),
	.fft_d3     (fft_d3     ),
	.fft_d4     (fft_d4     ),
	.fft_d5     (fft_d5     ),
	.fft_d6     (fft_d6     ),
	.fft_d7     (fft_d7     ),
	.fft_d8     (fft_d8     ),
	.fft_d9     (fft_d9     ),
	.fft_d10    (fft_d10    ),
	.fft_d11    (fft_d11    ),
	.fft_d12    (fft_d12    ),
	.fft_d13    (fft_d13    ),
	.fft_d14    (fft_d14    ),
	.fft_d15    (fft_d15    )
);

Analysis Analysis_inst (
	.clk		(clk		),
	.rst        (rst        ),
	.fft_valid  (fft_valid  ),
	.fft_d0     (fft_d0     ),
	.fft_d1     (fft_d1     ),
	.fft_d2     (fft_d2     ),
	.fft_d3     (fft_d3     ),
	.fft_d4     (fft_d4     ),
	.fft_d5     (fft_d5     ),
	.fft_d6     (fft_d6     ),
	.fft_d7     (fft_d7     ),
	.fft_d8     (fft_d8     ),
	.fft_d9     (fft_d9     ),
	.fft_d10    (fft_d10    ),
	.fft_d11    (fft_d11    ),
	.fft_d12    (fft_d12    ),
	.fft_d13    (fft_d13    ),
	.fft_d14    (fft_d14    ),
	.fft_d15    (fft_d15    ),
	.done		(done		),
	.freq       (freq      	)
);


endmodule



module FIR_Filter (
	input 			clk, 
	input			rst,
	input 			data_valid,
	input 	[15:0] 	data,
	output 	reg		fir_valid,
	output 	[15:0]	fir_data
);

// 4b int, 16b fraction
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

// 8b int, 8b fraction
reg signed [15:0] x_shift_reg [0:31];
reg [5:0] count;

wire signed [35:0] x31_h0	= x_shift_reg[0]  * FIR_C00;
wire signed [35:0] x30_h1	= x_shift_reg[1]  * FIR_C01;
wire signed [35:0] x29_h2	= x_shift_reg[2]  * FIR_C02;
wire signed [35:0] x28_h3	= x_shift_reg[3]  * FIR_C03;
wire signed [35:0] x27_h4	= x_shift_reg[4]  * FIR_C04;
wire signed [35:0] x26_h5	= x_shift_reg[5]  * FIR_C05;
wire signed [35:0] x25_h6	= x_shift_reg[6]  * FIR_C06;
wire signed [35:0] x24_h7	= x_shift_reg[7]  * FIR_C07;
wire signed [35:0] x23_h8	= x_shift_reg[8]  * FIR_C08;
wire signed [35:0] x22_h9 	= x_shift_reg[9]  * FIR_C09;
wire signed [35:0] x21_h10	= x_shift_reg[10] * FIR_C10;
wire signed [35:0] x20_h11	= x_shift_reg[11] * FIR_C11;
wire signed [35:0] x19_h12	= x_shift_reg[12] * FIR_C12;
wire signed [35:0] x18_h13	= x_shift_reg[13] * FIR_C13;
wire signed [35:0] x17_h14	= x_shift_reg[14] * FIR_C14;
wire signed [35:0] x16_h15	= x_shift_reg[15] * FIR_C15;
wire signed [35:0] x15_h16	= x_shift_reg[16] * FIR_C16;
wire signed [35:0] x14_h17	= x_shift_reg[17] * FIR_C17;
wire signed [35:0] x13_h18	= x_shift_reg[18] * FIR_C18;
wire signed [35:0] x12_h19	= x_shift_reg[19] * FIR_C19;
wire signed [35:0] x11_h20	= x_shift_reg[20] * FIR_C20;
wire signed [35:0] x10_h21	= x_shift_reg[21] * FIR_C21;
wire signed [35:0] x9_h22	= x_shift_reg[22] * FIR_C22;
wire signed [35:0] x8_h23	= x_shift_reg[23] * FIR_C23;
wire signed [35:0] x7_h24	= x_shift_reg[24] * FIR_C24;
wire signed [35:0] x6_h25	= x_shift_reg[25] * FIR_C25;
wire signed [35:0] x5_h26	= x_shift_reg[26] * FIR_C26;
wire signed [35:0] x4_h27	= x_shift_reg[27] * FIR_C27;
wire signed [35:0] x3_h28	= x_shift_reg[28] * FIR_C28;
wire signed [35:0] x2_h29	= x_shift_reg[29] * FIR_C29;
wire signed [35:0] x1_h30	= x_shift_reg[30] * FIR_C30;
wire signed [35:0] x0_h31	= x_shift_reg[31] * FIR_C31;

wire signed [66:0] sum = x31_h0  + x30_h1  + x29_h2  + x28_h3  + x27_h4  + x26_h5  + x25_h6  + x24_h7  + 
                         x23_h8  + x22_h9  + x21_h10 + x20_h11 + x19_h12 + x18_h13 + x17_h14 + x16_h15 + 
                         x15_h16 + x14_h17 + x13_h18 + x12_h19 + x11_h20 + x10_h21 + x9_h22  + x8_h23  + 
                         x7_h24  + x6_h25  + x5_h26  + x4_h27  + x3_h28  + x2_h29  + x1_h30  + x0_h31;

wire signed [15:0] y_n = {sum[31:24],sum[23:16]};	// 16b int, 16b fraction

assign fir_data 	= y_n;
assign count_done	= count == 6'd32;

integer i, j;
always@(posedge clk or posedge rst) begin
	if(rst) begin
		for(i=0; i<32; i=i+1) begin
			x_shift_reg[i] <= 16'd0;
		end
	end
	else if(data_valid) begin
		x_shift_reg[0] <= data;
		for(j=0; j<31; j=j+1) begin
			x_shift_reg[j + 1] <= x_shift_reg[j];
		end
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		count <= 6'd0;
	end
	else if(data_valid) begin
		count <= count + 6'd1;
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		fir_valid <= 1'b0;
	end
	else if(count_done) begin
		fir_valid <= 1'b1;
	end
end

endmodule



module FFT (
	input 			clk, 
	input			rst,
	input 			fir_valid,
	input 	[15:0]	fir_data,
	output	reg		fft_valid,
	output 	[31:0] 	fft_d0, fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7,
	output 	[31:0] 	fft_d8, fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15
);

// FFT parameters
parameter W0_real = 32'h00010000;
parameter W1_real = 32'h0000EC83;   
parameter W2_real = 32'h0000B504;   
parameter W3_real = 32'h000061F7;   
parameter W4_real = 32'h00000000;   
parameter W5_real = 32'hFFFF9E09;   
parameter W6_real = 32'hFFFF4AFC;   
parameter W7_real = 32'hFFFF137D;

parameter W0_imag = 32'h00000000;    
parameter W1_imag = 32'hFFFF9E09;   
parameter W2_imag = 32'hFFFF4AFC;   
parameter W3_imag = 32'hFFFF137D;   
parameter W4_imag = 32'hFFFF0000;   
parameter W5_imag = 32'hFFFF137D;   
parameter W6_imag = 32'hFFFF4AFC;   
parameter W7_imag = 32'hFFFF9E09;


reg [3:0] idx;
reg [1:0] stage_count;

// 16b int, 16b fraction
reg signed [31:0] parallel_reg  	 [0:15];
reg signed [31:0] stage_0_x_real_reg [0:15];
reg signed [31:0] stage_0_x_imag_reg [0:15];
reg signed [31:0] stage_1_x_real_reg [0:15];
reg signed [31:0] stage_1_x_imag_reg [0:15];
reg signed [31:0] stage_2_x_real_reg [0:15];
reg signed [31:0] stage_2_x_imag_reg [0:15];
reg signed [31:0] stage_3_x_real_reg [0:15];
reg signed [31:0] stage_3_x_imag_reg [0:15];

reg forward_flag_reg;

assign fft_d0  	= {stage_3_x_real_reg[0] [23:8], stage_3_x_imag_reg[0] [23:8]};
assign fft_d8  	= {stage_3_x_real_reg[1] [23:8], stage_3_x_imag_reg[1] [23:8]};
assign fft_d4  	= {stage_3_x_real_reg[2] [23:8], stage_3_x_imag_reg[2] [23:8]};
assign fft_d12  = {stage_3_x_real_reg[3] [23:8], stage_3_x_imag_reg[3] [23:8]};
assign fft_d2  	= {stage_3_x_real_reg[4] [23:8], stage_3_x_imag_reg[4] [23:8]};
assign fft_d10  = {stage_3_x_real_reg[5] [23:8], stage_3_x_imag_reg[5] [23:8]};
assign fft_d6  	= {stage_3_x_real_reg[6] [23:8], stage_3_x_imag_reg[6] [23:8]};
assign fft_d14  = {stage_3_x_real_reg[7] [23:8], stage_3_x_imag_reg[7] [23:8]};
assign fft_d1  	= {stage_3_x_real_reg[8] [23:8], stage_3_x_imag_reg[8] [23:8]};
assign fft_d9  	= {stage_3_x_real_reg[9] [23:8], stage_3_x_imag_reg[9] [23:8]};
assign fft_d5 	= {stage_3_x_real_reg[10][23:8], stage_3_x_imag_reg[10][23:8]};
assign fft_d13 	= {stage_3_x_real_reg[11][23:8], stage_3_x_imag_reg[11][23:8]};
assign fft_d3 	= {stage_3_x_real_reg[12][23:8], stage_3_x_imag_reg[12][23:8]};
assign fft_d11 	= {stage_3_x_real_reg[13][23:8], stage_3_x_imag_reg[13][23:8]};
assign fft_d7 	= {stage_3_x_real_reg[14][23:8], stage_3_x_imag_reg[14][23:8]};
assign fft_d15 	= {stage_3_x_real_reg[15][23:8], stage_3_x_imag_reg[15][23:8]};

// serial to parallel registers
integer i;
always@(posedge clk or posedge rst) begin
	if(rst) begin
		for(i=0; i<16; i=i+1) begin
			parallel_reg[i] <= 32'd0;
		end
	end  
	else if(fir_valid) begin
		parallel_reg[idx] <= {{8{fir_data[15]}}, fir_data[15:8], fir_data[7:0], 8'd0};	// 8b int, 8b fraction
	end
end


function signed [31:0] cal_real;
    input signed [31:0] a, b, c, d;
    input signed [31:0] Wn_real, Wn_imag;
	reg   signed [55:0] out_temp;
    begin
        out_temp = (a - c) * Wn_real + (d - b) * Wn_imag;
        cal_real = out_temp[47:16] + out_temp[15];
    end
endfunction

function signed [31:0] cal_imag;
    input signed [31:0] a, b, c, d;
    input signed [31:0] Wn_real, Wn_imag;
	reg   signed [55:0] out_temp;
    begin
        out_temp = (a - c) * Wn_imag + (b - d) * Wn_real;
		cal_imag = out_temp[47:16] + out_temp[15];
    end
endfunction

always@(posedge clk or posedge rst) begin
	if(rst) begin
		for(i=0; i<16; i=i+1) begin
			stage_0_x_real_reg[i] <= 32'd0;
			stage_0_x_imag_reg[i] <= 32'd0;
			stage_1_x_real_reg[i] <= 32'd0;
			stage_1_x_imag_reg[i] <= 32'd0;
			stage_2_x_real_reg[i] <= 32'd0;
			stage_2_x_imag_reg[i] <= 32'd0;
			stage_3_x_real_reg[i] <= 32'd0;
			stage_3_x_imag_reg[i] <= 32'd0;
		end
	end  
	else if(forward_flag_reg) begin
		case(stage_count)
			2'd0 : begin
				// stage 0 real part
				stage_0_x_real_reg[0]  <= (parallel_reg[0] + parallel_reg [8]);
				stage_0_x_real_reg[1]  <= (parallel_reg[1] + parallel_reg [9]);
				stage_0_x_real_reg[2]  <= (parallel_reg[2] + parallel_reg[10]);
				stage_0_x_real_reg[3]  <= (parallel_reg[3] + parallel_reg[11]);
				stage_0_x_real_reg[4]  <= (parallel_reg[4] + parallel_reg[12]);
				stage_0_x_real_reg[5]  <= (parallel_reg[5] + parallel_reg[13]);
				stage_0_x_real_reg[6]  <= (parallel_reg[6] + parallel_reg[14]);
				stage_0_x_real_reg[7]  <= (parallel_reg[7] + parallel_reg[15]);
				// stage 0 imag part
				stage_0_x_imag_reg[0]   <= 32'd0;
				stage_0_x_imag_reg[1]   <= 32'd0;
				stage_0_x_imag_reg[2]   <= 32'd0;
				stage_0_x_imag_reg[3]   <= 32'd0;
				stage_0_x_imag_reg[4]   <= 32'd0;
				stage_0_x_imag_reg[5]   <= 32'd0;
				stage_0_x_imag_reg[6]   <= 32'd0;
				stage_0_x_imag_reg[7]   <= 32'd0;
				// stage 0 real part
				stage_0_x_real_reg[8]  <= cal_real(parallel_reg[0], 32'sd0,  parallel_reg [8], 32'sd0,  W0_real, W0_imag);
				stage_0_x_real_reg[9]  <= cal_real(parallel_reg[1], 32'sd0,  parallel_reg [9], 32'sd0,  W1_real, W1_imag);
				stage_0_x_real_reg[10] <= cal_real(parallel_reg[2], 32'sd0,  parallel_reg[10], 32'sd0,  W2_real, W2_imag);
				stage_0_x_real_reg[11] <= cal_real(parallel_reg[3], 32'sd0,  parallel_reg[11], 32'sd0,  W3_real, W3_imag);
				stage_0_x_real_reg[12] <= cal_real(parallel_reg[4], 32'sd0,  parallel_reg[12], 32'sd0,  W4_real, W4_imag);
				stage_0_x_real_reg[13] <= cal_real(parallel_reg[5], 32'sd0,  parallel_reg[13], 32'sd0,  W5_real, W5_imag);
				stage_0_x_real_reg[14] <= cal_real(parallel_reg[6], 32'sd0,  parallel_reg[14], 32'sd0,  W6_real, W6_imag);
				stage_0_x_real_reg[15] <= cal_real(parallel_reg[7], 32'sd0,  parallel_reg[15], 32'sd0,  W7_real, W7_imag);
				// stage 0 imag part				 
				stage_0_x_imag_reg[8]  <= cal_imag(parallel_reg[0], 32'sd0,  parallel_reg [8], 32'sd0,  W0_real, W0_imag);
				stage_0_x_imag_reg[9]  <= cal_imag(parallel_reg[1], 32'sd0,  parallel_reg [9], 32'sd0,  W1_real, W1_imag);
				stage_0_x_imag_reg[10] <= cal_imag(parallel_reg[2], 32'sd0,  parallel_reg[10], 32'sd0,  W2_real, W2_imag);
				stage_0_x_imag_reg[11] <= cal_imag(parallel_reg[3], 32'sd0,  parallel_reg[11], 32'sd0,  W3_real, W3_imag);
				stage_0_x_imag_reg[12] <= cal_imag(parallel_reg[4], 32'sd0,  parallel_reg[12], 32'sd0,  W4_real, W4_imag);
				stage_0_x_imag_reg[13] <= cal_imag(parallel_reg[5], 32'sd0,  parallel_reg[13], 32'sd0,  W5_real, W5_imag);
				stage_0_x_imag_reg[14] <= cal_imag(parallel_reg[6], 32'sd0,  parallel_reg[14], 32'sd0,  W6_real, W6_imag);
				stage_0_x_imag_reg[15] <= cal_imag(parallel_reg[7], 32'sd0,  parallel_reg[15], 32'sd0,  W7_real, W7_imag);
			end
			2'd1 : begin
				// stage 1 real part
				stage_1_x_real_reg[0]  <= stage_0_x_real_reg[0]  + stage_0_x_real_reg[4];
				stage_1_x_real_reg[1]  <= stage_0_x_real_reg[1]  + stage_0_x_real_reg[5];
				stage_1_x_real_reg[2]  <= stage_0_x_real_reg[2]  + stage_0_x_real_reg[6];
				stage_1_x_real_reg[3]  <= stage_0_x_real_reg[3]  + stage_0_x_real_reg[7];
				stage_1_x_real_reg[8]  <= stage_0_x_real_reg[8]  + stage_0_x_real_reg[12];
				stage_1_x_real_reg[9]  <= stage_0_x_real_reg[9]  + stage_0_x_real_reg[13];
				stage_1_x_real_reg[10] <= stage_0_x_real_reg[10] + stage_0_x_real_reg[14];
				stage_1_x_real_reg[11] <= stage_0_x_real_reg[11] + stage_0_x_real_reg[15];
				// stage 1 imag part
				stage_1_x_imag_reg[0]   <= stage_0_x_imag_reg[0]   + stage_0_x_imag_reg[4];
				stage_1_x_imag_reg[1]   <= stage_0_x_imag_reg[1]   + stage_0_x_imag_reg[5];
				stage_1_x_imag_reg[2]   <= stage_0_x_imag_reg[2]   + stage_0_x_imag_reg[6];
				stage_1_x_imag_reg[3]   <= stage_0_x_imag_reg[3]   + stage_0_x_imag_reg[7];
				stage_1_x_imag_reg[8]   <= stage_0_x_imag_reg[8]   + stage_0_x_imag_reg[12];
				stage_1_x_imag_reg[9]   <= stage_0_x_imag_reg[9]   + stage_0_x_imag_reg[13];
				stage_1_x_imag_reg[10]  <= stage_0_x_imag_reg[10]  + stage_0_x_imag_reg[14];
				stage_1_x_imag_reg[11]  <= stage_0_x_imag_reg[11]  + stage_0_x_imag_reg[15];
				// stage 1 real part
				stage_1_x_real_reg[4]   <= cal_real(stage_0_x_real_reg[0],  stage_0_x_imag_reg[0],  stage_0_x_real_reg[4],  stage_0_x_imag_reg[0],  W0_real, W0_imag);
				stage_1_x_real_reg[5]   <= cal_real(stage_0_x_real_reg[1],  stage_0_x_imag_reg[1],  stage_0_x_real_reg[5],  stage_0_x_imag_reg[1],  W2_real, W2_imag);
				stage_1_x_real_reg[6]   <= cal_real(stage_0_x_real_reg[2],  stage_0_x_imag_reg[2],  stage_0_x_real_reg[6],  stage_0_x_imag_reg[2],  W4_real, W4_imag);
				stage_1_x_real_reg[7]   <= cal_real(stage_0_x_real_reg[3],  stage_0_x_imag_reg[3],  stage_0_x_real_reg[7],  stage_0_x_imag_reg[3],  W6_real, W6_imag);
				stage_1_x_real_reg[12]  <= cal_real(stage_0_x_real_reg[8],  stage_0_x_imag_reg[8],  stage_0_x_real_reg[12], stage_0_x_imag_reg[12], W0_real, W0_imag);
				stage_1_x_real_reg[13]  <= cal_real(stage_0_x_real_reg[9],  stage_0_x_imag_reg[9],  stage_0_x_real_reg[13], stage_0_x_imag_reg[13], W2_real, W2_imag);
				stage_1_x_real_reg[14]  <= cal_real(stage_0_x_real_reg[10], stage_0_x_imag_reg[10], stage_0_x_real_reg[14], stage_0_x_imag_reg[14], W4_real, W4_imag);
				stage_1_x_real_reg[15]  <= cal_real(stage_0_x_real_reg[11], stage_0_x_imag_reg[11], stage_0_x_real_reg[15], stage_0_x_imag_reg[15], W6_real, W6_imag);
				// stage 1 imag part                                                                                                                                 
				stage_1_x_imag_reg[4]   <= cal_imag(stage_0_x_real_reg[0],  stage_0_x_imag_reg[4],  stage_0_x_real_reg[0],  stage_0_x_imag_reg[4],  W0_real, W0_imag);
				stage_1_x_imag_reg[5]   <= cal_imag(stage_0_x_real_reg[1],  stage_0_x_imag_reg[5],  stage_0_x_real_reg[1],  stage_0_x_imag_reg[5],  W2_real, W2_imag);
				stage_1_x_imag_reg[6]   <= cal_imag(stage_0_x_real_reg[2],  stage_0_x_imag_reg[6],  stage_0_x_real_reg[2],  stage_0_x_imag_reg[6],  W4_real, W4_imag);
				stage_1_x_imag_reg[7]   <= cal_imag(stage_0_x_real_reg[3],  stage_0_x_imag_reg[7],  stage_0_x_real_reg[3],  stage_0_x_imag_reg[7],  W6_real, W6_imag);
				stage_1_x_imag_reg[12]  <= cal_imag(stage_0_x_real_reg[8],  stage_0_x_imag_reg[8],  stage_0_x_real_reg[12], stage_0_x_imag_reg[12], W0_real, W0_imag);
				stage_1_x_imag_reg[13]  <= cal_imag(stage_0_x_real_reg[9],  stage_0_x_imag_reg[9],  stage_0_x_real_reg[13], stage_0_x_imag_reg[13], W2_real, W2_imag);
				stage_1_x_imag_reg[14]  <= cal_imag(stage_0_x_real_reg[10], stage_0_x_imag_reg[10], stage_0_x_real_reg[14], stage_0_x_imag_reg[14], W4_real, W4_imag);
				stage_1_x_imag_reg[15]  <= cal_imag(stage_0_x_real_reg[11], stage_0_x_imag_reg[11], stage_0_x_real_reg[15], stage_0_x_imag_reg[15], W6_real, W6_imag);
			end
			2'd2 : begin
				// stage 2 real part
				stage_2_x_real_reg[0]  <= stage_1_x_real_reg[0]  + stage_1_x_real_reg[2];
				stage_2_x_real_reg[1]  <= stage_1_x_real_reg[1]  + stage_1_x_real_reg[3];
				stage_2_x_real_reg[4]  <= stage_1_x_real_reg[4]  + stage_1_x_real_reg[6];
				stage_2_x_real_reg[5]  <= stage_1_x_real_reg[5]  + stage_1_x_real_reg[7];
				stage_2_x_real_reg[8]  <= stage_1_x_real_reg[8]  + stage_1_x_real_reg[10];
				stage_2_x_real_reg[9]  <= stage_1_x_real_reg[9]  + stage_1_x_real_reg[11];
				stage_2_x_real_reg[12] <= stage_1_x_real_reg[12] + stage_1_x_real_reg[14];
				stage_2_x_real_reg[13] <= stage_1_x_real_reg[13] + stage_1_x_real_reg[15];
				// stage 2 imag part 
				stage_2_x_imag_reg[0]  <= stage_1_x_imag_reg[0]  + stage_1_x_imag_reg[2];
				stage_2_x_imag_reg[1]  <= stage_1_x_imag_reg[1]  + stage_1_x_imag_reg[3];
				stage_2_x_imag_reg[4]  <= stage_1_x_imag_reg[4]  + stage_1_x_imag_reg[6];
				stage_2_x_imag_reg[5]  <= stage_1_x_imag_reg[5]  + stage_1_x_imag_reg[7];
				stage_2_x_imag_reg[8]  <= stage_1_x_imag_reg[8]  + stage_1_x_imag_reg[10];
				stage_2_x_imag_reg[9]  <= stage_1_x_imag_reg[9]  + stage_1_x_imag_reg[11];
				stage_2_x_imag_reg[12] <= stage_1_x_imag_reg[12] + stage_1_x_imag_reg[14];
				stage_2_x_imag_reg[13] <= stage_1_x_imag_reg[13] + stage_1_x_imag_reg[15];
				// stage 2 real part
				stage_2_x_real_reg[2]  <= cal_real(stage_1_x_real_reg[0],  stage_1_x_imag_reg[0],  stage_1_x_real_reg[2],  stage_1_x_imag_reg[2],  W0_real, W0_imag);
				stage_2_x_real_reg[3]  <= cal_real(stage_1_x_real_reg[1],  stage_1_x_imag_reg[1],  stage_1_x_real_reg[3],  stage_1_x_imag_reg[3],  W4_real, W4_imag);
				stage_2_x_real_reg[6]  <= cal_real(stage_1_x_real_reg[4],  stage_1_x_imag_reg[4],  stage_1_x_real_reg[6],  stage_1_x_imag_reg[6],  W0_real, W0_imag);
				stage_2_x_real_reg[7]  <= cal_real(stage_1_x_real_reg[5],  stage_1_x_imag_reg[5],  stage_1_x_real_reg[7],  stage_1_x_imag_reg[7],  W4_real, W4_imag);
				stage_2_x_real_reg[10] <= cal_real(stage_1_x_real_reg[8],  stage_1_x_imag_reg[8],  stage_1_x_real_reg[10], stage_1_x_imag_reg[10], W0_real, W0_imag);
				stage_2_x_real_reg[11] <= cal_real(stage_1_x_real_reg[9],  stage_1_x_imag_reg[9],  stage_1_x_real_reg[11], stage_1_x_imag_reg[11], W4_real, W4_imag);
				stage_2_x_real_reg[14] <= cal_real(stage_1_x_real_reg[12], stage_1_x_imag_reg[12], stage_1_x_real_reg[14], stage_1_x_imag_reg[14], W0_real, W0_imag);
				stage_2_x_real_reg[15] <= cal_real(stage_1_x_real_reg[13], stage_1_x_imag_reg[13], stage_1_x_real_reg[15], stage_1_x_imag_reg[15], W4_real, W4_imag);
				// stage 2 imag part                                                                                                                                
				stage_2_x_imag_reg[2]  <= cal_imag(stage_1_x_real_reg[0],  stage_1_x_imag_reg[0],  stage_1_x_real_reg[2],  stage_1_x_imag_reg[2],  W0_real, W0_imag);
				stage_2_x_imag_reg[3]  <= cal_imag(stage_1_x_real_reg[1],  stage_1_x_imag_reg[1],  stage_1_x_real_reg[3],  stage_1_x_imag_reg[3],  W4_real, W4_imag);
				stage_2_x_imag_reg[6]  <= cal_imag(stage_1_x_real_reg[4],  stage_1_x_imag_reg[4],  stage_1_x_real_reg[6],  stage_1_x_imag_reg[6],  W0_real, W0_imag);
				stage_2_x_imag_reg[7]  <= cal_imag(stage_1_x_real_reg[5],  stage_1_x_imag_reg[5],  stage_1_x_real_reg[7],  stage_1_x_imag_reg[7],  W4_real, W4_imag);
				stage_2_x_imag_reg[10] <= cal_imag(stage_1_x_real_reg[8],  stage_1_x_imag_reg[8],  stage_1_x_real_reg[10], stage_1_x_imag_reg[10], W0_real, W0_imag);
				stage_2_x_imag_reg[11] <= cal_imag(stage_1_x_real_reg[9],  stage_1_x_imag_reg[9],  stage_1_x_real_reg[11], stage_1_x_imag_reg[11], W4_real, W4_imag);
				stage_2_x_imag_reg[14] <= cal_imag(stage_1_x_real_reg[12], stage_1_x_imag_reg[12], stage_1_x_real_reg[14], stage_1_x_imag_reg[14], W0_real, W0_imag);
				stage_2_x_imag_reg[15] <= cal_imag(stage_1_x_real_reg[13], stage_1_x_imag_reg[13], stage_1_x_real_reg[15], stage_1_x_imag_reg[15], W4_real, W4_imag);
			end
			2'd3 : begin
				// stage 3 real part
				stage_3_x_real_reg[0]  <= stage_2_x_real_reg[0]  + stage_2_x_real_reg[1];
				stage_3_x_real_reg[2]  <= stage_2_x_real_reg[2]  + stage_2_x_real_reg[3];
				stage_3_x_real_reg[4]  <= stage_2_x_real_reg[4]  + stage_2_x_real_reg[5];
				stage_3_x_real_reg[6]  <= stage_2_x_real_reg[6]  + stage_2_x_real_reg[7];
				stage_3_x_real_reg[8]  <= stage_2_x_real_reg[8]  + stage_2_x_real_reg[9];
				stage_3_x_real_reg[10] <= stage_2_x_real_reg[10] + stage_2_x_real_reg[11];
				stage_3_x_real_reg[12] <= stage_2_x_real_reg[12] + stage_2_x_real_reg[13];
				stage_3_x_real_reg[14] <= stage_2_x_real_reg[14] + stage_2_x_real_reg[15];
				
				stage_3_x_real_reg[1]  <= stage_2_x_real_reg[0]  - stage_2_x_real_reg[1];
				stage_3_x_real_reg[3]  <= stage_2_x_real_reg[2]  - stage_2_x_real_reg[3];
				stage_3_x_real_reg[5]  <= stage_2_x_real_reg[4]  - stage_2_x_real_reg[5];
				stage_3_x_real_reg[7]  <= stage_2_x_real_reg[6]  - stage_2_x_real_reg[7];
				stage_3_x_real_reg[9]  <= stage_2_x_real_reg[8]  - stage_2_x_real_reg[9];
				stage_3_x_real_reg[11] <= stage_2_x_real_reg[10] - stage_2_x_real_reg[11];
				stage_3_x_real_reg[13] <= stage_2_x_real_reg[12] - stage_2_x_real_reg[13];
				stage_3_x_real_reg[15] <= stage_2_x_real_reg[14] - stage_2_x_real_reg[15];
				// stage 3 imag part
				stage_3_x_imag_reg[0]  <= stage_2_x_imag_reg[0]  + stage_2_x_imag_reg[1];
				stage_3_x_imag_reg[2]  <= stage_2_x_imag_reg[2]  + stage_2_x_imag_reg[3];
				stage_3_x_imag_reg[4]  <= stage_2_x_imag_reg[4]  + stage_2_x_imag_reg[5];
				stage_3_x_imag_reg[6]  <= stage_2_x_imag_reg[6]  + stage_2_x_imag_reg[7];
				stage_3_x_imag_reg[8]  <= stage_2_x_imag_reg[8]  + stage_2_x_imag_reg[9];
				stage_3_x_imag_reg[10] <= stage_2_x_imag_reg[10] + stage_2_x_imag_reg[11];
				stage_3_x_imag_reg[12] <= stage_2_x_imag_reg[12] + stage_2_x_imag_reg[13];
				stage_3_x_imag_reg[14] <= stage_2_x_imag_reg[14] + stage_2_x_imag_reg[15];
				
				stage_3_x_imag_reg[1]  <= stage_2_x_imag_reg[0]  - stage_2_x_imag_reg[1];
				stage_3_x_imag_reg[3]  <= stage_2_x_imag_reg[2]  - stage_2_x_imag_reg[3];
				stage_3_x_imag_reg[5]  <= stage_2_x_imag_reg[4]  - stage_2_x_imag_reg[5];
				stage_3_x_imag_reg[7]  <= stage_2_x_imag_reg[6]  - stage_2_x_imag_reg[7];
				stage_3_x_imag_reg[9]  <= stage_2_x_imag_reg[8]  - stage_2_x_imag_reg[9];
				stage_3_x_imag_reg[11] <= stage_2_x_imag_reg[10] - stage_2_x_imag_reg[11];
				stage_3_x_imag_reg[13] <= stage_2_x_imag_reg[12] - stage_2_x_imag_reg[13];
				stage_3_x_imag_reg[15] <= stage_2_x_imag_reg[14] - stage_2_x_imag_reg[15];
			end
		endcase
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		idx <= 4'd0;
	end
	else if(fir_valid) begin
		idx <= idx + 4'd1;
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		stage_count <= 3'd0;
	end
	else if(forward_flag_reg) begin
		stage_count <= stage_count + 3'd1;
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		forward_flag_reg <= 1'd0;
	end
	else if(idx == 4'd15) begin
		forward_flag_reg <= 1'b1;
	end
	else if(stage_count == 2'd3) begin
		forward_flag_reg <= 1'b0;
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		fft_valid <= 1'd0;
	end
	else if(stage_count == 2'd3) begin
		fft_valid <= 1'b1;
	end
	else begin
		fft_valid <= 1'b0;
	end
end


endmodule





module Analysis (
	input 			clk, 
	input			rst,
	input 			fft_valid,
	input signed	[31:0] 	fft_d0, fft_d1, fft_d2, fft_d3, fft_d4, fft_d5, fft_d6, fft_d7,
	input signed	[31:0] 	fft_d8, fft_d9, fft_d10, fft_d11, fft_d12, fft_d13, fft_d14, fft_d15,
	output 			done,
	output 	[3:0]	freq
);

		  
wire [15:0] fft_d0_real	 = fft_d0[31]  ? (~fft_d0 [31:16] + 16'd1) : fft_d0 [30:16];
wire [15:0] fft_d1_real	 = fft_d1[31]  ? (~fft_d1 [31:16] + 16'd1) : fft_d1 [30:16];
wire [15:0] fft_d2_real	 = fft_d2[31]  ? (~fft_d2 [31:16] + 16'd1) : fft_d2 [30:16];
wire [15:0] fft_d3_real	 = fft_d3[31]  ? (~fft_d3 [31:16] + 16'd1) : fft_d3 [30:16];
wire [15:0] fft_d4_real	 = fft_d4[31]  ? (~fft_d4 [31:16] + 16'd1) : fft_d4 [30:16];
wire [15:0] fft_d5_real	 = fft_d5[31]  ? (~fft_d5 [31:16] + 16'd1) : fft_d5 [30:16];
wire [15:0] fft_d6_real	 = fft_d6[31]  ? (~fft_d6 [31:16] + 16'd1) : fft_d6 [30:16];
wire [15:0] fft_d7_real	 = fft_d7[31]  ? (~fft_d7 [31:16] + 16'd1) : fft_d7 [30:16];
wire [15:0] fft_d8_real	 = fft_d8[31]  ? (~fft_d8 [31:16] + 16'd1) : fft_d8 [30:16];
wire [15:0] fft_d9_real	 = fft_d9[31]  ? (~fft_d9 [31:16] + 16'd1) : fft_d9 [30:16];
wire [15:0] fft_d10_real = fft_d10[31] ? (~fft_d10[31:16] + 16'd1) : fft_d10[30:16];
wire [15:0] fft_d11_real = fft_d11[31] ? (~fft_d11[31:16] + 16'd1) : fft_d11[30:16];
wire [15:0] fft_d12_real = fft_d12[31] ? (~fft_d12[31:16] + 16'd1) : fft_d12[30:16];
wire [15:0] fft_d13_real = fft_d13[31] ? (~fft_d13[31:16] + 16'd1) : fft_d13[30:16];
wire [15:0] fft_d14_real = fft_d14[31] ? (~fft_d14[31:16] + 16'd1) : fft_d14[30:16];
wire [15:0] fft_d15_real = fft_d15[31] ? (~fft_d15[31:16] + 16'd1) : fft_d15[30:16];

wire [15:0] fft_d0_imag	 = fft_d0[15]  ? (~fft_d0 [15:0]  + 16'd1) : fft_d0 [15:0];
wire [15:0] fft_d1_imag	 = fft_d1[15]  ? (~fft_d1 [15:0]  + 16'd1) : fft_d1 [15:0];
wire [15:0] fft_d2_imag	 = fft_d2[15]  ? (~fft_d2 [15:0]  + 16'd1) : fft_d2 [15:0];
wire [15:0] fft_d3_imag	 = fft_d3[15]  ? (~fft_d3 [15:0]  + 16'd1) : fft_d3 [15:0];
wire [15:0] fft_d4_imag	 = fft_d4[15]  ? (~fft_d4 [15:0]  + 16'd1) : fft_d4 [15:0];
wire [15:0] fft_d5_imag	 = fft_d5[15]  ? (~fft_d5 [15:0]  + 16'd1) : fft_d5 [15:0];
wire [15:0] fft_d6_imag	 = fft_d6[15]  ? (~fft_d6 [15:0]  + 16'd1) : fft_d6 [15:0];
wire [15:0] fft_d7_imag	 = fft_d7[15]  ? (~fft_d7 [15:0]  + 16'd1) : fft_d7 [15:0];
wire [15:0] fft_d8_imag	 = fft_d8[15]  ? (~fft_d8 [15:0]  + 16'd1) : fft_d8 [15:0];
wire [15:0] fft_d9_imag	 = fft_d9[15]  ? (~fft_d9 [15:0]  + 16'd1) : fft_d9 [15:0];
wire [15:0] fft_d10_imag = fft_d10[15] ? (~fft_d10[15:0]  + 16'd1) : fft_d10[14:0];
wire [15:0] fft_d11_imag = fft_d11[15] ? (~fft_d11[15:0]  + 16'd1) : fft_d11[14:0];
wire [15:0] fft_d12_imag = fft_d12[15] ? (~fft_d12[15:0]  + 16'd1) : fft_d12[14:0];
wire [15:0] fft_d13_imag = fft_d13[15] ? (~fft_d13[15:0]  + 16'd1) : fft_d13[14:0];
wire [15:0] fft_d14_imag = fft_d14[15] ? (~fft_d14[15:0]  + 16'd1) : fft_d14[14:0];
wire [15:0] fft_d15_imag = fft_d15[15] ? (~fft_d15[15:0]  + 16'd1) : fft_d15[14:0];


// sum of square (length)
wire [32:0] fft_d0_len  = (fft_d0_real  * fft_d0_real)  + (fft_d0_imag  * fft_d0_imag);
wire [32:0] fft_d1_len  = (fft_d1_real  * fft_d1_real)  + (fft_d1_imag  * fft_d1_imag);
wire [32:0] fft_d2_len  = (fft_d2_real  * fft_d2_real)  + (fft_d2_imag  * fft_d2_imag);
wire [32:0] fft_d3_len  = (fft_d3_real  * fft_d3_real)  + (fft_d3_imag  * fft_d3_imag);
wire [32:0] fft_d4_len  = (fft_d4_real  * fft_d4_real)  + (fft_d4_imag  * fft_d4_imag);
wire [32:0] fft_d5_len  = (fft_d5_real  * fft_d5_real)  + (fft_d5_imag  * fft_d5_imag);
wire [32:0] fft_d6_len  = (fft_d6_real  * fft_d6_real)  + (fft_d6_imag  * fft_d6_imag);
wire [32:0] fft_d7_len  = (fft_d7_real  * fft_d7_real)  + (fft_d7_imag  * fft_d7_imag);
wire [32:0] fft_d8_len  = (fft_d8_real  * fft_d8_real)  + (fft_d8_imag  * fft_d8_imag);
wire [32:0] fft_d9_len  = (fft_d9_real  * fft_d9_real)  + (fft_d9_imag  * fft_d9_imag);
wire [32:0] fft_d10_len = (fft_d10_real * fft_d10_real) + (fft_d10_imag * fft_d10_imag);
wire [32:0] fft_d11_len = (fft_d11_real * fft_d11_real) + (fft_d11_imag * fft_d11_imag);
wire [32:0] fft_d12_len = (fft_d12_real * fft_d12_real) + (fft_d12_imag * fft_d12_imag);
wire [32:0] fft_d13_len = (fft_d13_real * fft_d13_real) + (fft_d13_imag * fft_d13_imag);
wire [32:0] fft_d14_len = (fft_d14_real * fft_d14_real) + (fft_d14_imag * fft_d14_imag);
wire [32:0] fft_d15_len = (fft_d15_real * fft_d15_real) + (fft_d15_imag * fft_d15_imag);

reg [1:0] stage_count;

reg [32:0] max_0_1_value;
reg [32:0] max_2_3_value;
reg [32:0] max_4_5_value;
reg [32:0] max_6_7_value;
reg [32:0] max_8_9_value;
reg [32:0] max_10_11_value;
reg [32:0] max_12_13_value;
reg [32:0] max_14_15_value;
reg [32:0] max_0_3_value;
reg [32:0] max_4_7_value;
reg [32:0] max_8_11_value;
reg [32:0] max_12_15_value;
reg [32:0] max_0_7_value;
reg [32:0] max_8_15_value;
reg [32:0] max_value;

reg [3:0] max_0_1_num;
reg [3:0] max_2_3_num;
reg [3:0] max_4_5_num;
reg [3:0] max_6_7_num;
reg [3:0] max_8_9_num;
reg [3:0] max_10_11_num;
reg [3:0] max_12_13_num;
reg [3:0] max_14_15_num;
reg [3:0] max_0_3_num;
reg [3:0] max_4_7_num;
reg [3:0] max_8_11_num;
reg [3:0] max_12_15_num;
reg [3:0] max_0_7_num;
reg [3:0] max_8_15_num;
reg [3:0] max_num;
reg done_reg;

assign freq = max_num;
assign done = done_reg;

always@(posedge clk or posedge rst) begin
	if(rst) begin
		stage_count <= 2'd0;
	end
	else if(fft_valid | stage_count != 2'd0) begin
		stage_count <= stage_count + 2'd1;
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		max_0_1_value 	<= 33'd0;
		max_2_3_value 	<= 33'd0;
		max_4_5_value 	<= 33'd0;
		max_6_7_value 	<= 33'd0;
		max_8_9_value 	<= 33'd0;
		max_10_11_value <= 33'd0;
		max_12_13_value <= 33'd0;
		max_14_15_value <= 33'd0;
		
		max_0_1_num   	<= 4'd0;
		max_2_3_num   	<= 4'd0;
		max_4_5_num   	<= 4'd0;
		max_6_7_num   	<= 4'd0;
		max_8_9_num   	<= 4'd0;
		max_10_11_num 	<= 4'd0;
		max_12_13_num 	<= 4'd0;
		max_14_15_num 	<= 4'd0;
	end
	else if(stage_count == 2'd0) begin
		max_0_1_value 	<= (fft_d0_len 		> fft_d1_len)  		? fft_d0_len      : fft_d1_len;
		max_2_3_value 	<= (fft_d2_len 		> fft_d3_len)  		? fft_d2_len      : fft_d3_len;
		max_4_5_value 	<= (fft_d4_len 		> fft_d5_len)  		? fft_d4_len      : fft_d5_len;
		max_6_7_value 	<= (fft_d6_len 		> fft_d7_len)  		? fft_d6_len      : fft_d7_len;
		max_8_9_value 	<= (fft_d8_len 		> fft_d9_len)  		? fft_d8_len      : fft_d9_len;
		max_10_11_value <= (fft_d10_len		> fft_d11_len) 		? fft_d10_len     : fft_d11_len;
		max_12_13_value <= (fft_d12_len		> fft_d13_len) 		? fft_d12_len     : fft_d13_len;
		max_14_15_value <= (fft_d14_len		> fft_d15_len) 		? fft_d14_len     : fft_d15_len;

		max_0_1_num   	<= (fft_d0_len 		> fft_d1_len) 		? 4'd0  : 4'd1;
		max_2_3_num   	<= (fft_d2_len 		> fft_d3_len) 		? 4'd2  : 4'd3;
		max_4_5_num   	<= (fft_d4_len 		> fft_d5_len) 		? 4'd4  : 4'd5;
		max_6_7_num   	<= (fft_d6_len 		> fft_d7_len) 		? 4'd6  : 4'd7;
		max_8_9_num   	<= (fft_d8_len 		> fft_d9_len) 		? 4'd8  : 4'd9;
		max_10_11_num 	<= (fft_d10_len		> fft_d11_len)		? 4'd10 : 4'd11;
		max_12_13_num 	<= (fft_d12_len		> fft_d13_len)		? 4'd12 : 4'd13;
		max_14_15_num 	<= (fft_d14_len		> fft_d15_len)		? 4'd14 : 4'd15;
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		max_0_3_value 	<= 33'd0;
		max_4_7_value 	<= 33'd0;
		max_8_11_value 	<= 33'd0;
		max_12_15_value <= 33'd0;
		
		max_0_3_num 	<= 4'd0;
		max_4_7_num 	<= 4'd0;
		max_8_11_num 	<= 4'd0;
		max_12_15_num 	<= 4'd0;
	end
	else if(stage_count == 2'd1) begin
		max_0_3_value 	<= (max_0_1_value   > max_2_3_value)   	? max_0_1_value   : max_2_3_value;
		max_4_7_value 	<= (max_4_5_value   > max_6_7_value)   	? max_4_5_value   : max_6_7_value;
		max_8_11_value 	<= (max_8_9_value   > max_10_11_value) 	? max_8_9_value   : max_10_11_value;
		max_12_15_value <= (max_12_13_value > max_14_15_value) 	? max_12_13_value : max_14_15_value;

		max_0_3_num 	<= (max_0_1_value   > max_2_3_value)   	? max_0_1_num     : max_2_3_num;
		max_4_7_num 	<= (max_4_5_value   > max_6_7_value)   	? max_4_5_num     : max_6_7_num;
		max_8_11_num 	<= (max_8_9_value   > max_10_11_value) 	? max_8_9_num     : max_10_11_num;
		max_12_15_num 	<= (max_12_13_value > max_14_15_value) 	? max_12_13_num   : max_14_15_num;
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		max_0_7_value 	<= 33'd0;
		max_8_15_value 	<= 33'd0;
		
		max_0_7_num 	<= 4'd0;
		max_8_15_num 	<= 4'd0;
	end
	else if(stage_count == 2'd2) begin
		max_0_7_value 	<= (max_0_3_value   > max_4_7_value)   	? max_0_3_value  : max_4_7_value;
		max_8_15_value 	<= (max_8_11_value  > max_12_15_value) 	? max_8_11_value : max_12_15_value;

		max_0_7_num 	<= (max_0_3_value   > max_4_7_value)   	? max_0_3_num    : max_4_7_num;
		max_8_15_num 	<= (max_8_11_value  > max_12_15_value) 	? max_8_11_num   : max_12_15_num;
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		max_value	 	<= 33'd0;
		max_num	 		<= 4'd0;
	end
	else if(stage_count == 2'd3) begin
		max_value	 	<= (max_0_7_value  	> max_8_15_value)   ? max_0_7_value : max_8_15_value;
		max_num	 		<= (max_0_7_value  	> max_8_15_value)	? max_0_7_num   : max_8_15_num;
	end
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		done_reg <= 1'b0;
	end
	else if(stage_count == 2'd3) begin
		done_reg <= 1'b1;
	end
	else begin
		done_reg <= 1'b0;
	end
end


endmodule

