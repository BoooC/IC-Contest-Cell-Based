/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Wed Mar 20 00:58:14 2024
/////////////////////////////////////////////////////////////


module SET_DW01_inc_0_DW01_inc_6 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2XL U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module SET_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [7:1] carry;
  assign SUM[1] = carry[1];

  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(n1), .CO(carry[4]), .S(SUM[3]) );
  ADDFHX4 U1_5 ( .A(A[5]), .B(n10), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_0 ( .A(A[0]), .B(B[0]), .CI(1'b0), .CO(carry[1]), .S(SUM[0]) );
  CLKBUFX3 U1 ( .A(B[5]), .Y(n10) );
  CLKAND2X3 U2 ( .A(B[2]), .B(A[2]), .Y(n1) );
  NAND2X1 U3 ( .A(A[6]), .B(n3), .Y(n4) );
  NAND2X1 U4 ( .A(n2), .B(B[6]), .Y(n5) );
  NAND2X1 U5 ( .A(n4), .B(n5), .Y(n6) );
  CLKINVX1 U6 ( .A(A[6]), .Y(n2) );
  INVX1 U7 ( .A(B[6]), .Y(n3) );
  XOR2X2 U8 ( .A(carry[6]), .B(n6), .Y(SUM[6]) );
  NAND2X2 U9 ( .A(A[6]), .B(carry[6]), .Y(n7) );
  NAND2X2 U10 ( .A(B[6]), .B(carry[6]), .Y(n8) );
  NAND2X1 U11 ( .A(B[6]), .B(A[6]), .Y(n9) );
  NAND3X4 U12 ( .A(n7), .B(n8), .C(n9), .Y(SUM[7]) );
  XOR2X1 U13 ( .A(B[2]), .B(A[2]), .Y(SUM[2]) );
endmodule


module SET_DW01_add_1 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [7:1] carry;

  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(n1), .CO(carry[4]), .S(SUM[3]) );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  NAND2X1 U1 ( .A(n2), .B(B[5]), .Y(n5) );
  INVX1 U2 ( .A(B[5]), .Y(n3) );
  NAND3X6 U3 ( .A(n11), .B(n12), .C(n13), .Y(carry[6]) );
  XOR2XL U4 ( .A(B[2]), .B(A[2]), .Y(SUM[2]) );
  AND2X2 U5 ( .A(B[2]), .B(A[2]), .Y(n1) );
  NAND2X1 U6 ( .A(A[5]), .B(n3), .Y(n4) );
  NAND2X2 U7 ( .A(n4), .B(n5), .Y(n10) );
  INVX1 U8 ( .A(A[5]), .Y(n2) );
  CLKXOR2X2 U9 ( .A(B[6]), .B(A[6]), .Y(n6) );
  XOR2X2 U10 ( .A(carry[6]), .B(n6), .Y(SUM[6]) );
  NAND2X1 U11 ( .A(B[6]), .B(carry[6]), .Y(n7) );
  NAND2X1 U12 ( .A(A[6]), .B(carry[6]), .Y(n8) );
  NAND2X1 U13 ( .A(A[6]), .B(B[6]), .Y(n9) );
  NAND3X2 U14 ( .A(n7), .B(n8), .C(n9), .Y(SUM[7]) );
  XOR2X4 U15 ( .A(carry[5]), .B(n10), .Y(SUM[5]) );
  NAND2X2 U16 ( .A(A[5]), .B(carry[5]), .Y(n11) );
  NAND2X2 U17 ( .A(B[5]), .B(carry[5]), .Y(n12) );
  NAND2XL U18 ( .A(B[5]), .B(A[5]), .Y(n13) );
  XOR2XL U19 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  AND2XL U20 ( .A(B[0]), .B(A[0]), .Y(SUM[1]) );
endmodule


module SET_DW01_add_2 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:1] carry;

  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(SUM[7]), .S(SUM[6]) );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(n1), .CO(carry[4]), .S(SUM[3]) );
  XOR2XL U1 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  AND2XL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[1]) );
  AND2X2 U3 ( .A(B[2]), .B(A[2]), .Y(n1) );
  XOR2XL U4 ( .A(B[2]), .B(A[2]), .Y(SUM[2]) );
endmodule


module SET ( clk, rst, en, central, radius, mode, busy, valid, candidate );
  input [23:0] central;
  input [11:0] radius;
  input [1:0] mode;
  output [7:0] candidate;
  input clk, rst, en;
  output busy, valid;
  wire   n625, n626, n627, n628, n629, n630, n631, n632, n633, N70, N71, N72,
         N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86,
         N87, N88, N89, N90, N91, N92, N93, N101, N102, N125, N134, N135, N136,
         N143, N144, N145, N146, N147, N148, N149, N150, N192, N198, n44, n45,
         n55, n56, n57, n58, n59, n60, n61, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         N202, N201, N200, N199, N196, N195, N194, N193, \C_Y_square[6] ,
         \C_Y_square[5] , \C_Y_square[4] , \C_Y_square[3] , \C_Y_square[2] ,
         \C_Y_square[0] , \C_X_square[6] , \C_X_square[5] , \C_X_square[4] ,
         \C_X_square[3] , \C_X_square[2] , \C_X_square[0] , \B_Y_square[6] ,
         \B_Y_square[5] , \B_Y_square[4] , \B_Y_square[3] , \B_Y_square[2] ,
         \B_Y_square[0] , \B_X_square[6] , \B_X_square[5] , \B_X_square[4] ,
         \B_X_square[3] , \B_X_square[2] , \B_X_square[0] , \A_Y_square[6] ,
         \A_Y_square[5] , \A_Y_square[4] , \A_Y_square[3] , \A_Y_square[2] ,
         \A_Y_square[0] , \A_X_square[6] , \A_X_square[5] , \A_X_square[4] ,
         \A_X_square[3] , \A_X_square[2] , \A_X_square[0] , \mult_75/n13 ,
         \mult_75/n12 , \mult_75/n11 , \mult_75/n5 , \mult_76/n13 ,
         \mult_76/n12 , \mult_76/n11 , \mult_77/n13 , \mult_77/n12 ,
         \mult_77/n11 , \mult_77/n5 , n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607, n608, n609, n610,
         n611, n612, n613, n614, n615, n616, n620, n621, n622, n623;
  wire   [1:0] state;
  wire   [3:0] ptr_X;
  wire   [3:0] ptr_Y;
  wire   [7:0] SET_A_R_aquare;
  wire   [7:0] SET_B_R_aquare;
  wire   [7:0] SET_C_R_aquare;
  assign SET_A_R_aquare[0] = radius[8];
  assign SET_B_R_aquare[0] = radius[4];
  assign SET_C_R_aquare[0] = radius[0];

  SET_DW01_inc_0_DW01_inc_6 add_155 ( .A({n626, n627, n628, n629, n630, n631, 
        n632, n633}), .SUM({N150, N149, N148, N147, N146, N145, N144, N143})
         );
  SET_DW01_add_0 add_81 ( .A({1'b0, \C_X_square[6] , \C_X_square[5] , 
        \C_X_square[4] , \C_X_square[3] , \C_X_square[2] , 1'b0, n228}), .B({
        1'b0, \C_Y_square[6] , \C_Y_square[5] , \C_Y_square[4] , 
        \C_Y_square[3] , \C_Y_square[2] , 1'b0, \C_Y_square[0] }), .CI(1'b0), 
        .SUM({N93, N92, N91, N90, N89, N88, N87, N86}) );
  SET_DW01_add_1 add_80 ( .A({1'b0, \B_X_square[6] , \B_X_square[5] , 
        \B_X_square[4] , \B_X_square[3] , \B_X_square[2] , 1'b0, n167}), .B({
        1'b0, \B_Y_square[6] , \B_Y_square[5] , \B_Y_square[4] , 
        \B_Y_square[3] , \B_Y_square[2] , 1'b0, \B_Y_square[0] }), .CI(1'b0), 
        .SUM({N85, N84, N83, N82, N81, N80, N79, N78}) );
  SET_DW01_add_2 add_79 ( .A({1'b0, \A_X_square[6] , \A_X_square[5] , 
        \A_X_square[4] , \A_X_square[3] , \A_X_square[2] , 1'b0, n230}), .B({
        1'b0, \A_Y_square[6] , \A_Y_square[5] , \A_Y_square[4] , 
        \A_Y_square[3] , \A_Y_square[2] , 1'b0, \A_Y_square[0] }), .CI(1'b0), 
        .SUM({N77, N76, N75, N74, N73, N72, N71, N70}) );
  ADDHXL \mult_77/U6  ( .A(radius[1]), .B(\mult_77/n13 ), .CO(\mult_77/n5 ), 
        .S(SET_C_R_aquare[2]) );
  DFFQX1 \state_reg[0]  ( .D(N101), .CK(clk), .Q(state[0]) );
  DFFQX2 \ptr_Y_reg[3]  ( .D(n158), .CK(clk), .Q(ptr_Y[3]) );
  DFFQX1 \ptr_X_reg[2]  ( .D(n160), .CK(clk), .Q(ptr_X[2]) );
  DFFQX2 \ptr_X_reg[0]  ( .D(n162), .CK(clk), .Q(ptr_X[0]) );
  DFFQX1 \ptr_X_reg[1]  ( .D(n159), .CK(clk), .Q(ptr_X[1]) );
  DFFHQX8 \candidate_reg[0]  ( .D(n155), .CK(clk), .Q(n633) );
  DFFHQX8 \candidate_reg[7]  ( .D(n148), .CK(clk), .Q(n626) );
  DFFHQX8 \candidate_reg[6]  ( .D(n149), .CK(clk), .Q(n627) );
  DFFHQX8 \candidate_reg[5]  ( .D(n150), .CK(clk), .Q(n628) );
  DFFHQX8 \candidate_reg[4]  ( .D(n151), .CK(clk), .Q(n629) );
  DFFHQX8 \candidate_reg[3]  ( .D(n152), .CK(clk), .Q(n630) );
  DFFHQX8 \candidate_reg[2]  ( .D(n153), .CK(clk), .Q(n631) );
  DFFQX1 valid_reg ( .D(n147), .CK(clk), .Q(n625) );
  DFFHQX8 \candidate_reg[1]  ( .D(n154), .CK(clk), .Q(n632) );
  DFFXL \state_reg[1]  ( .D(N102), .CK(clk), .Q(state[1]), .QN(n284) );
  DFFQX2 \ptr_Y_reg[1]  ( .D(n156), .CK(clk), .Q(ptr_Y[1]) );
  DFFQX2 \ptr_Y_reg[0]  ( .D(n163), .CK(clk), .Q(ptr_Y[0]) );
  DFFQX1 \ptr_X_reg[3]  ( .D(n161), .CK(clk), .Q(ptr_X[3]) );
  DFFQX2 \ptr_Y_reg[2]  ( .D(n157), .CK(clk), .Q(ptr_Y[2]) );
  INVX12 U172 ( .A(1'b1), .Y(busy) );
  NAND2X4 U174 ( .A(n206), .B(n551), .Y(n573) );
  AND2X6 U175 ( .A(n268), .B(\A_Y_square[0] ), .Y(n260) );
  AND2X4 U176 ( .A(n269), .B(n406), .Y(n247) );
  NAND3X6 U177 ( .A(n202), .B(n203), .C(n292), .Y(n295) );
  NAND2X6 U178 ( .A(n378), .B(n375), .Y(n377) );
  NAND3X4 U179 ( .A(n211), .B(n212), .C(n394), .Y(n397) );
  NAND2X8 U180 ( .A(n439), .B(\B_Y_square[0] ), .Y(n441) );
  OR2X4 U181 ( .A(n220), .B(n279), .Y(\C_Y_square[0] ) );
  NAND2X4 U182 ( .A(n410), .B(n167), .Y(n411) );
  NAND2X6 U183 ( .A(n270), .B(n302), .Y(n304) );
  CLKINVX1 U184 ( .A(n252), .Y(n179) );
  NAND2X2 U185 ( .A(n515), .B(n514), .Y(n518) );
  NAND2X2 U186 ( .A(N92), .B(n515), .Y(n503) );
  CLKAND2X3 U187 ( .A(ptr_X[0]), .B(n288), .Y(n256) );
  NAND2X6 U188 ( .A(n333), .B(\A_Y_square[0] ), .Y(n335) );
  INVX6 U189 ( .A(\A_Y_square[0] ), .Y(n336) );
  AND2X8 U190 ( .A(n269), .B(n167), .Y(n261) );
  NAND2X4 U191 ( .A(n362), .B(ptr_Y[2]), .Y(n363) );
  INVX6 U192 ( .A(central[2]), .Y(n362) );
  INVX3 U193 ( .A(n328), .Y(n196) );
  XOR3X4 U194 ( .A(central[18]), .B(n325), .C(n430), .Y(n328) );
  NAND2X4 U195 ( .A(n253), .B(n320), .Y(n316) );
  OA21X2 U196 ( .A0(central[16]), .A1(n416), .B0(n315), .Y(n253) );
  INVX12 U197 ( .A(n587), .Y(n581) );
  INVX6 U198 ( .A(n441), .Y(n240) );
  OR2X2 U199 ( .A(n471), .B(n470), .Y(n214) );
  NAND3BX2 U200 ( .AN(n257), .B(SET_C_R_aquare[2]), .C(n489), .Y(n490) );
  NAND2X4 U201 ( .A(n424), .B(n205), .Y(n200) );
  NAND3X6 U202 ( .A(n221), .B(n222), .C(n421), .Y(n424) );
  NOR3BX2 U203 ( .AN(n513), .B(n512), .C(N90), .Y(n519) );
  NAND2X2 U204 ( .A(N91), .B(n508), .Y(n513) );
  NAND2X4 U205 ( .A(n510), .B(n509), .Y(n514) );
  CLKINVX1 U206 ( .A(n510), .Y(n508) );
  XNOR3X2 U207 ( .A(n496), .B(n494), .C(n495), .Y(n510) );
  AND2X1 U208 ( .A(n333), .B(n332), .Y(n173) );
  NAND2X6 U209 ( .A(n197), .B(n198), .Y(n333) );
  CLKBUFX3 U210 ( .A(N80), .Y(n166) );
  NAND3X2 U211 ( .A(n425), .B(n420), .C(n419), .Y(n421) );
  INVX6 U212 ( .A(n419), .Y(n423) );
  NAND2X8 U213 ( .A(ptr_Y[2]), .B(n422), .Y(n419) );
  XOR2X2 U214 ( .A(n271), .B(n502), .Y(n515) );
  NAND2X2 U215 ( .A(n337), .B(\A_Y_square[0] ), .Y(n334) );
  AO22X2 U216 ( .A0(n383), .A1(\C_Y_square[0] ), .B0(n383), .B1(n382), .Y(
        \C_Y_square[4] ) );
  NAND3X2 U217 ( .A(n214), .B(n215), .C(n468), .Y(n477) );
  NOR3BX2 U218 ( .AN(n475), .B(n472), .C(N82), .Y(n464) );
  AO21X4 U219 ( .A0(N88), .A1(n488), .B0(n257), .Y(n492) );
  INVX4 U220 ( .A(N84), .Y(n462) );
  NOR2X6 U221 ( .A(n607), .B(n606), .Y(\mult_76/n11 ) );
  INVX8 U222 ( .A(radius[6]), .Y(n606) );
  NAND2X2 U223 ( .A(N84), .B(n473), .Y(n474) );
  CLKXOR2X2 U224 ( .A(n273), .B(n454), .Y(n473) );
  INVX8 U225 ( .A(N83), .Y(n452) );
  NAND3BX4 U226 ( .AN(n279), .B(n372), .C(n363), .Y(n368) );
  INVX6 U227 ( .A(n370), .Y(n378) );
  NAND2X4 U228 ( .A(N77), .B(n536), .Y(n574) );
  AND2X8 U229 ( .A(n436), .B(\B_Y_square[0] ), .Y(n264) );
  NAND2X6 U230 ( .A(n443), .B(\B_Y_square[0] ), .Y(n440) );
  INVX12 U231 ( .A(\B_Y_square[0] ), .Y(n442) );
  INVX12 U232 ( .A(\C_Y_square[0] ), .Y(n386) );
  AND2XL U233 ( .A(n383), .B(n387), .Y(\C_Y_square[5] ) );
  INVX8 U234 ( .A(n438), .Y(n443) );
  NAND3X6 U235 ( .A(n363), .B(central[1]), .C(n417), .Y(n364) );
  NAND2X8 U236 ( .A(n282), .B(n339), .Y(n341) );
  CLKINVX8 U237 ( .A(central[6]), .Y(n339) );
  INVX8 U238 ( .A(n332), .Y(n337) );
  XOR2X4 U239 ( .A(n260), .B(n330), .Y(n332) );
  INVX6 U240 ( .A(n424), .Y(n199) );
  AND2X6 U241 ( .A(n270), .B(n230), .Y(n265) );
  NAND3X2 U242 ( .A(n347), .B(n346), .C(n341), .Y(n342) );
  NAND3X4 U243 ( .A(n341), .B(n391), .C(central[5]), .Y(n343) );
  NAND2X4 U244 ( .A(n436), .B(n433), .Y(n435) );
  NAND2X2 U245 ( .A(n360), .B(n228), .Y(n358) );
  NAND2X4 U246 ( .A(ptr_Y[1]), .B(n314), .Y(n320) );
  INVX6 U247 ( .A(central[20]), .Y(n288) );
  AND2XL U248 ( .A(n307), .B(n311), .Y(\A_X_square[5] ) );
  CLKINVX1 U249 ( .A(n166), .Y(n467) );
  XNOR2X1 U250 ( .A(n538), .B(n537), .Y(n255) );
  XNOR2X2 U251 ( .A(n545), .B(n544), .Y(n554) );
  NAND2X2 U252 ( .A(n177), .B(n169), .Y(n524) );
  INVX3 U253 ( .A(n361), .Y(n369) );
  NAND2X4 U254 ( .A(n278), .B(n430), .Y(n365) );
  XOR3X2 U255 ( .A(central[1]), .B(ptr_Y[1]), .C(n371), .Y(n379) );
  NOR2X6 U256 ( .A(n280), .B(central[0]), .Y(n279) );
  INVX3 U257 ( .A(radius[1]), .Y(n610) );
  NAND3X2 U258 ( .A(n342), .B(n343), .C(n344), .Y(n345) );
  NAND2X4 U259 ( .A(n180), .B(n181), .Y(n305) );
  NAND2X1 U260 ( .A(n289), .B(n179), .Y(n180) );
  CLKINVX1 U261 ( .A(n289), .Y(n178) );
  INVX3 U262 ( .A(n435), .Y(n207) );
  INVX3 U263 ( .A(n409), .Y(n414) );
  CLKINVX6 U264 ( .A(n167), .Y(n413) );
  INVX3 U265 ( .A(SET_C_R_aquare[0]), .Y(n611) );
  CLKBUFX3 U266 ( .A(\mult_77/n5 ), .Y(n225) );
  AND2X2 U267 ( .A(central[0]), .B(n416), .Y(n220) );
  BUFX8 U268 ( .A(\C_X_square[0] ), .Y(n228) );
  NAND2X1 U269 ( .A(n225), .B(\mult_77/n12 ), .Y(n499) );
  NOR2X6 U270 ( .A(n610), .B(n609), .Y(\mult_77/n11 ) );
  CLKINVX1 U271 ( .A(n296), .Y(n299) );
  CLKINVX1 U272 ( .A(n315), .Y(n317) );
  INVX3 U273 ( .A(n329), .Y(n195) );
  NAND2X4 U274 ( .A(n191), .B(n192), .Y(n307) );
  NAND2X2 U275 ( .A(n304), .B(n190), .Y(n191) );
  INVX3 U276 ( .A(n306), .Y(n311) );
  NAND2X2 U277 ( .A(n240), .B(n440), .Y(n243) );
  CLKAND2X3 U278 ( .A(n414), .B(n413), .Y(\B_X_square[2] ) );
  AND2X2 U279 ( .A(n443), .B(n442), .Y(\B_Y_square[2] ) );
  OR2X1 U280 ( .A(n282), .B(n396), .Y(n211) );
  XOR2X2 U281 ( .A(n404), .B(n213), .Y(n407) );
  CLKINVX1 U282 ( .A(n399), .Y(n400) );
  NAND2X4 U283 ( .A(n437), .B(n442), .Y(n433) );
  CLKINVX1 U284 ( .A(n426), .Y(n427) );
  CLKINVX1 U285 ( .A(n446), .Y(n451) );
  XOR2X1 U286 ( .A(\mult_76/n11 ), .B(radius[6]), .Y(n444) );
  CLKBUFX3 U287 ( .A(\mult_75/n11 ), .Y(n229) );
  AND2X2 U288 ( .A(n311), .B(n310), .Y(\A_X_square[2] ) );
  AND2X2 U289 ( .A(n337), .B(n336), .Y(\A_Y_square[2] ) );
  OR2X1 U290 ( .A(n282), .B(n294), .Y(n202) );
  CLKINVX1 U291 ( .A(n321), .Y(n322) );
  CLKINVX1 U292 ( .A(n320), .Y(n323) );
  CLKINVX1 U293 ( .A(n335), .Y(n331) );
  BUFX8 U294 ( .A(\A_X_square[0] ), .Y(n230) );
  AND2X2 U295 ( .A(n453), .B(radius[7]), .Y(n273) );
  CLKINVX1 U296 ( .A(n455), .Y(n460) );
  INVX3 U297 ( .A(n176), .Y(n177) );
  NAND2X2 U298 ( .A(n505), .B(n503), .Y(n176) );
  OAI221X1 U299 ( .A0(n493), .A1(n492), .B0(N89), .B1(n491), .C0(n490), .Y(
        n505) );
  INVX3 U300 ( .A(n584), .Y(n576) );
  AOI22X2 U301 ( .A0(n555), .A1(N74), .B0(n554), .B1(N76), .Y(n565) );
  INVX3 U302 ( .A(n550), .Y(n575) );
  NAND2X6 U303 ( .A(n216), .B(n522), .Y(n587) );
  CLKXOR2X4 U304 ( .A(n300), .B(n175), .Y(n303) );
  NAND2X2 U305 ( .A(N83), .B(n460), .Y(n475) );
  NAND2X4 U306 ( .A(n199), .B(n204), .Y(n201) );
  BUFX12 U307 ( .A(\B_X_square[0] ), .Y(n167) );
  XOR2X1 U308 ( .A(central[23]), .B(ptr_X[3]), .Y(n168) );
  AO22X1 U309 ( .A0(n356), .A1(n355), .B0(n356), .B1(n228), .Y(\C_X_square[4] ) );
  INVX4 U310 ( .A(n390), .Y(n402) );
  AND2X2 U311 ( .A(n504), .B(n513), .Y(n169) );
  CLKINVX1 U312 ( .A(n204), .Y(n205) );
  AND2X2 U313 ( .A(radius[5]), .B(\mult_76/n13 ), .Y(n170) );
  XOR2X1 U314 ( .A(central[7]), .B(ptr_X[3]), .Y(n171) );
  XOR2X1 U315 ( .A(central[15]), .B(ptr_X[3]), .Y(n172) );
  INVX3 U316 ( .A(radius[2]), .Y(n609) );
  XOR2X1 U317 ( .A(n459), .B(n458), .Y(n472) );
  XNOR2X1 U318 ( .A(\mult_77/n12 ), .B(n225), .Y(n491) );
  CLKINVX1 U319 ( .A(ptr_Y[0]), .Y(n416) );
  INVX3 U320 ( .A(ptr_Y[1]), .Y(n417) );
  AND2X6 U321 ( .A(n553), .B(n563), .Y(n248) );
  CLKINVX1 U322 ( .A(n554), .Y(n250) );
  ADDHX1 U323 ( .A(radius[9]), .B(\mult_75/n13 ), .CO(\mult_75/n5 ), .S(
        SET_A_R_aquare[2]) );
  NOR2X1 U324 ( .A(n604), .B(n605), .Y(\mult_75/n13 ) );
  CLKAND2X3 U325 ( .A(n455), .B(n452), .Y(n262) );
  NOR2X2 U326 ( .A(n607), .B(n608), .Y(\mult_76/n13 ) );
  INVX3 U327 ( .A(n304), .Y(n189) );
  INVX4 U328 ( .A(N75), .Y(n546) );
  AND2X2 U329 ( .A(n410), .B(n414), .Y(\B_X_square[5] ) );
  AND2X2 U330 ( .A(n439), .B(n443), .Y(\B_Y_square[5] ) );
  OR2X8 U331 ( .A(n173), .B(n331), .Y(\A_Y_square[4] ) );
  AND2X2 U332 ( .A(mode[0]), .B(n582), .Y(n174) );
  OR2X8 U333 ( .A(n174), .B(n581), .Y(n583) );
  AND3X2 U334 ( .A(n349), .B(n353), .C(n351), .Y(\C_X_square[6] ) );
  AND3X1 U335 ( .A(n374), .B(n378), .C(n376), .Y(\C_Y_square[6] ) );
  XOR2X1 U336 ( .A(central[22]), .B(n403), .Y(n175) );
  AOI2BB1X2 U337 ( .A0N(n256), .A1N(n299), .B0(n298), .Y(n300) );
  NAND2X2 U338 ( .A(n189), .B(n303), .Y(n192) );
  INVX3 U339 ( .A(n303), .Y(n190) );
  CLKINVX1 U340 ( .A(N85), .Y(n254) );
  NAND2X2 U341 ( .A(n178), .B(n252), .Y(n181) );
  NAND2X1 U342 ( .A(n288), .B(ptr_X[0]), .Y(n289) );
  XOR2X4 U343 ( .A(central[21]), .B(n283), .Y(n252) );
  NAND2X4 U344 ( .A(n309), .B(n183), .Y(n184) );
  NAND2X2 U345 ( .A(n182), .B(n308), .Y(n185) );
  NAND2X4 U346 ( .A(n184), .B(n185), .Y(\A_X_square[3] ) );
  CLKINVX1 U347 ( .A(n309), .Y(n182) );
  INVX3 U348 ( .A(n308), .Y(n183) );
  NAND2X4 U349 ( .A(n311), .B(n230), .Y(n309) );
  NAND2X4 U350 ( .A(n307), .B(n230), .Y(n308) );
  NAND2XL U351 ( .A(n307), .B(n306), .Y(n186) );
  NAND2XL U352 ( .A(n307), .B(n230), .Y(n187) );
  NAND2X1 U353 ( .A(n186), .B(n187), .Y(\A_X_square[4] ) );
  XNOR2X4 U354 ( .A(n397), .B(n172), .Y(n269) );
  XNOR2X4 U355 ( .A(n295), .B(n168), .Y(n270) );
  AND3XL U356 ( .A(n301), .B(n270), .C(n303), .Y(\A_X_square[6] ) );
  XOR2X1 U357 ( .A(central[10]), .B(n430), .Y(n188) );
  XOR2X4 U358 ( .A(n431), .B(n188), .Y(n434) );
  AOI2BB1X2 U359 ( .A0N(n429), .A1N(n428), .B0(n427), .Y(n431) );
  NAND2X8 U360 ( .A(n207), .B(n434), .Y(n210) );
  INVX3 U361 ( .A(n434), .Y(n208) );
  OR2X1 U362 ( .A(ptr_Y[2]), .B(n318), .Y(n193) );
  OR2X4 U363 ( .A(n317), .B(n321), .Y(n194) );
  NAND3X4 U364 ( .A(n193), .B(n194), .C(n316), .Y(n319) );
  INVX8 U365 ( .A(central[18]), .Y(n318) );
  NAND2X2 U366 ( .A(central[17]), .B(n417), .Y(n321) );
  NAND2X4 U367 ( .A(n329), .B(n196), .Y(n197) );
  NAND2X6 U368 ( .A(n195), .B(n328), .Y(n198) );
  AND2X1 U369 ( .A(n333), .B(n337), .Y(\A_Y_square[5] ) );
  XOR2X1 U370 ( .A(radius[5]), .B(\mult_76/n13 ), .Y(SET_B_R_aquare[2]) );
  NAND2X8 U371 ( .A(n200), .B(n201), .Y(n436) );
  OR2X4 U372 ( .A(n293), .B(n297), .Y(n203) );
  INVX3 U373 ( .A(n291), .Y(n293) );
  XNOR2X2 U374 ( .A(central[11]), .B(ptr_Y[3]), .Y(n204) );
  OA21X4 U375 ( .A0(N74), .A1(n552), .B0(n554), .Y(n206) );
  INVX8 U376 ( .A(n573), .Y(n567) );
  NAND2X6 U377 ( .A(n435), .B(n208), .Y(n209) );
  NAND2X8 U378 ( .A(n209), .B(n210), .Y(n439) );
  OAI2BB1X1 U379 ( .A0N(n439), .A1N(n438), .B0(n441), .Y(\B_Y_square[4] ) );
  OR2X4 U380 ( .A(n395), .B(n399), .Y(n212) );
  NAND2X4 U381 ( .A(central[13]), .B(n391), .Y(n399) );
  XOR2X1 U382 ( .A(central[14]), .B(n403), .Y(n213) );
  AOI2BB1X2 U383 ( .A0N(n402), .A1N(n401), .B0(n400), .Y(n404) );
  INVX3 U384 ( .A(n407), .Y(n246) );
  OR2X1 U385 ( .A(N81), .B(n469), .Y(n215) );
  AO21XL U386 ( .A0(N78), .A1(n608), .B0(N79), .Y(n471) );
  OA21X4 U387 ( .A0(n525), .A1(n524), .B0(n523), .Y(n216) );
  AND2XL U388 ( .A(N93), .B(n507), .Y(n525) );
  AOI2BB1X1 U389 ( .A0N(N93), .A1N(n507), .B0(n506), .Y(n523) );
  AND3X2 U390 ( .A(mode[1]), .B(n576), .C(n587), .Y(n578) );
  NAND2X1 U391 ( .A(\mult_77/n11 ), .B(n609), .Y(n218) );
  NAND2X1 U392 ( .A(n217), .B(radius[2]), .Y(n219) );
  NAND2X1 U393 ( .A(n218), .B(n219), .Y(n482) );
  CLKINVX1 U394 ( .A(\mult_77/n11 ), .Y(n217) );
  NAND2X6 U395 ( .A(n378), .B(\C_Y_square[0] ), .Y(n381) );
  NAND2X4 U396 ( .A(n387), .B(\C_Y_square[0] ), .Y(n385) );
  OR2X8 U397 ( .A(n423), .B(n426), .Y(n221) );
  OR2X4 U398 ( .A(ptr_Y[2]), .B(n422), .Y(n222) );
  NAND2X4 U399 ( .A(central[9]), .B(n417), .Y(n426) );
  INVX6 U400 ( .A(central[10]), .Y(n422) );
  XNOR2X4 U401 ( .A(n345), .B(n171), .Y(n353) );
  AND2X6 U402 ( .A(n353), .B(n228), .Y(n263) );
  CLKAND2X8 U403 ( .A(n591), .B(n590), .Y(n223) );
  AND2X8 U404 ( .A(n589), .B(n588), .Y(n224) );
  NOR2X8 U405 ( .A(n223), .B(n224), .Y(n259) );
  AOI211X2 U406 ( .A0(n585), .A1(n584), .B0(n581), .C0(n534), .Y(n591) );
  OR2X8 U407 ( .A(n572), .B(n568), .Y(n590) );
  BUFX20 U408 ( .A(n259), .Y(n245) );
  INVX3 U409 ( .A(n259), .Y(n599) );
  INVX3 U410 ( .A(n362), .Y(n278) );
  NAND3X2 U411 ( .A(n565), .B(n564), .C(n563), .Y(n571) );
  NAND2X4 U412 ( .A(n353), .B(n350), .Y(n352) );
  NAND4X4 U413 ( .A(n369), .B(n365), .C(n364), .D(n368), .Y(n367) );
  NAND4X2 U414 ( .A(n477), .B(n476), .C(n475), .D(n474), .Y(n478) );
  CLKAND2X8 U415 ( .A(n387), .B(n386), .Y(\C_Y_square[2] ) );
  INVX8 U416 ( .A(radius[5]), .Y(n607) );
  INVX8 U417 ( .A(n355), .Y(n360) );
  CLKAND2X12 U418 ( .A(N89), .B(n491), .Y(n257) );
  NAND2X4 U419 ( .A(n553), .B(n563), .Y(n552) );
  NAND2X2 U420 ( .A(n251), .B(n549), .Y(n550) );
  INVX8 U421 ( .A(n382), .Y(n387) );
  XOR3X4 U422 ( .A(central[5]), .B(n283), .C(n346), .Y(n354) );
  AO22X4 U423 ( .A0(central[5]), .A1(n391), .B0(n347), .B1(n346), .Y(n348) );
  INVX8 U424 ( .A(central[5]), .Y(n340) );
  INVX8 U425 ( .A(central[12]), .Y(n388) );
  CLKINVX2 U426 ( .A(N91), .Y(n509) );
  CLKINVX8 U427 ( .A(n599), .Y(n226) );
  INVX12 U428 ( .A(n226), .Y(n227) );
  CLKINVX8 U429 ( .A(central[4]), .Y(n338) );
  INVX4 U430 ( .A(n452), .Y(n281) );
  AO21X2 U431 ( .A0(n166), .A1(n466), .B0(n258), .Y(n470) );
  NAND2X4 U432 ( .A(n481), .B(n480), .Y(n584) );
  NOR2X8 U433 ( .A(n610), .B(n611), .Y(\mult_77/n13 ) );
  OR2X8 U434 ( .A(n417), .B(central[1]), .Y(n372) );
  INVX2 U435 ( .A(n425), .Y(n428) );
  INVX4 U436 ( .A(n585), .Y(n586) );
  INVX3 U437 ( .A(n279), .Y(n371) );
  NAND2X8 U438 ( .A(n283), .B(n340), .Y(n347) );
  AND2XL U439 ( .A(n356), .B(n360), .Y(\C_X_square[5] ) );
  NAND2X6 U440 ( .A(n356), .B(n228), .Y(n357) );
  NAND2X6 U441 ( .A(n383), .B(\C_Y_square[0] ), .Y(n384) );
  INVX4 U442 ( .A(n297), .Y(n298) );
  NAND2X2 U443 ( .A(central[21]), .B(n391), .Y(n297) );
  NAND2X8 U444 ( .A(n283), .B(n290), .Y(n296) );
  XOR3X4 U445 ( .A(n278), .B(ptr_Y[2]), .C(n373), .Y(n376) );
  OAI2BB1X4 U446 ( .A0N(n365), .A1N(n364), .B0(n361), .Y(n366) );
  XOR2X4 U447 ( .A(n385), .B(n384), .Y(\C_Y_square[3] ) );
  NAND2X6 U448 ( .A(N75), .B(n542), .Y(n563) );
  XOR2X4 U449 ( .A(n352), .B(n351), .Y(n356) );
  OAI222X2 U450 ( .A0(n521), .A1(n520), .B0(n519), .B1(n518), .C0(n517), .C1(
        n516), .Y(n522) );
  NAND2X8 U451 ( .A(ptr_Y[1]), .B(n418), .Y(n425) );
  XOR2X4 U452 ( .A(n335), .B(n334), .Y(\A_Y_square[3] ) );
  CLKINVX2 U453 ( .A(n398), .Y(n401) );
  NAND2X6 U454 ( .A(n283), .B(n392), .Y(n398) );
  NAND3BX4 U455 ( .AN(n575), .B(n574), .C(n573), .Y(n579) );
  XOR2X4 U456 ( .A(n358), .B(n357), .Y(\C_X_square[3] ) );
  NAND2X6 U457 ( .A(n305), .B(n310), .Y(n302) );
  XOR2X4 U458 ( .A(n265), .B(n305), .Y(n306) );
  XOR2X4 U459 ( .A(n412), .B(n411), .Y(\B_X_square[3] ) );
  NAND2X4 U460 ( .A(n330), .B(n336), .Y(n327) );
  XOR3X1 U461 ( .A(central[17]), .B(ptr_Y[1]), .C(n313), .Y(n330) );
  CLKINVX8 U462 ( .A(n420), .Y(n429) );
  XOR2X4 U463 ( .A(n420), .B(ptr_Y[1]), .Y(n244) );
  NAND2X8 U464 ( .A(ptr_Y[0]), .B(n415), .Y(n420) );
  INVX8 U465 ( .A(n228), .Y(n359) );
  XOR3X4 U466 ( .A(central[6]), .B(n282), .C(n348), .Y(n351) );
  AOI2BB1X4 U467 ( .A0N(n554), .A1N(n551), .B0(n548), .Y(n549) );
  CLKINVX3 U468 ( .A(N76), .Y(n548) );
  INVX8 U469 ( .A(n393), .Y(n395) );
  NAND3BX4 U470 ( .AN(n402), .B(n393), .C(n398), .Y(n394) );
  NAND2X8 U471 ( .A(n282), .B(n396), .Y(n393) );
  OAI211X2 U472 ( .A0(central[20]), .A1(n389), .B0(n291), .C0(n296), .Y(n292)
         );
  AND3X1 U473 ( .A(n326), .B(n268), .C(n328), .Y(\A_Y_square[6] ) );
  OAI32X2 U474 ( .A0(n262), .A1(n465), .A2(n464), .B0(n463), .B1(n462), .Y(
        n479) );
  AOI2BB1X4 U475 ( .A0N(n262), .A1N(n461), .B0(n473), .Y(n463) );
  CLKINVX8 U476 ( .A(n230), .Y(n310) );
  NAND2X8 U477 ( .A(n282), .B(n294), .Y(n291) );
  AOI2BB1X4 U478 ( .A0N(n572), .A1N(n571), .B0(n570), .Y(n580) );
  CLKINVX3 U479 ( .A(n571), .Y(n566) );
  INVX1 U480 ( .A(n600), .Y(n155) );
  INVX1 U481 ( .A(n592), .Y(n148) );
  INVX1 U482 ( .A(n597), .Y(n153) );
  INVX1 U483 ( .A(n596), .Y(n152) );
  INVX1 U484 ( .A(n595), .Y(n151) );
  INVX1 U485 ( .A(n594), .Y(n150) );
  INVX1 U486 ( .A(n593), .Y(n149) );
  INVX1 U487 ( .A(n598), .Y(n154) );
  AO21X2 U488 ( .A0(central[12]), .A1(n389), .B0(n402), .Y(\B_X_square[0] ) );
  BUFX12 U489 ( .A(n632), .Y(candidate[1]) );
  AOI32XL U490 ( .A0(n632), .A1(n266), .A2(n245), .B0(N144), .B1(n227), .Y(
        n598) );
  BUFX12 U491 ( .A(n625), .Y(valid) );
  BUFX12 U492 ( .A(n631), .Y(candidate[2]) );
  AOI32XL U493 ( .A0(n631), .A1(n266), .A2(n245), .B0(N145), .B1(n227), .Y(
        n597) );
  BUFX12 U494 ( .A(n630), .Y(candidate[3]) );
  AOI32XL U495 ( .A0(n630), .A1(n266), .A2(n245), .B0(N146), .B1(n227), .Y(
        n596) );
  BUFX12 U496 ( .A(n629), .Y(candidate[4]) );
  AOI32XL U497 ( .A0(n629), .A1(n266), .A2(n245), .B0(N147), .B1(n227), .Y(
        n595) );
  BUFX12 U498 ( .A(n628), .Y(candidate[5]) );
  AOI32XL U499 ( .A0(n628), .A1(n266), .A2(n245), .B0(N148), .B1(n227), .Y(
        n594) );
  BUFX12 U500 ( .A(n627), .Y(candidate[6]) );
  AOI32XL U501 ( .A0(n627), .A1(n266), .A2(n245), .B0(N149), .B1(n227), .Y(
        n593) );
  BUFX12 U502 ( .A(n626), .Y(candidate[7]) );
  AOI32XL U503 ( .A0(n626), .A1(n266), .A2(n245), .B0(N150), .B1(n227), .Y(
        n592) );
  BUFX12 U504 ( .A(n633), .Y(candidate[0]) );
  AOI32XL U505 ( .A0(n633), .A1(n266), .A2(n245), .B0(N143), .B1(n227), .Y(
        n600) );
  NAND2X2 U506 ( .A(n441), .B(n241), .Y(n242) );
  NAND2X6 U507 ( .A(n242), .B(n243), .Y(\B_Y_square[3] ) );
  INVX3 U508 ( .A(n440), .Y(n241) );
  CLKXOR2X4 U509 ( .A(central[9]), .B(n244), .Y(n437) );
  INVX1 U510 ( .A(n574), .Y(n572) );
  CLKINVX6 U511 ( .A(central[9]), .Y(n418) );
  NAND2X6 U512 ( .A(n408), .B(n413), .Y(n406) );
  XOR3X2 U513 ( .A(central[13]), .B(n283), .C(n390), .Y(n408) );
  CLKINVX1 U514 ( .A(n569), .Y(n570) );
  OAI2BB2X4 U515 ( .B0(n254), .B1(n481), .A0N(n479), .A1N(n478), .Y(n585) );
  CLKINVX3 U516 ( .A(central[17]), .Y(n314) );
  NAND2X8 U517 ( .A(ptr_X[0]), .B(n388), .Y(n390) );
  XOR2X4 U518 ( .A(n247), .B(n246), .Y(n410) );
  INVX4 U519 ( .A(central[21]), .Y(n290) );
  XNOR3X4 U520 ( .A(central[19]), .B(ptr_Y[3]), .C(n319), .Y(n268) );
  CLKINVX1 U521 ( .A(n528), .Y(n541) );
  INVX3 U522 ( .A(SET_A_R_aquare[0]), .Y(n605) );
  XNOR2X1 U523 ( .A(n255), .B(n539), .Y(n553) );
  INVX3 U524 ( .A(SET_B_R_aquare[0]), .Y(n608) );
  NAND3X1 U525 ( .A(n248), .B(n249), .C(n250), .Y(n251) );
  INVX1 U526 ( .A(N74), .Y(n249) );
  NAND2XL U527 ( .A(n453), .B(n454), .Y(n481) );
  AO21X4 U528 ( .A0(N91), .A1(n508), .B0(n512), .Y(n511) );
  AO21XL U529 ( .A0(N86), .A1(n611), .B0(N87), .Y(n493) );
  NAND2X4 U530 ( .A(ptr_Y[2]), .B(n318), .Y(n315) );
  INVX3 U531 ( .A(radius[10]), .Y(n603) );
  INVX3 U532 ( .A(radius[9]), .Y(n604) );
  AND2XL U533 ( .A(radius[3]), .B(SET_C_R_aquare[0]), .Y(n483) );
  NAND2X1 U534 ( .A(n501), .B(n502), .Y(n517) );
  AO21X2 U535 ( .A0(central[20]), .A1(n389), .B0(n256), .Y(\A_X_square[0] ) );
  AND2X4 U536 ( .A(n360), .B(n359), .Y(\C_X_square[2] ) );
  INVXL U537 ( .A(n302), .Y(n301) );
  INVXL U538 ( .A(n433), .Y(n432) );
  NAND2X2 U539 ( .A(n268), .B(n327), .Y(n329) );
  INVXL U540 ( .A(n327), .Y(n326) );
  XOR2X4 U541 ( .A(n261), .B(n408), .Y(n409) );
  OR2XL U542 ( .A(N73), .B(n558), .Y(n561) );
  XOR2X4 U543 ( .A(n264), .B(n437), .Y(n438) );
  AND3XL U544 ( .A(n405), .B(n269), .C(n407), .Y(\B_X_square[6] ) );
  AND3XL U545 ( .A(n432), .B(n436), .C(n434), .Y(\B_Y_square[6] ) );
  INVXL U546 ( .A(n406), .Y(n405) );
  XOR2X4 U547 ( .A(n263), .B(n354), .Y(n355) );
  INVXL U548 ( .A(n350), .Y(n349) );
  NAND2XL U549 ( .A(n543), .B(n544), .Y(n535) );
  XNOR2XL U550 ( .A(\mult_76/n12 ), .B(n170), .Y(n469) );
  XNOR2XL U551 ( .A(\mult_75/n12 ), .B(\mult_75/n5 ), .Y(n558) );
  AO21X4 U552 ( .A0(central[16]), .A1(n416), .B0(n324), .Y(\A_Y_square[0] ) );
  NAND2X2 U553 ( .A(ptr_Y[0]), .B(n312), .Y(n313) );
  INVX4 U554 ( .A(central[16]), .Y(n312) );
  INVX6 U555 ( .A(central[22]), .Y(n294) );
  INVX4 U556 ( .A(central[14]), .Y(n396) );
  INVX3 U557 ( .A(n484), .Y(n496) );
  AND2X4 U558 ( .A(n501), .B(radius[3]), .Y(n271) );
  OAI2BB1X2 U559 ( .A0N(central[4]), .A1N(n389), .B0(n346), .Y(\C_X_square[0] ) );
  XNOR2X4 U560 ( .A(ptr_Y[3]), .B(central[3]), .Y(n361) );
  AND2XL U561 ( .A(radius[3]), .B(SET_C_R_aquare[0]), .Y(n497) );
  XOR2X1 U562 ( .A(n500), .B(n499), .Y(n512) );
  AND2XL U563 ( .A(radius[7]), .B(SET_B_R_aquare[0]), .Y(n456) );
  XOR2XL U564 ( .A(radius[6]), .B(\mult_76/n11 ), .Y(n457) );
  XOR2XL U565 ( .A(radius[10]), .B(n229), .Y(n538) );
  NAND2XL U566 ( .A(radius[11]), .B(radius[10]), .Y(n544) );
  NAND2XL U567 ( .A(radius[3]), .B(radius[2]), .Y(n502) );
  NAND2XL U568 ( .A(radius[7]), .B(radius[6]), .Y(n454) );
  NOR4X1 U569 ( .A(n616), .B(ptr_X[0]), .C(n283), .D(n282), .Y(n57) );
  CLKINVX1 U570 ( .A(N88), .Y(n489) );
  CLKINVX1 U571 ( .A(n535), .Y(n536) );
  NAND2X1 U572 ( .A(N73), .B(n558), .Y(n559) );
  AND2X2 U573 ( .A(N81), .B(n469), .Y(n258) );
  NAND2X1 U574 ( .A(n535), .B(n532), .Y(n569) );
  CLKINVX1 U575 ( .A(N77), .Y(n532) );
  CLKINVX1 U576 ( .A(n375), .Y(n374) );
  CLKINVX1 U577 ( .A(n517), .Y(n507) );
  CLKINVX1 U578 ( .A(N85), .Y(n480) );
  NAND2X2 U579 ( .A(n354), .B(n359), .Y(n350) );
  CLKINVX1 U580 ( .A(N93), .Y(n516) );
  CLKINVX1 U581 ( .A(N92), .Y(n521) );
  NAND2X2 U582 ( .A(n547), .B(n546), .Y(n551) );
  CLKINVX1 U583 ( .A(n547), .Y(n542) );
  CLKINVX1 U584 ( .A(n379), .Y(n380) );
  NAND3X1 U585 ( .A(n562), .B(n561), .C(n560), .Y(n564) );
  CLKINVX1 U586 ( .A(n473), .Y(n465) );
  CLKINVX1 U587 ( .A(n313), .Y(n324) );
  NAND3BX1 U588 ( .AN(N72), .B(SET_A_R_aquare[2]), .C(n559), .Y(n560) );
  NAND3BXL U589 ( .AN(n258), .B(SET_B_R_aquare[2]), .C(n467), .Y(n468) );
  NAND3X1 U590 ( .A(n559), .B(n557), .C(n556), .Y(n562) );
  AOI21X1 U591 ( .A0(N70), .A1(n605), .B0(N71), .Y(n556) );
  NAND2BXL U592 ( .AN(SET_A_R_aquare[2]), .B(N72), .Y(n557) );
  NAND2X1 U593 ( .A(n170), .B(\mult_76/n12 ), .Y(n458) );
  NAND2X1 U594 ( .A(\mult_75/n5 ), .B(\mult_75/n12 ), .Y(n539) );
  NAND2X1 U595 ( .A(N82), .B(n472), .Y(n476) );
  CLKINVX1 U596 ( .A(SET_C_R_aquare[2]), .Y(n488) );
  CLKINVX1 U597 ( .A(n553), .Y(n555) );
  CLKINVX1 U598 ( .A(SET_B_R_aquare[2]), .Y(n466) );
  NOR2BX1 U599 ( .AN(n58), .B(n59), .Y(N198) );
  NAND2X1 U600 ( .A(N200), .B(N199), .Y(n623) );
  CLKINVX1 U601 ( .A(n612), .Y(N199) );
  NAND3X1 U602 ( .A(n57), .B(n613), .C(n615), .Y(n59) );
  NAND2X1 U603 ( .A(N194), .B(N193), .Y(n621) );
  CLKINVX1 U604 ( .A(n614), .Y(N193) );
  AND2X2 U605 ( .A(n533), .B(n613), .Y(n266) );
  CLKINVX1 U606 ( .A(n283), .Y(n391) );
  CLKINVX1 U607 ( .A(n282), .Y(n403) );
  CLKINVX1 U608 ( .A(n60), .Y(n615) );
  AND2X2 U609 ( .A(n533), .B(n601), .Y(n267) );
  CLKINVX1 U610 ( .A(n533), .Y(n602) );
  CLKINVX1 U611 ( .A(mode[1]), .Y(n582) );
  NAND2X1 U612 ( .A(n267), .B(n613), .Y(n577) );
  NAND2X1 U613 ( .A(central[6]), .B(n403), .Y(n344) );
  CLKINVX1 U614 ( .A(ptr_Y[0]), .Y(n280) );
  NAND2X1 U615 ( .A(radius[3]), .B(radius[1]), .Y(n494) );
  CLKINVX1 U616 ( .A(n487), .Y(n501) );
  AND2X2 U617 ( .A(radius[3]), .B(radius[1]), .Y(n486) );
  XOR3X1 U618 ( .A(n451), .B(n450), .C(n272), .Y(n455) );
  AND2X2 U619 ( .A(\mult_76/n11 ), .B(radius[6]), .Y(n272) );
  NAND2X1 U620 ( .A(radius[7]), .B(radius[5]), .Y(n450) );
  AND2X2 U621 ( .A(radius[7]), .B(SET_B_R_aquare[0]), .Y(n445) );
  CLKINVX1 U622 ( .A(n449), .Y(n453) );
  AND2X2 U623 ( .A(radius[7]), .B(radius[5]), .Y(n448) );
  AND2X2 U624 ( .A(\mult_76/n11 ), .B(radius[6]), .Y(n447) );
  NAND2X1 U625 ( .A(n543), .B(radius[11]), .Y(n545) );
  AND2X2 U626 ( .A(radius[11]), .B(SET_A_R_aquare[0]), .Y(n527) );
  XOR2X1 U627 ( .A(n229), .B(radius[10]), .Y(n526) );
  CLKINVX1 U628 ( .A(n531), .Y(n543) );
  AND2X2 U629 ( .A(radius[11]), .B(radius[9]), .Y(n530) );
  AND2X2 U630 ( .A(n229), .B(radius[10]), .Y(n529) );
  XOR3X1 U631 ( .A(n541), .B(n540), .C(n274), .Y(n547) );
  AND2X2 U632 ( .A(n229), .B(radius[10]), .Y(n274) );
  NAND2X1 U633 ( .A(radius[11]), .B(radius[9]), .Y(n540) );
  NAND4X1 U634 ( .A(n569), .B(n613), .C(mode[1]), .D(n267), .Y(n534) );
  XOR2X1 U635 ( .A(n498), .B(n497), .Y(n500) );
  XOR2X1 U636 ( .A(n457), .B(n456), .Y(n459) );
  NAND2X1 U637 ( .A(radius[11]), .B(SET_A_R_aquare[0]), .Y(n537) );
  CLKINVX1 U638 ( .A(mode[0]), .Y(n506) );
  CLKMX2X2 U639 ( .A(ptr_Y[3]), .B(N136), .S0(n55), .Y(n158) );
  XOR2X1 U640 ( .A(N202), .B(n622), .Y(N136) );
  NOR2BX1 U641 ( .AN(N201), .B(n623), .Y(n622) );
  CLKINVX1 U642 ( .A(rst), .Y(n613) );
  CLKMX2X2 U643 ( .A(ptr_Y[2]), .B(N135), .S0(n55), .Y(n157) );
  XNOR2X1 U644 ( .A(N201), .B(n623), .Y(N135) );
  CLKMX2X2 U645 ( .A(ptr_Y[1]), .B(N134), .S0(n55), .Y(n156) );
  XNOR2X1 U646 ( .A(N200), .B(n612), .Y(N134) );
  NAND2X1 U647 ( .A(N198), .B(ptr_Y[0]), .Y(n612) );
  NOR3X1 U648 ( .A(n60), .B(rst), .C(n57), .Y(N192) );
  CLKMX2X2 U649 ( .A(N125), .B(ptr_X[3]), .S0(n56), .Y(n161) );
  XOR2X1 U650 ( .A(N196), .B(n620), .Y(N125) );
  NOR2BX1 U651 ( .AN(N195), .B(n621), .Y(n620) );
  MXI2X1 U652 ( .A(n275), .B(n403), .S0(n56), .Y(n160) );
  XOR2X1 U653 ( .A(N195), .B(n621), .Y(n275) );
  NAND2X1 U654 ( .A(N192), .B(ptr_X[0]), .Y(n614) );
  MXI2X1 U655 ( .A(n276), .B(n277), .S0(n56), .Y(n159) );
  XOR2X1 U656 ( .A(N194), .B(n614), .Y(n276) );
  CLKINVX1 U657 ( .A(ptr_X[1]), .Y(n277) );
  CLKMX2X2 U658 ( .A(ptr_Y[0]), .B(n612), .S0(n55), .Y(n163) );
  OAI31XL U659 ( .A0(n601), .A1(rst), .A2(n44), .B0(n45), .Y(n147) );
  NAND2XL U660 ( .A(valid), .B(n44), .Y(n45) );
  AOI211X1 U661 ( .A0(state[0]), .A1(state[1]), .B0(n602), .C0(rst), .Y(n44)
         );
  CLKMX2X2 U662 ( .A(n614), .B(ptr_X[0]), .S0(n56), .Y(n162) );
  CLKINVX1 U663 ( .A(n287), .Y(N101) );
  AOI32X1 U664 ( .A0(n613), .A1(en), .A2(n602), .B0(n286), .B1(n285), .Y(n287)
         );
  CLKINVX1 U665 ( .A(n58), .Y(n286) );
  CLKINVX1 U666 ( .A(n59), .Y(n285) );
  AO21X1 U667 ( .A0(n57), .A1(n615), .B0(rst), .Y(n55) );
  NOR2X1 U668 ( .A(rst), .B(n615), .Y(n56) );
  AOI21X1 U669 ( .A0(n60), .A1(n61), .B0(rst), .Y(N102) );
  NAND2BX1 U670 ( .AN(state[1]), .B(state[0]), .Y(n61) );
  CLKBUFX3 U671 ( .A(ptr_X[1]), .Y(n283) );
  CLKINVX1 U672 ( .A(ptr_X[0]), .Y(n389) );
  CLKBUFX3 U673 ( .A(ptr_X[2]), .Y(n282) );
  CLKINVX1 U674 ( .A(ptr_Y[2]), .Y(n430) );
  NAND4X1 U675 ( .A(ptr_Y[3]), .B(n416), .C(n417), .D(n430), .Y(n58) );
  CLKINVX1 U676 ( .A(ptr_X[3]), .Y(n616) );
  NAND2X1 U677 ( .A(state[1]), .B(n601), .Y(n60) );
  CLKINVX1 U678 ( .A(state[0]), .Y(n601) );
  NAND2X1 U679 ( .A(n601), .B(n284), .Y(n533) );
  NAND2X1 U680 ( .A(N90), .B(n512), .Y(n504) );
  AND2XL U681 ( .A(\mult_77/n11 ), .B(radius[2]), .Y(n485) );
  XOR2XL U682 ( .A(radius[2]), .B(\mult_77/n11 ), .Y(n498) );
  NAND2XL U683 ( .A(\mult_77/n11 ), .B(radius[2]), .Y(n495) );
  AOI211X2 U684 ( .A0(n281), .A1(n460), .B0(N82), .C0(n472), .Y(n461) );
  NAND2X8 U685 ( .A(ptr_X[0]), .B(n338), .Y(n346) );
  AO22X1 U686 ( .A0(n410), .A1(n409), .B0(n410), .B1(n167), .Y(\B_X_square[4] ) );
  XOR2X4 U687 ( .A(n381), .B(n380), .Y(n382) );
  AOI2BB1X2 U690 ( .A0N(n324), .A1N(n323), .B0(n322), .Y(n325) );
  NAND2X2 U693 ( .A(n379), .B(n386), .Y(n375) );
  OAI211X2 U694 ( .A0(n369), .A1(n368), .B0(n367), .C0(n366), .Y(n370) );
  AO22X4 U695 ( .A0(central[1]), .A1(n417), .B0(n371), .B1(n372), .Y(n373) );
  XOR2X4 U696 ( .A(n377), .B(n376), .Y(n383) );
  INVX4 U698 ( .A(central[13]), .Y(n392) );
  NAND2X2 U699 ( .A(n414), .B(n167), .Y(n412) );
  INVX4 U700 ( .A(central[8]), .Y(n415) );
  AO21X4 U701 ( .A0(central[8]), .A1(n416), .B0(n429), .Y(\B_Y_square[0] ) );
  ACHCINX2 U703 ( .CIN(n458), .A(n445), .B(n444), .CO(n446) );
  ACHCINX2 U704 ( .CIN(n451), .A(n448), .B(n447), .CO(n449) );
  ACHCINX2 U705 ( .CIN(n499), .A(n483), .B(n482), .CO(n484) );
  ACHCINX2 U706 ( .CIN(n496), .A(n486), .B(n485), .CO(n487) );
  OAI32X2 U707 ( .A0(n511), .A1(N90), .A2(n515), .B0(n515), .B1(n514), .Y(n520) );
  ACHCINX2 U708 ( .CIN(n539), .A(n527), .B(n526), .CO(n528) );
  ACHCINX2 U709 ( .CIN(n541), .A(n530), .B(n529), .CO(n531) );
  AOI2BB1X2 U710 ( .A0N(n575), .A1N(n567), .B0(n566), .Y(n568) );
  AOI211X2 U711 ( .A0(n580), .A1(n579), .B0(n578), .C0(n577), .Y(n589) );
  AOI33X2 U712 ( .A0(mode[1]), .A1(n587), .A2(n586), .B0(n585), .B1(n584), 
        .B2(n583), .Y(n588) );
  AND2X1 U713 ( .A(ptr_Y[1]), .B(N198), .Y(N200) );
  AND2X1 U714 ( .A(ptr_Y[2]), .B(N198), .Y(N201) );
  AND2X1 U715 ( .A(N198), .B(ptr_Y[3]), .Y(N202) );
  AND2X1 U716 ( .A(n283), .B(N192), .Y(N194) );
  AND2X1 U717 ( .A(n282), .B(N192), .Y(N195) );
  AND2X1 U718 ( .A(N192), .B(ptr_X[3]), .Y(N196) );
  NOR2X1 U719 ( .A(n609), .B(n611), .Y(\mult_77/n12 ) );
  NOR2X1 U720 ( .A(n606), .B(n608), .Y(\mult_76/n12 ) );
  NOR2X1 U721 ( .A(n604), .B(n603), .Y(\mult_75/n11 ) );
  NOR2X1 U722 ( .A(n603), .B(n605), .Y(\mult_75/n12 ) );
endmodule

