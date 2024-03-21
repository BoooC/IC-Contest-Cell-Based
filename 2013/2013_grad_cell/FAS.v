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













endmodule
