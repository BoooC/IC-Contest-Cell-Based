/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : U-2022.12
// Date      : Sun Jan 26 14:43:24 2025
/////////////////////////////////////////////////////////////


module SET ( clk, rst, en, central, radius, mode, busy, valid, candidate );
  input [23:0] central;
  input [11:0] radius;
  input [1:0] mode;
  output [7:0] candidate;
  input clk, rst, en;
  output busy, valid;
  wire   n664, n665, next_state_1_, N77, N78, N79, N80, N81, N82,
         det_inside_B_d_y_3_, det_inside_B_d_x_3_, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n185, n186, n187, n189, DP_OP_68J1_124_2494_n79,
         DP_OP_68J1_124_2494_n78, DP_OP_68J1_124_2494_n72, intadd_0_A_0_,
         intadd_0_B_3_, intadd_0_B_2_, intadd_0_B_1_, intadd_0_B_0_,
         intadd_0_CI, intadd_0_SUM_3_, intadd_0_SUM_2_, intadd_0_SUM_1_,
         intadd_0_SUM_0_, intadd_0_n4, intadd_0_n3, intadd_0_n2, intadd_0_n1,
         DP_OP_69J1_125_2494_n150, DP_OP_69J1_125_2494_n146,
         DP_OP_69J1_125_2494_n145, DP_OP_69J1_125_2494_n144,
         DP_OP_69J1_125_2494_n142, DP_OP_69J1_125_2494_n141,
         DP_OP_69J1_125_2494_n139, DP_OP_69J1_125_2494_n138,
         DP_OP_69J1_125_2494_n136, DP_OP_69J1_125_2494_n134,
         DP_OP_69J1_125_2494_n125, DP_OP_69J1_125_2494_n123,
         DP_OP_69J1_125_2494_n106, DP_OP_69J1_125_2494_n105,
         DP_OP_69J1_125_2494_n104, DP_OP_69J1_125_2494_n98,
         DP_OP_69J1_125_2494_n97, DP_OP_69J1_125_2494_n96,
         DP_OP_69J1_125_2494_n95, DP_OP_69J1_125_2494_n94,
         DP_OP_69J1_125_2494_n93, DP_OP_69J1_125_2494_n92,
         DP_OP_69J1_125_2494_n91, DP_OP_69J1_125_2494_n89,
         DP_OP_69J1_125_2494_n88, DP_OP_69J1_125_2494_n87,
         DP_OP_69J1_125_2494_n86, DP_OP_69J1_125_2494_n85,
         DP_OP_69J1_125_2494_n84, DP_OP_69J1_125_2494_n82,
         DP_OP_69J1_125_2494_n81, DP_OP_69J1_125_2494_n80,
         DP_OP_69J1_125_2494_n79, DP_OP_69J1_125_2494_n78,
         DP_OP_69J1_125_2494_n77, DP_OP_69J1_125_2494_n76,
         DP_OP_69J1_125_2494_n75, DP_OP_69J1_125_2494_n74,
         DP_OP_69J1_125_2494_n73, DP_OP_69J1_125_2494_n72,
         DP_OP_69J1_125_2494_n71, DP_OP_70J1_126_2494_n105,
         DP_OP_70J1_126_2494_n104, DP_OP_70J1_126_2494_n102,
         DP_OP_70J1_126_2494_n89, DP_OP_70J1_126_2494_n88,
         DP_OP_70J1_126_2494_n86, DP_OP_70J1_126_2494_n82,
         DP_OP_70J1_126_2494_n79, DP_OP_70J1_126_2494_n78,
         DP_OP_70J1_126_2494_n77, DP_OP_70J1_126_2494_n75,
         DP_OP_70J1_126_2494_n72, DP_OP_70J1_126_2494_n71,
         DP_OP_70J1_126_2494_n70, n190, n196, n198, n200, n202, n204, n206,
         n208, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593,
         n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663;
  wire   [3:0] A_X;
  wire   [3:0] A_Y;
  wire   [3:0] B_X;
  wire   [3:0] B_Y;
  wire   [3:0] C_X;
  wire   [3:0] C_Y;
  wire   [3:0] A_R;
  wire   [3:0] B_R;
  wire   [3:0] C_R;
  wire   [3:0] count_x;
  wire   [3:0] count_y;
  wire   [1:0] state;
  wire   [1:0] mode_reg;
  wire   [5:0] in_count;
  wire   [3:1] det_inside_C_d_y;
  wire   [3:1] det_inside_C_d_x;

  DFFQX1 mode_reg_reg_1_ ( .D(n172), .CK(clk), .Q(mode_reg[1]) );
  DFFQX1 mode_reg_reg_0_ ( .D(n171), .CK(clk), .Q(mode_reg[0]) );
  DFFQX2 central_reg_reg_23_ ( .D(n170), .CK(clk), .Q(A_X[3]) );
  DFFQX2 central_reg_reg_22_ ( .D(n169), .CK(clk), .Q(A_X[2]) );
  DFFQX2 central_reg_reg_19_ ( .D(n166), .CK(clk), .Q(A_Y[3]) );
  DFFQX2 central_reg_reg_18_ ( .D(n165), .CK(clk), .Q(A_Y[2]) );
  DFFQX2 central_reg_reg_15_ ( .D(n162), .CK(clk), .Q(B_X[3]) );
  DFFQX2 central_reg_reg_14_ ( .D(n161), .CK(clk), .Q(B_X[2]) );
  DFFQX4 central_reg_reg_13_ ( .D(n160), .CK(clk), .Q(B_X[1]) );
  DFFQX2 central_reg_reg_12_ ( .D(n159), .CK(clk), .Q(B_X[0]) );
  DFFQX2 central_reg_reg_11_ ( .D(n158), .CK(clk), .Q(B_Y[3]) );
  DFFQX2 central_reg_reg_10_ ( .D(n157), .CK(clk), .Q(B_Y[2]) );
  DFFQX4 central_reg_reg_9_ ( .D(n156), .CK(clk), .Q(B_Y[1]) );
  DFFQX1 central_reg_reg_7_ ( .D(n154), .CK(clk), .Q(C_X[3]) );
  DFFQX1 central_reg_reg_6_ ( .D(n153), .CK(clk), .Q(C_X[2]) );
  DFFQX1 central_reg_reg_3_ ( .D(n150), .CK(clk), .Q(C_Y[3]) );
  DFFQX1 central_reg_reg_2_ ( .D(n149), .CK(clk), .Q(C_Y[2]) );
  DFFQX1 central_reg_reg_0_ ( .D(n147), .CK(clk), .Q(C_Y[0]) );
  DFFQX1 radius_reg_reg_11_ ( .D(n146), .CK(clk), .Q(A_R[3]) );
  DFFQX1 radius_reg_reg_10_ ( .D(n145), .CK(clk), .Q(A_R[2]) );
  DFFQX1 radius_reg_reg_9_ ( .D(n144), .CK(clk), .Q(A_R[1]) );
  DFFQX1 radius_reg_reg_8_ ( .D(n143), .CK(clk), .Q(A_R[0]) );
  DFFQX1 radius_reg_reg_7_ ( .D(n142), .CK(clk), .Q(B_R[3]) );
  DFFQX1 radius_reg_reg_6_ ( .D(n141), .CK(clk), .Q(B_R[2]) );
  DFFQX1 radius_reg_reg_5_ ( .D(n140), .CK(clk), .Q(B_R[1]) );
  DFFQX1 radius_reg_reg_4_ ( .D(n139), .CK(clk), .Q(B_R[0]) );
  DFFQX1 radius_reg_reg_3_ ( .D(n138), .CK(clk), .Q(C_R[3]) );
  DFFQX1 radius_reg_reg_2_ ( .D(n137), .CK(clk), .Q(C_R[2]) );
  DFFQX1 radius_reg_reg_1_ ( .D(n136), .CK(clk), .Q(C_R[1]) );
  DFFQX1 radius_reg_reg_0_ ( .D(n135), .CK(clk), .Q(C_R[0]) );
  DFFRX4 count_y_reg_3_ ( .D(n186), .CK(clk), .RN(n505), .Q(count_y[3]), .QN(
        n646) );
  DFFRX1 state_reg_0_ ( .D(n189), .CK(clk), .RN(n505), .Q(state[0]), .QN(n653)
         );
  DFFRX1 state_reg_1_ ( .D(next_state_1_), .CK(clk), .RN(n505), .Q(state[1])
         );
  DFFRX4 count_y_reg_1_ ( .D(n180), .CK(clk), .RN(n505), .Q(n211), .QN(n647)
         );
  CMPR42X1 DP_OP_69J1_125_2494_U89 ( .A(DP_OP_69J1_125_2494_n105), .B(
        DP_OP_69J1_125_2494_n125), .C(det_inside_C_d_x[1]), .D(
        det_inside_C_d_y[1]), .ICI(DP_OP_69J1_125_2494_n150), .S(
        DP_OP_69J1_125_2494_n97), .ICO(DP_OP_69J1_125_2494_n95), .CO(
        DP_OP_69J1_125_2494_n96) );
  CMPR42X1 DP_OP_69J1_125_2494_U88 ( .A(DP_OP_69J1_125_2494_n123), .B(
        DP_OP_69J1_125_2494_n106), .C(DP_OP_69J1_125_2494_n145), .D(
        DP_OP_69J1_125_2494_n146), .ICI(DP_OP_69J1_125_2494_n95), .S(
        DP_OP_69J1_125_2494_n94), .ICO(DP_OP_69J1_125_2494_n92), .CO(
        DP_OP_69J1_125_2494_n93) );
  CMPR42X1 DP_OP_69J1_125_2494_U86 ( .A(DP_OP_69J1_125_2494_n104), .B(
        DP_OP_69J1_125_2494_n91), .C(det_inside_C_d_y[2]), .D(
        det_inside_C_d_x[2]), .ICI(DP_OP_69J1_125_2494_n144), .S(
        DP_OP_69J1_125_2494_n89), .ICO(DP_OP_69J1_125_2494_n87), .CO(
        DP_OP_69J1_125_2494_n88) );
  CMPR42X1 DP_OP_69J1_125_2494_U85 ( .A(DP_OP_69J1_125_2494_n141), .B(
        DP_OP_69J1_125_2494_n139), .C(DP_OP_69J1_125_2494_n142), .D(
        DP_OP_69J1_125_2494_n92), .ICI(DP_OP_69J1_125_2494_n93), .S(
        DP_OP_69J1_125_2494_n86), .ICO(DP_OP_69J1_125_2494_n84), .CO(
        DP_OP_69J1_125_2494_n85) );
  CMPR42X1 DP_OP_69J1_125_2494_U82 ( .A(DP_OP_69J1_125_2494_n138), .B(
        DP_OP_69J1_125_2494_n87), .C(DP_OP_69J1_125_2494_n81), .D(
        DP_OP_69J1_125_2494_n84), .ICI(DP_OP_69J1_125_2494_n88), .S(
        DP_OP_69J1_125_2494_n79), .ICO(DP_OP_69J1_125_2494_n77), .CO(
        DP_OP_69J1_125_2494_n78) );
  CMPR42X1 DP_OP_69J1_125_2494_U81 ( .A(DP_OP_69J1_125_2494_n98), .B(n652), 
        .C(DP_OP_69J1_125_2494_n82), .D(det_inside_C_d_y[3]), .ICI(
        det_inside_C_d_x[3]), .S(DP_OP_69J1_125_2494_n76), .ICO(
        DP_OP_69J1_125_2494_n74), .CO(DP_OP_69J1_125_2494_n75) );
  DFFSX4 count_y_reg_0_ ( .D(n187), .CK(clk), .SN(n505), .Q(count_y[0]), .QN(
        n655) );
  DFFRX2 in_count_reg_5_ ( .D(n174), .CK(clk), .RN(n505), .Q(in_count[5]), 
        .QN(n660) );
  DFFRX1 in_count_reg_3_ ( .D(n176), .CK(clk), .RN(n505), .Q(in_count[3]), 
        .QN(n658) );
  DFFRX2 in_count_reg_0_ ( .D(n179), .CK(clk), .RN(n505), .Q(in_count[0]), 
        .QN(n656) );
  DFFQX1 central_reg_reg_1_ ( .D(n148), .CK(clk), .Q(C_Y[1]) );
  DFFQX2 central_reg_reg_5_ ( .D(n152), .CK(clk), .Q(C_X[1]) );
  DFFQX2 central_reg_reg_17_ ( .D(n164), .CK(clk), .Q(A_Y[1]) );
  DFFQX2 central_reg_reg_16_ ( .D(n163), .CK(clk), .Q(A_Y[0]) );
  CMPR42X1 DP_OP_70J1_126_2494_U62 ( .A(DP_OP_70J1_126_2494_n89), .B(
        DP_OP_70J1_126_2494_n88), .C(DP_OP_70J1_126_2494_n104), .D(
        DP_OP_70J1_126_2494_n105), .ICI(DP_OP_70J1_126_2494_n82), .S(
        DP_OP_70J1_126_2494_n79), .ICO(DP_OP_70J1_126_2494_n77), .CO(
        DP_OP_70J1_126_2494_n78) );
  CMPR42X1 DP_OP_70J1_126_2494_U59 ( .A(det_inside_B_d_y_3_), .B(
        det_inside_B_d_x_3_), .C(DP_OP_70J1_126_2494_n102), .D(
        DP_OP_70J1_126_2494_n86), .ICI(DP_OP_70J1_126_2494_n75), .S(
        DP_OP_70J1_126_2494_n72), .ICO(DP_OP_70J1_126_2494_n70), .CO(
        DP_OP_70J1_126_2494_n71) );
  DFFRX2 in_count_reg_2_ ( .D(n177), .CK(clk), .RN(n505), .Q(in_count[2]), 
        .QN(n659) );
  DFFRX2 in_count_reg_4_ ( .D(n175), .CK(clk), .RN(n505), .Q(in_count[4]), 
        .QN(n213) );
  DFFRX1 count_x_reg_0_ ( .D(n210), .CK(clk), .RN(n505), .Q(n657), .QN(
        count_x[0]) );
  DFFRX4 count_x_reg_1_ ( .D(n185), .CK(clk), .RN(n505), .Q(n661), .QN(n190)
         );
  EDFFXL central_reg_reg_21_ ( .D(central[21]), .E(en), .CK(clk), .Q(A_X[1]), 
        .QN(n662) );
  DFFRX2 count_x_reg_2_ ( .D(n183), .CK(clk), .RN(n505), .Q(count_x[2]), .QN(
        n648) );
  DFFQX1 central_reg_reg_8_ ( .D(n155), .CK(clk), .Q(B_Y[0]) );
  DFFQX1 central_reg_reg_4_ ( .D(n151), .CK(clk), .Q(C_X[0]) );
  DFFRX1 busy_reg ( .D(n173), .CK(clk), .RN(n505), .Q(n664), .QN(n208) );
  DFFRX1 valid_reg ( .D(n663), .CK(clk), .RN(n505), .QN(n206) );
  DFFRX1 candidate_reg_1_ ( .D(N78), .CK(clk), .RN(n505), .QN(n204) );
  DFFRX1 candidate_reg_2_ ( .D(N79), .CK(clk), .RN(n505), .QN(n202) );
  DFFRX1 candidate_reg_3_ ( .D(N80), .CK(clk), .RN(n505), .QN(n200) );
  DFFRX1 candidate_reg_4_ ( .D(N81), .CK(clk), .RN(n505), .QN(n198) );
  DFFRX1 candidate_reg_5_ ( .D(N82), .CK(clk), .RN(n505), .QN(n196) );
  DFFRHQX1 candidate_reg_0_ ( .D(N77), .CK(clk), .RN(n505), .Q(n665) );
  ADDFX1 intadd_0_U5 ( .A(intadd_0_A_0_), .B(intadd_0_B_0_), .CI(intadd_0_CI), 
        .CO(intadd_0_n4), .S(intadd_0_SUM_0_) );
  ADDFX2 intadd_0_U4 ( .A(DP_OP_68J1_124_2494_n79), .B(intadd_0_B_1_), .CI(
        intadd_0_n4), .CO(intadd_0_n3), .S(intadd_0_SUM_1_) );
  DFFRX2 count_y_reg_2_ ( .D(n181), .CK(clk), .RN(n505), .Q(n650), .QN(n651)
         );
  DFFRX2 in_count_reg_1_ ( .D(n178), .CK(clk), .RN(n505), .Q(in_count[1]), 
        .QN(n654) );
  ADDFX2 intadd_0_U3 ( .A(DP_OP_68J1_124_2494_n78), .B(intadd_0_B_2_), .CI(
        intadd_0_n3), .CO(intadd_0_n2), .S(intadd_0_SUM_2_) );
  DFFQX2 central_reg_reg_20_ ( .D(n167), .CK(clk), .Q(A_X[0]) );
  DFFRX2 count_x_reg_3_ ( .D(n182), .CK(clk), .RN(n505), .Q(count_x[3]), .QN(
        n649) );
  AO21X1 U206 ( .A0(n636), .A1(in_count[0]), .B0(n635), .Y(n179) );
  INVX8 U207 ( .A(n645), .Y(n634) );
  INVX1 U208 ( .A(n621), .Y(n514) );
  OAI21XL U209 ( .A0(n580), .A1(n579), .B0(n578), .Y(intadd_0_B_3_) );
  OAI21XL U210 ( .A0(n503), .A1(n600), .B0(n502), .Y(DP_OP_68J1_124_2494_n78)
         );
  CLKINVX1 U211 ( .A(n356), .Y(n407) );
  OAI21XL U212 ( .A0(n605), .A1(n604), .B0(n603), .Y(n578) );
  ADDFXL U213 ( .A(n397), .B(B_R[3]), .CI(n396), .CO(n356), .S(n398) );
  OAI21XL U214 ( .A0(n571), .A1(n570), .B0(n569), .Y(n573) );
  ADDFXL U215 ( .A(DP_OP_70J1_126_2494_n77), .B(n353), .CI(n352), .CO(n395), 
        .S(n389) );
  ADDHXL U216 ( .A(n351), .B(n350), .CO(DP_OP_70J1_126_2494_n75), .S(n352) );
  INVX1 U217 ( .A(det_inside_C_d_x[3]), .Y(n593) );
  CLKINVX1 U218 ( .A(det_inside_C_d_x[1]), .Y(n592) );
  NOR2X2 U219 ( .A(n235), .B(n234), .Y(n598) );
  NAND2X1 U220 ( .A(n314), .B(n474), .Y(n316) );
  NAND2X1 U221 ( .A(n286), .B(n312), .Y(n346) );
  OAI22X2 U222 ( .A0(n302), .A1(n301), .B0(B_Y[3]), .B1(n646), .Y(n314) );
  CLKINVX1 U223 ( .A(C_X[0]), .Y(n557) );
  NAND2X1 U224 ( .A(count_y[0]), .B(n529), .Y(n310) );
  OAI21X2 U225 ( .A0(count_y[0]), .A1(n563), .B0(n297), .Y(n474) );
  NOR2XL U226 ( .A(n651), .B(B_Y[2]), .Y(n299) );
  NAND2X1 U227 ( .A(n661), .B(n561), .Y(n282) );
  NAND2X2 U228 ( .A(n510), .B(n551), .Y(n285) );
  NAND2XL U229 ( .A(n661), .B(n541), .Y(n214) );
  NOR2XL U230 ( .A(n648), .B(C_X[2]), .Y(n218) );
  NAND2XL U231 ( .A(n583), .B(n582), .Y(n585) );
  INVXL U232 ( .A(n257), .Y(n258) );
  NOR2XL U233 ( .A(n593), .B(n591), .Y(DP_OP_69J1_125_2494_n142) );
  XOR2X1 U234 ( .A(n297), .B(n296), .Y(n315) );
  NAND2XL U235 ( .A(n262), .B(n598), .Y(n274) );
  OAI21XL U236 ( .A0(n268), .A1(n267), .B0(n266), .Y(n270) );
  AOI21XL U237 ( .A0(n596), .A1(n597), .B0(n594), .Y(intadd_0_CI) );
  NOR2XL U238 ( .A(n593), .B(n590), .Y(DP_OP_69J1_125_2494_n136) );
  AND2X1 U239 ( .A(n475), .B(det_inside_B_d_y_3_), .Y(n350) );
  AND2X1 U240 ( .A(DP_OP_69J1_125_2494_n72), .B(n336), .Y(n338) );
  INVXL U241 ( .A(n398), .Y(n402) );
  NOR2XL U242 ( .A(n575), .B(n602), .Y(n416) );
  NOR2XL U243 ( .A(n338), .B(n337), .Y(n339) );
  AOI21XL U244 ( .A0(n335), .A1(n334), .B0(n333), .Y(n341) );
  INVXL U245 ( .A(mode_reg[0]), .Y(n342) );
  NAND2X2 U246 ( .A(n653), .B(state[1]), .Y(n581) );
  INVXL U247 ( .A(C_Y[1]), .Y(n533) );
  CLKINVX2 U248 ( .A(en), .Y(n645) );
  INVXL U249 ( .A(C_X[2]), .Y(n523) );
  NAND2XL U250 ( .A(n634), .B(central[15]), .Y(n536) );
  OAI31XL U251 ( .A0(in_count[3]), .A1(n644), .A2(n643), .B0(n642), .Y(n176)
         );
  INVX3 U252 ( .A(det_inside_C_d_y[1]), .Y(n586) );
  XOR2X1 U253 ( .A(n288), .B(n283), .Y(n348) );
  CLKXOR2X2 U254 ( .A(n285), .B(n284), .Y(n312) );
  CLKINVX1 U255 ( .A(n467), .Y(n643) );
  NAND2X2 U256 ( .A(count_y[0]), .B(n563), .Y(n297) );
  BUFX4 U257 ( .A(count_x[0]), .Y(n510) );
  AND2X1 U258 ( .A(B_R[2]), .B(B_R[3]), .Y(n397) );
  INVX1 U259 ( .A(n446), .Y(n451) );
  INVX1 U260 ( .A(n605), .Y(n580) );
  NAND2XL U261 ( .A(DP_OP_69J1_125_2494_n97), .B(n321), .Y(n322) );
  NAND2XL U262 ( .A(n629), .B(n650), .Y(n630) );
  XOR2X1 U263 ( .A(n291), .B(n290), .Y(n293) );
  OAI21X1 U264 ( .A0(n348), .A1(n346), .B0(n347), .Y(n291) );
  INVX1 U265 ( .A(n252), .Y(n254) );
  OAI22X2 U266 ( .A0(n300), .A1(n299), .B0(n650), .B1(n547), .Y(n302) );
  INVXL U267 ( .A(n509), .Y(n513) );
  XOR2X1 U268 ( .A(n300), .B(n295), .Y(n344) );
  AOI22X1 U269 ( .A0(n310), .A1(n306), .B0(C_Y[1]), .B1(n647), .Y(n480) );
  NAND2X1 U270 ( .A(n211), .B(n565), .Y(n294) );
  MX2X1 U271 ( .A(mode_reg[1]), .B(mode[1]), .S0(n634), .Y(n172) );
  MX2X1 U272 ( .A(mode_reg[0]), .B(mode[0]), .S0(n634), .Y(n171) );
  MX2X1 U273 ( .A(B_R[1]), .B(radius[5]), .S0(n634), .Y(n140) );
  MX2X1 U274 ( .A(B_R[0]), .B(radius[4]), .S0(n634), .Y(n139) );
  MX2X1 U275 ( .A(C_R[0]), .B(radius[0]), .S0(n634), .Y(n135) );
  INVX1 U276 ( .A(A_X[3]), .Y(n549) );
  INVX1 U277 ( .A(C_Y[2]), .Y(n527) );
  OA21X4 U278 ( .A0(n341), .A1(n340), .B0(n339), .Y(n457) );
  ADDFX2 U279 ( .A(n389), .B(DP_OP_70J1_126_2494_n78), .CI(n388), .CO(n394), 
        .S(n390) );
  NAND2X2 U280 ( .A(n417), .B(n412), .Y(n608) );
  AND2X2 U281 ( .A(det_inside_B_d_x_3_), .B(n472), .Y(DP_OP_70J1_126_2494_n104) );
  AND2X2 U282 ( .A(n477), .B(det_inside_B_d_y_3_), .Y(DP_OP_70J1_126_2494_n86)
         );
  XOR2X1 U283 ( .A(n585), .B(n584), .Y(det_inside_C_d_x[1]) );
  XNOR2X2 U284 ( .A(n349), .B(n348), .Y(n476) );
  XOR2X1 U285 ( .A(n303), .B(n302), .Y(n305) );
  NAND2X1 U286 ( .A(n314), .B(n343), .Y(n345) );
  OAI21X1 U287 ( .A0(n344), .A1(n343), .B0(n314), .Y(n303) );
  NAND2XL U288 ( .A(n511), .B(n661), .Y(n512) );
  INVX1 U289 ( .A(n472), .Y(n286) );
  INVX1 U290 ( .A(n436), .Y(n422) );
  CLKINVX1 U291 ( .A(n233), .Y(n234) );
  AOI22X2 U292 ( .A0(n297), .A1(n294), .B0(B_Y[1]), .B1(n647), .Y(n300) );
  XOR2X1 U293 ( .A(n661), .B(B_X[1]), .Y(n284) );
  INVX3 U294 ( .A(B_Y[0]), .Y(n563) );
  INVX1 U295 ( .A(n615), .Y(n617) );
  NAND2X4 U296 ( .A(n644), .B(n581), .Y(n504) );
  INVX1 U297 ( .A(n644), .Y(n466) );
  AOI211X2 U298 ( .A0(n408), .A1(n407), .B0(n406), .C0(n405), .Y(n459) );
  OAI21X1 U299 ( .A0(n457), .A1(n342), .B0(mode_reg[1]), .Y(n409) );
  ADDFX2 U300 ( .A(n395), .B(DP_OP_70J1_126_2494_n72), .CI(n394), .CO(n357), 
        .S(n401) );
  ADDFX2 U301 ( .A(DP_OP_69J1_125_2494_n74), .B(DP_OP_69J1_125_2494_n71), .CI(
        DP_OP_69J1_125_2494_n75), .CO(n337), .S(n336) );
  AND2X2 U302 ( .A(det_inside_B_d_x_3_), .B(n473), .Y(n351) );
  AND2X2 U303 ( .A(n474), .B(det_inside_B_d_y_3_), .Y(DP_OP_70J1_126_2494_n88)
         );
  NOR2X4 U304 ( .A(n305), .B(n304), .Y(det_inside_B_d_y_3_) );
  AND2X2 U305 ( .A(n475), .B(n477), .Y(DP_OP_70J1_126_2494_n89) );
  INVX1 U306 ( .A(n275), .Y(n239) );
  INVX1 U307 ( .A(n262), .Y(n263) );
  OAI2BB1X1 U308 ( .A0N(n581), .A1N(n664), .B0(n645), .Y(n173) );
  XOR2X1 U309 ( .A(n211), .B(B_Y[1]), .Y(n296) );
  AND2X1 U310 ( .A(B_R[3]), .B(B_R[1]), .Y(n359) );
  CLKINVX6 U311 ( .A(rst), .Y(n505) );
  OAI2BB1X2 U312 ( .A0N(n213), .A1N(n466), .B0(n616), .Y(n469) );
  AOI2BB1X2 U313 ( .A0N(in_count[3]), .A1N(n644), .B0(n641), .Y(n616) );
  NOR2X4 U314 ( .A(n636), .B(n635), .Y(n640) );
  INVX3 U315 ( .A(n460), .Y(n456) );
  NAND3BX2 U316 ( .AN(n459), .B(mode_reg[0]), .C(n458), .Y(n461) );
  NAND2BX2 U317 ( .AN(n409), .B(n459), .Y(n460) );
  OAI211X1 U318 ( .A0(n408), .A1(n407), .B0(n400), .C0(n399), .Y(n404) );
  XOR2X1 U319 ( .A(n281), .B(n499), .Y(DP_OP_68J1_124_2494_n79) );
  NOR2X1 U320 ( .A(n379), .B(n378), .Y(n380) );
  INVX1 U321 ( .A(n500), .Y(n503) );
  INVX1 U322 ( .A(n576), .Y(n414) );
  NOR2X2 U323 ( .A(n575), .B(n597), .Y(n569) );
  NOR2X4 U324 ( .A(n601), .B(n602), .Y(n603) );
  XOR2X2 U325 ( .A(n240), .B(n239), .Y(n413) );
  NOR2X2 U326 ( .A(n491), .B(n490), .Y(det_inside_C_d_y[3]) );
  XNOR2X2 U327 ( .A(n345), .B(n344), .Y(n477) );
  XOR2X1 U328 ( .A(n311), .B(n478), .Y(det_inside_C_d_y[1]) );
  INVX1 U329 ( .A(n425), .Y(n595) );
  OAI21X1 U330 ( .A0(n483), .A1(n482), .B0(n583), .Y(n222) );
  INVX1 U331 ( .A(n631), .Y(n627) );
  NAND3XL U332 ( .A(n622), .B(n621), .C(n620), .Y(n623) );
  INVX1 U333 ( .A(n236), .Y(n238) );
  MX2X1 U334 ( .A(n657), .B(n509), .S0(n624), .Y(n210) );
  AND2X1 U335 ( .A(n582), .B(n568), .Y(n318) );
  INVX1 U336 ( .A(n493), .Y(n498) );
  INVX1 U337 ( .A(DP_OP_69J1_125_2494_n125), .Y(DP_OP_69J1_125_2494_n106) );
  INVX1 U338 ( .A(DP_OP_69J1_125_2494_n123), .Y(DP_OP_69J1_125_2494_n104) );
  NAND2X1 U339 ( .A(n233), .B(n225), .Y(n227) );
  NAND2X2 U340 ( .A(n249), .B(n241), .Y(n243) );
  INVX1 U341 ( .A(n249), .Y(n250) );
  NAND3XL U342 ( .A(n611), .B(n621), .C(count_x[3]), .Y(n507) );
  AND2X1 U343 ( .A(A_R[0]), .B(n423), .Y(n424) );
  NAND2XL U344 ( .A(A_R[1]), .B(n439), .Y(n431) );
  MX2X1 U345 ( .A(B_R[3]), .B(radius[7]), .S0(n634), .Y(n142) );
  MX2X1 U346 ( .A(C_R[2]), .B(radius[2]), .S0(n634), .Y(n137) );
  MX2X1 U347 ( .A(B_R[2]), .B(radius[6]), .S0(n634), .Y(n141) );
  INVX1 U348 ( .A(A_R[1]), .Y(n440) );
  NAND2XL U349 ( .A(A_R[1]), .B(A_R[2]), .Y(n423) );
  NAND2XL U350 ( .A(A_R[3]), .B(A_R[0]), .Y(n420) );
  INVX1 U351 ( .A(A_R[2]), .Y(n619) );
  NOR2X1 U352 ( .A(n648), .B(B_X[2]), .Y(n287) );
  NAND2XL U353 ( .A(in_count[0]), .B(in_count[2]), .Y(n465) );
  AND2X1 U354 ( .A(B_R[2]), .B(B_R[1]), .Y(n355) );
  NAND2XL U355 ( .A(en), .B(central[4]), .Y(n556) );
  NAND2XL U356 ( .A(en), .B(central[22]), .Y(n538) );
  NAND2XL U357 ( .A(en), .B(central[19]), .Y(n554) );
  NAND2XL U358 ( .A(en), .B(central[14]), .Y(n534) );
  NAND2XL U359 ( .A(en), .B(central[13]), .Y(n560) );
  NAND2XL U360 ( .A(en), .B(central[18]), .Y(n558) );
  NAND2XL U361 ( .A(en), .B(central[23]), .Y(n548) );
  NAND2XL U362 ( .A(en), .B(central[11]), .Y(n552) );
  NAND2XL U363 ( .A(en), .B(central[6]), .Y(n522) );
  NAND2XL U364 ( .A(en), .B(radius[11]), .Y(n530) );
  NAND2XL U365 ( .A(en), .B(central[9]), .Y(n564) );
  NAND2XL U366 ( .A(en), .B(central[17]), .Y(n542) );
  NAND2XL U367 ( .A(en), .B(central[7]), .Y(n632) );
  NAND2XL U368 ( .A(en), .B(central[2]), .Y(n526) );
  NAND2XL U369 ( .A(en), .B(central[16]), .Y(n544) );
  NAND2XL U370 ( .A(en), .B(radius[10]), .Y(n618) );
  NAND2XL U371 ( .A(en), .B(central[1]), .Y(n532) );
  NAND2XL U372 ( .A(en), .B(central[5]), .Y(n540) );
  INVX12 U373 ( .A(1'b1), .Y(candidate[7]) );
  INVX12 U374 ( .A(1'b1), .Y(candidate[6]) );
  BUFX12 U377 ( .A(n665), .Y(candidate[0]) );
  NOR2X2 U378 ( .A(n653), .B(state[1]), .Y(n621) );
  INVX12 U379 ( .A(n196), .Y(candidate[5]) );
  INVX12 U380 ( .A(n198), .Y(candidate[4]) );
  INVX12 U381 ( .A(n200), .Y(candidate[3]) );
  INVX12 U382 ( .A(n202), .Y(candidate[2]) );
  INVX12 U383 ( .A(n204), .Y(candidate[1]) );
  INVX12 U384 ( .A(n206), .Y(valid) );
  INVX12 U385 ( .A(n208), .Y(busy) );
  OAI22X2 U386 ( .A0(n288), .A1(n287), .B0(count_x[2]), .B1(n535), .Y(n290) );
  OAI2BB2X1 U387 ( .B0(n387), .B1(n386), .A0N(n385), .A1N(n384), .Y(n391) );
  AND2X2 U388 ( .A(DP_OP_69J1_125_2494_n94), .B(DP_OP_69J1_125_2494_n96), .Y(
        n212) );
  NAND2X1 U389 ( .A(n236), .B(n228), .Y(n230) );
  XOR2X1 U390 ( .A(n489), .B(n488), .Y(n491) );
  NOR2X1 U391 ( .A(n224), .B(n223), .Y(det_inside_C_d_x[3]) );
  ADDFXL U392 ( .A(n614), .B(n493), .CI(n492), .CO(n495), .S(
        DP_OP_69J1_125_2494_n91) );
  CLKINVX1 U393 ( .A(n413), .Y(n601) );
  CMPR42X1 U394 ( .A(DP_OP_69J1_125_2494_n134), .B(DP_OP_69J1_125_2494_n136), 
        .C(DP_OP_69J1_125_2494_n80), .D(DP_OP_69J1_125_2494_n77), .ICI(
        DP_OP_69J1_125_2494_n76), .S(DP_OP_69J1_125_2494_n73), .ICO(
        DP_OP_69J1_125_2494_n71), .CO(DP_OP_69J1_125_2494_n72) );
  CLKINVX1 U395 ( .A(C_Y[0]), .Y(n529) );
  CLKINVX1 U396 ( .A(C_X[3]), .Y(n633) );
  OAI2BB1X2 U397 ( .A0N(in_count[5]), .A1N(n469), .B0(n468), .Y(n174) );
  NOR2X1 U398 ( .A(n657), .B(n514), .Y(n509) );
  NAND2X1 U399 ( .A(n514), .B(n581), .Y(n624) );
  NAND2X2 U400 ( .A(n510), .B(n557), .Y(n217) );
  CLKINVX1 U401 ( .A(C_X[1]), .Y(n541) );
  AOI22X1 U402 ( .A0(n217), .A1(n214), .B0(C_X[1]), .B1(n190), .Y(n219) );
  XOR2X1 U403 ( .A(count_x[2]), .B(C_X[2]), .Y(n215) );
  XOR2X1 U404 ( .A(n219), .B(n215), .Y(n483) );
  OAI21X1 U405 ( .A0(n510), .A1(n557), .B0(n217), .Y(n582) );
  INVX3 U406 ( .A(n582), .Y(n591) );
  XOR2X1 U407 ( .A(n661), .B(C_X[1]), .Y(n216) );
  XOR2X1 U408 ( .A(n217), .B(n216), .Y(n584) );
  NAND2X1 U409 ( .A(n591), .B(n584), .Y(n482) );
  OAI22X1 U410 ( .A0(n219), .A1(n218), .B0(count_x[2]), .B1(n523), .Y(n221) );
  NOR2X1 U411 ( .A(count_x[3]), .B(n633), .Y(n220) );
  OAI22X2 U412 ( .A0(n221), .A1(n220), .B0(C_X[3]), .B1(n649), .Y(n583) );
  XOR2X1 U413 ( .A(n222), .B(n221), .Y(n224) );
  XOR2X1 U414 ( .A(count_x[3]), .B(n633), .Y(n223) );
  CLKINVX1 U415 ( .A(A_Y[0]), .Y(n545) );
  NAND2X2 U416 ( .A(count_y[0]), .B(n545), .Y(n233) );
  CLKINVX1 U417 ( .A(A_Y[1]), .Y(n543) );
  NAND2X1 U418 ( .A(n211), .B(n543), .Y(n225) );
  NAND2X1 U419 ( .A(n647), .B(A_Y[1]), .Y(n226) );
  NAND2X1 U420 ( .A(n227), .B(n226), .Y(n236) );
  CLKINVX1 U421 ( .A(A_Y[2]), .Y(n559) );
  NAND2X1 U422 ( .A(n650), .B(n559), .Y(n228) );
  NAND2X1 U423 ( .A(n651), .B(A_Y[2]), .Y(n229) );
  NAND2X1 U424 ( .A(n230), .B(n229), .Y(n276) );
  CLKINVX1 U425 ( .A(A_Y[3]), .Y(n555) );
  NOR2X1 U426 ( .A(count_y[3]), .B(n555), .Y(n231) );
  OAI22X1 U427 ( .A0(n276), .A1(n231), .B0(A_Y[3]), .B1(n646), .Y(n273) );
  XOR2X1 U428 ( .A(n211), .B(A_Y[1]), .Y(n232) );
  XOR2X1 U429 ( .A(n233), .B(n232), .Y(n262) );
  NOR2BX1 U430 ( .AN(A_Y[0]), .B(count_y[0]), .Y(n235) );
  NAND2X1 U431 ( .A(n273), .B(n274), .Y(n240) );
  XOR2X1 U432 ( .A(n650), .B(A_Y[2]), .Y(n237) );
  XOR2X1 U433 ( .A(n238), .B(n237), .Y(n275) );
  CLKINVX1 U434 ( .A(A_X[0]), .Y(n567) );
  NAND2X2 U435 ( .A(n510), .B(n567), .Y(n249) );
  NAND2X1 U436 ( .A(n661), .B(n662), .Y(n241) );
  NAND2X1 U437 ( .A(n190), .B(A_X[1]), .Y(n242) );
  NAND2X1 U438 ( .A(n243), .B(n242), .Y(n252) );
  CLKINVX1 U439 ( .A(A_X[2]), .Y(n539) );
  NAND2X1 U440 ( .A(count_x[2]), .B(n539), .Y(n244) );
  NAND2X2 U441 ( .A(n252), .B(n244), .Y(n246) );
  NAND2X1 U442 ( .A(n648), .B(A_X[2]), .Y(n245) );
  NAND2X1 U443 ( .A(n246), .B(n245), .Y(n269) );
  NOR2X1 U444 ( .A(count_x[3]), .B(n549), .Y(n247) );
  OAI22X1 U445 ( .A0(n269), .A1(n247), .B0(A_X[3]), .B1(n649), .Y(n266) );
  XOR2X1 U446 ( .A(n661), .B(A_X[1]), .Y(n248) );
  XOR2X1 U447 ( .A(n249), .B(n248), .Y(n257) );
  NOR2BX1 U448 ( .AN(A_X[0]), .B(n510), .Y(n251) );
  NOR2X2 U449 ( .A(n251), .B(n250), .Y(n597) );
  NAND2X1 U450 ( .A(n257), .B(n597), .Y(n267) );
  NAND2X1 U451 ( .A(n266), .B(n267), .Y(n255) );
  XOR2X1 U452 ( .A(count_x[2]), .B(A_X[2]), .Y(n253) );
  XOR2X1 U453 ( .A(n254), .B(n253), .Y(n268) );
  CLKXOR2X2 U454 ( .A(n255), .B(n268), .Y(n602) );
  CLKINVX1 U455 ( .A(n597), .Y(n427) );
  CLKINVX1 U456 ( .A(n598), .Y(n429) );
  NAND3X1 U457 ( .A(n603), .B(n427), .C(n429), .Y(n600) );
  CLKINVX1 U458 ( .A(n266), .Y(n256) );
  NAND2X1 U459 ( .A(n256), .B(n258), .Y(n260) );
  NAND3X1 U460 ( .A(n266), .B(n257), .C(n427), .Y(n259) );
  NAND2X1 U461 ( .A(n258), .B(n597), .Y(n425) );
  NAND3X1 U462 ( .A(n260), .B(n259), .C(n425), .Y(n411) );
  CLKINVX1 U463 ( .A(n411), .Y(n594) );
  NOR2X1 U464 ( .A(n602), .B(n594), .Y(n500) );
  XNOR2X1 U465 ( .A(n600), .B(n500), .Y(n281) );
  CLKINVX1 U466 ( .A(n273), .Y(n261) );
  NAND2X1 U467 ( .A(n261), .B(n263), .Y(n265) );
  NAND3X1 U468 ( .A(n273), .B(n262), .C(n429), .Y(n264) );
  NAND2X1 U469 ( .A(n263), .B(n598), .Y(n426) );
  NAND3X1 U470 ( .A(n265), .B(n264), .C(n426), .Y(n574) );
  AND2X2 U471 ( .A(n413), .B(n574), .Y(n570) );
  XNOR2X1 U472 ( .A(n270), .B(n269), .Y(n272) );
  XOR2X1 U473 ( .A(count_x[3]), .B(A_X[3]), .Y(n271) );
  NAND2X2 U474 ( .A(n272), .B(n271), .Y(n575) );
  XOR2X1 U475 ( .A(n570), .B(n569), .Y(n280) );
  OAI21X1 U476 ( .A0(n275), .A1(n274), .B0(n273), .Y(n277) );
  XNOR2X1 U477 ( .A(n277), .B(n276), .Y(n279) );
  XOR2X1 U478 ( .A(count_y[3]), .B(A_Y[3]), .Y(n278) );
  NAND2X2 U479 ( .A(n279), .B(n278), .Y(n576) );
  NOR2X1 U480 ( .A(n576), .B(n598), .Y(n571) );
  XOR2X1 U481 ( .A(n280), .B(n571), .Y(n499) );
  INVX3 U482 ( .A(B_X[0]), .Y(n551) );
  INVX1 U483 ( .A(B_X[1]), .Y(n561) );
  AOI22X4 U484 ( .A0(n285), .A1(n282), .B0(B_X[1]), .B1(n190), .Y(n288) );
  XOR2X1 U485 ( .A(count_x[2]), .B(B_X[2]), .Y(n283) );
  OAI21X4 U486 ( .A0(n510), .A1(n551), .B0(n285), .Y(n472) );
  INVX1 U487 ( .A(B_X[2]), .Y(n535) );
  INVX1 U488 ( .A(B_X[3]), .Y(n537) );
  NOR2X1 U489 ( .A(count_x[3]), .B(n537), .Y(n289) );
  OAI22X4 U490 ( .A0(n290), .A1(n289), .B0(B_X[3]), .B1(n649), .Y(n347) );
  XOR2X1 U491 ( .A(count_x[3]), .B(n537), .Y(n292) );
  NOR2X4 U492 ( .A(n293), .B(n292), .Y(det_inside_B_d_x_3_) );
  INVX1 U493 ( .A(B_Y[1]), .Y(n565) );
  XOR2X1 U494 ( .A(n650), .B(B_Y[2]), .Y(n295) );
  INVX1 U495 ( .A(n474), .Y(n298) );
  NAND2X2 U496 ( .A(n298), .B(n315), .Y(n343) );
  INVX1 U497 ( .A(B_Y[2]), .Y(n547) );
  INVX1 U498 ( .A(B_Y[3]), .Y(n553) );
  NOR2X1 U499 ( .A(count_y[3]), .B(n553), .Y(n301) );
  XOR2X1 U500 ( .A(count_y[3]), .B(n553), .Y(n304) );
  NAND2X1 U501 ( .A(n211), .B(n533), .Y(n306) );
  NOR2X1 U502 ( .A(n651), .B(C_Y[2]), .Y(n307) );
  OAI22X2 U503 ( .A0(n480), .A1(n307), .B0(n650), .B1(n527), .Y(n488) );
  CLKINVX1 U504 ( .A(C_Y[3]), .Y(n525) );
  NOR2X1 U505 ( .A(count_y[3]), .B(n525), .Y(n308) );
  OAI22X2 U506 ( .A0(n488), .A1(n308), .B0(C_Y[3]), .B1(n646), .Y(n485) );
  OAI21X1 U507 ( .A0(count_y[0]), .A1(n529), .B0(n310), .Y(n319) );
  NAND2X1 U508 ( .A(n485), .B(n319), .Y(n311) );
  XOR2X1 U509 ( .A(n211), .B(C_Y[1]), .Y(n309) );
  XOR2X1 U510 ( .A(n310), .B(n309), .Y(n478) );
  NAND2X2 U511 ( .A(n347), .B(n472), .Y(n313) );
  XOR2X4 U512 ( .A(n313), .B(n312), .Y(n473) );
  XOR2X4 U513 ( .A(n316), .B(n315), .Y(n475) );
  NOR2X1 U514 ( .A(DP_OP_69J1_125_2494_n73), .B(DP_OP_69J1_125_2494_n78), .Y(
        n332) );
  NOR2X1 U515 ( .A(DP_OP_69J1_125_2494_n79), .B(DP_OP_69J1_125_2494_n85), .Y(
        n317) );
  NOR2X1 U516 ( .A(n332), .B(n317), .Y(n335) );
  INVX3 U517 ( .A(n319), .Y(n588) );
  NOR2X1 U518 ( .A(n586), .B(n588), .Y(n321) );
  NOR2X1 U519 ( .A(DP_OP_69J1_125_2494_n97), .B(n321), .Y(n324) );
  CLKINVX1 U520 ( .A(C_R[0]), .Y(n568) );
  OR2X1 U521 ( .A(n582), .B(n568), .Y(n320) );
  AOI21XL U522 ( .A0(n320), .A1(n319), .B0(n318), .Y(n323) );
  OAI21XL U523 ( .A0(n324), .A1(n323), .B0(n322), .Y(n326) );
  OR2X1 U524 ( .A(DP_OP_69J1_125_2494_n94), .B(DP_OP_69J1_125_2494_n96), .Y(
        n325) );
  AOI21X1 U525 ( .A0(n326), .A1(n325), .B0(n212), .Y(n329) );
  NOR2X1 U526 ( .A(DP_OP_69J1_125_2494_n86), .B(DP_OP_69J1_125_2494_n89), .Y(
        n328) );
  NAND2X1 U527 ( .A(DP_OP_69J1_125_2494_n86), .B(DP_OP_69J1_125_2494_n89), .Y(
        n327) );
  OAI21XL U528 ( .A0(n329), .A1(n328), .B0(n327), .Y(n334) );
  NAND2X1 U529 ( .A(DP_OP_69J1_125_2494_n79), .B(DP_OP_69J1_125_2494_n85), .Y(
        n331) );
  NAND2X1 U530 ( .A(DP_OP_69J1_125_2494_n73), .B(DP_OP_69J1_125_2494_n78), .Y(
        n330) );
  OAI21X1 U531 ( .A0(n332), .A1(n331), .B0(n330), .Y(n333) );
  NOR2X1 U532 ( .A(DP_OP_69J1_125_2494_n72), .B(n336), .Y(n340) );
  NAND2X1 U533 ( .A(n347), .B(n346), .Y(n349) );
  ADDHXL U534 ( .A(n477), .B(n476), .CO(n353), .S(n383) );
  AND2X1 U535 ( .A(n473), .B(n472), .Y(n354) );
  AND2X1 U536 ( .A(n476), .B(n472), .Y(n471) );
  AND2X1 U537 ( .A(n474), .B(n477), .Y(n470) );
  ADDFX2 U538 ( .A(n473), .B(n475), .CI(n354), .CO(n377), .S(n370) );
  AND3X1 U539 ( .A(n474), .B(n475), .C(n370), .Y(n375) );
  ADDHXL U540 ( .A(B_R[2]), .B(n355), .CO(n360), .S(n363) );
  CLKINVX1 U541 ( .A(B_R[0]), .Y(n368) );
  NOR2BX1 U542 ( .AN(B_R[3]), .B(n368), .Y(n362) );
  NOR2BX1 U543 ( .AN(B_R[2]), .B(n368), .Y(n365) );
  NOR2BX1 U544 ( .AN(B_R[1]), .B(n368), .Y(n366) );
  ADDFX2 U545 ( .A(DP_OP_70J1_126_2494_n71), .B(DP_OP_70J1_126_2494_n70), .CI(
        n357), .CO(n406), .S(n408) );
  ADDFXL U546 ( .A(n360), .B(n359), .CI(n358), .CO(n396), .S(n393) );
  ADDFXL U547 ( .A(n363), .B(n362), .CI(n361), .CO(n358), .S(n387) );
  ADDHXL U548 ( .A(n365), .B(n364), .CO(n361), .S(n381) );
  ADDHXL U549 ( .A(B_R[1]), .B(n366), .CO(n364), .S(n374) );
  ADDHXL U550 ( .A(n474), .B(n472), .CO(n367), .S(n369) );
  AOI21X1 U551 ( .A0(n369), .A1(n368), .B0(n367), .Y(n373) );
  AOI21X1 U552 ( .A0(n474), .A1(n475), .B0(n370), .Y(n371) );
  OR2X4 U553 ( .A(n371), .B(n375), .Y(n372) );
  AOI222X1 U554 ( .A0(n374), .A1(n373), .B0(n374), .B1(n372), .C0(n373), .C1(
        n372), .Y(n379) );
  ADDFX1 U555 ( .A(n377), .B(n376), .CI(n375), .CO(n382), .S(n378) );
  OAI2BB2X2 U556 ( .B0(n381), .B1(n380), .A0N(n379), .A1N(n378), .Y(n385) );
  ADDFXL U557 ( .A(DP_OP_70J1_126_2494_n79), .B(n383), .CI(n382), .CO(n388), 
        .S(n384) );
  NOR2X1 U558 ( .A(n385), .B(n384), .Y(n386) );
  NOR2X1 U559 ( .A(n391), .B(n390), .Y(n392) );
  OAI2BB2XL U560 ( .B0(n393), .B1(n392), .A0N(n391), .A1N(n390), .Y(n400) );
  OR2X1 U561 ( .A(n401), .B(n402), .Y(n399) );
  OAI211X1 U562 ( .A0(n408), .A1(n407), .B0(n402), .C0(n401), .Y(n403) );
  NAND2X2 U563 ( .A(n404), .B(n403), .Y(n405) );
  XOR2X1 U564 ( .A(n576), .B(n575), .Y(n410) );
  XOR2X1 U565 ( .A(n410), .B(n416), .Y(n609) );
  NOR2X1 U566 ( .A(n575), .B(n576), .Y(n417) );
  AND2X2 U567 ( .A(n411), .B(n574), .Y(n412) );
  NAND2X1 U568 ( .A(n414), .B(n413), .Y(n607) );
  NAND2X1 U569 ( .A(n608), .B(n607), .Y(n415) );
  AOI2BB2X1 U570 ( .B0(n609), .B1(n415), .A0N(n608), .A1N(n607), .Y(n447) );
  NOR2X1 U571 ( .A(n417), .B(n416), .Y(n448) );
  NAND2X1 U572 ( .A(n447), .B(n448), .Y(n446) );
  NAND2X1 U573 ( .A(A_R[2]), .B(A_R[3]), .Y(n449) );
  NOR2X1 U574 ( .A(n446), .B(n449), .Y(n419) );
  CLKINVX1 U575 ( .A(intadd_0_n1), .Y(n418) );
  OAI21XL U576 ( .A0(n619), .A1(A_R[1]), .B0(A_R[3]), .Y(n445) );
  AOI2BB2X2 U577 ( .B0(n419), .B1(n418), .A0N(intadd_0_SUM_3_), .A1N(n445), 
        .Y(n455) );
  OAI21XL U578 ( .A0(A_R[0]), .A1(n440), .B0(A_R[2]), .Y(n421) );
  XNOR2X1 U579 ( .A(n421), .B(n420), .Y(n436) );
  NAND2BX1 U580 ( .AN(intadd_0_SUM_1_), .B(n422), .Y(n438) );
  OAI21XL U581 ( .A0(A_R[1]), .A1(A_R[2]), .B0(n424), .Y(n434) );
  XOR2X1 U582 ( .A(n595), .B(n426), .Y(n432) );
  CLKINVX1 U583 ( .A(A_R[0]), .Y(n439) );
  OAI21XL U584 ( .A0(n429), .A1(n439), .B0(n427), .Y(n428) );
  OAI2BB1X1 U585 ( .A0N(n439), .A1N(n429), .B0(n428), .Y(n430) );
  ACHCINX2 U586 ( .CIN(n432), .A(n431), .B(n430), .CO(n433) );
  ACHCONX2 U587 ( .A(n434), .B(n433), .CI(intadd_0_SUM_0_), .CON(n435) );
  OAI2BB1X1 U588 ( .A0N(n436), .A1N(intadd_0_SUM_1_), .B0(n435), .Y(n437) );
  NAND2X1 U589 ( .A(n438), .B(n437), .Y(n443) );
  XNOR2X1 U590 ( .A(A_R[2]), .B(A_R[3]), .Y(n441) );
  OAI22XL U591 ( .A0(n441), .A1(n440), .B0(n439), .B1(n449), .Y(n442) );
  ACHCINX2 U592 ( .CIN(intadd_0_SUM_2_), .A(n443), .B(n442), .CO(n444) );
  OAI2BB1X1 U593 ( .A0N(n445), .A1N(intadd_0_SUM_3_), .B0(n444), .Y(n454) );
  NOR2X1 U594 ( .A(intadd_0_n1), .B(n449), .Y(n452) );
  AOI2BB2X1 U595 ( .B0(intadd_0_n1), .B1(n449), .A0N(n448), .A1N(n447), .Y(
        n450) );
  OAI21X1 U596 ( .A0(n452), .A1(n451), .B0(n450), .Y(n453) );
  AOI21X4 U597 ( .A0(n455), .A1(n454), .B0(n453), .Y(n462) );
  NAND2X2 U598 ( .A(n456), .B(n462), .Y(n464) );
  NAND2X1 U599 ( .A(n457), .B(mode_reg[1]), .Y(n458) );
  OAI2BB1X4 U600 ( .A0N(n462), .A1N(n461), .B0(n460), .Y(n463) );
  NAND3X8 U601 ( .A(n464), .B(n621), .C(n463), .Y(n644) );
  NOR2X1 U602 ( .A(n654), .B(n465), .Y(n467) );
  OAI21X4 U603 ( .A0(n644), .A1(n467), .B0(n504), .Y(n641) );
  NOR3X2 U604 ( .A(n644), .B(n643), .C(n658), .Y(n615) );
  NAND3X1 U605 ( .A(n615), .B(in_count[4]), .C(n660), .Y(n468) );
  ADDHXL U606 ( .A(n471), .B(n470), .CO(DP_OP_70J1_126_2494_n82), .S(n376) );
  AND2X1 U607 ( .A(n476), .B(n473), .Y(DP_OP_70J1_126_2494_n105) );
  AND2X2 U608 ( .A(n476), .B(det_inside_B_d_x_3_), .Y(DP_OP_70J1_126_2494_n102) );
  NOR2XL U609 ( .A(n581), .B(n654), .Y(N78) );
  NAND2X1 U610 ( .A(n588), .B(n478), .Y(n486) );
  NAND2X1 U611 ( .A(n485), .B(n486), .Y(n481) );
  XOR2X1 U612 ( .A(n650), .B(C_Y[2]), .Y(n479) );
  XOR2X1 U613 ( .A(n480), .B(n479), .Y(n487) );
  XNOR2X1 U614 ( .A(n481), .B(n487), .Y(det_inside_C_d_y[2]) );
  NAND2X1 U615 ( .A(n583), .B(n482), .Y(n484) );
  XNOR2X1 U616 ( .A(n484), .B(n483), .Y(det_inside_C_d_x[2]) );
  OAI21X1 U617 ( .A0(n487), .A1(n486), .B0(n485), .Y(n489) );
  XOR2X1 U618 ( .A(count_y[3]), .B(n525), .Y(n490) );
  CLKINVX1 U619 ( .A(C_R[1]), .Y(DP_OP_69J1_125_2494_n105) );
  CLKINVX1 U620 ( .A(C_R[3]), .Y(DP_OP_69J1_125_2494_n98) );
  CLKINVX1 U621 ( .A(C_R[2]), .Y(n614) );
  NOR2X1 U622 ( .A(DP_OP_69J1_125_2494_n105), .B(n614), .Y(n493) );
  OR2X1 U623 ( .A(DP_OP_69J1_125_2494_n98), .B(n568), .Y(n492) );
  OR2X1 U624 ( .A(DP_OP_69J1_125_2494_n105), .B(DP_OP_69J1_125_2494_n98), .Y(
        n497) );
  INVX3 U625 ( .A(det_inside_C_d_y[3]), .Y(n587) );
  NOR2X1 U626 ( .A(n587), .B(n586), .Y(n494) );
  ADDFX2 U627 ( .A(n496), .B(n495), .CI(n494), .CO(DP_OP_69J1_125_2494_n80), 
        .S(DP_OP_69J1_125_2494_n81) );
  MX2X1 U628 ( .A(C_R[3]), .B(radius[3]), .S0(n634), .Y(n138) );
  ADDHXL U629 ( .A(n498), .B(n497), .CO(DP_OP_69J1_125_2494_n82), .S(n496) );
  CLKINVX1 U630 ( .A(n600), .Y(n501) );
  OAI21XL U631 ( .A0(n501), .A1(n500), .B0(n499), .Y(n502) );
  CLKINVX1 U632 ( .A(n504), .Y(n636) );
  NOR2X2 U633 ( .A(n644), .B(in_count[0]), .Y(n635) );
  MX2X1 U634 ( .A(C_R[1]), .B(radius[1]), .S0(n634), .Y(n136) );
  NAND3X1 U635 ( .A(n509), .B(n661), .C(count_x[2]), .Y(n622) );
  NOR3X1 U636 ( .A(n649), .B(n661), .C(count_x[2]), .Y(n506) );
  NAND2BX1 U637 ( .AN(n510), .B(n506), .Y(n611) );
  XNOR2X1 U638 ( .A(n622), .B(n507), .Y(n508) );
  OAI21XL U639 ( .A0(n649), .A1(n624), .B0(n508), .Y(n182) );
  OAI21XL U640 ( .A0(n510), .A1(n514), .B0(n624), .Y(n511) );
  OAI21XL U641 ( .A0(n513), .A1(n661), .B0(n512), .Y(n185) );
  NOR2X1 U642 ( .A(n611), .B(n514), .Y(n517) );
  NOR2X1 U643 ( .A(n655), .B(n647), .Y(n515) );
  NAND2X1 U644 ( .A(n517), .B(n515), .Y(n631) );
  NOR2X1 U645 ( .A(n631), .B(n651), .Y(n521) );
  NOR3X1 U646 ( .A(n646), .B(n211), .C(n650), .Y(n516) );
  NAND2BX1 U647 ( .AN(count_y[0]), .B(n516), .Y(n612) );
  INVXL U648 ( .A(n612), .Y(n520) );
  NAND2X1 U649 ( .A(n517), .B(count_y[3]), .Y(n519) );
  CLKINVX1 U650 ( .A(n517), .Y(n626) );
  NAND2X1 U651 ( .A(n626), .B(n581), .Y(n625) );
  AOI2BB2X1 U652 ( .B0(n521), .B1(n519), .A0N(n646), .A1N(n625), .Y(n518) );
  OAI31XL U653 ( .A0(n521), .A1(n520), .A2(n519), .B0(n518), .Y(n186) );
  NOR2X1 U654 ( .A(DP_OP_69J1_125_2494_n105), .B(n568), .Y(
        DP_OP_69J1_125_2494_n125) );
  OAI21XL U655 ( .A0(n634), .A1(n523), .B0(n522), .Y(n153) );
  NAND2X1 U656 ( .A(n634), .B(central[3]), .Y(n524) );
  OAI21XL U657 ( .A0(n634), .A1(n525), .B0(n524), .Y(n150) );
  OAI21XL U658 ( .A0(n634), .A1(n527), .B0(n526), .Y(n149) );
  NAND2X1 U659 ( .A(n634), .B(central[0]), .Y(n528) );
  OAI21XL U660 ( .A0(n634), .A1(n529), .B0(n528), .Y(n147) );
  INVXL U661 ( .A(A_R[3]), .Y(n531) );
  OAI21XL U662 ( .A0(n634), .A1(n531), .B0(n530), .Y(n146) );
  OAI21XL U663 ( .A0(n634), .A1(n533), .B0(n532), .Y(n148) );
  OAI21XL U664 ( .A0(n634), .A1(n535), .B0(n534), .Y(n161) );
  OAI21XL U665 ( .A0(n634), .A1(n537), .B0(n536), .Y(n162) );
  OAI21XL U666 ( .A0(n634), .A1(n539), .B0(n538), .Y(n169) );
  OAI21XL U667 ( .A0(n634), .A1(n541), .B0(n540), .Y(n152) );
  OAI21XL U668 ( .A0(n634), .A1(n543), .B0(n542), .Y(n164) );
  OAI21XL U669 ( .A0(n634), .A1(n545), .B0(n544), .Y(n163) );
  NAND2X1 U670 ( .A(n634), .B(central[10]), .Y(n546) );
  OAI21XL U671 ( .A0(n634), .A1(n547), .B0(n546), .Y(n157) );
  OAI21XL U672 ( .A0(n634), .A1(n549), .B0(n548), .Y(n170) );
  NAND2X1 U673 ( .A(n634), .B(central[12]), .Y(n550) );
  OAI21XL U674 ( .A0(n634), .A1(n551), .B0(n550), .Y(n159) );
  OAI21XL U675 ( .A0(n634), .A1(n553), .B0(n552), .Y(n158) );
  OAI21XL U676 ( .A0(n634), .A1(n555), .B0(n554), .Y(n166) );
  OAI21XL U677 ( .A0(n634), .A1(n557), .B0(n556), .Y(n151) );
  OAI21XL U678 ( .A0(n634), .A1(n559), .B0(n558), .Y(n165) );
  OAI21XL U679 ( .A0(n634), .A1(n561), .B0(n560), .Y(n160) );
  NAND2X1 U680 ( .A(n634), .B(central[8]), .Y(n562) );
  OAI21XL U681 ( .A0(n634), .A1(n563), .B0(n562), .Y(n155) );
  OAI21XL U682 ( .A0(n634), .A1(n565), .B0(n564), .Y(n156) );
  NAND2X1 U683 ( .A(n634), .B(central[20]), .Y(n566) );
  OAI21XL U684 ( .A0(n634), .A1(n567), .B0(n566), .Y(n167) );
  NOR2X1 U685 ( .A(n614), .B(n568), .Y(DP_OP_69J1_125_2494_n123) );
  NAND2X1 U686 ( .A(n571), .B(n570), .Y(n572) );
  NAND2X1 U687 ( .A(n573), .B(n572), .Y(n605) );
  CLKINVX1 U688 ( .A(n574), .Y(n596) );
  OAI22XL U689 ( .A0(n596), .A1(n576), .B0(n575), .B1(n594), .Y(n577) );
  AND2X2 U690 ( .A(n608), .B(n577), .Y(n604) );
  CLKINVX1 U691 ( .A(n604), .Y(n579) );
  INVXL U692 ( .A(n581), .Y(n663) );
  NOR2XL U693 ( .A(n581), .B(n656), .Y(N77) );
  NOR2BX1 U694 ( .AN(in_count[4]), .B(n581), .Y(N81) );
  NOR2XL U695 ( .A(n581), .B(n660), .Y(N82) );
  NOR2XL U696 ( .A(n581), .B(n659), .Y(N79) );
  NOR2XL U697 ( .A(n581), .B(n658), .Y(N80) );
  NOR2X1 U698 ( .A(n626), .B(n612), .Y(next_state_1_) );
  NOR2X1 U699 ( .A(n626), .B(n655), .Y(n628) );
  MXI2X1 U700 ( .A(n655), .B(n628), .S0(n625), .Y(n187) );
  CLKINVX1 U701 ( .A(det_inside_C_d_x[2]), .Y(n590) );
  NOR2X1 U702 ( .A(n590), .B(n592), .Y(DP_OP_69J1_125_2494_n144) );
  NOR2X1 U703 ( .A(n592), .B(n591), .Y(DP_OP_69J1_125_2494_n150) );
  NOR2X1 U704 ( .A(n590), .B(n591), .Y(DP_OP_69J1_125_2494_n146) );
  CLKINVX1 U705 ( .A(det_inside_C_d_y[2]), .Y(n589) );
  NOR2X1 U706 ( .A(n587), .B(n589), .Y(DP_OP_69J1_125_2494_n134) );
  NOR2X1 U707 ( .A(n586), .B(n589), .Y(DP_OP_69J1_125_2494_n141) );
  NOR2X1 U708 ( .A(n587), .B(n588), .Y(DP_OP_69J1_125_2494_n139) );
  NOR2X1 U709 ( .A(n589), .B(n588), .Y(DP_OP_69J1_125_2494_n145) );
  NOR2X1 U710 ( .A(n593), .B(n592), .Y(DP_OP_69J1_125_2494_n138) );
  NOR3X1 U711 ( .A(n596), .B(n595), .C(n598), .Y(intadd_0_B_0_) );
  OAI22XL U712 ( .A0(n601), .A1(n598), .B0(n597), .B1(n602), .Y(n599) );
  AND2X2 U713 ( .A(n600), .B(n599), .Y(intadd_0_A_0_) );
  AOI21X1 U714 ( .A0(n602), .A1(n601), .B0(n603), .Y(intadd_0_B_1_) );
  XOR2X1 U715 ( .A(n604), .B(n603), .Y(n606) );
  XOR2X1 U716 ( .A(n606), .B(n605), .Y(intadd_0_B_2_) );
  XOR2X1 U717 ( .A(n608), .B(n607), .Y(n610) );
  XOR2X1 U718 ( .A(n610), .B(n609), .Y(DP_OP_68J1_124_2494_n72) );
  OAI21XL U719 ( .A0(n612), .A1(n611), .B0(n621), .Y(n613) );
  OAI31XL U720 ( .A0(n645), .A1(state[1]), .A2(state[0]), .B0(n613), .Y(n189)
         );
  OR2X1 U721 ( .A(n614), .B(DP_OP_69J1_125_2494_n98), .Y(n652) );
  MXI2X1 U722 ( .A(n617), .B(n616), .S0(in_count[4]), .Y(n175) );
  OAI21XL U723 ( .A0(n634), .A1(n619), .B0(n618), .Y(n145) );
  OAI21XL U724 ( .A0(n657), .A1(n190), .B0(n648), .Y(n620) );
  OAI21XL U725 ( .A0(n624), .A1(n648), .B0(n623), .Y(n183) );
  OAI21XL U726 ( .A0(n627), .A1(n626), .B0(n625), .Y(n629) );
  AO22X1 U727 ( .A0(n629), .A1(n211), .B0(n628), .B1(n631), .Y(n180) );
  OAI21XL U728 ( .A0(n650), .A1(n631), .B0(n630), .Y(n181) );
  OAI21XL U729 ( .A0(n634), .A1(n633), .B0(n632), .Y(n154) );
  NAND2XL U730 ( .A(n654), .B(in_count[0]), .Y(n637) );
  OAI22X1 U731 ( .A0(n640), .A1(n654), .B0(n644), .B1(n637), .Y(n178) );
  OAI21XL U732 ( .A0(n656), .A1(in_count[2]), .B0(in_count[1]), .Y(n638) );
  OAI21XL U733 ( .A0(in_count[1]), .A1(in_count[2]), .B0(n638), .Y(n639) );
  OAI22X1 U734 ( .A0(n640), .A1(n659), .B0(n644), .B1(n639), .Y(n177) );
  NAND2X1 U735 ( .A(n641), .B(in_count[3]), .Y(n642) );
  OA22X1 U736 ( .A0(n634), .A1(A_R[1]), .B0(n645), .B1(radius[9]), .Y(n144) );
  OA22X1 U737 ( .A0(n634), .A1(A_R[0]), .B0(n645), .B1(radius[8]), .Y(n143) );
  ADDFHX2 U738 ( .A(DP_OP_68J1_124_2494_n72), .B(intadd_0_B_3_), .CI(
        intadd_0_n2), .CO(intadd_0_n1), .S(intadd_0_SUM_3_) );
endmodule

