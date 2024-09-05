module Bicubic (
input CLK,
input RST,
input [6:0] V0,
input [6:0] H0,
input [4:0] SW,
input [4:0] SH,
input [5:0] TW,
input [5:0] TH,
output  DONE);

// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
localparam IDLE 		= 3'd0;
localparam READ_ROM 	= 3'd1;
localparam HOR_INTER	= 3'd2;
localparam VER_INTER	= 3'd3;
localparam WRITE_BACK	= 3'd4;
localparam FINISH		= 3'd5;

parameter FRAC_BIT = 15;

// ====================================================================	//
// 						 	Instantiation  								//
// ====================================================================	//
wire [7:0] 	rom_data;	// rom out
wire [13:0] rom_addr;
wire 		rom_en;

wire [7:0] 	sram_data;	// sram in
wire [13:0] sram_addr;
wire 		sram_en;
wire 		sram_wr;

ImgROM u_ImgROM (.Q(rom_data), .CLK(~CLK), .CEN(rom_en), .A(rom_addr));
ResultSRAM u_ResultSRAM (.Q(), .CLK(~CLK), .CEN(sram_en), .WEN(sram_wr), .A(sram_addr), .D(sram_data));

// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [2:0] state, next_state;

reg [5:0] X_count; 		// 0~TW-1
reg [5:0] Y_count;		// 0~TH-1

reg [1:0] hor_count; 	// 0~3
reg [1:0] ver_count; 	// 0~3

reg [7:0] ROM_Buffer [0:3];
reg [7:0] Hor_Result [0:3];

// scaling factor
reg [5:0] hor_ratio_den;	
reg [5:0] hor_ratio_num;
reg [5:0] ver_ratio_den;
reg [5:0] ver_ratio_num;

// pipelined registers
reg [5+FRAC_BIT:0] x;	// [21:0]
reg [5+FRAC_BIT:0] y;	// [21:0]

reg [7:0] inter_result;
reg [13:0] sram_addr_reg;


// ====================================================================	//
// 						 		 Wires  								//
// ====================================================================	//
// state wire
wire IDLE_wire 			= state == IDLE;
wire READ_ROM_wire 		= state == READ_ROM;
wire HOR_INTER_wire		= state == HOR_INTER;
wire VER_INTER_wire		= state == VER_INTER;
wire WRITE_BACK_wire	= state == WRITE_BACK;
wire FINISH_wire		= state == FINISH;

// interpolation
wire [9:0] hor_num = X_count * hor_ratio_num;
wire [9:0] ver_num = Y_count * ver_ratio_num;

wire [4:0] x_int = hor_num / hor_ratio_den;
wire [4:0] y_int = ver_num / ver_ratio_den;
wire [5:0] x_mod = hor_num % hor_ratio_den;
wire [5:0] y_mod = ver_num % ver_ratio_den;

wire direct_wb = (x_mod == 6'd0) & (y_mod == 6'd0);

// polynomial parameters (mult-2)
wire [7:0] p_0 = VER_INTER_wire ? Hor_Result[0] : ROM_Buffer[0];
wire [7:0] p_1 = VER_INTER_wire ? Hor_Result[1] : ROM_Buffer[1];
wire [7:0] p_2 = VER_INTER_wire ? Hor_Result[2] : ROM_Buffer[2];
wire [7:0] p_3 = VER_INTER_wire ? Hor_Result[3] : ROM_Buffer[3];

wire signed [10:0] a =  -p_0 + 3*p_1 - 3*p_2 + p_3;
wire signed [10:0] b = 2*p_0 - 5*p_1 + 4*p_2 - p_3;
wire signed [10:0] c =  -p_0 + p_2;
wire signed [10:0] d = 2*p_1;

/*
wire signed [16:0] cur_var 	= VER_INTER_wire ? y : x;
wire signed [61:0] a_x3 = a * cur_var**3;
wire signed [44:0] b_x2 = b * cur_var**2;
wire signed [27:0] c_x1 = c * cur_var;
wire signed [10:0] d_x0 = d;

wire [61:0] p 		= a_x3 + (b_x2 <<< 16) + (c_x1 <<< 32) + (d_x0 <<< 48); // int : 12-bit, fraction : 48-bit 
wire [11:0] p_int 	= p[61:49];
wire [48:0] p_frac	= p[48:0];
wire [7:0] 	p_quan 	= p[61] ? 8'd0 : ((p_int > 'd255) ? 8'd255 : (p_int + p_frac[48]));
*/

wire signed [FRAC_BIT:0] cur_var = VER_INTER_wire ? y : x;

wire signed [10+(FRAC_BIT+1)*3:0] a_x3 = a * cur_var*cur_var*cur_var;
wire signed [10+(FRAC_BIT+1)*2:0] b_x2 = b * cur_var*cur_var;
wire signed [10+(FRAC_BIT+1)*1:0] c_x1 = c * cur_var;	
wire signed [10+(FRAC_BIT+1)*0:0] d_x0 = d;			

wire [10+(FRAC_BIT+1)*3:0] 		p 		= a_x3 + (b_x2 <<< FRAC_BIT) + (c_x1 <<< (FRAC_BIT*2)) + (d_x0 <<< (FRAC_BIT*3)); // int : 12-bit, fraction : 48-bit 
wire [11:0] 					p_int 	= p[10+(FRAC_BIT+1)*3 : 10+(FRAC_BIT+1)*3-12];
wire [10+(FRAC_BIT+1)*3-12-1:0] p_frac	= p[10+(FRAC_BIT+1)*3-12-1 : 0];
wire [7:0] 						p_quan 	= p[10+(FRAC_BIT+1)*3] ? 8'd0 : ((p_int > 'd255) ? 8'd255 : (p_int[7:0] + p_frac[10+(FRAC_BIT+1)*3-12-1]));

// counter control
wire X_count_done 	= (X_count + 6'd1) == TW;
wire Y_count_done 	= (Y_count + 6'd1) == TH;
wire hor_count_done	= hor_count == 2'd3;
wire ver_count_done	= ver_count == 2'd3;

// FSM control
wire read_rom_done 	= hor_count_done;
wire hor_inter_done	= ver_count_done;
wire all_inter_done	= X_count_done & Y_count_done;

// sram control
wire sram_write_done= ((x_int + 5'd1) == SW) & ((y_int + 5'd1) == SH);

// rom addr
wire [6:0]addr_rom_x= direct_wb ? (H0 + x_int) : (H0 + x_int + hor_count - 'd1);
wire [6:0]addr_rom_y= direct_wb ? (V0 + y_int) : (V0 + y_int + ver_count - 'd1);

// ROM I/O
assign rom_en 		= ~READ_ROM_wire;
assign rom_addr		= (addr_rom_y << 6) + (addr_rom_y << 5) + (addr_rom_y << 2) + addr_rom_x; // addr_rom_y*100 + addr_rom_x

// SRAM I/O
assign sram_en 		= ~WRITE_BACK_wire;
assign sram_wr 		= ~WRITE_BACK_wire;
assign sram_addr	= sram_addr_reg;
assign sram_data 	= direct_wb ? rom_data : inter_result;

// output
assign DONE = FINISH_wire;

// next state logic
always @(*) begin
	case(state)
		IDLE 		: next_state = READ_ROM;
		READ_ROM 	: next_state = direct_wb 		? WRITE_BACK: read_rom_done ? HOR_INTER : READ_ROM;
		HOR_INTER	: next_state = hor_inter_done	? VER_INTER : READ_ROM;
		VER_INTER	: next_state = WRITE_BACK;
		WRITE_BACK	: next_state = sram_write_done 	? FINISH 	: READ_ROM;
		FINISH		: next_state = IDLE;
		default		: next_state = IDLE;
	endcase
end

// FSM
always @(posedge CLK or posedge RST) begin
	if(RST) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

// Buffers
integer i;
always @(posedge CLK or posedge RST) begin
	if(RST) begin
		for(i=0; i<4; i=i+1) begin
			ROM_Buffer[i] <= 8'd0;
		end
	end
	else if(READ_ROM_wire) begin
		ROM_Buffer[hor_count] <= rom_data;
	end
end

integer j;
always @(posedge CLK or posedge RST) begin
	if(RST) begin
		for(j=0; j<4; j=j+1) begin
			Hor_Result[j] <= 8'd0;
		end
	end
	else if(HOR_INTER_wire) begin
		Hor_Result[ver_count] <= p_quan;
	end
end

// counters
always @(posedge CLK or posedge RST) begin
	if(RST) begin
		hor_count <= 2'd0;
	end
	else if(READ_ROM_wire) begin
		hor_count <= (hor_count_done | direct_wb) ? 2'd0 : (hor_count + 2'd1);
	end
end

always @(posedge CLK or posedge RST) begin
	if(RST) begin
		ver_count <= 2'd0;
	end
	else if(HOR_INTER_wire) begin
		ver_count <= (ver_count_done | direct_wb) ? 2'd0 : (ver_count + 2'd1);
	end
end

always @(posedge CLK or posedge RST) begin
	if(RST) begin
		X_count <= 6'd0;
	end
	else if(WRITE_BACK_wire) begin
		X_count <= X_count_done ? 6'd0 : (X_count + 6'd1);
	end
end

always @(posedge CLK or posedge RST) begin
	if(RST) begin
		Y_count <= 6'd0;
	end
	else if(WRITE_BACK_wire & X_count_done) begin
		Y_count <= Y_count_done ? 6'd0 : (Y_count + 6'd1);
	end
end


// pipelined registers
always @(posedge CLK or posedge RST) begin
	if(RST) begin
		hor_ratio_den <= 'd0;
		hor_ratio_num <= 'd0;
		ver_ratio_den <= 'd0;
		ver_ratio_num <= 'd0;
	end
	else begin
		hor_ratio_den <= TW - 6'd1;
		hor_ratio_num <= SW - 5'd1;
		ver_ratio_den <= TH - 6'd1;
		ver_ratio_num <= SH - 5'd1;
	end
end

always @(posedge CLK or posedge RST) begin
	if(RST) begin
		x <= 'd0;
		y <= 'd0;
	end
	else begin
		x <= ((hor_num - hor_ratio_den*x_int) << FRAC_BIT) / hor_ratio_den;
		y <= ((ver_num - ver_ratio_den*y_int) << FRAC_BIT) / ver_ratio_den;
	end
end


// output
always @(posedge CLK or posedge RST) begin
	if(RST) begin
		inter_result <= 8'd0;
	end
	else if(VER_INTER_wire) begin
		inter_result <= p_quan;
	end
end

always @(posedge CLK or posedge RST) begin
	if(RST) begin
		sram_addr_reg <= 14'd0;
	end
	else if(WRITE_BACK_wire) begin
		sram_addr_reg <= sram_write_done ? 14'd0 : (sram_addr_reg + 14'd1);
	end
end

endmodule
