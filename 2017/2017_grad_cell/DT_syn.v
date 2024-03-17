/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Mon Mar 18 01:01:43 2024
/////////////////////////////////////////////////////////////


module DT_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;
  wire   n1, n2;
  wire   [7:2] carry;

  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(n2), .CO(carry[5]), .S(SUM[4]) );
  CMPR22X2 U1_1_2 ( .A(A[2]), .B(n1), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2X1 U1 ( .A(A[1]), .B(A[0]), .Y(SUM[1]) );
  AND2X2 U2 ( .A(A[1]), .B(A[0]), .Y(n1) );
  AND2X8 U3 ( .A(A[3]), .B(carry[3]), .Y(n2) );
  XOR2X1 U4 ( .A(A[3]), .B(carry[3]), .Y(SUM[3]) );
  XOR2X1 U5 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U6 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module DT_DW01_inc_2_DW01_inc_3 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module DT_DW01_inc_3_DW01_inc_4 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd;
  wire   N35, N36, N37, N38, n456, n457, sti_object_flag, sti_object_flag_reg,
         N42, N43, N44, N45, N46, N47, N48, N49, N84, N85, N86, N87, N88, N89,
         N90, N91, N92, N93, N109, N110, N111, N117, N118, N119, N120, N121,
         N122, N138, N139, N140, N141, N142, N143, N199, N200, N201, N202,
         N203, N204, N416, N420, n11, n85, n86, n143, n152, n153, n154, n155,
         n156, n157, n158, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n173, n174, n175, n176, n177, n178, n180,
         n181, n182, n188, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n241, n247, n249, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455;
  wire   [2:0] state;
  wire   [6:0] X;
  wire   [6:0] Y;
  wire   [7:0] res_di_plus1;
  wire   [7:0] min_temp;
  wire   [2:0] next_state;
  wire   [7:1] \add_89/carry ;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1;
  assign done = N416;
  assign sti_rd = N420;

  OAI21XL U63 ( .A0(n86), .A1(n11), .B0(n455), .Y(n85) );
  OAI22XL U179 ( .A0(n451), .A1(n453), .B0(n11), .B1(n454), .Y(n143) );
  AND2X8 U3 ( .A(n11), .B(n452), .Y(n11) );
  DT_DW01_inc_0_DW01_inc_1 add_125 ( .A({sti_addr[9], n239, n241, sti_addr[6], 
        n226, n225, sti_addr[3], n223, n224, sti_addr[0]}), .SUM({N93, N92, 
        N91, N90, N89, N88, N87, N86, N85, N84}) );
  DT_DW01_inc_1_DW01_inc_2 add_75 ( .A(res_di), .SUM(res_di_plus1) );
  DT_DW01_inc_2_DW01_inc_3 r429 ( .A(X), .SUM({N204, N203, N202, N201, N200, 
        N199, SYNOPSYS_UNCONNECTED__0}) );
  DT_DW01_inc_3_DW01_inc_4 r428 ( .A(Y), .SUM({N143, N142, N141, N140, N139, 
        N138, SYNOPSYS_UNCONNECTED__1}) );
  DFFRX1 res_object_flag_reg_reg ( .D(n222), .CK(clk), .RN(n252), .QN(n452) );
  DFFRX1 \sti_addr_reg[5]  ( .D(n164), .CK(clk), .RN(n252), .Q(n226), .QN(n234) );
  DFFRX1 \sti_addr_reg[4]  ( .D(n165), .CK(clk), .RN(n252), .Q(n225), .QN(n233) );
  DFFRX1 \sti_addr_reg[2]  ( .D(n167), .CK(clk), .RN(n252), .Q(n223), .QN(n230) );
  DFFRX1 \sti_addr_reg[1]  ( .D(n169), .CK(clk), .RN(n252), .Q(n224), .QN(n227) );
  DFFRX1 \sti_addr_reg[7]  ( .D(n162), .CK(clk), .RN(n253), .QN(n235) );
  DFFRX1 \sti_addr_reg[8]  ( .D(n161), .CK(clk), .RN(n253), .QN(n236) );
  DFFRX1 sti_object_flag_reg_reg ( .D(sti_object_flag), .CK(clk), .RN(n252), 
        .Q(sti_object_flag_reg) );
  DFFRX1 \Y_reg[5]  ( .D(n197), .CK(clk), .RN(reset), .Q(Y[5]), .QN(n171) );
  DFFRX1 \Y_reg[6]  ( .D(n196), .CK(clk), .RN(n253), .Q(Y[6]), .QN(n170) );
  DFFRX1 \Y_reg[4]  ( .D(n198), .CK(clk), .RN(n253), .Q(Y[4]), .QN(n265) );
  DFFRX1 \Y_reg[3]  ( .D(n199), .CK(clk), .RN(n253), .Q(Y[3]), .QN(n173) );
  DFFRX1 \Y_reg[2]  ( .D(n200), .CK(clk), .RN(n253), .Q(Y[2]), .QN(n174) );
  DFFRX1 \Y_reg[1]  ( .D(n201), .CK(clk), .RN(n253), .Q(Y[1]), .QN(n175) );
  DFFRX1 \X_reg[0]  ( .D(n208), .CK(clk), .RN(n253), .Q(X[0]), .QN(N109) );
  DFFRX1 \X_reg[4]  ( .D(n204), .CK(clk), .RN(reset), .Q(X[4]), .QN(n259) );
  DFFRX1 \X_reg[3]  ( .D(n205), .CK(clk), .RN(reset), .Q(X[3]), .QN(n180) );
  DFFRX1 \X_reg[6]  ( .D(n203), .CK(clk), .RN(n253), .Q(X[6]), .QN(n177) );
  DFFRX1 \X_reg[2]  ( .D(n206), .CK(clk), .RN(reset), .Q(X[2]), .QN(n181) );
  DFFRX1 \X_reg[5]  ( .D(n209), .CK(clk), .RN(n253), .Q(X[5]), .QN(n178) );
  DFFRX1 \X_reg[1]  ( .D(n207), .CK(clk), .RN(reset), .Q(X[1]), .QN(n182) );
  DFFSX1 \index_reg[3]  ( .D(n192), .CK(clk), .SN(reset), .Q(N38), .QN(n188)
         );
  DFFSX1 \index_reg[1]  ( .D(n194), .CK(clk), .SN(reset), .Q(N36), .QN(n281)
         );
  DFFSX1 \index_reg[2]  ( .D(n193), .CK(clk), .SN(reset), .Q(N37), .QN(n280)
         );
  DFFSX1 \index_reg[0]  ( .D(n195), .CK(clk), .SN(reset), .Q(N35), .QN(n282)
         );
  DFFSX1 \min_temp_reg[7]  ( .D(n217), .CK(clk), .SN(reset), .Q(min_temp[7]), 
        .QN(n158) );
  DFFSX1 \min_temp_reg[6]  ( .D(n216), .CK(clk), .SN(reset), .Q(min_temp[6]), 
        .QN(n157) );
  DFFSX1 \min_temp_reg[0]  ( .D(n210), .CK(clk), .SN(reset), .Q(min_temp[0])
         );
  DFFSX1 \min_temp_reg[3]  ( .D(n213), .CK(clk), .SN(n253), .Q(min_temp[3]), 
        .QN(n154) );
  DFFSX1 \min_temp_reg[2]  ( .D(n212), .CK(clk), .SN(reset), .Q(min_temp[2]), 
        .QN(n153) );
  DFFSX1 \min_temp_reg[4]  ( .D(n214), .CK(clk), .SN(n252), .Q(min_temp[4]), 
        .QN(n155) );
  DFFSX1 \min_temp_reg[1]  ( .D(n211), .CK(clk), .SN(reset), .Q(min_temp[1]), 
        .QN(n152) );
  DFFSX1 \min_temp_reg[5]  ( .D(n215), .CK(clk), .SN(n253), .Q(min_temp[5]), 
        .QN(n156) );
  DFFRX1 \state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(reset), .Q(state[2]), .QN(n339) );
  DFFRX1 \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n252), .Q(state[1]), 
        .QN(n455) );
  DFFRX1 \count_reg[0]  ( .D(n221), .CK(clk), .RN(n252), .Q(n449), .QN(n362)
         );
  DFFRX1 \count_reg[2]  ( .D(n219), .CK(clk), .RN(reset), .Q(n448), .QN(n326)
         );
  DFFRX1 \count_reg[1]  ( .D(n220), .CK(clk), .RN(n252), .Q(n450), .QN(n363)
         );
  DFFRX1 \count_reg[3]  ( .D(n218), .CK(clk), .RN(reset), .Q(n447) );
  DFFRX2 \sti_addr_reg[0]  ( .D(n168), .CK(clk), .RN(n252), .Q(sti_addr[0]) );
  DFFRX2 \sti_addr_reg[9]  ( .D(n160), .CK(clk), .RN(n253), .Q(sti_addr[9]) );
  DFFRX2 \sti_addr_reg[6]  ( .D(n163), .CK(clk), .RN(reset), .Q(sti_addr[6])
         );
  DFFRX2 \sti_addr_reg[3]  ( .D(n166), .CK(clk), .RN(n252), .Q(sti_addr[3]) );
  DFFRX2 \Y_reg[0]  ( .D(n202), .CK(clk), .RN(n253), .Q(Y[0]), .QN(n176) );
  DFFRX2 \state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n252), .Q(state[0]), 
        .QN(n334) );
  INVX3 U218 ( .A(n390), .Y(n389) );
  NOR3BX4 U219 ( .AN(n379), .B(n325), .C(n454), .Y(n369) );
  OAI22X2 U220 ( .A0(n382), .A1(n383), .B0(res_di_plus1[7]), .B1(n158), .Y(
        n379) );
  NAND2X1 U221 ( .A(res_di_plus1[5]), .B(n156), .Y(n385) );
  NAND2BX1 U222 ( .AN(n86), .B(n238), .Y(n361) );
  XNOR2X1 U223 ( .A(X[6]), .B(n258), .Y(n228) );
  OA21XL U224 ( .A0(n256), .A1(n259), .B0(n257), .Y(n229) );
  XOR2X1 U225 ( .A(X[5]), .B(n257), .Y(n231) );
  AOI21X1 U226 ( .A0(n255), .A1(X[3]), .B0(n256), .Y(n232) );
  INVXL U227 ( .A(n143), .Y(n237) );
  CLKINVX1 U228 ( .A(n237), .Y(n238) );
  INVX3 U229 ( .A(n295), .Y(res_addr[6]) );
  INVXL U230 ( .A(n236), .Y(n239) );
  INVX3 U231 ( .A(n236), .Y(sti_addr[8]) );
  INVXL U232 ( .A(n235), .Y(n241) );
  INVX3 U233 ( .A(n235), .Y(sti_addr[7]) );
  INVX3 U234 ( .A(n233), .Y(sti_addr[4]) );
  INVX3 U235 ( .A(n230), .Y(sti_addr[2]) );
  INVX3 U236 ( .A(n234), .Y(sti_addr[5]) );
  AND3XL U237 ( .A(sti_addr[4]), .B(sti_addr[2]), .C(sti_addr[3]), .Y(n348) );
  AND3XL U238 ( .A(n241), .B(sti_addr[5]), .C(sti_addr[6]), .Y(n347) );
  INVX3 U239 ( .A(n227), .Y(sti_addr[1]) );
  AND2XL U240 ( .A(n239), .B(sti_addr[9]), .Y(n346) );
  NAND3BXL U241 ( .AN(n249), .B(sti_addr[1]), .C(sti_addr[0]), .Y(n345) );
  INVX3 U242 ( .A(n299), .Y(res_addr[5]) );
  INVX3 U243 ( .A(n300), .Y(res_addr[4]) );
  AO22X2 U244 ( .A0(min_temp[6]), .A1(n251), .B0(N48), .B1(n284), .Y(res_do[6]) );
  INVX3 U245 ( .A(n301), .Y(res_addr[3]) );
  AO22X2 U246 ( .A0(min_temp[5]), .A1(n251), .B0(N47), .B1(n284), .Y(res_do[5]) );
  INVX3 U247 ( .A(n302), .Y(res_addr[2]) );
  AO22X2 U248 ( .A0(min_temp[4]), .A1(n251), .B0(N46), .B1(n284), .Y(res_do[4]) );
  INVX3 U249 ( .A(n303), .Y(res_addr[1]) );
  AO22X2 U250 ( .A0(min_temp[3]), .A1(n251), .B0(N45), .B1(n284), .Y(res_do[3]) );
  AO22X2 U251 ( .A0(min_temp[2]), .A1(n251), .B0(N44), .B1(n284), .Y(res_do[2]) );
  MXI2X4 U252 ( .A(n320), .B(n321), .S0(Y[0]), .Y(res_addr[0]) );
  OAI31X1 U253 ( .A0(n313), .A1(n447), .A2(n453), .B0(n318), .Y(n86) );
  NAND3X2 U254 ( .A(n334), .B(n339), .C(state[1]), .Y(n453) );
  AO22X2 U255 ( .A0(min_temp[0]), .A1(n251), .B0(N42), .B1(n284), .Y(res_do[0]) );
  OAI221X4 U256 ( .A0(n323), .A1(n327), .B0(n316), .B1(n313), .C0(n319), .Y(
        n298) );
  OA21X2 U257 ( .A0(N38), .A1(n445), .B0(n335), .Y(n441) );
  AO22X2 U258 ( .A0(min_temp[7]), .A1(n251), .B0(N49), .B1(n284), .Y(res_do[7]) );
  NOR3X2 U259 ( .A(n448), .B(n447), .C(n327), .Y(n325) );
  MXI2X4 U260 ( .A(n294), .B(n287), .S0(X[0]), .Y(res_addr[7]) );
  AND3X2 U261 ( .A(n317), .B(n318), .C(n319), .Y(n287) );
  NOR2X2 U262 ( .A(n416), .B(n286), .Y(n412) );
  AOI2BB1X2 U263 ( .A0N(n433), .A1N(n434), .B0(n286), .Y(n422) );
  NAND3X2 U264 ( .A(state[1]), .B(n339), .C(state[0]), .Y(n286) );
  OAI221X4 U265 ( .A0(n329), .A1(n323), .B0(n316), .B1(n315), .C0(n318), .Y(
        n297) );
  OAI2BB2X2 U266 ( .B0(n152), .B1(n285), .A0N(N43), .A1N(n284), .Y(res_do[1])
         );
  NOR3X2 U267 ( .A(n339), .B(state[0]), .C(n455), .Y(N416) );
  NOR3X4 U268 ( .A(state[1]), .B(state[2]), .C(n334), .Y(N420) );
  AOI211X4 U269 ( .A0(n286), .A1(n341), .B0(n422), .C0(n423), .Y(n413) );
  OAI211XL U270 ( .A0(n367), .A1(n353), .B0(res_rd), .C0(n378), .Y(n210) );
  OAI211XL U271 ( .A0(n367), .A1(n354), .B0(res_rd), .C0(n377), .Y(n211) );
  OAI211XL U272 ( .A0(n367), .A1(n355), .B0(res_rd), .C0(n376), .Y(n212) );
  OAI211XL U273 ( .A0(n367), .A1(n356), .B0(res_rd), .C0(n375), .Y(n213) );
  OAI211XL U274 ( .A0(n367), .A1(n357), .B0(res_rd), .C0(n374), .Y(n214) );
  OAI211XL U275 ( .A0(n367), .A1(n358), .B0(res_rd), .C0(n373), .Y(n215) );
  MXI2X2 U276 ( .A(n396), .B(n325), .S0(n453), .Y(n367) );
  OAI221X4 U277 ( .A0(n322), .A1(n323), .B0(n316), .B1(n314), .C0(n317), .Y(
        n296) );
  OAI222X4 U278 ( .A0(n180), .A1(n287), .B0(n288), .B1(n307), .C0(n290), .C1(
        n232), .Y(res_addr[10]) );
  OAI222X4 U279 ( .A0(n259), .A1(n287), .B0(n288), .B1(n306), .C0(n290), .C1(
        n229), .Y(res_addr[11]) );
  OAI222X4 U280 ( .A0(n178), .A1(n287), .B0(n288), .B1(n305), .C0(n290), .C1(
        n231), .Y(res_addr[12]) );
  OAI222X4 U281 ( .A0(n177), .A1(n287), .B0(n288), .B1(n304), .C0(n290), .C1(
        n228), .Y(res_addr[13]) );
  OAI222X4 U282 ( .A0(n182), .A1(n287), .B0(n288), .B1(n292), .C0(n290), .C1(
        n293), .Y(res_addr[8]) );
  OAI222X4 U283 ( .A0(n181), .A1(n287), .B0(n288), .B1(n289), .C0(n290), .C1(
        n291), .Y(res_addr[9]) );
  OAI31X4 U284 ( .A0(n308), .A1(n309), .A2(n310), .B0(n311), .Y(n290) );
  AOI32XL U285 ( .A0(n384), .A1(n385), .A2(n386), .B0(n387), .B1(n388), .Y(
        n382) );
  NOR2XL U286 ( .A(n297), .B(n298), .Y(n320) );
  INVXL U287 ( .A(n296), .Y(n321) );
  OAI2BB2X1 U288 ( .B0(n279), .B1(N38), .A0N(N38), .A1N(n278), .Y(
        sti_object_flag) );
  NAND2BXL U289 ( .AN(n286), .B(sti_object_flag), .Y(n247) );
  INVXL U290 ( .A(n413), .Y(n416) );
  INVXL U291 ( .A(n325), .Y(n324) );
  OAI2BB1XL U292 ( .A0N(N38), .A1N(n445), .B0(n441), .Y(n192) );
  AND2XL U293 ( .A(n290), .B(n288), .Y(n294) );
  NAND2BXL U294 ( .AN(n422), .B(n285), .Y(n426) );
  INVXL U295 ( .A(N420), .Y(n335) );
  AOI22XL U296 ( .A0(res_di[6]), .A1(n157), .B0(res_di[4]), .B1(n155), .Y(n400) );
  AOI2BB2XL U297 ( .B0(n412), .B1(N202), .A0N(n413), .A1N(n259), .Y(n420) );
  AOI2BB2XL U298 ( .B0(n412), .B1(N201), .A0N(n413), .A1N(n180), .Y(n419) );
  OAI211XL U299 ( .A0(n291), .A1(n410), .B0(n249), .C0(n418), .Y(n206) );
  AOI2BB2XL U300 ( .B0(n412), .B1(N200), .A0N(n413), .A1N(n181), .Y(n418) );
  OAI211XL U301 ( .A0(n293), .A1(n410), .B0(n249), .C0(n417), .Y(n207) );
  AOI2BB2XL U302 ( .B0(n412), .B1(N199), .A0N(n413), .A1N(n182), .Y(n417) );
  OAI211XL U303 ( .A0(n228), .A1(n410), .B0(n249), .C0(n421), .Y(n203) );
  AOI2BB2XL U304 ( .B0(n412), .B1(N204), .A0N(n413), .A1N(n177), .Y(n421) );
  OAI211XL U305 ( .A0(n231), .A1(n410), .B0(n249), .C0(n411), .Y(n209) );
  AOI2BB2XL U306 ( .B0(n412), .B1(N203), .A0N(n413), .A1N(n178), .Y(n411) );
  NAND2BXL U307 ( .AN(n410), .B(N109), .Y(n414) );
  MXI2XL U308 ( .A(n412), .B(n416), .S0(X[0]), .Y(n415) );
  OAI211XL U309 ( .A0(n282), .A1(res_wr), .B0(n440), .C0(n441), .Y(n195) );
  OAI211XL U310 ( .A0(n281), .A1(n442), .B0(n443), .C0(n441), .Y(n194) );
  OAI211XL U311 ( .A0(n280), .A1(n444), .B0(n445), .C0(n441), .Y(n193) );
  AOI22XL U312 ( .A0(n422), .A1(N142), .B0(n251), .B1(N121), .Y(n431) );
  OAI211XL U313 ( .A0(n265), .A1(res_wr), .B0(n425), .C0(n430), .Y(n198) );
  AOI22XL U314 ( .A0(n422), .A1(N141), .B0(n251), .B1(N120), .Y(n430) );
  OAI211XL U315 ( .A0(n173), .A1(res_wr), .B0(n425), .C0(n429), .Y(n199) );
  AOI22XL U316 ( .A0(n422), .A1(N140), .B0(n251), .B1(N119), .Y(n429) );
  OAI211XL U317 ( .A0(n174), .A1(res_wr), .B0(n425), .C0(n428), .Y(n200) );
  AOI22XL U318 ( .A0(n422), .A1(N139), .B0(n251), .B1(N118), .Y(n428) );
  OAI211XL U319 ( .A0(n170), .A1(res_wr), .B0(n425), .C0(n432), .Y(n196) );
  AOI22XL U320 ( .A0(n422), .A1(N143), .B0(n251), .B1(N122), .Y(n432) );
  OAI211XL U321 ( .A0(n175), .A1(res_wr), .B0(n425), .C0(n427), .Y(n201) );
  AOI22XL U322 ( .A0(n422), .A1(N138), .B0(n251), .B1(N117), .Y(n427) );
  OAI211XL U323 ( .A0(n333), .A1(n334), .B0(n453), .C0(n335), .Y(next_state[1]) );
  INVX1 U324 ( .A(sti_object_flag), .Y(n451) );
  INVX3 U325 ( .A(n247), .Y(n284) );
  CLKBUFX3 U326 ( .A(n283), .Y(n251) );
  NOR2X1 U327 ( .A(n334), .B(n332), .Y(n283) );
  CLKBUFX3 U328 ( .A(n456), .Y(res_wr) );
  NAND2XL U329 ( .A(n286), .B(n285), .Y(n456) );
  CLKBUFX3 U330 ( .A(n457), .Y(res_rd) );
  NAND2XL U331 ( .A(n454), .B(n453), .Y(n457) );
  NAND3BXL U332 ( .AN(n361), .B(n448), .C(n328), .Y(n365) );
  OR2X1 U333 ( .A(X[1]), .B(X[0]), .Y(n254) );
  OR2X1 U334 ( .A(Y[1]), .B(Y[0]), .Y(n260) );
  AND4X2 U335 ( .A(n282), .B(n281), .C(n446), .D(n280), .Y(n342) );
  CLKBUFX3 U336 ( .A(n349), .Y(n249) );
  NAND4X1 U337 ( .A(n436), .B(n437), .C(n438), .D(n439), .Y(n349) );
  CLKBUFX3 U338 ( .A(reset), .Y(n253) );
  CLKBUFX3 U339 ( .A(reset), .Y(n252) );
  MXI2XL U340 ( .A(n238), .B(n361), .S0(n362), .Y(n221) );
  OAI33X4 U341 ( .A0(n379), .A1(n454), .A2(n325), .B0(n380), .B1(n453), .B2(
        n381), .Y(n370) );
  AOI2BB2XL U342 ( .B0(n369), .B1(res_di_plus1[5]), .A0N(n156), .A1N(n372), 
        .Y(n373) );
  XOR2X1 U343 ( .A(min_temp[7]), .B(\add_89/carry [7]), .Y(N49) );
  AND2X1 U344 ( .A(\add_89/carry [6]), .B(min_temp[6]), .Y(\add_89/carry [7])
         );
  XOR2X1 U345 ( .A(min_temp[6]), .B(\add_89/carry [6]), .Y(N48) );
  AND2X1 U346 ( .A(\add_89/carry [5]), .B(min_temp[5]), .Y(\add_89/carry [6])
         );
  XOR2X1 U347 ( .A(min_temp[5]), .B(\add_89/carry [5]), .Y(N47) );
  AND2X1 U348 ( .A(\add_89/carry [4]), .B(min_temp[4]), .Y(\add_89/carry [5])
         );
  XOR2X1 U349 ( .A(min_temp[4]), .B(\add_89/carry [4]), .Y(N46) );
  AND2X1 U350 ( .A(\add_89/carry [3]), .B(min_temp[3]), .Y(\add_89/carry [4])
         );
  XOR2X1 U351 ( .A(min_temp[3]), .B(\add_89/carry [3]), .Y(N45) );
  AND2X1 U352 ( .A(\add_89/carry [2]), .B(min_temp[2]), .Y(\add_89/carry [3])
         );
  XOR2X1 U353 ( .A(min_temp[2]), .B(\add_89/carry [2]), .Y(N44) );
  AND2X1 U354 ( .A(\add_89/carry [1]), .B(min_temp[1]), .Y(\add_89/carry [2])
         );
  XOR2X1 U355 ( .A(min_temp[1]), .B(\add_89/carry [1]), .Y(N43) );
  AND2X1 U356 ( .A(min_temp[0]), .B(sti_object_flag_reg), .Y(\add_89/carry [1]) );
  XOR2X1 U357 ( .A(sti_object_flag_reg), .B(min_temp[0]), .Y(N42) );
  OAI2BB1X1 U358 ( .A0N(X[1]), .A1N(X[0]), .B0(n254), .Y(N110) );
  OR2X1 U359 ( .A(n254), .B(X[2]), .Y(n255) );
  OAI2BB1X1 U360 ( .A0N(n254), .A1N(X[2]), .B0(n255), .Y(N111) );
  NOR2X1 U361 ( .A(n255), .B(X[3]), .Y(n256) );
  NAND2X1 U362 ( .A(n256), .B(n259), .Y(n257) );
  NOR2X1 U363 ( .A(X[5]), .B(n257), .Y(n258) );
  OAI2BB1X1 U364 ( .A0N(Y[0]), .A1N(Y[1]), .B0(n260), .Y(N117) );
  OR2X1 U365 ( .A(n260), .B(Y[2]), .Y(n261) );
  OAI2BB1X1 U366 ( .A0N(n260), .A1N(Y[2]), .B0(n261), .Y(N118) );
  NOR2X1 U367 ( .A(n261), .B(Y[3]), .Y(n262) );
  AO21X1 U368 ( .A0(n261), .A1(Y[3]), .B0(n262), .Y(N119) );
  NAND2X1 U369 ( .A(n262), .B(n265), .Y(n263) );
  OAI21XL U370 ( .A0(n262), .A1(n265), .B0(n263), .Y(N120) );
  XNOR2X1 U371 ( .A(Y[5]), .B(n263), .Y(N121) );
  NOR2X1 U372 ( .A(Y[5]), .B(n263), .Y(n264) );
  XOR2X1 U373 ( .A(Y[6]), .B(n264), .Y(N122) );
  NOR2X1 U374 ( .A(n281), .B(N35), .Y(n275) );
  NOR2X1 U375 ( .A(n281), .B(n282), .Y(n274) );
  NOR2X1 U376 ( .A(n282), .B(N36), .Y(n272) );
  NOR2X1 U377 ( .A(N35), .B(N36), .Y(n271) );
  AO22X1 U378 ( .A0(sti_di[5]), .A1(n272), .B0(sti_di[4]), .B1(n271), .Y(n266)
         );
  AOI221XL U379 ( .A0(sti_di[6]), .A1(n275), .B0(sti_di[7]), .B1(n274), .C0(
        n266), .Y(n269) );
  AO22X1 U380 ( .A0(sti_di[1]), .A1(n272), .B0(sti_di[0]), .B1(n271), .Y(n267)
         );
  AOI221XL U381 ( .A0(sti_di[2]), .A1(n275), .B0(sti_di[3]), .B1(n274), .C0(
        n267), .Y(n268) );
  OA22X1 U382 ( .A0(n280), .A1(n269), .B0(N37), .B1(n268), .Y(n279) );
  AO22X1 U383 ( .A0(sti_di[13]), .A1(n272), .B0(sti_di[12]), .B1(n271), .Y(
        n270) );
  AOI221XL U384 ( .A0(sti_di[14]), .A1(n275), .B0(sti_di[15]), .B1(n274), .C0(
        n270), .Y(n277) );
  AO22X1 U385 ( .A0(sti_di[9]), .A1(n272), .B0(sti_di[8]), .B1(n271), .Y(n273)
         );
  AOI221XL U386 ( .A0(sti_di[10]), .A1(n275), .B0(sti_di[11]), .B1(n274), .C0(
        n273), .Y(n276) );
  OAI22XL U387 ( .A0(n277), .A1(n280), .B0(N37), .B1(n276), .Y(n278) );
  CLKINVX1 U388 ( .A(N200), .Y(n289) );
  CLKINVX1 U389 ( .A(N199), .Y(n292) );
  AOI222XL U390 ( .A0(Y[6]), .A1(n296), .B0(n297), .B1(N143), .C0(n298), .C1(
        N122), .Y(n295) );
  AOI222XL U391 ( .A0(Y[5]), .A1(n296), .B0(n297), .B1(N142), .C0(n298), .C1(
        N121), .Y(n299) );
  AOI222XL U392 ( .A0(Y[4]), .A1(n296), .B0(n297), .B1(N141), .C0(n298), .C1(
        N120), .Y(n300) );
  AOI222XL U393 ( .A0(Y[3]), .A1(n296), .B0(n297), .B1(N140), .C0(n298), .C1(
        N119), .Y(n301) );
  AOI222XL U394 ( .A0(Y[2]), .A1(n296), .B0(n297), .B1(N139), .C0(n298), .C1(
        N118), .Y(n302) );
  AOI222XL U395 ( .A0(Y[1]), .A1(n296), .B0(n297), .B1(N138), .C0(n298), .C1(
        N117), .Y(n303) );
  CLKINVX1 U396 ( .A(N204), .Y(n304) );
  CLKINVX1 U397 ( .A(N203), .Y(n305) );
  CLKINVX1 U398 ( .A(N202), .Y(n306) );
  CLKINVX1 U399 ( .A(N201), .Y(n307) );
  CLKINVX1 U400 ( .A(n312), .Y(n288) );
  AOI31X1 U401 ( .A0(n313), .A1(n314), .A2(n315), .B0(n316), .Y(n312) );
  AOI2BB1X1 U402 ( .A0N(n454), .A1N(n324), .B0(res_wr), .Y(n317) );
  NAND2X1 U403 ( .A(n310), .B(n326), .Y(n314) );
  NAND2X1 U404 ( .A(n311), .B(n328), .Y(n319) );
  NAND2X1 U405 ( .A(n308), .B(n326), .Y(n315) );
  CLKINVX1 U406 ( .A(n330), .Y(n316) );
  CLKINVX1 U407 ( .A(n311), .Y(n323) );
  NOR3X1 U408 ( .A(n448), .B(n447), .C(n453), .Y(n311) );
  OAI21XL U409 ( .A0(n286), .A1(n331), .B0(n332), .Y(next_state[2]) );
  AOI33X1 U410 ( .A0(n336), .A1(n337), .A2(n338), .B0(n331), .B1(n339), .B2(
        n340), .Y(n333) );
  NAND4X1 U411 ( .A(n282), .B(n281), .C(n280), .D(n188), .Y(n340) );
  AND4X1 U412 ( .A(n259), .B(n180), .C(n181), .D(n182), .Y(n338) );
  NOR3X1 U413 ( .A(n341), .B(state[1]), .C(X[0]), .Y(n337) );
  AND2X1 U414 ( .A(n177), .B(n178), .Y(n336) );
  AO22X1 U415 ( .A0(n331), .A1(n342), .B0(n343), .B1(n334), .Y(next_state[0])
         );
  NAND2X1 U416 ( .A(n85), .B(n344), .Y(n343) );
  OAI31XL U417 ( .A0(n86), .A1(n451), .A2(n455), .B0(n339), .Y(n344) );
  NAND4BX1 U418 ( .AN(n345), .B(n346), .C(n347), .D(n348), .Y(n331) );
  OAI21XL U419 ( .A0(n452), .A1(n86), .B0(n350), .Y(n222) );
  OAI21XL U420 ( .A0(n351), .A1(n352), .B0(n325), .Y(n350) );
  NAND4X1 U421 ( .A(n353), .B(n354), .C(n355), .D(n356), .Y(n352) );
  NAND4X1 U422 ( .A(n357), .B(n358), .C(n359), .D(n360), .Y(n351) );
  OAI221XL U423 ( .A0(n322), .A1(n361), .B0(n238), .B1(n363), .C0(n329), .Y(
        n220) );
  CLKINVX1 U424 ( .A(n310), .Y(n329) );
  NOR2X1 U425 ( .A(n363), .B(n449), .Y(n310) );
  CLKINVX1 U426 ( .A(n308), .Y(n322) );
  NOR2X1 U427 ( .A(n362), .B(n450), .Y(n308) );
  OAI2BB2XL U428 ( .B0(n313), .B1(n361), .A0N(n364), .A1N(n448), .Y(n219) );
  MXI2X1 U429 ( .A(n365), .B(n366), .S0(n447), .Y(n218) );
  NOR2X1 U430 ( .A(n326), .B(n364), .Y(n366) );
  OAI21XL U431 ( .A0(n86), .A1(n328), .B0(n238), .Y(n364) );
  NAND3X1 U432 ( .A(n309), .B(n330), .C(n448), .Y(n318) );
  NOR2X1 U433 ( .A(n454), .B(n447), .Y(n330) );
  NAND2X1 U434 ( .A(n328), .B(n326), .Y(n313) );
  NOR2X1 U435 ( .A(n362), .B(n363), .Y(n328) );
  OAI211X1 U436 ( .A0(n367), .A1(n360), .B0(res_rd), .C0(n368), .Y(n217) );
  AOI22X1 U437 ( .A0(n369), .A1(res_di_plus1[7]), .B0(min_temp[7]), .B1(n370), 
        .Y(n368) );
  CLKINVX1 U438 ( .A(res_di[7]), .Y(n360) );
  OAI211X1 U439 ( .A0(n367), .A1(n359), .B0(res_rd), .C0(n371), .Y(n216) );
  AOI2BB2X1 U440 ( .B0(n369), .B1(res_di_plus1[6]), .A0N(n157), .A1N(n372), 
        .Y(n371) );
  CLKINVX1 U441 ( .A(res_di[6]), .Y(n359) );
  CLKINVX1 U442 ( .A(res_di[5]), .Y(n358) );
  AOI2BB2X1 U443 ( .B0(n369), .B1(res_di_plus1[4]), .A0N(n155), .A1N(n372), 
        .Y(n374) );
  CLKINVX1 U444 ( .A(res_di[4]), .Y(n357) );
  AOI22X1 U445 ( .A0(n369), .A1(res_di_plus1[3]), .B0(min_temp[3]), .B1(n370), 
        .Y(n375) );
  AOI22X1 U446 ( .A0(n369), .A1(res_di_plus1[2]), .B0(min_temp[2]), .B1(n370), 
        .Y(n376) );
  AOI2BB2X1 U447 ( .B0(n369), .B1(res_di_plus1[1]), .A0N(n152), .A1N(n372), 
        .Y(n377) );
  CLKINVX1 U448 ( .A(n370), .Y(n372) );
  CLKINVX1 U449 ( .A(res_di[1]), .Y(n354) );
  AOI22X1 U450 ( .A0(res_di_plus1[0]), .A1(n369), .B0(min_temp[0]), .B1(n370), 
        .Y(n378) );
  AND2X1 U451 ( .A(res_di_plus1[7]), .B(n158), .Y(n383) );
  OAI21XL U452 ( .A0(n389), .A1(n157), .B0(res_di_plus1[6]), .Y(n388) );
  NAND2X1 U453 ( .A(n389), .B(n157), .Y(n387) );
  OAI32X1 U454 ( .A0(n391), .A1(res_di_plus1[4]), .A2(n155), .B0(
        res_di_plus1[5]), .B1(n156), .Y(n390) );
  CLKINVX1 U455 ( .A(n385), .Y(n391) );
  AOI22X1 U456 ( .A0(res_di_plus1[6]), .A1(n157), .B0(res_di_plus1[4]), .B1(
        n155), .Y(n386) );
  OAI221XL U457 ( .A0(n392), .A1(n393), .B0(n154), .B1(n394), .C0(n395), .Y(
        n384) );
  AO21X1 U458 ( .A0(n394), .A1(n154), .B0(res_di_plus1[3]), .Y(n395) );
  OR2X1 U459 ( .A(res_di_plus1[2]), .B(n153), .Y(n394) );
  AO22X1 U460 ( .A0(n154), .A1(res_di_plus1[3]), .B0(n153), .B1(
        res_di_plus1[2]), .Y(n393) );
  ACHCINX2 U461 ( .CIN(min_temp[0]), .A(res_di_plus1[1]), .B(n152), .CO(n392)
         );
  NAND2BX1 U462 ( .AN(n332), .B(n334), .Y(n454) );
  CLKINVX1 U463 ( .A(res_di[0]), .Y(n353) );
  CLKINVX1 U464 ( .A(n309), .Y(n327) );
  NOR2X1 U465 ( .A(n450), .B(n449), .Y(n309) );
  OR2X1 U466 ( .A(n381), .B(n380), .Y(n396) );
  NOR2X1 U467 ( .A(res_di[7]), .B(n158), .Y(n380) );
  AOI21X1 U468 ( .A0(res_di[7]), .A1(n158), .B0(n397), .Y(n381) );
  AOI32X1 U469 ( .A0(n398), .A1(n399), .A2(n400), .B0(n401), .B1(n402), .Y(
        n397) );
  OAI21XL U470 ( .A0(n403), .A1(n157), .B0(res_di[6]), .Y(n402) );
  NAND2X1 U471 ( .A(n403), .B(n157), .Y(n401) );
  CLKINVX1 U472 ( .A(n404), .Y(n403) );
  OAI32X1 U473 ( .A0(n405), .A1(res_di[4]), .A2(n155), .B0(res_di[5]), .B1(
        n156), .Y(n404) );
  CLKINVX1 U474 ( .A(n399), .Y(n405) );
  NAND2X1 U475 ( .A(res_di[5]), .B(n156), .Y(n399) );
  OAI221XL U476 ( .A0(n406), .A1(n407), .B0(n154), .B1(n408), .C0(n409), .Y(
        n398) );
  AO21X1 U477 ( .A0(n408), .A1(n154), .B0(res_di[3]), .Y(n409) );
  NAND2X1 U478 ( .A(n355), .B(min_temp[2]), .Y(n408) );
  OAI22XL U479 ( .A0(min_temp[3]), .A1(n356), .B0(min_temp[2]), .B1(n355), .Y(
        n407) );
  CLKINVX1 U480 ( .A(res_di[2]), .Y(n355) );
  CLKINVX1 U481 ( .A(res_di[3]), .Y(n356) );
  ACHCINX2 U482 ( .CIN(min_temp[0]), .A(res_di[1]), .B(n152), .CO(n406) );
  NAND3X1 U483 ( .A(n414), .B(n249), .C(n415), .Y(n208) );
  CLKINVX1 U484 ( .A(N110), .Y(n293) );
  CLKINVX1 U485 ( .A(N111), .Y(n291) );
  OAI211X1 U486 ( .A0(n232), .A1(n410), .B0(n249), .C0(n419), .Y(n205) );
  OAI211X1 U487 ( .A0(n229), .A1(n410), .B0(n249), .C0(n420), .Y(n204) );
  NAND2X1 U488 ( .A(n413), .B(n251), .Y(n410) );
  NAND2X1 U489 ( .A(n424), .B(n425), .Y(n202) );
  MXI2X1 U490 ( .A(n426), .B(n423), .S0(Y[0]), .Y(n424) );
  CLKINVX1 U491 ( .A(res_wr), .Y(n423) );
  OAI211X1 U492 ( .A0(n171), .A1(res_wr), .B0(n425), .C0(n431), .Y(n197) );
  NAND3X1 U493 ( .A(Y[5]), .B(Y[4]), .C(Y[6]), .Y(n434) );
  NAND4X1 U494 ( .A(Y[3]), .B(Y[2]), .C(Y[1]), .D(Y[0]), .Y(n433) );
  OA22X1 U495 ( .A0(n286), .A1(n249), .B0(n285), .B1(n341), .Y(n425) );
  NAND4X1 U496 ( .A(n174), .B(n173), .C(n175), .D(n435), .Y(n341) );
  NOR4X1 U497 ( .A(Y[0]), .B(Y[6]), .C(Y[5]), .D(Y[4]), .Y(n435) );
  NOR4X1 U498 ( .A(N109), .B(n182), .C(n181), .D(n180), .Y(n439) );
  NOR3X1 U499 ( .A(n177), .B(n259), .C(n178), .Y(n438) );
  NOR4X1 U500 ( .A(n176), .B(n175), .C(n174), .D(n173), .Y(n437) );
  NOR3X1 U501 ( .A(n170), .B(n265), .C(n171), .Y(n436) );
  NAND2X1 U502 ( .A(n444), .B(n280), .Y(n445) );
  CLKINVX1 U503 ( .A(n443), .Y(n444) );
  NAND2X1 U504 ( .A(n442), .B(n281), .Y(n443) );
  CLKINVX1 U505 ( .A(n440), .Y(n442) );
  NAND2X1 U506 ( .A(n282), .B(res_wr), .Y(n440) );
  CLKINVX1 U507 ( .A(n251), .Y(n285) );
  NAND2X1 U508 ( .A(state[2]), .B(n455), .Y(n332) );
  CLKMX2X2 U509 ( .A(sti_addr[1]), .B(N85), .S0(n342), .Y(n169) );
  CLKMX2X2 U510 ( .A(sti_addr[0]), .B(N84), .S0(n342), .Y(n168) );
  CLKMX2X2 U511 ( .A(sti_addr[2]), .B(N86), .S0(n342), .Y(n167) );
  CLKMX2X2 U512 ( .A(sti_addr[3]), .B(N87), .S0(n342), .Y(n166) );
  CLKMX2X2 U513 ( .A(sti_addr[4]), .B(N88), .S0(n342), .Y(n165) );
  CLKMX2X2 U514 ( .A(sti_addr[5]), .B(N89), .S0(n342), .Y(n164) );
  CLKMX2X2 U515 ( .A(sti_addr[6]), .B(N90), .S0(n342), .Y(n163) );
  CLKMX2X2 U516 ( .A(n241), .B(N91), .S0(n342), .Y(n162) );
  CLKMX2X2 U517 ( .A(n239), .B(N92), .S0(n342), .Y(n161) );
  CLKMX2X2 U518 ( .A(sti_addr[9]), .B(N93), .S0(n342), .Y(n160) );
  NOR2X1 U519 ( .A(n286), .B(N38), .Y(n446) );
endmodule

