module STI_DAC(
	input				clk, 
	input 				reset,
	input				load, pi_msb, pi_low, pi_end,
	input		[15:0]	pi_data,
	input		[1:0]	pi_length,
	input				pi_fill,
	output reg			so_data, so_valid,
	output reg 			oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr,
	output reg 	[4:0] 	oem_addr,
	output reg 	[7:0] 	oem_dataout
);
















endmodule


