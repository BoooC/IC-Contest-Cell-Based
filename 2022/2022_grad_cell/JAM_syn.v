/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Tue Feb  6 22:45:34 2024
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(A[8]), .B(n2), .Y(SUM[8]) );
  XOR2XL U3 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XOR2XL U4 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  XNOR2X1 U5 ( .A(A[9]), .B(n3), .Y(SUM[9]) );
  NAND2X1 U6 ( .A(A[8]), .B(n2), .Y(n3) );
  AND2X2 U7 ( .A(A[7]), .B(carry[7]), .Y(n2) );
endmodule


module JAM_DW01_add_1 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  CLKAND2X8 U1 ( .A(A[7]), .B(carry[7]), .Y(n2) );
  NAND2X4 U2 ( .A(A[8]), .B(n2), .Y(n3) );
  XOR2X4 U3 ( .A(A[8]), .B(n2), .Y(SUM[8]) );
  XNOR2X4 U4 ( .A(A[9]), .B(n3), .Y(SUM[9]) );
  XOR2X1 U5 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  AND2X2 U6 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U7 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N99, N100, N102, N103, N104, N105, N106, N107, n814, n815, n816, n817,
         n818, n819, n820, n821, n822, n823, n824, n825, n826, n827,
         \perm[0][2] , \perm[0][1] , \perm[0][0] , \perm[1][2] , \perm[1][1] ,
         \perm[1][0] , \perm[2][2] , \perm[2][1] , \perm[2][0] , \perm[3][2] ,
         \perm[3][1] , \perm[3][0] , \perm[4][2] , \perm[4][1] , \perm[4][0] ,
         \perm[5][2] , \perm[5][1] , \perm[5][0] , \perm[6][2] , \perm[6][1] ,
         \perm[6][0] , \perm[7][2] , \perm[7][1] , \perm[7][0] , N195, N196,
         N197, N343, N344, N385, N386, N387, N388, N389, N390, N391, N392,
         N393, N394, N430, N431, N432, N433, N434, N435, N436, N437, N438,
         N439, N472, N483, N501, n244, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n289, n290, n291, n292, n293, n294, n295, n297, n298, n299, n300,
         n301, n302, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n655, n656, n657, n658, n659, n660, n661, n662, n663,
         n664, n665, n666, n667, n668, n669, n670, n671, n672, n673, n674,
         n675, n676, n677, n678, n679, n680, n681, n682, n683, n684, n685,
         n686, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696,
         n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, n707,
         n708, n709, n710, n711, n712, n713, n714, n715, n716, n717, n718,
         n719, n720, n721, n722, n723, n724, n725, n726, n727, n728, n729,
         n730, n731, n732, n733, n734, n735, n736, n737, n738, n739, n740,
         n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751,
         n752, n753, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n765, n766, n767, n768, n769, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n797, n798, n799, n800, n801, n802, n803, n804, n805, n806,
         n807, n808, n809, n810, n811, n812, n813;
  wire   [1:0] state;
  wire   [2:0] exchange_num;
  wire   [9:0] cost_temp;

  OAI221X2 U81 ( .A0(n762), .A1(n311), .B0(n750), .B1(n626), .C0(n313), .Y(
        n287) );
  AOI2BB2X4 U90 ( .B0(n336), .B1(n564), .A0N(n337), .A1N(n754), .Y(n335) );
  AOI21X4 U204 ( .A0(n417), .A1(n422), .B0(n419), .Y(n410) );
  AOI32X2 U212 ( .A0(n766), .A1(n762), .A2(\perm[7][1] ), .B0(n633), .B1(n620), 
        .Y(n432) );
  NAND2X4 U264 ( .A(n779), .B(n474), .Y(n379) );
  AOI211X2 U270 ( .A0(\perm[1][1] ), .A1(n799), .B0(n803), .C0(\perm[1][0] ), 
        .Y(n483) );
  JAM_DW01_add_0 add_194_2 ( .A(cost_temp), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(
        1'b0), .SUM({N439, N438, N437, N436, N435, N434, N433, N432, N431, 
        N430}) );
  JAM_DW01_add_1 r537 ( .A(cost_temp), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(1'b0), 
        .SUM({N394, N393, N392, N391, N390, N389, N388, N387, N386, N385}) );
  DFFQX1 \cost_temp_reg[9]  ( .D(n523), .CK(CLK), .Q(cost_temp[9]) );
  DFFQX1 \cost_temp_reg[6]  ( .D(n526), .CK(CLK), .Q(cost_temp[6]) );
  DFFQX1 \cost_temp_reg[5]  ( .D(n527), .CK(CLK), .Q(cost_temp[5]) );
  DFFQX1 \cost_temp_reg[4]  ( .D(n528), .CK(CLK), .Q(cost_temp[4]) );
  DFFQX1 \cost_temp_reg[3]  ( .D(n529), .CK(CLK), .Q(cost_temp[3]) );
  DFFQX1 \cost_temp_reg[2]  ( .D(n530), .CK(CLK), .Q(cost_temp[2]) );
  DFFQX1 \cost_temp_reg[1]  ( .D(n531), .CK(CLK), .Q(cost_temp[1]) );
  DFFQX2 \perm_reg[0][2]  ( .D(n534), .CK(CLK), .Q(\perm[0][2] ) );
  DFFQX1 \state_reg[1]  ( .D(N344), .CK(CLK), .Q(state[1]) );
  DFFQX1 \state_reg[0]  ( .D(N343), .CK(CLK), .Q(state[0]) );
  DFFQX2 \perm_reg[7][0]  ( .D(n550), .CK(CLK), .Q(\perm[7][0] ) );
  DFFQX2 \perm_reg[4][0]  ( .D(n545), .CK(CLK), .Q(\perm[4][0] ) );
  DFFQX2 \perm_reg[1][2]  ( .D(n537), .CK(CLK), .Q(\perm[1][2] ) );
  DFFQX2 \perm_reg[5][0]  ( .D(n742), .CK(CLK), .Q(\perm[5][0] ) );
  DFFQX2 \perm_reg[1][0]  ( .D(n744), .CK(CLK), .Q(\perm[1][0] ) );
  DFFQX2 \perm_reg[1][1]  ( .D(n538), .CK(CLK), .Q(\perm[1][1] ) );
  DFFQX2 \perm_reg[2][0]  ( .D(n540), .CK(CLK), .Q(\perm[2][0] ) );
  DFFQX1 \cost_temp_reg[8]  ( .D(n524), .CK(CLK), .Q(cost_temp[8]) );
  DFFQX1 \cost_temp_reg[7]  ( .D(n525), .CK(CLK), .Q(cost_temp[7]) );
  DFFQX1 \cost_temp_reg[0]  ( .D(n532), .CK(CLK), .Q(cost_temp[0]) );
  DFFQX1 \perm_reg[0][0]  ( .D(n536), .CK(CLK), .Q(\perm[0][0] ) );
  DFFQX1 \perm_reg[0][1]  ( .D(n535), .CK(CLK), .Q(\perm[0][1] ) );
  DFFQX4 \perm_reg[4][1]  ( .D(n544), .CK(CLK), .Q(\perm[4][1] ) );
  DFFQX2 \perm_reg[5][2]  ( .D(n546), .CK(CLK), .Q(\perm[5][2] ) );
  DFFHQX8 \perm_reg[3][2]  ( .D(n541), .CK(CLK), .Q(\perm[3][2] ) );
  DFFQX2 \perm_reg[6][2]  ( .D(n741), .CK(CLK), .Q(\perm[6][2] ) );
  DFFQX2 \perm_reg[7][1]  ( .D(n551), .CK(CLK), .Q(\perm[7][1] ) );
  DFFQX4 \perm_reg[2][2]  ( .D(n539), .CK(CLK), .Q(\perm[2][2] ) );
  DFFQX2 \perm_reg[5][1]  ( .D(n547), .CK(CLK), .Q(\perm[5][1] ) );
  DFFQX1 \W_reg[1]  ( .D(n533), .CK(CLK), .Q(N103) );
  DFFQXL \MatchCount_reg[1]  ( .D(n521), .CK(CLK), .Q(n816) );
  DFFQXL \MatchCount_reg[2]  ( .D(n520), .CK(CLK), .Q(n815) );
  DFFQX1 \W_reg[2]  ( .D(n552), .CK(CLK), .Q(N104) );
  DFFXL \MatchCount_reg[3]  ( .D(n519), .CK(CLK), .Q(n814), .QN(n244) );
  DFFQXL \perm_reg[7][2]  ( .D(n549), .CK(CLK), .Q(\perm[7][2] ) );
  DFFX1 \W_reg[0]  ( .D(n553), .CK(CLK), .Q(N102), .QN(n745) );
  DFFQX2 \perm_reg[6][0]  ( .D(n548), .CK(CLK), .Q(\perm[6][0] ) );
  DFFQX2 \perm_reg[3][0]  ( .D(n542), .CK(CLK), .Q(\perm[3][0] ) );
  DFFHQX4 \perm_reg[2][1]  ( .D(n743), .CK(CLK), .Q(\perm[2][1] ) );
  DFFQX4 \perm_reg[3][1]  ( .D(n559), .CK(CLK), .Q(\perm[3][1] ) );
  DFFQX1 \perm_reg[6][1]  ( .D(n561), .CK(CLK), .Q(\perm[6][1] ) );
  DFFQX2 \perm_reg[4][2]  ( .D(n543), .CK(CLK), .Q(\perm[4][2] ) );
  DFFQX1 \MinCost_reg[4]  ( .D(n729), .CK(CLK), .Q(n823) );
  DFFQX1 \MinCost_reg[8]  ( .D(n733), .CK(CLK), .Q(n819) );
  DFFQX1 \MinCost_reg[3]  ( .D(n728), .CK(CLK), .Q(n824) );
  DFFQX1 \MinCost_reg[5]  ( .D(n730), .CK(CLK), .Q(n822) );
  DFFQX1 \MatchCount_reg[0]  ( .D(n522), .CK(CLK), .Q(n817) );
  DFFQX1 \MinCost_reg[1]  ( .D(n726), .CK(CLK), .Q(n826) );
  DFFQX1 \MinCost_reg[0]  ( .D(n725), .CK(CLK), .Q(n827) );
  DFFQX1 \MinCost_reg[2]  ( .D(n727), .CK(CLK), .Q(n825) );
  DFFQX1 \MinCost_reg[6]  ( .D(n731), .CK(CLK), .Q(n821) );
  DFFQX1 \MinCost_reg[7]  ( .D(n732), .CK(CLK), .Q(n820) );
  DFFQX1 \MinCost_reg[9]  ( .D(n734), .CK(CLK), .Q(n818) );
  AOI32X2 U413 ( .A0(n558), .A1(n781), .A2(\perm[7][1] ), .B0(n633), .B1(n792), 
        .Y(n507) );
  OR2X4 U414 ( .A(n792), .B(n633), .Y(n558) );
  AOI221X1 U415 ( .A0(MinCost[8]), .A1(n630), .B0(N438), .B1(n735), .C0(RST), 
        .Y(n263) );
  OAI211X2 U416 ( .A0(\perm[2][2] ), .A1(n798), .B0(n485), .C0(n761), .Y(n469)
         );
  OAI211X1 U417 ( .A0(n696), .A1(n719), .B0(n695), .C0(n707), .Y(n697) );
  NAND2X2 U418 ( .A(N387), .B(n714), .Y(n707) );
  OAI31X4 U419 ( .A0(n454), .A1(exchange_num[0]), .A2(n567), .B0(n456), .Y(
        n453) );
  NOR2BX4 U420 ( .AN(n469), .B(n451), .Y(n420) );
  AOI211X2 U421 ( .A0(\perm[0][2] ), .A1(n798), .B0(n460), .C0(n763), .Y(n450)
         );
  INVX12 U422 ( .A(n382), .Y(n755) );
  OAI21X1 U423 ( .A0(\perm[1][1] ), .A1(n762), .B0(\perm[1][0] ), .Y(n489) );
  AOI222X2 U424 ( .A0(n822), .A1(n721), .B0(n823), .B1(n720), .C0(n699), .C1(
        n698), .Y(n703) );
  AOI2BB2X1 U425 ( .B0(n352), .B1(n635), .A0N(n353), .A1N(n357), .Y(n356) );
  CLKAND2X6 U426 ( .A(n453), .B(n380), .Y(n442) );
  BUFX8 U427 ( .A(n651), .Y(n554) );
  OAI22XL U428 ( .A0(n380), .A1(n643), .B0(n780), .B1(n642), .Y(n555) );
  CLKINVX12 U429 ( .A(exchange_num[1]), .Y(n762) );
  BUFX16 U430 ( .A(n762), .Y(n619) );
  NAND2X6 U431 ( .A(n327), .B(n488), .Y(n449) );
  OAI31X4 U432 ( .A0(n489), .A1(exchange_num[0]), .A2(n490), .B0(n491), .Y(
        n488) );
  OR2X4 U433 ( .A(n606), .B(n607), .Y(n470) );
  NOR3X1 U434 ( .A(n471), .B(exchange_num[0]), .C(n472), .Y(n606) );
  AOI221X1 U435 ( .A0(n818), .A1(n630), .B0(N439), .B1(n735), .C0(RST), .Y(
        n261) );
  CLKINVX1 U436 ( .A(n490), .Y(n771) );
  NOR2X2 U437 ( .A(n774), .B(\perm[1][2] ), .Y(n490) );
  AOI32X4 U438 ( .A0(n768), .A1(n762), .A2(\perm[3][1] ), .B0(\perm[3][2] ), 
        .B1(n620), .Y(n456) );
  CLKINVX6 U439 ( .A(n481), .Y(n786) );
  OAI32X4 U440 ( .A0(n801), .A1(\perm[2][1] ), .A2(n511), .B0(\perm[2][2] ), 
        .B1(n791), .Y(n481) );
  CLKINVX2 U441 ( .A(n633), .Y(n794) );
  BUFX12 U442 ( .A(\perm[7][2] ), .Y(n633) );
  INVX8 U443 ( .A(N389), .Y(n720) );
  CLKINVX8 U444 ( .A(n476), .Y(n784) );
  OAI31X4 U445 ( .A0(n508), .A1(\perm[4][0] ), .A2(n509), .B0(n510), .Y(n476)
         );
  AOI221X1 U446 ( .A0(\perm[2][0] ), .A1(n649), .B0(\perm[3][0] ), .B1(n575), 
        .C0(n637), .Y(n638) );
  AO22X1 U447 ( .A0(\perm[1][0] ), .A1(n574), .B0(\perm[0][0] ), .B1(n572), 
        .Y(n637) );
  BUFX8 U448 ( .A(n648), .Y(n575) );
  OAI31X4 U449 ( .A0(n513), .A1(\perm[3][0] ), .A2(n514), .B0(n515), .Y(n480)
         );
  NOR2X6 U450 ( .A(n710), .B(n709), .Y(n699) );
  INVX8 U451 ( .A(N393), .Y(n722) );
  NAND2BX4 U452 ( .AN(n701), .B(n700), .Y(n702) );
  NAND2X6 U453 ( .A(N391), .B(n716), .Y(n700) );
  INVX20 U454 ( .A(n635), .Y(n781) );
  BUFX12 U455 ( .A(\perm[6][1] ), .Y(n635) );
  BUFX8 U456 ( .A(n285), .Y(n573) );
  OAI221X4 U457 ( .A0(n620), .A1(n311), .B0(n754), .B1(n626), .C0(n402), .Y(
        n285) );
  NOR4X8 U458 ( .A(n712), .B(n711), .C(n710), .D(n709), .Y(N483) );
  OAI32XL U459 ( .A0(n812), .A1(MatchCount[2]), .A2(n251), .B0(n253), .B1(n813), .Y(n520) );
  BUFX6 U460 ( .A(n260), .Y(n556) );
  OA21X4 U461 ( .A0(MatchCount[2]), .A1(n252), .B0(n253), .Y(n249) );
  NAND2X2 U462 ( .A(n565), .B(n717), .Y(n705) );
  BUFX6 U463 ( .A(N392), .Y(n565) );
  NOR3BX1 U464 ( .AN(n700), .B(n694), .C(n701), .Y(n692) );
  NOR2X6 U465 ( .A(n722), .B(MinCost[8]), .Y(n694) );
  INVX6 U466 ( .A(N390), .Y(n721) );
  INVX8 U467 ( .A(N483), .Y(n736) );
  OAI221X4 U468 ( .A0(n762), .A1(n349), .B0(n750), .B1(n622), .C0(n356), .Y(
        n297) );
  NAND2X4 U469 ( .A(n353), .B(n622), .Y(n349) );
  OAI222X2 U470 ( .A0(n703), .A1(n702), .B0(N391), .B1(n716), .C0(n565), .C1(
        n717), .Y(n704) );
  NOR2X6 U471 ( .A(n566), .B(n755), .Y(n397) );
  BUFX6 U472 ( .A(n254), .Y(n557) );
  AOI221X2 U473 ( .A0(n634), .A1(n649), .B0(n633), .B1(n575), .C0(n644), .Y(
        n651) );
  AO22X2 U474 ( .A0(n631), .A1(n574), .B0(n632), .B1(n572), .Y(n644) );
  NOR2X8 U475 ( .A(n652), .B(N99), .Y(n649) );
  AOI32X2 U476 ( .A0(n705), .A1(n723), .A2(n704), .B0(MinCost[8]), .B1(n722), 
        .Y(n706) );
  CLKINVX8 U477 ( .A(n379), .Y(N99) );
  NAND2X4 U478 ( .A(n764), .B(n470), .Y(n451) );
  INVX1 U479 ( .A(n473), .Y(n607) );
  INVX3 U480 ( .A(n419), .Y(n757) );
  NAND3X2 U481 ( .A(n560), .B(n608), .C(n558), .Y(n609) );
  BUFX6 U482 ( .A(n646), .Y(n574) );
  AND3X4 U483 ( .A(n404), .B(n626), .C(n764), .Y(n403) );
  CLKINVX1 U484 ( .A(n627), .Y(n596) );
  CLKINVX6 U485 ( .A(N195), .Y(n754) );
  CLKINVX1 U486 ( .A(N104), .Y(n670) );
  INVX3 U487 ( .A(n624), .Y(n739) );
  AOI32X1 U488 ( .A0(n770), .A1(n762), .A2(\perm[2][1] ), .B0(\perm[2][2] ), 
        .B1(n620), .Y(n473) );
  CLKBUFX3 U489 ( .A(n455), .Y(n567) );
  CLKINVX1 U490 ( .A(n567), .Y(n768) );
  CLKINVX1 U491 ( .A(N386), .Y(n719) );
  AOI31X1 U492 ( .A0(n426), .A1(n794), .A2(n634), .B0(n427), .Y(n425) );
  NOR2X1 U493 ( .A(n759), .B(n563), .Y(n427) );
  NOR2X1 U494 ( .A(n787), .B(\perm[3][2] ), .Y(n511) );
  NOR2X2 U495 ( .A(n796), .B(n631), .Y(n509) );
  CLKINVX1 U496 ( .A(n503), .Y(n779) );
  INVX3 U497 ( .A(n566), .Y(n758) );
  BUFX4 U498 ( .A(n383), .Y(n571) );
  XNOR2X2 U499 ( .A(n777), .B(N106), .Y(n409) );
  NAND3X2 U500 ( .A(n396), .B(n627), .C(n395), .Y(n394) );
  INVX4 U501 ( .A(\perm[3][1] ), .Y(n801) );
  BUFX8 U502 ( .A(\perm[5][2] ), .Y(n631) );
  AOI221X1 U503 ( .A0(\perm[6][0] ), .A1(n685), .B0(\perm[7][0] ), .B1(n684), 
        .C0(n672), .Y(n675) );
  AOI221X1 U504 ( .A0(\perm[2][0] ), .A1(n685), .B0(\perm[3][0] ), .B1(n684), 
        .C0(n673), .Y(n674) );
  INVX3 U505 ( .A(n613), .Y(exchange_num[0]) );
  OA22X1 U506 ( .A0(n380), .A1(n639), .B0(n780), .B1(n638), .Y(n613) );
  AOI221X1 U507 ( .A0(\perm[6][0] ), .A1(n649), .B0(\perm[7][0] ), .B1(n575), 
        .C0(n636), .Y(n639) );
  AND3X2 U508 ( .A(n395), .B(n566), .C(n568), .Y(n336) );
  NOR2X1 U509 ( .A(n394), .B(n379), .Y(n345) );
  NAND2X1 U510 ( .A(n755), .B(n374), .Y(n362) );
  CLKINVX1 U511 ( .A(n826), .Y(n713) );
  CLKINVX1 U512 ( .A(n825), .Y(n714) );
  CLKINVX1 U513 ( .A(n824), .Y(n715) );
  CLKINVX1 U514 ( .A(n821), .Y(n716) );
  CLKINVX1 U515 ( .A(n820), .Y(n717) );
  CLKINVX1 U516 ( .A(n818), .Y(n718) );
  AOI221XL U517 ( .A0(n635), .A1(n667), .B0(\perm[7][1] ), .B1(n666), .C0(n658), .Y(n661) );
  CLKINVX1 U518 ( .A(n817), .Y(n811) );
  NAND3X1 U519 ( .A(n738), .B(n809), .C(state[1]), .Y(n274) );
  INVX6 U520 ( .A(\perm[2][2] ), .Y(n787) );
  AOI222X1 U521 ( .A0(n314), .A1(n633), .B0(\perm[2][2] ), .B1(n315), .C0(n316), .C1(n634), .Y(n402) );
  OAI221X1 U522 ( .A0(n762), .A1(n317), .B0(n750), .B1(n623), .C0(n319), .Y(
        n289) );
  INVX8 U523 ( .A(\perm[3][2] ), .Y(n791) );
  INVX3 U524 ( .A(\perm[4][1] ), .Y(n802) );
  INVX3 U525 ( .A(\perm[2][0] ), .Y(n803) );
  OAI221XL U526 ( .A0(n800), .A1(n323), .B0(n762), .B1(n324), .C0(n406), .Y(
        n282) );
  AOI2BB2X1 U527 ( .B0(n625), .B1(N195), .A0N(n798), .A1N(n327), .Y(n405) );
  NOR3X2 U528 ( .A(n293), .B(n297), .C(n295), .Y(n348) );
  NAND4X2 U529 ( .A(n291), .B(n290), .C(n298), .D(n375), .Y(n307) );
  INVX12 U530 ( .A(n562), .Y(J[0]) );
  NAND3X1 U531 ( .A(n597), .B(n598), .C(n738), .Y(n542) );
  OAI21X1 U532 ( .A0(n249), .A1(n244), .B0(n250), .Y(n519) );
  AOI221XL U533 ( .A0(n820), .A1(n630), .B0(N437), .B1(n735), .C0(RST), .Y(
        n264) );
  OAI211X1 U534 ( .A0(n258), .A1(n811), .B0(n259), .C0(n556), .Y(n522) );
  NAND3X1 U535 ( .A(n594), .B(n595), .C(n738), .Y(n543) );
  OR2X1 U536 ( .A(n752), .B(n739), .Y(n594) );
  OAI2BB2XL U537 ( .B0(n783), .B1(n740), .A0N(n291), .A1N(n624), .Y(n547) );
  OAI2BB2XL U538 ( .B0(n787), .B1(n740), .A0N(n573), .A1N(n624), .Y(n539) );
  AOI221XL U539 ( .A0(n295), .A1(n624), .B0(n634), .B1(n628), .C0(RST), .Y(
        n294) );
  AOI221XL U540 ( .A0(n293), .A1(n624), .B0(\perm[5][0] ), .B1(n628), .C0(RST), 
        .Y(n292) );
  OAI2BB2XL U541 ( .B0(n277), .B1(n739), .A0N(\perm[0][2] ), .A1N(n628), .Y(
        n534) );
  OAI221X1 U542 ( .A0(n620), .A1(n342), .B0(n754), .B1(n627), .C0(n343), .Y(
        n341) );
  NAND3X1 U543 ( .A(n604), .B(n605), .C(n738), .Y(n559) );
  AND2X1 U544 ( .A(n378), .B(n379), .Y(n321) );
  AND2X2 U545 ( .A(n403), .B(n775), .Y(n314) );
  OA21XL U546 ( .A0(\perm[7][1] ), .A1(n781), .B0(\perm[7][0] ), .Y(n560) );
  CLKINVX2 U547 ( .A(RST), .Y(n738) );
  NOR2X1 U548 ( .A(n774), .B(n631), .Y(n499) );
  NOR2X1 U549 ( .A(n774), .B(n632), .Y(n447) );
  CLKINVX1 U550 ( .A(N106), .Y(n689) );
  AOI221XL U551 ( .A0(n634), .A1(n685), .B0(n633), .B1(n684), .C0(n680), .Y(
        n687) );
  OAI221X1 U552 ( .A0(n620), .A1(n349), .B0(n754), .B1(n622), .C0(n351), .Y(
        n295) );
  NAND3X1 U553 ( .A(n610), .B(n611), .C(n738), .Y(n561) );
  OA22X1 U554 ( .A0(n670), .A1(n657), .B0(N104), .B1(n656), .Y(n562) );
  OR3X2 U555 ( .A(\perm[7][1] ), .B(n428), .C(n781), .Y(n563) );
  CLKINVX1 U556 ( .A(\perm[6][0] ), .Y(n608) );
  AO22X1 U557 ( .A0(\perm[1][1] ), .A1(n574), .B0(\perm[0][1] ), .B1(n572), 
        .Y(n641) );
  NAND4BX1 U558 ( .AN(n251), .B(MatchCount[2]), .C(MatchCount[1]), .D(n244), 
        .Y(n250) );
  INVX4 U559 ( .A(n631), .Y(n797) );
  OAI21X1 U560 ( .A0(\perm[7][1] ), .A1(n762), .B0(\perm[7][0] ), .Y(n430) );
  NOR2X1 U561 ( .A(n774), .B(n633), .Y(n431) );
  INVX8 U562 ( .A(exchange_num[2]), .Y(n774) );
  INVX3 U563 ( .A(N105), .Y(n688) );
  NOR2X1 U564 ( .A(n620), .B(n634), .Y(n494) );
  BUFX8 U565 ( .A(n774), .Y(n620) );
  OAI211X2 U566 ( .A0(n759), .A1(n423), .B0(n424), .C0(n425), .Y(n419) );
  NAND2X4 U567 ( .A(n492), .B(n423), .Y(n417) );
  OAI31X4 U568 ( .A0(n493), .A1(exchange_num[0]), .A2(n494), .B0(n495), .Y(
        n423) );
  AO22XL U569 ( .A0(\perm[5][0] ), .A1(n574), .B0(\perm[4][0] ), .B1(n572), 
        .Y(n636) );
  NOR3X4 U570 ( .A(n477), .B(n476), .C(n503), .Y(n380) );
  AOI31X2 U571 ( .A0(n478), .A1(n479), .A2(n786), .B0(n480), .Y(n475) );
  AO22X4 U572 ( .A0(\perm[1][2] ), .A1(n612), .B0(\perm[0][2] ), .B1(n569), 
        .Y(n683) );
  AOI2BB1X4 U573 ( .A0N(MatchCount[1]), .A1N(n252), .B0(n557), .Y(n253) );
  NAND2X8 U574 ( .A(n624), .B(n570), .Y(n252) );
  NAND2XL U575 ( .A(N472), .B(n740), .Y(n262) );
  OAI22XL U576 ( .A0(n554), .A1(n380), .B0(n780), .B1(n650), .Y(n564) );
  CLKAND2X6 U577 ( .A(n622), .B(n497), .Y(n436) );
  NAND2X4 U578 ( .A(N394), .B(n718), .Y(n708) );
  NOR2X1 U579 ( .A(N105), .B(N106), .Y(n681) );
  AOI222X1 U580 ( .A0(n632), .A1(n344), .B0(n345), .B1(n346), .C0(n347), .C1(
        n634), .Y(n343) );
  NOR2X4 U581 ( .A(n721), .B(n822), .Y(n701) );
  OAI2BB2X2 U582 ( .B0(n621), .B1(n413), .A0N(N106), .A1N(n408), .Y(n412) );
  OAI22X4 U583 ( .A0(n690), .A1(n679), .B0(N107), .B1(n678), .Y(N196) );
  AOI221X4 U584 ( .A0(\perm[2][1] ), .A1(n685), .B0(\perm[3][1] ), .B1(n684), 
        .C0(n677), .Y(n678) );
  AOI221X4 U585 ( .A0(n635), .A1(n685), .B0(\perm[7][1] ), .B1(n684), .C0(n676), .Y(n679) );
  OAI221X4 U586 ( .A0(n332), .A1(n359), .B0(n334), .B1(n805), .C0(n360), .Y(
        n293) );
  NAND2X2 U587 ( .A(n756), .B(n397), .Y(n396) );
  NAND3X6 U588 ( .A(n418), .B(n417), .C(n757), .Y(N106) );
  OAI211X4 U589 ( .A0(n760), .A1(n420), .B0(n415), .C0(n416), .Y(n418) );
  CLKINVX4 U590 ( .A(n341), .Y(n752) );
  BUFX12 U591 ( .A(n392), .Y(n566) );
  AOI222X4 U592 ( .A0(n314), .A1(\perm[7][0] ), .B0(\perm[2][0] ), .B1(n315), 
        .C0(n316), .C1(\perm[6][0] ), .Y(n385) );
  NOR2BX4 U593 ( .AN(n596), .B(n353), .Y(n352) );
  AOI222X4 U594 ( .A0(n320), .A1(\perm[6][0] ), .B0(n321), .B1(n330), .C0(
        \perm[3][0] ), .C1(n780), .Y(n329) );
  OAI221X4 U595 ( .A0(n765), .A1(n349), .B0(n749), .B1(n622), .C0(n388), .Y(
        n298) );
  NOR3X1 U596 ( .A(n755), .B(n758), .C(n756), .Y(n407) );
  CLKINVX2 U597 ( .A(n571), .Y(n756) );
  NAND4X2 U598 ( .A(n757), .B(n415), .C(n416), .D(n417), .Y(N107) );
  BUFX6 U599 ( .A(n391), .Y(n568) );
  INVX8 U600 ( .A(n426), .Y(n759) );
  OAI31X4 U601 ( .A0(n430), .A1(exchange_num[0]), .A2(n431), .B0(n432), .Y(
        n426) );
  OAI2BB1X4 U602 ( .A0N(n433), .A1N(n415), .B0(n416), .Y(n422) );
  OAI21X2 U603 ( .A0(n434), .A1(n435), .B0(n436), .Y(n416) );
  CLKINVX8 U604 ( .A(n386), .Y(n746) );
  OAI221X4 U605 ( .A0(n762), .A1(n342), .B0(n750), .B1(n627), .C0(n387), .Y(
        n386) );
  NOR2BX4 U606 ( .AN(N388), .B(n824), .Y(n710) );
  AO21X4 U607 ( .A0(n719), .A1(n696), .B0(n826), .Y(n695) );
  NOR2BX2 U608 ( .AN(MinCost[0]), .B(N385), .Y(n696) );
  INVX4 U609 ( .A(n694), .Y(n723) );
  NOR2X2 U610 ( .A(n652), .B(n653), .Y(n648) );
  INVX3 U611 ( .A(n621), .Y(n652) );
  INVX2 U612 ( .A(N99), .Y(n653) );
  OAI21X2 U613 ( .A0(\perm[1][2] ), .A1(n787), .B0(n482), .Y(n478) );
  INVX1 U614 ( .A(n514), .Y(n790) );
  NOR2X2 U615 ( .A(n791), .B(n632), .Y(n514) );
  NOR3X1 U616 ( .A(n280), .B(n277), .C(n279), .Y(n401) );
  AOI2BB2X1 U617 ( .B0(n763), .B1(\perm[0][2] ), .A0N(n763), .A1N(n754), .Y(
        n277) );
  XNOR2X4 U618 ( .A(n412), .B(n780), .Y(n411) );
  NAND2BX4 U619 ( .AN(n434), .B(n440), .Y(n415) );
  OAI211X4 U620 ( .A0(n632), .A1(n791), .B0(n441), .C0(n442), .Y(n440) );
  NOR2X8 U621 ( .A(n720), .B(n823), .Y(n709) );
  AOI222X1 U622 ( .A0(n320), .A1(n635), .B0(n321), .B1(n322), .C0(\perm[3][1] ), .C1(n780), .Y(n319) );
  AND2X4 U623 ( .A(n568), .B(n566), .Y(n332) );
  CLKINVX8 U624 ( .A(n376), .Y(n753) );
  OAI221X4 U625 ( .A0(n620), .A1(n317), .B0(n754), .B1(n623), .C0(n377), .Y(
        n376) );
  CLKINVX8 U626 ( .A(n328), .Y(n747) );
  OAI221X4 U627 ( .A0(n765), .A1(n317), .B0(n749), .B1(n623), .C0(n329), .Y(
        n328) );
  OAI221X4 U628 ( .A0(n332), .A1(n398), .B0(n334), .B1(n783), .C0(n399), .Y(
        n291) );
  AOI222X4 U629 ( .A0(\perm[4][0] ), .A1(n344), .B0(n345), .B1(n330), .C0(n347), .C1(\perm[6][0] ), .Y(n393) );
  BUFX6 U630 ( .A(n681), .Y(n569) );
  NAND2X2 U631 ( .A(n407), .B(n776), .Y(n324) );
  AOI2BB2XL U632 ( .B0(n625), .B1(N196), .A0N(n789), .A1N(n327), .Y(n406) );
  AOI2BB2X1 U633 ( .B0(n352), .B1(n634), .A0N(n353), .A1N(n354), .Y(n351) );
  BUFX6 U634 ( .A(n257), .Y(n570) );
  OAI22X2 U635 ( .A0(n690), .A1(n675), .B0(N107), .B1(n674), .Y(N197) );
  NAND3X2 U636 ( .A(n624), .B(n570), .C(n817), .Y(n251) );
  NOR2X4 U637 ( .A(N106), .B(n408), .Y(n413) );
  NAND2X4 U638 ( .A(n775), .B(n410), .Y(n408) );
  OAI31X1 U639 ( .A0(n449), .A1(n420), .A2(n450), .B0(n421), .Y(n433) );
  OAI21X2 U640 ( .A0(n451), .A1(n452), .B0(n442), .Y(n421) );
  OAI22X4 U641 ( .A0(n380), .A1(n643), .B0(n780), .B1(n642), .Y(
        exchange_num[1]) );
  BUFX6 U642 ( .A(n645), .Y(n572) );
  NOR2X1 U643 ( .A(N99), .B(n621), .Y(n645) );
  OAI21X2 U644 ( .A0(n477), .A1(n504), .B0(n779), .Y(N100) );
  OAI31X4 U645 ( .A0(n516), .A1(\perm[5][0] ), .A2(n517), .B0(n518), .Y(n477)
         );
  OAI31X2 U646 ( .A0(n480), .A1(n785), .A2(n481), .B0(n784), .Y(n504) );
  NAND2X2 U647 ( .A(n461), .B(n462), .Y(n460) );
  NAND2X2 U648 ( .A(n395), .B(n445), .Y(n434) );
  AOI221X4 U649 ( .A0(\perm[2][1] ), .A1(n649), .B0(\perm[3][1] ), .B1(n575), 
        .C0(n641), .Y(n642) );
  OAI21X1 U650 ( .A0(\perm[5][1] ), .A1(n802), .B0(\perm[5][0] ), .Y(n508) );
  AOI221X4 U651 ( .A0(n635), .A1(n649), .B0(\perm[7][1] ), .B1(n575), .C0(n640), .Y(n643) );
  AOI221X4 U652 ( .A0(\perm[2][2] ), .A1(n649), .B0(\perm[3][2] ), .B1(n575), 
        .C0(n647), .Y(n650) );
  AOI222X4 U653 ( .A0(\perm[4][1] ), .A1(n344), .B0(n345), .B1(n322), .C0(n347), .C1(n635), .Y(n387) );
  NOR2X2 U654 ( .A(n571), .B(n758), .Y(n374) );
  OAI211X2 U655 ( .A0(n817), .A1(n252), .B0(n255), .C0(n740), .Y(n254) );
  NAND3BXL U656 ( .AN(N472), .B(n736), .C(n624), .Y(n255) );
  NAND2X1 U657 ( .A(n374), .B(n382), .Y(n381) );
  INVX4 U658 ( .A(n410), .Y(N105) );
  AOI222X1 U659 ( .A0(n314), .A1(\perm[7][1] ), .B0(\perm[2][1] ), .B1(n315), 
        .C0(n316), .C1(n635), .Y(n313) );
  AND2X1 U660 ( .A(n403), .B(n379), .Y(n316) );
  NAND4X2 U661 ( .A(n282), .B(n281), .C(n573), .D(n401), .Y(n306) );
  AO22X4 U662 ( .A0(\perm[1][2] ), .A1(n574), .B0(\perm[0][2] ), .B1(n572), 
        .Y(n647) );
  INVX16 U663 ( .A(n745), .Y(W[0]) );
  BUFX12 U664 ( .A(n814), .Y(MatchCount[3]) );
  INVX16 U665 ( .A(n670), .Y(W[2]) );
  AOI2BB2X1 U666 ( .B0(N104), .B1(n618), .A0N(N104), .A1N(n660), .Y(n617) );
  BUFX16 U667 ( .A(n815), .Y(MatchCount[2]) );
  INVX12 U668 ( .A(n718), .Y(MinCost[9]) );
  INVX1 U669 ( .A(n261), .Y(n734) );
  INVX12 U670 ( .A(n717), .Y(MinCost[7]) );
  INVX12 U671 ( .A(n716), .Y(MinCost[6]) );
  INVX12 U672 ( .A(n714), .Y(MinCost[2]) );
  BUFX16 U673 ( .A(n827), .Y(MinCost[0]) );
  INVX12 U674 ( .A(n713), .Y(MinCost[1]) );
  INVX12 U675 ( .A(n811), .Y(MatchCount[0]) );
  BUFX12 U676 ( .A(n822), .Y(MinCost[5]) );
  INVX12 U677 ( .A(n715), .Y(MinCost[3]) );
  BUFX16 U678 ( .A(n819), .Y(MinCost[8]) );
  BUFX12 U679 ( .A(n823), .Y(MinCost[4]) );
  BUFX12 U680 ( .A(N501), .Y(Valid) );
  NOR2BX1 U681 ( .AN(state[1]), .B(n809), .Y(N501) );
  BUFX16 U682 ( .A(n816), .Y(MatchCount[1]) );
  INVX16 U683 ( .A(n810), .Y(W[1]) );
  NOR2X1 U684 ( .A(n671), .B(N103), .Y(n664) );
  NOR2X1 U685 ( .A(N102), .B(N103), .Y(n663) );
  INVX3 U686 ( .A(N103), .Y(n810) );
  OR2X1 U687 ( .A(n796), .B(n740), .Y(n595) );
  INVX2 U688 ( .A(n632), .Y(n796) );
  NOR2BX4 U689 ( .AN(n568), .B(n566), .Y(n353) );
  INVX8 U690 ( .A(\perm[5][1] ), .Y(n783) );
  OR2XL U691 ( .A(n747), .B(n739), .Y(n597) );
  OR2X1 U692 ( .A(n806), .B(n740), .Y(n598) );
  INVXL U693 ( .A(\perm[3][0] ), .Y(n806) );
  AND2X2 U694 ( .A(n337), .B(n622), .Y(n395) );
  CLKINVX2 U695 ( .A(n379), .Y(n775) );
  NAND3X1 U696 ( .A(n599), .B(n777), .C(n600), .Y(n601) );
  NAND2X2 U697 ( .A(n601), .B(n395), .Y(n344) );
  CLKINVX1 U698 ( .A(n394), .Y(n599) );
  INVXL U699 ( .A(n775), .Y(n600) );
  BUFX6 U700 ( .A(N100), .Y(n621) );
  BUFX20 U701 ( .A(\perm[6][2] ), .Y(n634) );
  OR2XL U702 ( .A(n791), .B(n740), .Y(n602) );
  NAND2X1 U703 ( .A(n602), .B(n603), .Y(n541) );
  CLKBUFX3 U704 ( .A(n256), .Y(n624) );
  NAND2XL U705 ( .A(n289), .B(n624), .Y(n604) );
  OR2XL U706 ( .A(n753), .B(n739), .Y(n603) );
  NAND2XL U707 ( .A(\perm[3][1] ), .B(n628), .Y(n605) );
  NAND2XL U708 ( .A(n297), .B(n624), .Y(n610) );
  NAND2X4 U709 ( .A(n609), .B(n507), .Y(n503) );
  NOR2X1 U710 ( .A(n774), .B(\perm[3][2] ), .Y(n455) );
  CLKINVX3 U711 ( .A(n449), .Y(n761) );
  OAI22X1 U712 ( .A0(\perm[2][2] ), .A1(n798), .B0(n483), .B1(n484), .Y(n482)
         );
  NAND2XL U713 ( .A(n635), .B(n628), .Y(n611) );
  INVX6 U714 ( .A(n384), .Y(n748) );
  OAI221X4 U715 ( .A0(n765), .A1(n311), .B0(n749), .B1(n626), .C0(n385), .Y(
        n384) );
  NOR3X4 U716 ( .A(n284), .B(n289), .C(n287), .Y(n310) );
  CLKINVX2 U717 ( .A(\perm[2][1] ), .Y(n799) );
  NOR2X2 U718 ( .A(n621), .B(n780), .Y(n327) );
  NOR3X2 U719 ( .A(n777), .B(n775), .C(n394), .Y(n347) );
  NOR2X1 U720 ( .A(n653), .B(n621), .Y(n646) );
  NAND4X2 U721 ( .A(n300), .B(n301), .C(n299), .D(n348), .Y(n308) );
  NOR3X4 U722 ( .A(n746), .B(n748), .C(n753), .Y(n375) );
  NAND4X2 U723 ( .A(n752), .B(n751), .C(n747), .D(n310), .Y(n309) );
  OAI2BB2XL U724 ( .B0(n798), .B1(n740), .A0N(n281), .A1N(n624), .Y(n537) );
  INVX3 U725 ( .A(n517), .Y(n793) );
  BUFX6 U726 ( .A(n682), .Y(n612) );
  NOR2XL U727 ( .A(n688), .B(N106), .Y(n682) );
  NAND2BXL U728 ( .AN(n381), .B(n623), .Y(n317) );
  NOR2X2 U729 ( .A(n778), .B(n775), .Y(n338) );
  XOR2X4 U730 ( .A(n411), .B(N107), .Y(n382) );
  NAND2X1 U731 ( .A(n623), .B(n380), .Y(n315) );
  INVX1 U732 ( .A(n479), .Y(n785) );
  NOR2X2 U733 ( .A(n797), .B(\perm[6][2] ), .Y(n517) );
  OAI22X4 U734 ( .A0(n554), .A1(n380), .B0(n780), .B1(n650), .Y(
        exchange_num[2]) );
  OAI21X1 U735 ( .A0(n635), .A1(n783), .B0(\perm[6][0] ), .Y(n516) );
  AOI32XL U736 ( .A0(n790), .A1(n801), .A2(\perm[4][1] ), .B0(n632), .B1(n791), 
        .Y(n515) );
  OAI21XL U737 ( .A0(\perm[4][1] ), .A1(n801), .B0(\perm[4][0] ), .Y(n513) );
  NAND2BXL U738 ( .AN(n404), .B(n626), .Y(n311) );
  NAND2BXL U739 ( .AN(n396), .B(n627), .Y(n342) );
  OA21X4 U740 ( .A0(n332), .A1(n626), .B0(n622), .Y(n334) );
  AND3X4 U741 ( .A(n623), .B(n380), .C(n381), .Y(n378) );
  INVX1 U742 ( .A(N107), .Y(n690) );
  NAND3XL U743 ( .A(n379), .B(n777), .C(n780), .Y(n340) );
  NOR2XL U744 ( .A(n379), .B(n778), .Y(n326) );
  NAND3XL U745 ( .A(n379), .B(n380), .C(n621), .Y(n312) );
  INVX1 U746 ( .A(n472), .Y(n770) );
  INVX4 U747 ( .A(N197), .Y(n749) );
  AOI2BB2XL U748 ( .B0(n625), .B1(N197), .A0N(n808), .A1N(n327), .Y(n325) );
  INVX6 U749 ( .A(N196), .Y(n750) );
  AOI2BB2XL U750 ( .B0(n362), .B1(n363), .A0N(n620), .A1N(n362), .Y(n299) );
  NAND2XL U751 ( .A(N472), .B(n624), .Y(n260) );
  INVX3 U752 ( .A(n628), .Y(n740) );
  CLKINVX1 U753 ( .A(\perm[7][1] ), .Y(n800) );
  OAI21X2 U754 ( .A0(n305), .A1(n273), .B0(state[1]), .Y(n304) );
  NOR4X2 U755 ( .A(n306), .B(n307), .C(n308), .D(n309), .Y(n305) );
  BUFX20 U756 ( .A(\perm[4][2] ), .Y(n632) );
  NOR2XL U757 ( .A(\perm[3][1] ), .B(n799), .Y(n459) );
  NOR2XL U758 ( .A(\perm[5][1] ), .B(n802), .Y(n439) );
  OAI22X2 U759 ( .A0(n687), .A1(n690), .B0(N107), .B1(n686), .Y(N195) );
  AOI2BB2XL U760 ( .B0(n336), .B1(exchange_num[0]), .A0N(n337), .A1N(n749), 
        .Y(n360) );
  INVX8 U761 ( .A(\perm[1][2] ), .Y(n798) );
  AOI2BB2XL U762 ( .B0(n352), .B1(\perm[6][0] ), .A0N(n353), .A1N(n389), .Y(
        n388) );
  AOI2BB2XL U763 ( .B0(n336), .B1(n555), .A0N(n337), .A1N(n750), .Y(n399) );
  AOI2BB2XL U764 ( .B0(n763), .B1(\perm[0][0] ), .A0N(n763), .A1N(n749), .Y(
        n280) );
  INVX1 U765 ( .A(n292), .Y(n742) );
  INVX1 U766 ( .A(n283), .Y(n744) );
  CLKINVX4 U767 ( .A(n708), .Y(n724) );
  NAND3XL U768 ( .A(n570), .B(n811), .C(n624), .Y(n259) );
  INVX1 U769 ( .A(n267), .Y(n729) );
  INVX1 U770 ( .A(n263), .Y(n733) );
  INVX1 U771 ( .A(n268), .Y(n728) );
  INVX1 U772 ( .A(n266), .Y(n730) );
  INVX1 U773 ( .A(n271), .Y(n725) );
  INVX1 U774 ( .A(n270), .Y(n726) );
  INVX1 U775 ( .A(n269), .Y(n727) );
  INVX1 U776 ( .A(n265), .Y(n731) );
  INVX1 U777 ( .A(n264), .Y(n732) );
  INVXL U778 ( .A(\perm[0][1] ), .Y(n788) );
  NOR2BXL U779 ( .AN(N385), .B(MinCost[0]), .Y(n691) );
  NAND2XL U780 ( .A(\perm[0][0] ), .B(n808), .Y(n468) );
  INVX1 U781 ( .A(\perm[1][0] ), .Y(n808) );
  INVX1 U782 ( .A(\perm[1][1] ), .Y(n789) );
  AOI211XL U783 ( .A0(\perm[2][1] ), .A1(n789), .B0(n808), .C0(\perm[2][0] ), 
        .Y(n486) );
  NOR2XL U784 ( .A(\perm[2][1] ), .B(n789), .Y(n487) );
  AOI211XL U785 ( .A0(\perm[3][1] ), .A1(n799), .B0(n803), .C0(\perm[3][0] ), 
        .Y(n458) );
  AOI211XL U786 ( .A0(\perm[4][1] ), .A1(n801), .B0(n806), .C0(\perm[4][0] ), 
        .Y(n443) );
  INVX1 U787 ( .A(\perm[4][0] ), .Y(n804) );
  AOI211XL U788 ( .A0(\perm[5][1] ), .A1(n802), .B0(n804), .C0(\perm[5][0] ), 
        .Y(n438) );
  AOI211XL U789 ( .A0(n635), .A1(n783), .B0(n805), .C0(\perm[6][0] ), .Y(n501)
         );
  INVX1 U790 ( .A(\perm[5][0] ), .Y(n805) );
  NOR4XL U791 ( .A(n274), .B(n810), .C(n745), .D(W[2]), .Y(n614) );
  AO21XL U792 ( .A0(W[2]), .A1(n302), .B0(n614), .Y(n552) );
  INVX1 U793 ( .A(\perm[7][0] ), .Y(n807) );
  INVX3 U794 ( .A(n338), .Y(n763) );
  NAND2X1 U795 ( .A(n397), .B(n571), .Y(n404) );
  NOR2X2 U796 ( .A(n689), .B(n688), .Y(n684) );
  NOR2X1 U797 ( .A(n382), .B(n756), .Y(n391) );
  AND2X2 U798 ( .A(n378), .B(n775), .Y(n320) );
  NAND3BX1 U799 ( .AN(n407), .B(n776), .C(n327), .Y(n323) );
  CLKINVX1 U800 ( .A(n327), .Y(n778) );
  CLKINVX1 U801 ( .A(n315), .Y(n764) );
  NAND2X2 U802 ( .A(n775), .B(n780), .Y(n337) );
  CLKINVX1 U803 ( .A(n625), .Y(n776) );
  XNOR2X1 U804 ( .A(n408), .B(n409), .Y(n383) );
  NOR2X2 U805 ( .A(n689), .B(N105), .Y(n685) );
  CLKINVX1 U806 ( .A(n499), .Y(n773) );
  CLKINVX1 U807 ( .A(n447), .Y(n767) );
  INVX3 U808 ( .A(n556), .Y(n735) );
  INVX3 U809 ( .A(n380), .Y(n780) );
  CLKBUFX3 U810 ( .A(n318), .Y(n623) );
  NAND2X1 U811 ( .A(n775), .B(n621), .Y(n318) );
  CLKBUFX3 U812 ( .A(n350), .Y(n622) );
  NAND2X1 U813 ( .A(n621), .B(n780), .Y(n350) );
  INVX3 U814 ( .A(n275), .Y(n737) );
  CLKINVX1 U815 ( .A(n621), .Y(n777) );
  CLKBUFX3 U816 ( .A(n340), .Y(n627) );
  CLKBUFX3 U817 ( .A(n326), .Y(n625) );
  CLKBUFX3 U818 ( .A(n312), .Y(n626) );
  OAI22XL U819 ( .A0(n792), .A1(n623), .B0(n794), .B1(n627), .Y(n339) );
  OAI21XL U820 ( .A0(n621), .A1(n797), .B0(n794), .Y(n346) );
  OAI21X2 U821 ( .A0(n475), .A1(n476), .B0(n782), .Y(n474) );
  CLKINVX1 U822 ( .A(n477), .Y(n782) );
  NOR2X1 U823 ( .A(n736), .B(N472), .Y(n257) );
  CLKINVX1 U824 ( .A(n634), .Y(n792) );
  CLKINVX1 U825 ( .A(n421), .Y(n760) );
  OAI21X2 U826 ( .A0(n775), .A1(n410), .B0(n408), .Y(n392) );
  OAI221XL U827 ( .A0(n794), .A1(n323), .B0(n620), .B1(n324), .C0(n405), .Y(
        n281) );
  OAI211X1 U828 ( .A0(n634), .A1(n797), .B0(n496), .C0(n436), .Y(n492) );
  OAI22XL U829 ( .A0(n631), .A1(n792), .B0(n501), .B1(n502), .Y(n496) );
  NOR2X1 U830 ( .A(n635), .B(n783), .Y(n502) );
  OAI221XL U831 ( .A0(n751), .A1(n739), .B0(n797), .B1(n740), .C0(n738), .Y(
        n546) );
  OAI221X1 U832 ( .A0(n807), .A1(n323), .B0(n324), .B1(n765), .C0(n325), .Y(
        n284) );
  OAI22XL U833 ( .A0(n802), .A1(n740), .B0(n746), .B1(n739), .Y(n544) );
  OAI2BB2XL U834 ( .B0(n804), .B1(n740), .A0N(n290), .A1N(n624), .Y(n545) );
  OAI22XL U835 ( .A0(n740), .A1(n788), .B0(n279), .B1(n739), .Y(n535) );
  OAI2BB2XL U836 ( .B0(n789), .B1(n740), .A0N(n282), .A1N(n624), .Y(n538) );
  OAI22XL U837 ( .A0(n803), .A1(n740), .B0(n748), .B1(n739), .Y(n540) );
  CLKBUFX3 U838 ( .A(n262), .Y(n630) );
  OR4X1 U839 ( .A(n364), .B(n365), .C(n633), .D(n634), .Y(n363) );
  OAI22XL U840 ( .A0(n796), .A1(n623), .B0(n797), .B1(n627), .Y(n365) );
  OAI222XL U841 ( .A0(n787), .A1(n776), .B0(n791), .B1(n626), .C0(n798), .C1(
        n763), .Y(n364) );
  OA21XL U842 ( .A0(n762), .A1(n362), .B0(n366), .Y(n301) );
  OAI31XL U843 ( .A0(n367), .A1(n368), .A2(n369), .B0(n362), .Y(n366) );
  OAI22XL U844 ( .A0(n781), .A1(n337), .B0(n800), .B1(n622), .Y(n368) );
  OAI22XL U845 ( .A0(n802), .A1(n623), .B0(n783), .B1(n627), .Y(n369) );
  OA21XL U846 ( .A0(n765), .A1(n362), .B0(n370), .Y(n300) );
  OAI31XL U847 ( .A0(n371), .A1(n372), .A2(n373), .B0(n362), .Y(n370) );
  OAI22XL U848 ( .A0(n608), .A1(n337), .B0(n807), .B1(n622), .Y(n372) );
  OAI22XL U849 ( .A0(n804), .A1(n623), .B0(n805), .B1(n627), .Y(n373) );
  OAI2BB2XL U850 ( .B0(n608), .B1(n740), .A0N(n298), .A1N(n624), .Y(n548) );
  OAI221XL U851 ( .A0(n301), .A1(n739), .B0(n800), .B1(n740), .C0(n738), .Y(
        n551) );
  OAI221XL U852 ( .A0(n300), .A1(n739), .B0(n807), .B1(n740), .C0(n738), .Y(
        n550) );
  OAI221XL U853 ( .A0(n299), .A1(n739), .B0(n794), .B1(n740), .C0(n738), .Y(
        n549) );
  NAND2X1 U854 ( .A(n738), .B(n274), .Y(n275) );
  CLKINVX1 U855 ( .A(exchange_num[0]), .Y(n765) );
  CLKBUFX3 U856 ( .A(n272), .Y(n629) );
  NOR2BX1 U857 ( .AN(n273), .B(n274), .Y(n272) );
  AND2X2 U858 ( .A(n468), .B(n788), .Y(n467) );
  NOR2X1 U859 ( .A(n794), .B(n634), .Y(n428) );
  OAI222XL U860 ( .A0(n799), .A1(n776), .B0(n801), .B1(n626), .C0(n789), .C1(
        n763), .Y(n367) );
  OAI222XL U861 ( .A0(n803), .A1(n776), .B0(n806), .B1(n626), .C0(n763), .C1(
        n808), .Y(n371) );
  OAI22XL U862 ( .A0(n777), .A1(n800), .B0(n621), .B1(n783), .Y(n322) );
  OAI22XL U863 ( .A0(n777), .A1(n807), .B0(n621), .B1(n805), .Y(n330) );
  AOI32X1 U864 ( .A0(n795), .A1(n802), .A2(\perm[5][1] ), .B0(n631), .B1(n796), 
        .Y(n510) );
  INVX4 U865 ( .A(n509), .Y(n795) );
  INVX3 U866 ( .A(n431), .Y(n766) );
  AOI21X1 U867 ( .A0(n809), .A1(n304), .B0(RST), .Y(N344) );
  OAI211X1 U868 ( .A0(n635), .A1(n800), .B0(\perm[6][0] ), .C0(n429), .Y(n424)
         );
  NOR3X1 U869 ( .A(n428), .B(\perm[7][0] ), .C(n759), .Y(n429) );
  AOI221XL U870 ( .A0(n625), .A1(\perm[3][1] ), .B0(n338), .B1(\perm[2][1] ), 
        .C0(n358), .Y(n357) );
  OAI222XL U871 ( .A0(n783), .A1(n623), .B0(n800), .B1(n337), .C0(n802), .C1(
        n626), .Y(n358) );
  INVXL U872 ( .A(MatchCount[2]), .Y(n813) );
  INVXL U873 ( .A(MatchCount[1]), .Y(n812) );
  INVX12 U874 ( .A(n617), .Y(J[1]) );
  CLKINVX1 U875 ( .A(n661), .Y(n618) );
  NOR2X1 U876 ( .A(\perm[1][1] ), .B(n799), .Y(n484) );
  AOI221XL U877 ( .A0(n625), .A1(\perm[3][2] ), .B0(n338), .B1(\perm[2][2] ), 
        .C0(n355), .Y(n354) );
  OAI222XL U878 ( .A0(n797), .A1(n623), .B0(n794), .B1(n337), .C0(n796), .C1(
        n626), .Y(n355) );
  CLKINVX1 U879 ( .A(n331), .Y(n751) );
  OAI221X1 U880 ( .A0(n332), .A1(n333), .B0(n334), .B1(n797), .C0(n335), .Y(
        n331) );
  AOI221XL U881 ( .A0(n625), .A1(n632), .B0(n338), .B1(\perm[3][2] ), .C0(n339), .Y(n333) );
  INVX12 U882 ( .A(n615), .Y(J[2]) );
  OA22XL U883 ( .A0(n669), .A1(n670), .B0(N104), .B1(n668), .Y(n615) );
  OAI22XL U884 ( .A0(\perm[1][2] ), .A1(n787), .B0(n486), .B1(n487), .Y(n485)
         );
  AOI32X1 U885 ( .A0(n771), .A1(n762), .A2(\perm[1][1] ), .B0(\perm[1][2] ), 
        .B1(n620), .Y(n491) );
  AOI32X1 U886 ( .A0(n793), .A1(n783), .A2(n635), .B0(n634), .B1(n797), .Y(
        n518) );
  OAI2BB2XL U887 ( .B0(MatchCount[1]), .B1(n251), .A0N(n557), .A1N(
        MatchCount[1]), .Y(n521) );
  AOI221XL U888 ( .A0(n625), .A1(\perm[4][1] ), .B0(n338), .B1(\perm[3][1] ), 
        .C0(n400), .Y(n398) );
  OAI22XL U889 ( .A0(n781), .A1(n623), .B0(n800), .B1(n627), .Y(n400) );
  AOI2BB2X1 U890 ( .B0(n763), .B1(\perm[0][1] ), .A0N(n763), .A1N(n750), .Y(
        n279) );
  NAND4BX1 U891 ( .AN(n511), .B(\perm[3][0] ), .C(n512), .D(n803), .Y(n479) );
  NAND2X1 U892 ( .A(\perm[2][1] ), .B(n801), .Y(n512) );
  OAI221X1 U893 ( .A0(n765), .A1(n342), .B0(n749), .B1(n627), .C0(n393), .Y(
        n290) );
  AOI222XL U894 ( .A0(n320), .A1(n634), .B0(n321), .B1(n346), .C0(\perm[3][2] ), .C1(n780), .Y(n377) );
  OAI22XL U895 ( .A0(\perm[3][2] ), .A1(n796), .B0(n443), .B1(n444), .Y(n441)
         );
  NOR2X1 U896 ( .A(\perm[4][1] ), .B(n801), .Y(n444) );
  OAI21XL U897 ( .A0(\perm[3][1] ), .A1(n619), .B0(\perm[3][0] ), .Y(n454) );
  OAI21XL U898 ( .A0(\perm[3][2] ), .A1(n787), .B0(n457), .Y(n452) );
  OAI22XL U899 ( .A0(\perm[2][2] ), .A1(n791), .B0(n458), .B1(n459), .Y(n457)
         );
  NOR2X1 U900 ( .A(n774), .B(\perm[2][2] ), .Y(n472) );
  OAI21XL U901 ( .A0(\perm[2][1] ), .A1(n762), .B0(\perm[2][0] ), .Y(n471) );
  AOI32X1 U902 ( .A0(n769), .A1(n762), .A2(\perm[0][1] ), .B0(\perm[0][2] ), 
        .B1(n620), .Y(n465) );
  CLKINVX1 U903 ( .A(n464), .Y(n769) );
  NOR2X1 U904 ( .A(n774), .B(\perm[0][2] ), .Y(n464) );
  OAI21XL U905 ( .A0(\perm[0][2] ), .A1(n798), .B0(n466), .Y(n461) );
  OAI31XL U906 ( .A0(n463), .A1(exchange_num[0]), .A2(n464), .B0(n465), .Y(
        n462) );
  OAI22XL U907 ( .A0(\perm[1][1] ), .A1(n467), .B0(n788), .B1(n468), .Y(n466)
         );
  CLKINVX1 U908 ( .A(n286), .Y(n743) );
  AOI221XL U909 ( .A0(n287), .A1(n624), .B0(\perm[2][1] ), .B1(n628), .C0(RST), 
        .Y(n286) );
  OAI31XL U910 ( .A0(n498), .A1(exchange_num[0]), .A2(n499), .B0(n500), .Y(
        n497) );
  OAI21XL U911 ( .A0(\perm[5][1] ), .A1(n762), .B0(\perm[5][0] ), .Y(n498) );
  AOI32X1 U912 ( .A0(n773), .A1(n762), .A2(\perm[5][1] ), .B0(n631), .B1(n620), 
        .Y(n500) );
  AOI221XL U913 ( .A0(n625), .A1(\perm[4][0] ), .B0(n338), .B1(\perm[3][0] ), 
        .C0(n361), .Y(n359) );
  OAI22XL U914 ( .A0(n608), .A1(n623), .B0(n807), .B1(n627), .Y(n361) );
  AO22X1 U915 ( .A0(\perm[1][0] ), .A1(n612), .B0(\perm[0][0] ), .B1(n569), 
        .Y(n673) );
  CLKINVX1 U916 ( .A(n294), .Y(n741) );
  OAI31XL U917 ( .A0(n446), .A1(exchange_num[0]), .A2(n447), .B0(n448), .Y(
        n445) );
  OAI21XL U918 ( .A0(\perm[4][1] ), .A1(n762), .B0(\perm[4][0] ), .Y(n446) );
  AOI32X1 U919 ( .A0(n767), .A1(n762), .A2(\perm[4][1] ), .B0(n632), .B1(n620), 
        .Y(n448) );
  OAI21XL U920 ( .A0(n631), .A1(n796), .B0(n437), .Y(n435) );
  OAI22XL U921 ( .A0(n632), .A1(n797), .B0(n438), .B1(n439), .Y(n437) );
  AOI221XL U922 ( .A0(n625), .A1(\perm[3][0] ), .B0(n338), .B1(\perm[2][0] ), 
        .C0(n390), .Y(n389) );
  OAI222XL U923 ( .A0(n805), .A1(n623), .B0(n807), .B1(n337), .C0(n804), .C1(
        n626), .Y(n390) );
  OAI21XL U924 ( .A0(n635), .A1(n762), .B0(\perm[6][0] ), .Y(n493) );
  AOI32X1 U925 ( .A0(n772), .A1(n762), .A2(n635), .B0(n634), .B1(n620), .Y(
        n495) );
  CLKINVX1 U926 ( .A(n494), .Y(n772) );
  OA21XL U927 ( .A0(N483), .A1(n739), .B0(n740), .Y(n258) );
  AOI221XL U928 ( .A0(MinCost[4]), .A1(n630), .B0(N434), .B1(n735), .C0(RST), 
        .Y(n267) );
  AOI221XL U929 ( .A0(MinCost[3]), .A1(n630), .B0(N433), .B1(n735), .C0(RST), 
        .Y(n268) );
  AOI221XL U930 ( .A0(MinCost[1]), .A1(n630), .B0(N431), .B1(n735), .C0(RST), 
        .Y(n270) );
  AOI221XL U931 ( .A0(MinCost[5]), .A1(n630), .B0(N435), .B1(n735), .C0(RST), 
        .Y(n266) );
  AOI221XL U932 ( .A0(MinCost[0]), .A1(n630), .B0(N430), .B1(n735), .C0(RST), 
        .Y(n271) );
  AOI221XL U933 ( .A0(n825), .A1(n630), .B0(N432), .B1(n735), .C0(RST), .Y(
        n269) );
  AOI221XL U934 ( .A0(n821), .A1(n630), .B0(N436), .B1(n735), .C0(RST), .Y(
        n265) );
  AOI221XL U935 ( .A0(n284), .A1(n624), .B0(n628), .B1(\perm[1][0] ), .C0(RST), 
        .Y(n283) );
  OAI21XL U936 ( .A0(\perm[0][1] ), .A1(n762), .B0(\perm[0][0] ), .Y(n463) );
  OAI2BB2XL U937 ( .B0(n280), .B1(n739), .A0N(n628), .A1N(\perm[0][0] ), .Y(
        n536) );
  CLKINVX1 U938 ( .A(state[0]), .Y(n809) );
  AO22X1 U939 ( .A0(cost_temp[9]), .A1(n737), .B0(N394), .B1(n629), .Y(n523)
         );
  AO22X1 U940 ( .A0(cost_temp[8]), .A1(n737), .B0(N393), .B1(n629), .Y(n524)
         );
  AO22X1 U941 ( .A0(cost_temp[7]), .A1(n737), .B0(n565), .B1(n629), .Y(n525)
         );
  AO22X1 U942 ( .A0(cost_temp[6]), .A1(n737), .B0(N391), .B1(n629), .Y(n526)
         );
  NOR2XL U943 ( .A(n273), .B(RST), .Y(n256) );
  CLKBUFX3 U944 ( .A(n278), .Y(n628) );
  NOR2X1 U945 ( .A(RST), .B(n624), .Y(n278) );
  AO22X1 U946 ( .A0(cost_temp[5]), .A1(n737), .B0(N390), .B1(n629), .Y(n527)
         );
  AO22X1 U947 ( .A0(cost_temp[4]), .A1(n737), .B0(N389), .B1(n629), .Y(n528)
         );
  AO22X1 U948 ( .A0(cost_temp[3]), .A1(n737), .B0(N388), .B1(n629), .Y(n529)
         );
  AO22X1 U949 ( .A0(cost_temp[0]), .A1(n737), .B0(N385), .B1(n629), .Y(n532)
         );
  AO22X1 U950 ( .A0(cost_temp[2]), .A1(n737), .B0(N387), .B1(n629), .Y(n530)
         );
  AO22X1 U951 ( .A0(cost_temp[1]), .A1(n737), .B0(N386), .B1(n629), .Y(n531)
         );
  OAI2BB2XL U952 ( .B0(state[0]), .B1(n414), .A0N(n738), .A1N(Valid), .Y(N343)
         );
  OA21XL U953 ( .A0(RST), .A1(state[1]), .B0(n739), .Y(n414) );
  OAI22XL U954 ( .A0(n745), .A1(n275), .B0(W[0]), .B1(n274), .Y(n553) );
  NOR2X2 U955 ( .A(n810), .B(N102), .Y(n667) );
  INVXL U956 ( .A(N102), .Y(n671) );
  OA21XL U957 ( .A0(W[0]), .A1(n274), .B0(n275), .Y(n276) );
  OAI32XL U958 ( .A0(n274), .A1(W[1]), .A2(n745), .B0(n276), .B1(n810), .Y(
        n533) );
  OAI21XL U959 ( .A0(W[1]), .A1(n274), .B0(n276), .Y(n302) );
  NAND3XL U960 ( .A(N103), .B(N102), .C(N104), .Y(n273) );
  NOR2X2 U961 ( .A(n810), .B(n671), .Y(n666) );
  NAND3BX4 U962 ( .AN(N472), .B(n708), .C(n707), .Y(n711) );
  OAI22X4 U963 ( .A0(N394), .A1(n718), .B0(n724), .B1(n706), .Y(N472) );
  AO22X1 U964 ( .A0(\perm[5][1] ), .A1(n574), .B0(\perm[4][1] ), .B1(n572), 
        .Y(n640) );
  AO22X1 U965 ( .A0(\perm[5][0] ), .A1(n664), .B0(\perm[4][0] ), .B1(n663), 
        .Y(n654) );
  AOI221XL U966 ( .A0(\perm[6][0] ), .A1(n667), .B0(\perm[7][0] ), .B1(n666), 
        .C0(n654), .Y(n657) );
  AO22X1 U967 ( .A0(\perm[1][0] ), .A1(n664), .B0(\perm[0][0] ), .B1(n663), 
        .Y(n655) );
  AOI221XL U968 ( .A0(\perm[2][0] ), .A1(n667), .B0(\perm[3][0] ), .B1(n666), 
        .C0(n655), .Y(n656) );
  AO22X1 U969 ( .A0(\perm[5][1] ), .A1(n664), .B0(\perm[4][1] ), .B1(n663), 
        .Y(n658) );
  AO22X1 U970 ( .A0(\perm[1][1] ), .A1(n664), .B0(\perm[0][1] ), .B1(n663), 
        .Y(n659) );
  AOI221XL U971 ( .A0(\perm[2][1] ), .A1(n667), .B0(\perm[3][1] ), .B1(n666), 
        .C0(n659), .Y(n660) );
  AO22X1 U972 ( .A0(n631), .A1(n664), .B0(n632), .B1(n663), .Y(n662) );
  AOI221XL U973 ( .A0(n634), .A1(n667), .B0(n633), .B1(n666), .C0(n662), .Y(
        n669) );
  AO22X1 U974 ( .A0(\perm[1][2] ), .A1(n664), .B0(\perm[0][2] ), .B1(n663), 
        .Y(n665) );
  AOI221XL U975 ( .A0(\perm[2][2] ), .A1(n667), .B0(\perm[3][2] ), .B1(n666), 
        .C0(n665), .Y(n668) );
  AO22X1 U976 ( .A0(\perm[5][0] ), .A1(n612), .B0(\perm[4][0] ), .B1(n569), 
        .Y(n672) );
  AO22X1 U977 ( .A0(\perm[5][1] ), .A1(n612), .B0(\perm[4][1] ), .B1(n569), 
        .Y(n676) );
  AO22X1 U978 ( .A0(\perm[1][1] ), .A1(n612), .B0(\perm[0][1] ), .B1(n569), 
        .Y(n677) );
  AO22X1 U979 ( .A0(n631), .A1(n612), .B0(n632), .B1(n569), .Y(n680) );
  AOI221XL U980 ( .A0(\perm[2][2] ), .A1(n685), .B0(\perm[3][2] ), .B1(n684), 
        .C0(n683), .Y(n686) );
  OAI22XL U981 ( .A0(N386), .A1(n691), .B0(n691), .B1(n713), .Y(n693) );
  NAND3X1 U982 ( .A(n693), .B(n705), .C(n692), .Y(n712) );
  OAI221XL U983 ( .A0(N387), .A1(n714), .B0(N388), .B1(n715), .C0(n697), .Y(
        n698) );
endmodule

