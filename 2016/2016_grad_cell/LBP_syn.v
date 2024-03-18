/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Mon Mar 18 23:39:14 2024
/////////////////////////////////////////////////////////////


module LBP_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  XOR2XL U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  XOR2XL U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_3_DW01_inc_4 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;
  wire   n1;
  wire   [6:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(n1), .CO(carry[6]), .S(SUM[5]) );
  AND2X2 U1 ( .A(A[4]), .B(carry[4]), .Y(n1) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
  XOR2XL U3 ( .A(A[4]), .B(carry[4]), .Y(SUM[4]) );
  XOR2X1 U4 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module LBP_DW01_inc_2_DW01_inc_3 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, \line_buffer[0][7] , \line_buffer[0][6] ,
         \line_buffer[0][5] , \line_buffer[0][4] , \line_buffer[0][3] ,
         \line_buffer[0][2] , \line_buffer[0][1] , \line_buffer[0][0] ,
         \line_buffer[1][7] , \line_buffer[1][6] , \line_buffer[1][5] ,
         \line_buffer[1][4] , \line_buffer[1][3] , \line_buffer[1][2] ,
         \line_buffer[1][1] , \line_buffer[1][0] , \line_buffer[2][7] ,
         \line_buffer[2][6] , \line_buffer[2][5] , \line_buffer[2][4] ,
         \line_buffer[2][3] , \line_buffer[2][2] , \line_buffer[2][1] ,
         \line_buffer[2][0] , N89, N90, N91, N92, N93, N94, N96, N97, N98, N99,
         N100, N101, N109, N110, N111, N112, N113, N114, N115, N144, N145,
         N146, N147, N148, N149, N150, N173, N174, N180, N181, N182, N183,
         N184, N185, N186, N195, N196, N197, N198, N199, N200, N201, N352,
         N387, N396, n48, n49, n50, n55, n56, n57, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n291, n292, n293, n294, n298, n299, n300, n301, n302, n303, N403,
         N402, N401, N400, N399, N398, N397, N394, N393, N392, N391, N390,
         N389, N388, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n352, n353, n354, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n384, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423, n424, n425, n426,
         n427, n428, n429, n430, n431, n432, n433, n434, n435, n436, n437,
         n438, n439, n440, n441, n442, n443, n444, n445, n446, n447, n448,
         n449, n450, n451, n452, n453, n454, n455, n456, n457, n458, n459,
         n460, n461, n462, n463, n464, n465, n466, n467, n468, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491, n492,
         n493, n494, n495, n496, n497, n498, n499, n500, n501, n502, n503,
         n504, n505, n506, n507, n508, n509, n510, n511, n512, n513, n514,
         n515, n516, n517, n518, n519, n520, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n548, n549, n550, n551, n552, n553, n554, n555, n556, n557, n558,
         n559, n560, n561, n562, n563, n564, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n583, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657;
  wire   [1:0] state;
  wire   [3:0] pix_idx;
  assign lbp_valid = N352;

  LBP_DW01_inc_0_DW01_inc_1 r432 ( .A({n669, n670, n671, n672, n673, n674, 
        n384}), .SUM({N150, N149, N148, N147, N146, N145, N144}) );
  LBP_DW01_inc_1_DW01_inc_2 r431 ( .A({n662, n663, n664, n665, n666, n667, 
        n382}), .SUM({N115, N114, N113, N112, N111, N110, N109}) );
  LBP_DW01_inc_3_DW01_inc_4 add_129_aco ( .A({N403, N402, N401, N400, N399, 
        N398, N397}), .SUM({N201, N200, N199, N198, N197, N196, N195}) );
  LBP_DW01_inc_2_DW01_inc_3 add_120_aco ( .A({N394, N393, N392, N391, N390, 
        N389, N388}), .SUM({N186, N185, N184, N183, N182, N181, N180}) );
  DFFX1 \line_buffer_reg[6][7]  ( .D(n285), .CK(clk), .QN(n88) );
  DFFX1 \line_buffer_reg[7][7]  ( .D(n277), .CK(clk), .QN(n96) );
  DFFX1 \line_buffer_reg[8][7]  ( .D(n269), .CK(clk), .QN(n104) );
  DFFX1 \line_buffer_reg[3][7]  ( .D(n238), .CK(clk), .Q(n327), .QN(n64) );
  DFFX1 \line_buffer_reg[5][7]  ( .D(n254), .CK(clk), .Q(n328), .QN(n80) );
  DFFX1 \line_buffer_reg[6][6]  ( .D(n284), .CK(clk), .QN(n89) );
  DFFX1 \line_buffer_reg[7][6]  ( .D(n276), .CK(clk), .QN(n97) );
  DFFX1 \line_buffer_reg[5][6]  ( .D(n255), .CK(clk), .QN(n81) );
  DFFX1 \line_buffer_reg[4][7]  ( .D(n246), .CK(clk), .Q(n326), .QN(n72) );
  DFFX1 \line_buffer_reg[8][6]  ( .D(n268), .CK(clk), .QN(n105) );
  DFFX1 \line_buffer_reg[3][6]  ( .D(n239), .CK(clk), .QN(n65) );
  DFFX1 \line_buffer_reg[6][3]  ( .D(n281), .CK(clk), .QN(n92) );
  DFFX1 \line_buffer_reg[7][3]  ( .D(n273), .CK(clk), .QN(n100) );
  DFFX1 \line_buffer_reg[8][3]  ( .D(n265), .CK(clk), .QN(n108) );
  DFFX1 \line_buffer_reg[7][2]  ( .D(n272), .CK(clk), .QN(n101) );
  DFFX1 \line_buffer_reg[8][2]  ( .D(n264), .CK(clk), .QN(n109) );
  DFFX1 \line_buffer_reg[3][2]  ( .D(n243), .CK(clk), .QN(n69) );
  DFFX1 \line_buffer_reg[4][4]  ( .D(n249), .CK(clk), .QN(n75) );
  DFFX1 \line_buffer_reg[3][3]  ( .D(n242), .CK(clk), .Q(n320), .QN(n68) );
  DFFX1 \line_buffer_reg[5][3]  ( .D(n258), .CK(clk), .Q(n325), .QN(n84) );
  DFFX1 \line_buffer_reg[6][2]  ( .D(n280), .CK(clk), .QN(n93) );
  DFFX1 \line_buffer_reg[5][2]  ( .D(n259), .CK(clk), .QN(n85) );
  DFFX1 \line_buffer_reg[6][4]  ( .D(n282), .CK(clk), .Q(n323), .QN(n91) );
  DFFX1 \line_buffer_reg[7][4]  ( .D(n274), .CK(clk), .Q(n322), .QN(n99) );
  DFFX1 \line_buffer_reg[8][4]  ( .D(n266), .CK(clk), .Q(n321), .QN(n107) );
  DFFX1 \line_buffer_reg[3][4]  ( .D(n241), .CK(clk), .Q(n319), .QN(n67) );
  DFFX1 \line_buffer_reg[5][4]  ( .D(n257), .CK(clk), .Q(n324), .QN(n83) );
  DFFX1 \line_buffer_reg[3][5]  ( .D(n240), .CK(clk), .Q(n306), .QN(n66) );
  DFFX1 \line_buffer_reg[5][5]  ( .D(n256), .CK(clk), .Q(n310), .QN(n82) );
  DFFX1 \line_buffer_reg[6][5]  ( .D(n283), .CK(clk), .Q(n309), .QN(n90) );
  DFFX1 \line_buffer_reg[7][5]  ( .D(n275), .CK(clk), .Q(n308), .QN(n98) );
  DFFX1 \line_buffer_reg[8][5]  ( .D(n267), .CK(clk), .Q(n307), .QN(n106) );
  DFFX1 \line_buffer_reg[4][3]  ( .D(n250), .CK(clk), .Q(n316), .QN(n76) );
  DFFX1 \line_buffer_reg[7][0]  ( .D(n270), .CK(clk), .QN(n103) );
  DFFX1 \line_buffer_reg[8][0]  ( .D(n262), .CK(clk), .QN(n111) );
  DFFX1 \line_buffer_reg[3][0]  ( .D(n245), .CK(clk), .QN(n71) );
  DFFX1 \line_buffer_reg[7][1]  ( .D(n271), .CK(clk), .Q(n318), .QN(n102) );
  DFFX1 \line_buffer_reg[8][1]  ( .D(n263), .CK(clk), .Q(n317), .QN(n110) );
  DFFX1 \line_buffer_reg[3][1]  ( .D(n244), .CK(clk), .Q(n314), .QN(n70) );
  DFFX1 \line_buffer_reg[6][0]  ( .D(n278), .CK(clk), .QN(n95) );
  DFFX1 \line_buffer_reg[6][1]  ( .D(n279), .CK(clk), .QN(n94) );
  DFFX1 \line_buffer_reg[5][0]  ( .D(n261), .CK(clk), .Q(n315), .QN(n87) );
  DFFX1 \line_buffer_reg[5][1]  ( .D(n260), .CK(clk), .Q(n305), .QN(n86) );
  DFFX1 \line_buffer_reg[4][0]  ( .D(n253), .CK(clk), .Q(n313), .QN(n79) );
  EDFFX1 \Y_reg[1]  ( .D(N196), .E(n330), .CK(clk), .Q(n667), .QN(n57) );
  EDFFX1 \X_reg[1]  ( .D(N181), .E(n329), .CK(clk), .Q(n674), .QN(n50) );
  EDFFX1 \Y_reg[2]  ( .D(N197), .E(n330), .CK(clk), .Q(n666), .QN(n56) );
  EDFFX1 \X_reg[2]  ( .D(N182), .E(n329), .CK(clk), .Q(n673), .QN(n49) );
  EDFFX1 \Y_reg[3]  ( .D(N198), .E(n330), .CK(clk), .Q(n665), .QN(n55) );
  EDFFX1 \X_reg[3]  ( .D(N183), .E(n329), .CK(clk), .Q(n672), .QN(n48) );
  DFFX1 \state_reg[1]  ( .D(N174), .CK(clk), .Q(state[1]), .QN(n657) );
  DFFX1 \state_reg[0]  ( .D(N173), .CK(clk), .Q(state[0]), .QN(n654) );
  DFFX1 \pix_idx_reg[0]  ( .D(n303), .CK(clk), .Q(pix_idx[0]), .QN(n426) );
  DFFX1 \pix_idx_reg[3]  ( .D(n302), .CK(clk), .Q(pix_idx[3]), .QN(n403) );
  DFFX1 \X_reg[0]  ( .D(n301), .CK(clk), .Q(n675), .QN(n312) );
  DFFX1 \pix_idx_reg[2]  ( .D(n287), .CK(clk), .Q(pix_idx[2]), .QN(n408) );
  DFFX1 \pix_idx_reg[1]  ( .D(n286), .CK(clk), .Q(pix_idx[1]), .QN(n646) );
  DFFX1 \Y_reg[0]  ( .D(n294), .CK(clk), .Q(n668), .QN(n311) );
  DFFX1 \line_buffer_reg[2][7]  ( .D(n230), .CK(clk), .Q(\line_buffer[2][7] )
         );
  DFFX1 \line_buffer_reg[2][6]  ( .D(n231), .CK(clk), .Q(\line_buffer[2][6] ), 
        .QN(n553) );
  DFFX1 \line_buffer_reg[2][5]  ( .D(n232), .CK(clk), .Q(\line_buffer[2][5] )
         );
  DFFX1 \line_buffer_reg[2][4]  ( .D(n233), .CK(clk), .Q(\line_buffer[2][4] )
         );
  DFFX1 \line_buffer_reg[2][3]  ( .D(n234), .CK(clk), .Q(\line_buffer[2][3] )
         );
  DFFX1 \line_buffer_reg[2][2]  ( .D(n235), .CK(clk), .Q(\line_buffer[2][2] ), 
        .QN(n558) );
  DFFX1 \line_buffer_reg[2][1]  ( .D(n236), .CK(clk), .Q(\line_buffer[2][1] )
         );
  DFFX1 \line_buffer_reg[1][7]  ( .D(n222), .CK(clk), .Q(\line_buffer[1][7] )
         );
  DFFX1 \line_buffer_reg[1][6]  ( .D(n223), .CK(clk), .Q(\line_buffer[1][6] ), 
        .QN(n580) );
  DFFX1 \line_buffer_reg[1][5]  ( .D(n224), .CK(clk), .Q(\line_buffer[1][5] )
         );
  DFFX1 \line_buffer_reg[1][4]  ( .D(n225), .CK(clk), .Q(\line_buffer[1][4] )
         );
  DFFX1 \line_buffer_reg[1][3]  ( .D(n226), .CK(clk), .Q(\line_buffer[1][3] )
         );
  DFFX1 \line_buffer_reg[1][2]  ( .D(n227), .CK(clk), .Q(\line_buffer[1][2] ), 
        .QN(n585) );
  DFFX1 \line_buffer_reg[1][1]  ( .D(n228), .CK(clk), .Q(\line_buffer[1][1] )
         );
  DFFX1 \line_buffer_reg[1][0]  ( .D(n229), .CK(clk), .Q(\line_buffer[1][0] )
         );
  DFFX1 \line_buffer_reg[0][7]  ( .D(n214), .CK(clk), .Q(\line_buffer[0][7] )
         );
  DFFX1 \line_buffer_reg[0][6]  ( .D(n215), .CK(clk), .Q(\line_buffer[0][6] ), 
        .QN(n620) );
  DFFX1 \line_buffer_reg[0][5]  ( .D(n216), .CK(clk), .Q(\line_buffer[0][5] )
         );
  DFFX1 \line_buffer_reg[0][4]  ( .D(n217), .CK(clk), .Q(\line_buffer[0][4] )
         );
  DFFX1 \line_buffer_reg[0][3]  ( .D(n218), .CK(clk), .Q(\line_buffer[0][3] )
         );
  DFFX1 \line_buffer_reg[0][2]  ( .D(n219), .CK(clk), .Q(\line_buffer[0][2] ), 
        .QN(n625) );
  DFFX1 \line_buffer_reg[0][1]  ( .D(n220), .CK(clk), .Q(\line_buffer[0][1] )
         );
  DFFX1 \line_buffer_reg[0][0]  ( .D(n221), .CK(clk), .Q(\line_buffer[0][0] )
         );
  DFFX1 \line_buffer_reg[2][0]  ( .D(n237), .CK(clk), .Q(\line_buffer[2][0] )
         );
  DFFX1 \X_reg[4]  ( .D(n298), .CK(clk), .Q(n671), .QN(n400) );
  DFFX1 \Y_reg[4]  ( .D(n291), .CK(clk), .Q(n664), .QN(n394) );
  DFFX1 \X_reg[5]  ( .D(n299), .CK(clk), .Q(n670), .QN(n636) );
  DFFX1 \Y_reg[5]  ( .D(n292), .CK(clk), .Q(n663), .QN(n641) );
  DFFX1 \X_reg[6]  ( .D(n300), .CK(clk), .Q(n669), .QN(n633) );
  DFFX1 \Y_reg[6]  ( .D(n293), .CK(clk), .Q(n662), .QN(n640) );
  DFFX4 \line_buffer_reg[4][6]  ( .D(n247), .CK(clk), .Q(n470), .QN(n73) );
  DFFX2 \line_buffer_reg[4][5]  ( .D(n248), .CK(clk), .Q(n467), .QN(n74) );
  DFFX2 \line_buffer_reg[4][1]  ( .D(n252), .CK(clk), .Q(n460), .QN(n78) );
  DFFX2 \line_buffer_reg[4][2]  ( .D(n251), .CK(clk), .Q(n463), .QN(n77) );
  AND4X1 U257 ( .A(n643), .B(n482), .C(n472), .D(n455), .Y(n632) );
  NOR2X1 U258 ( .A(reset), .B(N352), .Y(n412) );
  OA21XL U259 ( .A0(n50), .A1(n632), .B0(n639), .Y(n365) );
  OA21XL U260 ( .A0(n49), .A1(n632), .B0(n638), .Y(n366) );
  NAND2X1 U261 ( .A(N352), .B(n515), .Y(n304) );
  BUFX12 U262 ( .A(n675), .Y(lbp_addr[0]) );
  BUFX12 U263 ( .A(n668), .Y(lbp_addr[7]) );
  INVXL U264 ( .A(n412), .Y(n329) );
  INVXL U265 ( .A(n413), .Y(n330) );
  BUFX12 U266 ( .A(n678), .Y(lbp_data[5]) );
  OAI2BB2XL U267 ( .B0(n545), .B1(n546), .A0N(\line_buffer[2][7] ), .A1N(n381), 
        .Y(n678) );
  AOI32X1 U268 ( .A0(n547), .A1(n548), .A2(n549), .B0(n550), .B1(n551), .Y(
        n545) );
  BUFX12 U269 ( .A(n680), .Y(lbp_data[3]) );
  OAI2BB2XL U270 ( .B0(n572), .B1(n573), .A0N(\line_buffer[1][7] ), .A1N(n381), 
        .Y(n680) );
  AOI32X1 U271 ( .A0(n574), .A1(n575), .A2(n576), .B0(n577), .B1(n578), .Y(
        n572) );
  OAI2BB1X2 U272 ( .A0N(n514), .A1N(n456), .B0(n493), .Y(n505) );
  NAND2X1 U273 ( .A(n456), .B(n419), .Y(n493) );
  NAND3X1 U274 ( .A(n358), .B(N352), .C(n359), .Y(n683) );
  INVX12 U275 ( .A(n683), .Y(finish) );
  AOI2BB1X2 U276 ( .A0N(n419), .A1N(n436), .B0(reset), .Y(n428) );
  BUFX12 U277 ( .A(n682), .Y(lbp_data[0]) );
  OAI2BB2XL U278 ( .B0(n612), .B1(n613), .A0N(\line_buffer[0][7] ), .A1N(n381), 
        .Y(n682) );
  AOI32X1 U279 ( .A0(n614), .A1(n615), .A2(n616), .B0(n617), .B1(n618), .Y(
        n612) );
  AOI2BB1X1 U280 ( .A0N(n632), .A1N(n633), .B0(n370), .Y(n369) );
  OAI2BB1X2 U281 ( .A0N(n503), .A1N(n456), .B0(n493), .Y(n495) );
  NOR2BX2 U282 ( .AN(n425), .B(n386), .Y(N387) );
  AOI2BB1X2 U283 ( .A0N(n419), .A1N(n405), .B0(reset), .Y(n437) );
  OA22X1 U284 ( .A0(n516), .A1(n517), .B0(n104), .B1(n326), .Y(n676) );
  INVX12 U285 ( .A(n676), .Y(lbp_data[7]) );
  AOI2BB1X1 U286 ( .A0N(n632), .A1N(n636), .B0(n376), .Y(n375) );
  AOI2BB1X1 U287 ( .A0N(n627), .A1N(n640), .B0(n368), .Y(n367) );
  OAI2BB1X2 U288 ( .A0N(n492), .A1N(n456), .B0(n493), .Y(n484) );
  AOI2BB1X2 U289 ( .A0N(n424), .A1N(n425), .B0(reset), .Y(n413) );
  AOI2BB1X2 U290 ( .A0N(n419), .A1N(n439), .B0(reset), .Y(n438) );
  OA22X1 U291 ( .A0(n560), .A1(n561), .B0(n96), .B1(n326), .Y(n679) );
  INVX12 U292 ( .A(n679), .Y(lbp_data[4]) );
  AOI2BB1X1 U293 ( .A0N(n627), .A1N(n641), .B0(n378), .Y(n377) );
  BUFX12 U294 ( .A(n660), .Y(gray_addr[0]) );
  OAI21XL U295 ( .A0(n632), .A1(n312), .B0(n644), .Y(n660) );
  OA22X1 U296 ( .A0(n587), .A1(n588), .B0(n88), .B1(n326), .Y(n681) );
  INVX12 U297 ( .A(n681), .Y(lbp_data[2]) );
  OA21X2 U298 ( .A0(n419), .A1(n482), .B0(n456), .Y(n474) );
  INVX12 U299 ( .A(n394), .Y(lbp_addr[11]) );
  INVX12 U300 ( .A(n633), .Y(lbp_addr[6]) );
  AOI2BB1X1 U301 ( .A0N(n627), .A1N(n394), .B0(n374), .Y(n373) );
  BUFX12 U302 ( .A(n659), .Y(gray_addr[3]) );
  OAI21XL U303 ( .A0(n48), .A1(n632), .B0(n637), .Y(n659) );
  OA22X1 U304 ( .A0(n530), .A1(n531), .B0(n80), .B1(n326), .Y(n677) );
  INVX12 U305 ( .A(n677), .Y(lbp_data[6]) );
  OA21X2 U306 ( .A0(n419), .A1(n455), .B0(n456), .Y(n442) );
  INVX12 U307 ( .A(n640), .Y(lbp_addr[13]) );
  INVX12 U308 ( .A(n400), .Y(lbp_addr[4]) );
  AND2XL U309 ( .A(n671), .B(N387), .Y(N392) );
  AOI2BB1X1 U310 ( .A0N(n632), .A1N(n400), .B0(n372), .Y(n371) );
  AOI21X1 U311 ( .A0(n360), .A1(n382), .B0(n361), .Y(n658) );
  INVX12 U312 ( .A(n658), .Y(gray_addr[7]) );
  BUFX12 U313 ( .A(n667), .Y(lbp_addr[8]) );
  NAND2BXL U314 ( .AN(n667), .B(n311), .Y(n389) );
  OAI2BB1XL U315 ( .A0N(n382), .A1N(n667), .B0(n389), .Y(N89) );
  BUFX12 U316 ( .A(n674), .Y(lbp_addr[1]) );
  AND2XL U317 ( .A(n674), .B(N387), .Y(N389) );
  NAND2BXL U318 ( .AN(n674), .B(n312), .Y(n395) );
  BUFX12 U319 ( .A(n666), .Y(lbp_addr[9]) );
  OAI2BB1XL U320 ( .A0N(n389), .A1N(n666), .B0(n390), .Y(N90) );
  BUFX12 U321 ( .A(n673), .Y(lbp_addr[2]) );
  AND2XL U322 ( .A(n673), .B(N387), .Y(N390) );
  BUFX12 U323 ( .A(n665), .Y(lbp_addr[10]) );
  AO21XL U324 ( .A0(n390), .A1(n665), .B0(n391), .Y(N91) );
  BUFX12 U325 ( .A(n672), .Y(lbp_addr[3]) );
  AND2XL U326 ( .A(n672), .B(N387), .Y(N391) );
  AO21XL U327 ( .A0(n396), .A1(n672), .B0(n397), .Y(N98) );
  INVX12 U328 ( .A(n352), .Y(lbp_data[1]) );
  NOR2XL U329 ( .A(n64), .B(n326), .Y(n353) );
  NOR2XL U330 ( .A(n600), .B(n601), .Y(n354) );
  NOR2X1 U331 ( .A(n353), .B(n354), .Y(n352) );
  OA21X2 U332 ( .A0(n419), .A1(n472), .B0(n456), .Y(n458) );
  INVX12 U333 ( .A(n641), .Y(lbp_addr[12]) );
  INVX12 U334 ( .A(n636), .Y(lbp_addr[5]) );
  AND2XL U335 ( .A(n670), .B(N387), .Y(N393) );
  XNOR2X1 U336 ( .A(state[1]), .B(state[0]), .Y(n661) );
  INVX12 U337 ( .A(n661), .Y(gray_req) );
  INVX16 U338 ( .A(n424), .Y(N352) );
  AND2XL U339 ( .A(lbp_addr[0]), .B(N387), .Y(N388) );
  MXI2XL U340 ( .A(n444), .B(n314), .S0(n474), .Y(n475) );
  MXI2XL U341 ( .A(n447), .B(n320), .S0(n474), .Y(n477) );
  MXI2XL U342 ( .A(n449), .B(n319), .S0(n474), .Y(n478) );
  MXI2XL U343 ( .A(n451), .B(n306), .S0(n474), .Y(n479) );
  MXI2XL U344 ( .A(n454), .B(n327), .S0(n474), .Y(n481) );
  MXI2XL U345 ( .A(n469), .B(n470), .S0(n458), .Y(n468) );
  MXI2XL U346 ( .A(n454), .B(n326), .S0(n458), .Y(n471) );
  MXI2XL U347 ( .A(n451), .B(n467), .S0(n458), .Y(n466) );
  MXI2XL U348 ( .A(n441), .B(n315), .S0(n442), .Y(n440) );
  MX2XL U349 ( .A(n435), .B(n71), .S0(n474), .Y(n473) );
  MX2XL U350 ( .A(n433), .B(n69), .S0(n474), .Y(n476) );
  MX2XL U351 ( .A(n429), .B(n65), .S0(n474), .Y(n480) );
  MX2XL U352 ( .A(N186), .B(n669), .S0(n412), .Y(n300) );
  AND2XL U353 ( .A(N387), .B(n669), .Y(N394) );
  MX2XL U354 ( .A(n431), .B(n380), .S0(n458), .Y(n465) );
  MX2XL U355 ( .A(N185), .B(lbp_addr[5]), .S0(n412), .Y(n299) );
  MXI2XL U356 ( .A(n441), .B(\line_buffer[2][0] ), .S0(n484), .Y(n483) );
  MXI2XL U357 ( .A(n449), .B(\line_buffer[1][4] ), .S0(n495), .Y(n499) );
  MXI2XL U358 ( .A(n469), .B(\line_buffer[1][6] ), .S0(n495), .Y(n501) );
  MXI2XL U359 ( .A(n469), .B(\line_buffer[0][6] ), .S0(n505), .Y(n512) );
  MXI2XL U360 ( .A(n451), .B(\line_buffer[1][5] ), .S0(n495), .Y(n500) );
  MXI2XL U361 ( .A(n444), .B(\line_buffer[2][1] ), .S0(n484), .Y(n485) );
  MXI2XL U362 ( .A(n462), .B(\line_buffer[2][2] ), .S0(n484), .Y(n486) );
  MXI2XL U363 ( .A(n447), .B(\line_buffer[2][3] ), .S0(n484), .Y(n487) );
  MXI2XL U364 ( .A(n449), .B(\line_buffer[2][4] ), .S0(n484), .Y(n488) );
  MXI2XL U365 ( .A(n451), .B(\line_buffer[2][5] ), .S0(n484), .Y(n489) );
  MXI2XL U366 ( .A(n469), .B(\line_buffer[2][6] ), .S0(n484), .Y(n490) );
  MXI2XL U367 ( .A(n454), .B(\line_buffer[2][7] ), .S0(n484), .Y(n491) );
  MXI2XL U368 ( .A(n441), .B(\line_buffer[1][0] ), .S0(n495), .Y(n494) );
  MXI2XL U369 ( .A(n444), .B(\line_buffer[1][1] ), .S0(n495), .Y(n496) );
  MXI2XL U370 ( .A(n462), .B(\line_buffer[1][2] ), .S0(n495), .Y(n497) );
  MXI2XL U371 ( .A(n447), .B(\line_buffer[1][3] ), .S0(n495), .Y(n498) );
  MXI2XL U372 ( .A(n454), .B(\line_buffer[1][7] ), .S0(n495), .Y(n502) );
  MXI2XL U373 ( .A(n441), .B(\line_buffer[0][0] ), .S0(n505), .Y(n504) );
  MXI2XL U374 ( .A(n444), .B(\line_buffer[0][1] ), .S0(n505), .Y(n507) );
  MXI2XL U375 ( .A(n462), .B(\line_buffer[0][2] ), .S0(n505), .Y(n508) );
  MXI2XL U376 ( .A(n447), .B(\line_buffer[0][3] ), .S0(n505), .Y(n509) );
  MXI2XL U377 ( .A(n449), .B(\line_buffer[0][4] ), .S0(n505), .Y(n510) );
  MXI2XL U378 ( .A(n451), .B(\line_buffer[0][5] ), .S0(n505), .Y(n511) );
  MXI2XL U379 ( .A(n454), .B(\line_buffer[0][7] ), .S0(n505), .Y(n513) );
  MX2XL U380 ( .A(N184), .B(n671), .S0(n412), .Y(n298) );
  MXI2XL U381 ( .A(n435), .B(n111), .S0(n438), .Y(n262) );
  MXI2XL U382 ( .A(n434), .B(n110), .S0(n438), .Y(n263) );
  MXI2XL U383 ( .A(n433), .B(n109), .S0(n438), .Y(n264) );
  MXI2XL U384 ( .A(n432), .B(n108), .S0(n438), .Y(n265) );
  MXI2XL U385 ( .A(n431), .B(n107), .S0(n438), .Y(n266) );
  MXI2XL U386 ( .A(n430), .B(n106), .S0(n438), .Y(n267) );
  MXI2XL U387 ( .A(n429), .B(n105), .S0(n438), .Y(n268) );
  MXI2XL U388 ( .A(n427), .B(n104), .S0(n438), .Y(n269) );
  MXI2XL U389 ( .A(n435), .B(n103), .S0(n437), .Y(n270) );
  MXI2XL U390 ( .A(n434), .B(n102), .S0(n437), .Y(n271) );
  MXI2XL U391 ( .A(n433), .B(n101), .S0(n437), .Y(n272) );
  MXI2XL U392 ( .A(n432), .B(n100), .S0(n437), .Y(n273) );
  MXI2XL U393 ( .A(n431), .B(n99), .S0(n437), .Y(n274) );
  MXI2XL U394 ( .A(n430), .B(n98), .S0(n437), .Y(n275) );
  MXI2XL U395 ( .A(n429), .B(n97), .S0(n437), .Y(n276) );
  MXI2XL U396 ( .A(n427), .B(n96), .S0(n437), .Y(n277) );
  MXI2XL U397 ( .A(n435), .B(n95), .S0(n428), .Y(n278) );
  MXI2XL U398 ( .A(n434), .B(n94), .S0(n428), .Y(n279) );
  MXI2XL U399 ( .A(n433), .B(n93), .S0(n428), .Y(n280) );
  MXI2XL U400 ( .A(n432), .B(n92), .S0(n428), .Y(n281) );
  MXI2XL U401 ( .A(n431), .B(n91), .S0(n428), .Y(n282) );
  MXI2XL U402 ( .A(n430), .B(n90), .S0(n428), .Y(n283) );
  MXI2XL U403 ( .A(n429), .B(n89), .S0(n428), .Y(n284) );
  MXI2XL U404 ( .A(n427), .B(n88), .S0(n428), .Y(n285) );
  OR2XL U405 ( .A(n395), .B(n673), .Y(n396) );
  XOR2XL U406 ( .A(n662), .B(n393), .Y(N94) );
  NOR2XL U407 ( .A(n663), .B(n392), .Y(n393) );
  OR2XL U408 ( .A(n389), .B(n666), .Y(n390) );
  XOR2XL U409 ( .A(n669), .B(n399), .Y(N101) );
  NOR2XL U410 ( .A(n670), .B(n398), .Y(n399) );
  XNOR2XL U411 ( .A(n663), .B(n392), .Y(N93) );
  XNOR2XL U412 ( .A(n670), .B(n398), .Y(N100) );
  NAND4XL U413 ( .A(n663), .B(n662), .C(n664), .D(n656), .Y(n649) );
  MX2XL U414 ( .A(N195), .B(n382), .S0(n413), .Y(n294) );
  AND4X1 U415 ( .A(n643), .B(n503), .C(n472), .D(n405), .Y(n627) );
  MX2XL U416 ( .A(N201), .B(n662), .S0(n413), .Y(n293) );
  AND2XL U417 ( .A(N396), .B(n662), .Y(N403) );
  MX2XL U418 ( .A(N200), .B(lbp_addr[12]), .S0(n413), .Y(n292) );
  MX2XL U419 ( .A(N199), .B(n664), .S0(n413), .Y(n291) );
  MXI2XL U420 ( .A(n444), .B(n305), .S0(n442), .Y(n443) );
  MXI2XL U421 ( .A(n447), .B(n325), .S0(n442), .Y(n446) );
  MXI2XL U422 ( .A(n449), .B(n324), .S0(n442), .Y(n448) );
  MXI2XL U423 ( .A(n451), .B(n310), .S0(n442), .Y(n450) );
  MXI2XL U424 ( .A(n454), .B(n328), .S0(n442), .Y(n453) );
  MXI2XL U425 ( .A(n441), .B(n313), .S0(n458), .Y(n457) );
  MXI2XL U426 ( .A(n447), .B(n316), .S0(n458), .Y(n464) );
  MXI2XL U427 ( .A(n444), .B(n460), .S0(n458), .Y(n459) );
  MXI2XL U428 ( .A(n462), .B(n463), .S0(n458), .Y(n461) );
  MX2XL U429 ( .A(n429), .B(n81), .S0(n442), .Y(n452) );
  MX2XL U430 ( .A(n433), .B(n85), .S0(n442), .Y(n445) );
  NAND4XL U431 ( .A(gray_ready), .B(n515), .C(n654), .D(n657), .Y(n652) );
  NAND3XL U432 ( .A(n425), .B(n515), .C(state[1]), .Y(n650) );
  OAI2BB1XL U433 ( .A0N(n395), .A1N(n673), .B0(n396), .Y(N97) );
  OAI2BB1XL U434 ( .A0N(n384), .A1N(n674), .B0(n395), .Y(N96) );
  AND2XL U435 ( .A(n667), .B(N396), .Y(N398) );
  AND2XL U436 ( .A(n666), .B(N396), .Y(N399) );
  AND2XL U437 ( .A(n665), .B(N396), .Y(N400) );
  AND2XL U438 ( .A(n664), .B(N396), .Y(N401) );
  AND2XL U439 ( .A(n663), .B(N396), .Y(N402) );
  NOR3BX2 U440 ( .AN(n649), .B(n425), .C(n386), .Y(N396) );
  CLKBUFX3 U441 ( .A(n388), .Y(n386) );
  CLKBUFX3 U442 ( .A(n304), .Y(n388) );
  CLKBUFX3 U443 ( .A(n304), .Y(n387) );
  INVX3 U444 ( .A(n506), .Y(n419) );
  NAND2X2 U445 ( .A(n411), .B(n410), .Y(n506) );
  NAND2X2 U446 ( .A(n313), .B(n460), .Y(n527) );
  CLKINVX1 U447 ( .A(n649), .Y(n358) );
  CLKINVX1 U448 ( .A(n425), .Y(n359) );
  CLKINVX1 U449 ( .A(n627), .Y(n360) );
  INVX12 U450 ( .A(n367), .Y(gray_addr[13]) );
  INVX12 U451 ( .A(n369), .Y(gray_addr[6]) );
  CLKBUFX3 U452 ( .A(n76), .Y(n379) );
  INVX12 U453 ( .A(n377), .Y(gray_addr[12]) );
  INVX12 U454 ( .A(n375), .Y(gray_addr[5]) );
  CLKBUFX3 U455 ( .A(n75), .Y(n380) );
  INVX12 U456 ( .A(n373), .Y(gray_addr[11]) );
  INVX12 U457 ( .A(n371), .Y(gray_addr[4]) );
  CLKBUFX3 U458 ( .A(n72), .Y(n381) );
  CLKBUFX3 U459 ( .A(n675), .Y(n384) );
  CLKBUFX3 U460 ( .A(n668), .Y(n382) );
  INVX12 U461 ( .A(n364), .Y(gray_addr[10]) );
  OA21XL U462 ( .A0(n55), .A1(n627), .B0(n642), .Y(n364) );
  INVX12 U463 ( .A(n366), .Y(gray_addr[2]) );
  INVX12 U464 ( .A(n363), .Y(gray_addr[9]) );
  OA21XL U465 ( .A0(n56), .A1(n627), .B0(n628), .Y(n363) );
  INVX12 U466 ( .A(n365), .Y(gray_addr[1]) );
  INVX12 U467 ( .A(n362), .Y(gray_addr[8]) );
  OA21XL U468 ( .A0(n57), .A1(n627), .B0(n631), .Y(n362) );
  AO22X1 U469 ( .A0(n311), .A1(n629), .B0(N109), .B1(n630), .Y(n361) );
  AOI22XL U470 ( .A0(N97), .A1(n634), .B0(N146), .B1(n635), .Y(n638) );
  AO22XL U471 ( .A0(N94), .A1(n629), .B0(N115), .B1(n630), .Y(n368) );
  AO22XL U472 ( .A0(N101), .A1(n634), .B0(N150), .B1(n635), .Y(n370) );
  AO22XL U473 ( .A0(N99), .A1(n634), .B0(N148), .B1(n635), .Y(n372) );
  AO22XL U474 ( .A0(N92), .A1(n629), .B0(N113), .B1(n630), .Y(n374) );
  AO22XL U475 ( .A0(N100), .A1(n634), .B0(N149), .B1(n635), .Y(n376) );
  AO22XL U476 ( .A0(N93), .A1(n629), .B0(N114), .B1(n630), .Y(n378) );
  AOI22XL U477 ( .A0(N91), .A1(n629), .B0(N112), .B1(n630), .Y(n642) );
  AOI22XL U478 ( .A0(N98), .A1(n634), .B0(N147), .B1(n635), .Y(n637) );
  AOI32XL U479 ( .A0(n602), .A1(n603), .A2(n604), .B0(n605), .B1(n606), .Y(
        n600) );
  AOI32XL U480 ( .A0(n562), .A1(n563), .A2(n564), .B0(n565), .B1(n566), .Y(
        n560) );
  AOI32XL U481 ( .A0(n518), .A1(n519), .A2(n520), .B0(n521), .B1(n522), .Y(
        n516) );
  AOI32XL U482 ( .A0(n589), .A1(n590), .A2(n591), .B0(n592), .B1(n593), .Y(
        n587) );
  AOI32XL U483 ( .A0(n532), .A1(n533), .A2(n534), .B0(n535), .B1(n536), .Y(
        n530) );
  AND2X1 U484 ( .A(lbp_addr[7]), .B(N396), .Y(N397) );
  NOR2X1 U485 ( .A(n390), .B(n665), .Y(n391) );
  NAND2X1 U486 ( .A(n391), .B(n394), .Y(n392) );
  OAI21XL U487 ( .A0(n391), .A1(n394), .B0(n392), .Y(N92) );
  NOR2X1 U488 ( .A(n396), .B(n672), .Y(n397) );
  NAND2X1 U489 ( .A(n397), .B(n400), .Y(n398) );
  OAI21XL U490 ( .A0(n397), .A1(n400), .B0(n398), .Y(N99) );
  MXI2X1 U491 ( .A(n401), .B(n402), .S0(pix_idx[0]), .Y(n303) );
  OAI22XL U492 ( .A0(n403), .A1(n402), .B0(n401), .B1(n404), .Y(n302) );
  NOR2BX1 U493 ( .AN(n405), .B(n406), .Y(n404) );
  AOI2BB1X1 U494 ( .A0N(n407), .A1N(n408), .B0(n403), .Y(n406) );
  OA21XL U495 ( .A0(n409), .A1(n410), .B0(n411), .Y(n401) );
  CLKMX2X2 U496 ( .A(N180), .B(n384), .S0(n412), .Y(n301) );
  NAND2X1 U497 ( .A(n414), .B(n415), .Y(n287) );
  MXI2X1 U498 ( .A(n416), .B(n417), .S0(pix_idx[2]), .Y(n414) );
  OAI21XL U499 ( .A0(n418), .A1(n419), .B0(n402), .Y(n417) );
  NOR2X1 U500 ( .A(n419), .B(n407), .Y(n416) );
  NAND2X1 U501 ( .A(n420), .B(n415), .Y(n286) );
  CLKINVX1 U502 ( .A(n421), .Y(n415) );
  MXI2X1 U503 ( .A(n422), .B(n423), .S0(pix_idx[1]), .Y(n420) );
  OAI21XL U504 ( .A0(pix_idx[0]), .A1(n419), .B0(n402), .Y(n423) );
  NAND2X1 U505 ( .A(n419), .B(n413), .Y(n402) );
  NOR2X1 U506 ( .A(n419), .B(n426), .Y(n422) );
  OAI21XL U507 ( .A0(n111), .A1(n387), .B0(n440), .Y(n261) );
  OAI21XL U508 ( .A0(n110), .A1(n386), .B0(n443), .Y(n260) );
  OAI21XL U509 ( .A0(n109), .A1(n386), .B0(n445), .Y(n259) );
  OAI21XL U510 ( .A0(n108), .A1(n386), .B0(n446), .Y(n258) );
  OAI21XL U511 ( .A0(n107), .A1(n386), .B0(n448), .Y(n257) );
  OAI21XL U512 ( .A0(n106), .A1(n386), .B0(n450), .Y(n256) );
  OAI21XL U513 ( .A0(n105), .A1(n386), .B0(n452), .Y(n255) );
  OAI21XL U514 ( .A0(n104), .A1(n386), .B0(n453), .Y(n254) );
  OAI21XL U515 ( .A0(n103), .A1(n386), .B0(n457), .Y(n253) );
  OAI21XL U516 ( .A0(n102), .A1(n386), .B0(n459), .Y(n252) );
  OAI21XL U517 ( .A0(n101), .A1(n386), .B0(n461), .Y(n251) );
  OAI21XL U518 ( .A0(n100), .A1(n386), .B0(n464), .Y(n250) );
  OAI21XL U519 ( .A0(n99), .A1(n304), .B0(n465), .Y(n249) );
  OAI21XL U520 ( .A0(n98), .A1(n388), .B0(n466), .Y(n248) );
  OAI21XL U521 ( .A0(n97), .A1(n386), .B0(n468), .Y(n247) );
  OAI21XL U522 ( .A0(n96), .A1(n304), .B0(n471), .Y(n246) );
  OAI21XL U523 ( .A0(n95), .A1(n304), .B0(n473), .Y(n245) );
  OAI21XL U524 ( .A0(n94), .A1(n304), .B0(n475), .Y(n244) );
  OAI21XL U525 ( .A0(n93), .A1(n388), .B0(n476), .Y(n243) );
  OAI21XL U526 ( .A0(n92), .A1(n387), .B0(n477), .Y(n242) );
  OAI21XL U527 ( .A0(n91), .A1(n387), .B0(n478), .Y(n241) );
  OAI21XL U528 ( .A0(n90), .A1(n387), .B0(n479), .Y(n240) );
  OAI21XL U529 ( .A0(n89), .A1(n387), .B0(n480), .Y(n239) );
  OAI21XL U530 ( .A0(n88), .A1(n387), .B0(n481), .Y(n238) );
  OAI21XL U531 ( .A0(n87), .A1(n387), .B0(n483), .Y(n237) );
  OAI21XL U532 ( .A0(n86), .A1(n387), .B0(n485), .Y(n236) );
  OAI21XL U533 ( .A0(n85), .A1(n387), .B0(n486), .Y(n235) );
  OAI21XL U534 ( .A0(n84), .A1(n387), .B0(n487), .Y(n234) );
  OAI21XL U535 ( .A0(n83), .A1(n387), .B0(n488), .Y(n233) );
  OAI21XL U536 ( .A0(n82), .A1(n387), .B0(n489), .Y(n232) );
  OAI21XL U537 ( .A0(n81), .A1(n387), .B0(n490), .Y(n231) );
  OAI21XL U538 ( .A0(n80), .A1(n387), .B0(n491), .Y(n230) );
  OAI21XL U539 ( .A0(n79), .A1(n387), .B0(n494), .Y(n229) );
  OAI21XL U540 ( .A0(n78), .A1(n387), .B0(n496), .Y(n228) );
  OAI21XL U541 ( .A0(n77), .A1(n387), .B0(n497), .Y(n227) );
  OAI21XL U542 ( .A0(n379), .A1(n387), .B0(n498), .Y(n226) );
  OAI21XL U543 ( .A0(n380), .A1(n387), .B0(n499), .Y(n225) );
  OAI21XL U544 ( .A0(n74), .A1(n387), .B0(n500), .Y(n224) );
  OAI21XL U545 ( .A0(n73), .A1(n304), .B0(n501), .Y(n223) );
  OAI21XL U546 ( .A0(n381), .A1(n388), .B0(n502), .Y(n222) );
  OAI21XL U547 ( .A0(n71), .A1(n388), .B0(n504), .Y(n221) );
  CLKINVX1 U548 ( .A(n435), .Y(n441) );
  NAND2X1 U549 ( .A(gray_data[0]), .B(n506), .Y(n435) );
  OAI21XL U550 ( .A0(n70), .A1(n388), .B0(n507), .Y(n220) );
  CLKINVX1 U551 ( .A(n434), .Y(n444) );
  NAND2X1 U552 ( .A(gray_data[1]), .B(n506), .Y(n434) );
  OAI21XL U553 ( .A0(n69), .A1(n388), .B0(n508), .Y(n219) );
  CLKINVX1 U554 ( .A(n433), .Y(n462) );
  NAND2X1 U555 ( .A(gray_data[2]), .B(n506), .Y(n433) );
  OAI21XL U556 ( .A0(n68), .A1(n388), .B0(n509), .Y(n218) );
  CLKINVX1 U557 ( .A(n432), .Y(n447) );
  NAND2X1 U558 ( .A(gray_data[3]), .B(n506), .Y(n432) );
  OAI21XL U559 ( .A0(n67), .A1(n388), .B0(n510), .Y(n217) );
  CLKINVX1 U560 ( .A(n431), .Y(n449) );
  NAND2X1 U561 ( .A(gray_data[4]), .B(n506), .Y(n431) );
  OAI21XL U562 ( .A0(n66), .A1(n388), .B0(n511), .Y(n216) );
  CLKINVX1 U563 ( .A(n430), .Y(n451) );
  NAND2X1 U564 ( .A(gray_data[5]), .B(n506), .Y(n430) );
  OAI21XL U565 ( .A0(n65), .A1(n388), .B0(n512), .Y(n215) );
  CLKINVX1 U566 ( .A(n429), .Y(n469) );
  NAND2X1 U567 ( .A(gray_data[6]), .B(n506), .Y(n429) );
  OAI21XL U568 ( .A0(n64), .A1(n388), .B0(n513), .Y(n214) );
  AND2X1 U569 ( .A(n387), .B(n515), .Y(n456) );
  CLKINVX1 U570 ( .A(n427), .Y(n454) );
  NAND2X1 U571 ( .A(gray_data[7]), .B(n506), .Y(n427) );
  NOR2BX1 U572 ( .AN(n104), .B(n381), .Y(n517) );
  OAI21XL U573 ( .A0(n523), .A1(n105), .B0(n470), .Y(n522) );
  NAND2X1 U574 ( .A(n523), .B(n105), .Y(n521) );
  AOI32X1 U575 ( .A0(n380), .A1(n321), .A2(n518), .B0(n307), .B1(n74), .Y(n523) );
  AOI2BB2X1 U576 ( .B0(n470), .B1(n105), .A0N(n380), .A1N(n321), .Y(n520) );
  OAI22XL U577 ( .A0(n108), .A1(n316), .B0(n524), .B1(n525), .Y(n519) );
  ACHCINX2 U578 ( .CIN(n77), .A(n109), .B(n526), .CO(n525) );
  AOI211X1 U579 ( .A0(n527), .A1(n317), .B0(n528), .C0(n529), .Y(n526) );
  AOI2BB1X1 U580 ( .A0N(n78), .A1N(n317), .B0(n111), .Y(n529) );
  NOR2BX1 U581 ( .AN(n108), .B(n379), .Y(n524) );
  NAND2X1 U582 ( .A(n106), .B(n467), .Y(n518) );
  NOR2X1 U583 ( .A(n381), .B(n328), .Y(n531) );
  OAI21XL U584 ( .A0(n537), .A1(n470), .B0(n81), .Y(n536) );
  NAND2X1 U585 ( .A(n537), .B(n470), .Y(n535) );
  AOI32X1 U586 ( .A0(n380), .A1(n324), .A2(n532), .B0(n310), .B1(n74), .Y(n537) );
  AOI2BB2X1 U587 ( .B0(n470), .B1(n81), .A0N(n380), .A1N(n324), .Y(n534) );
  OAI22XL U588 ( .A0(n84), .A1(n316), .B0(n538), .B1(n539), .Y(n533) );
  AOI2BB2X1 U589 ( .B0(n77), .B1(n540), .A0N(n85), .A1N(n541), .Y(n539) );
  NOR2X1 U590 ( .A(n77), .B(n540), .Y(n541) );
  OAI211X1 U591 ( .A0(n86), .A1(n542), .B0(n543), .C0(n544), .Y(n540) );
  OAI21XL U592 ( .A0(n78), .A1(n305), .B0(n315), .Y(n543) );
  NOR2X1 U593 ( .A(n379), .B(n325), .Y(n538) );
  NAND2X1 U594 ( .A(n82), .B(n467), .Y(n532) );
  NOR2X1 U595 ( .A(n381), .B(\line_buffer[2][7] ), .Y(n546) );
  OAI21XL U596 ( .A0(n552), .A1(n553), .B0(n470), .Y(n551) );
  NAND2X1 U597 ( .A(n552), .B(n553), .Y(n550) );
  AOI32X1 U598 ( .A0(n380), .A1(n547), .A2(\line_buffer[2][4] ), .B0(
        \line_buffer[2][5] ), .B1(n74), .Y(n552) );
  OA22X1 U599 ( .A0(n73), .A1(\line_buffer[2][6] ), .B0(n380), .B1(
        \line_buffer[2][4] ), .Y(n549) );
  OAI2BB1X1 U600 ( .A0N(\line_buffer[2][3] ), .A1N(n379), .B0(n554), .Y(n548)
         );
  OAI22XL U601 ( .A0(n555), .A1(n556), .B0(\line_buffer[2][3] ), .B1(n379), 
        .Y(n554) );
  NOR2X1 U602 ( .A(n557), .B(n558), .Y(n556) );
  AOI21X1 U603 ( .A0(n557), .A1(n558), .B0(n463), .Y(n555) );
  AOI211X1 U604 ( .A0(\line_buffer[2][0] ), .A1(n78), .B0(n559), .C0(n528), 
        .Y(n557) );
  OA21XL U605 ( .A0(\line_buffer[2][0] ), .A1(n527), .B0(\line_buffer[2][1] ), 
        .Y(n559) );
  NAND2BX1 U606 ( .AN(\line_buffer[2][5] ), .B(n467), .Y(n547) );
  NOR2BX1 U607 ( .AN(n96), .B(n381), .Y(n561) );
  OAI21XL U608 ( .A0(n567), .A1(n470), .B0(n97), .Y(n566) );
  NAND2X1 U609 ( .A(n567), .B(n470), .Y(n565) );
  AOI32X1 U610 ( .A0(n380), .A1(n322), .A2(n562), .B0(n308), .B1(n74), .Y(n567) );
  AOI2BB2X1 U611 ( .B0(n470), .B1(n97), .A0N(n380), .A1N(n322), .Y(n564) );
  OAI22XL U612 ( .A0(n100), .A1(n316), .B0(n568), .B1(n569), .Y(n563) );
  ACHCINX2 U613 ( .CIN(n77), .A(n101), .B(n570), .CO(n569) );
  AOI211X1 U614 ( .A0(n527), .A1(n318), .B0(n528), .C0(n571), .Y(n570) );
  AOI2BB1X1 U615 ( .A0N(n78), .A1N(n318), .B0(n103), .Y(n571) );
  NOR2BX1 U616 ( .AN(n100), .B(n379), .Y(n568) );
  NAND2X1 U617 ( .A(n98), .B(n467), .Y(n562) );
  NOR2X1 U618 ( .A(n381), .B(\line_buffer[1][7] ), .Y(n573) );
  OAI21XL U619 ( .A0(n579), .A1(n580), .B0(n470), .Y(n578) );
  NAND2X1 U620 ( .A(n579), .B(n580), .Y(n577) );
  AOI32X1 U621 ( .A0(n380), .A1(n574), .A2(\line_buffer[1][4] ), .B0(
        \line_buffer[1][5] ), .B1(n74), .Y(n579) );
  OA22X1 U622 ( .A0(n73), .A1(\line_buffer[1][6] ), .B0(n380), .B1(
        \line_buffer[1][4] ), .Y(n576) );
  OAI2BB1X1 U623 ( .A0N(\line_buffer[1][3] ), .A1N(n379), .B0(n581), .Y(n575)
         );
  OAI22XL U624 ( .A0(n582), .A1(n583), .B0(\line_buffer[1][3] ), .B1(n379), 
        .Y(n581) );
  NOR2X1 U625 ( .A(n584), .B(n585), .Y(n583) );
  AOI21X1 U626 ( .A0(n584), .A1(n585), .B0(n463), .Y(n582) );
  AOI211X1 U627 ( .A0(\line_buffer[1][0] ), .A1(n78), .B0(n586), .C0(n528), 
        .Y(n584) );
  OA21XL U628 ( .A0(\line_buffer[1][0] ), .A1(n527), .B0(\line_buffer[1][1] ), 
        .Y(n586) );
  NAND2BX1 U629 ( .AN(\line_buffer[1][5] ), .B(n467), .Y(n574) );
  NOR2BX1 U630 ( .AN(n88), .B(n381), .Y(n588) );
  OAI21XL U631 ( .A0(n594), .A1(n470), .B0(n89), .Y(n593) );
  NAND2X1 U632 ( .A(n594), .B(n470), .Y(n592) );
  AOI32X1 U633 ( .A0(n380), .A1(n323), .A2(n589), .B0(n309), .B1(n74), .Y(n594) );
  AOI2BB2X1 U634 ( .B0(n470), .B1(n89), .A0N(n380), .A1N(n323), .Y(n591) );
  OAI22XL U635 ( .A0(n92), .A1(n316), .B0(n595), .B1(n596), .Y(n590) );
  AOI2BB2X1 U636 ( .B0(n77), .B1(n597), .A0N(n93), .A1N(n598), .Y(n596) );
  NOR2X1 U637 ( .A(n77), .B(n597), .Y(n598) );
  OAI211X1 U638 ( .A0(n94), .A1(n542), .B0(n599), .C0(n544), .Y(n597) );
  AO21X1 U639 ( .A0(n460), .A1(n94), .B0(n95), .Y(n599) );
  CLKINVX1 U640 ( .A(n527), .Y(n542) );
  NOR2BX1 U641 ( .AN(n92), .B(n379), .Y(n595) );
  NAND2X1 U642 ( .A(n90), .B(n467), .Y(n589) );
  NOR2X1 U643 ( .A(n381), .B(n327), .Y(n601) );
  OAI21XL U644 ( .A0(n607), .A1(n65), .B0(n470), .Y(n606) );
  NAND2X1 U645 ( .A(n607), .B(n65), .Y(n605) );
  AOI32X1 U646 ( .A0(n380), .A1(n319), .A2(n602), .B0(n306), .B1(n74), .Y(n607) );
  AOI2BB2X1 U647 ( .B0(n470), .B1(n65), .A0N(n380), .A1N(n319), .Y(n604) );
  OAI22XL U648 ( .A0(n68), .A1(n316), .B0(n608), .B1(n609), .Y(n603) );
  ACHCINX2 U649 ( .CIN(n77), .A(n69), .B(n610), .CO(n609) );
  AOI211X1 U650 ( .A0(n527), .A1(n314), .B0(n528), .C0(n611), .Y(n610) );
  AOI2BB1X1 U651 ( .A0N(n78), .A1N(n314), .B0(n71), .Y(n611) );
  NOR2X1 U652 ( .A(n379), .B(n320), .Y(n608) );
  NAND2X1 U653 ( .A(n66), .B(n467), .Y(n602) );
  NOR2X1 U654 ( .A(n381), .B(\line_buffer[0][7] ), .Y(n613) );
  OAI21XL U655 ( .A0(n619), .A1(n620), .B0(n470), .Y(n618) );
  NAND2X1 U656 ( .A(n619), .B(n620), .Y(n617) );
  AOI32X1 U657 ( .A0(n380), .A1(n614), .A2(\line_buffer[0][4] ), .B0(
        \line_buffer[0][5] ), .B1(n74), .Y(n619) );
  OA22X1 U658 ( .A0(n73), .A1(\line_buffer[0][6] ), .B0(n380), .B1(
        \line_buffer[0][4] ), .Y(n616) );
  OAI2BB1X1 U659 ( .A0N(\line_buffer[0][3] ), .A1N(n379), .B0(n621), .Y(n615)
         );
  OAI22XL U660 ( .A0(n622), .A1(n623), .B0(\line_buffer[0][3] ), .B1(n379), 
        .Y(n621) );
  NOR2X1 U661 ( .A(n624), .B(n625), .Y(n623) );
  AOI21X1 U662 ( .A0(n624), .A1(n625), .B0(n463), .Y(n622) );
  AOI211X1 U663 ( .A0(\line_buffer[0][0] ), .A1(n78), .B0(n626), .C0(n528), 
        .Y(n624) );
  CLKINVX1 U664 ( .A(n544), .Y(n528) );
  NAND2X1 U665 ( .A(n79), .B(n78), .Y(n544) );
  OA21XL U666 ( .A0(\line_buffer[0][0] ), .A1(n527), .B0(\line_buffer[0][1] ), 
        .Y(n626) );
  NAND2BX1 U667 ( .AN(\line_buffer[0][5] ), .B(n467), .Y(n614) );
  AOI22X1 U668 ( .A0(N90), .A1(n629), .B0(N111), .B1(n630), .Y(n628) );
  AOI22X1 U669 ( .A0(N89), .A1(n629), .B0(N110), .B1(n630), .Y(n631) );
  AOI22X1 U670 ( .A0(N96), .A1(n634), .B0(N145), .B1(n635), .Y(n639) );
  NAND3X1 U671 ( .A(n455), .B(n439), .C(n492), .Y(n630) );
  NAND3X1 U672 ( .A(n482), .B(n436), .C(n514), .Y(n629) );
  AOI22X1 U673 ( .A0(n312), .A1(n634), .B0(N144), .B1(n635), .Y(n644) );
  NAND3X1 U674 ( .A(n405), .B(n439), .C(n436), .Y(n635) );
  NAND3X1 U675 ( .A(pix_idx[1]), .B(n426), .C(n645), .Y(n436) );
  NAND2X1 U676 ( .A(n645), .B(n418), .Y(n405) );
  NAND3X1 U677 ( .A(n503), .B(n492), .C(n514), .Y(n634) );
  NAND3X1 U678 ( .A(n426), .B(n646), .C(n647), .Y(n514) );
  NAND3X1 U679 ( .A(pix_idx[1]), .B(n426), .C(n647), .Y(n492) );
  NAND3X1 U680 ( .A(pix_idx[0]), .B(n646), .C(n647), .Y(n503) );
  NAND3X1 U681 ( .A(n426), .B(n646), .C(n645), .Y(n472) );
  NAND2X1 U682 ( .A(n647), .B(n418), .Y(n482) );
  CLKINVX1 U683 ( .A(n407), .Y(n418) );
  NAND2X1 U684 ( .A(pix_idx[1]), .B(pix_idx[0]), .Y(n407) );
  NOR2X1 U685 ( .A(pix_idx[3]), .B(pix_idx[2]), .Y(n647) );
  NAND2X1 U686 ( .A(pix_idx[3]), .B(n648), .Y(n643) );
  OAI211X1 U687 ( .A0(n455), .A1(n411), .B0(n650), .C0(n410), .Y(N174) );
  OAI211X1 U688 ( .A0(n651), .A1(n411), .B0(n652), .C0(n653), .Y(N173) );
  NOR2X1 U689 ( .A(N396), .B(n421), .Y(n653) );
  NOR2X1 U690 ( .A(n439), .B(n410), .Y(n421) );
  NAND3X1 U691 ( .A(n515), .B(n654), .C(state[1]), .Y(n410) );
  CLKINVX1 U692 ( .A(n409), .Y(n439) );
  NOR2X1 U693 ( .A(n403), .B(n648), .Y(n409) );
  NAND3X1 U694 ( .A(n646), .B(n408), .C(n426), .Y(n648) );
  NAND2X1 U695 ( .A(state[0]), .B(state[1]), .Y(n424) );
  NAND4X1 U696 ( .A(n670), .B(n671), .C(n669), .D(n655), .Y(n425) );
  NOR4X1 U697 ( .A(n50), .B(n49), .C(n48), .D(n384), .Y(n655) );
  NOR4X1 U698 ( .A(n57), .B(n56), .C(n55), .D(n382), .Y(n656) );
  NAND3X1 U699 ( .A(n515), .B(n657), .C(state[0]), .Y(n411) );
  CLKINVX1 U700 ( .A(reset), .Y(n515) );
  CLKINVX1 U701 ( .A(n455), .Y(n651) );
  NAND3X1 U702 ( .A(pix_idx[0]), .B(n646), .C(n645), .Y(n455) );
  NOR2X1 U703 ( .A(n408), .B(pix_idx[3]), .Y(n645) );
endmodule

