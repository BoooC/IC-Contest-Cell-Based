/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : U-2022.12
// Date      : Sun Jan 26 14:54:57 2025
/////////////////////////////////////////////////////////////


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd;
  wire   n800, n801, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, C1_DATA4_6,
         C1_DATA4_4, C1_DATA4_3, C1_DATA4_2, DP_OP_87J1_122_9642_n136,
         DP_OP_87J1_122_9642_n135, DP_OP_87J1_122_9642_n134,
         DP_OP_87J1_122_9642_n133, DP_OP_87J1_122_9642_n132,
         DP_OP_87J1_122_9642_n131, n179, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694,
         n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n766, n767, n768, n769, n770, n771,
         n772, n773, n774, n775, n776, n777, n778, n779, n780, n781, n782,
         n783, n784, n785, n786, n787, n788, n796, n797, n798, n799;
  wire   [2:0] count;
  wire   [15:0] rom_buffer;
  wire   [1:0] state;
  wire   [1:0] next_state;

  DFFRX4 sti_addr_reg_0_ ( .D(n134), .CK(clk), .RN(n796), .Q(sti_addr[0]), 
        .QN(n760) );
  DFFRX4 sti_addr_reg_3_ ( .D(n127), .CK(clk), .RN(n796), .Q(sti_addr[3]), 
        .QN(n787) );
  DFFRX4 sti_addr_reg_2_ ( .D(n126), .CK(clk), .RN(n796), .Q(sti_addr[2]), 
        .QN(n786) );
  DFFRX4 sti_addr_reg_1_ ( .D(n125), .CK(clk), .RN(n796), .Q(sti_addr[1]), 
        .QN(n761) );
  DFFRX4 min_temp_reg_3_ ( .D(n120), .CK(clk), .RN(n797), .Q(res_do[3]), .QN(
        DP_OP_87J1_122_9642_n135) );
  DFFRX4 min_temp_reg_2_ ( .D(n119), .CK(clk), .RN(n797), .Q(res_do[2]), .QN(
        DP_OP_87J1_122_9642_n136) );
  DFFRX4 min_temp_reg_1_ ( .D(n118), .CK(clk), .RN(n797), .Q(res_do[1]), .QN(
        n183) );
  DFFRX4 back_flag_reg ( .D(n153), .CK(clk), .RN(n797), .Q(n746), .QN(n765) );
  DFFRX4 count_reg_0_ ( .D(n152), .CK(clk), .RN(reset), .Q(count[0]), .QN(n764) );
  DFFRX4 count_reg_1_ ( .D(n151), .CK(clk), .RN(reset), .Q(count[1]), .QN(n756) );
  DFFRX4 res_addr_reg_8_ ( .D(n141), .CK(clk), .RN(reset), .QN(n744) );
  DFFRX4 res_addr_reg_5_ ( .D(n144), .CK(clk), .RN(reset), .Q(res_addr[5]), 
        .QN(n767) );
  DFFRX4 res_addr_reg_1_ ( .D(n149), .CK(clk), .RN(reset), .Q(res_addr[1]), 
        .QN(n769) );
  DFFRX2 res_addr_reg_0_ ( .D(n148), .CK(clk), .RN(reset), .QN(n747) );
  DFFRX2 res_addr_reg_12_ ( .D(n137), .CK(clk), .RN(reset), .Q(n800), .QN(n758) );
  DFFRX2 sti_addr_reg_8_ ( .D(n132), .CK(clk), .RN(n796), .Q(sti_addr[8]), 
        .QN(n749) );
  DFFRX1 rom_buffer_reg_9_ ( .D(n162), .CK(clk), .RN(n798), .Q(rom_buffer[9]), 
        .QN(n773) );
  DFFRX1 rom_buffer_reg_2_ ( .D(n155), .CK(clk), .RN(n797), .Q(rom_buffer[2]), 
        .QN(n780) );
  DFFRX1 rom_buffer_reg_10_ ( .D(n163), .CK(clk), .RN(n798), .Q(rom_buffer[10]), .QN(n778) );
  DFFRX1 rom_buffer_reg_3_ ( .D(n156), .CK(clk), .RN(n797), .Q(rom_buffer[3]), 
        .QN(n777) );
  DFFRX1 rom_buffer_reg_11_ ( .D(n164), .CK(clk), .RN(n798), .Q(rom_buffer[11]), .QN(n775) );
  DFFRX1 rom_buffer_reg_8_ ( .D(n161), .CK(clk), .RN(n798), .Q(rom_buffer[8]), 
        .QN(n782) );
  DFFRX2 rom_buffer_reg_0_ ( .D(n168), .CK(clk), .RN(n798), .Q(rom_buffer[0]), 
        .QN(n742) );
  DFFRX2 count_reg_2_ ( .D(n150), .CK(clk), .RN(n797), .Q(count[2]), .QN(n755)
         );
  DFFRX2 min_temp_reg_4_ ( .D(n121), .CK(clk), .RN(n797), .Q(res_do[4]), .QN(
        DP_OP_87J1_122_9642_n134) );
  DFFRX2 res_addr_reg_2_ ( .D(n147), .CK(clk), .RN(reset), .Q(C1_DATA4_2), 
        .QN(n750) );
  DFFRX4 sti_addr_reg_4_ ( .D(n128), .CK(clk), .RN(n796), .Q(sti_addr[4]), 
        .QN(n784) );
  DFFRX4 res_addr_reg_9_ ( .D(n140), .CK(clk), .RN(reset), .Q(res_addr[9]), 
        .QN(n762) );
  DFFRX2 min_temp_reg_5_ ( .D(n122), .CK(clk), .RN(n797), .Q(res_do[5]), .QN(
        DP_OP_87J1_122_9642_n133) );
  DFFRX2 min_temp_reg_0_ ( .D(n117), .CK(clk), .RN(n797), .Q(res_do[0]), .QN(
        n788) );
  DFFRX4 res_addr_reg_13_ ( .D(n799), .CK(clk), .RN(reset), .Q(res_addr[13]), 
        .QN(n771) );
  DFFRX2 res_addr_reg_3_ ( .D(n146), .CK(clk), .RN(reset), .Q(C1_DATA4_3), 
        .QN(n768) );
  DFFRX4 sti_addr_reg_5_ ( .D(n129), .CK(clk), .RN(n796), .Q(sti_addr[5]), 
        .QN(n770) );
  DFFRX2 min_temp_reg_7_ ( .D(n124), .CK(clk), .RN(n796), .Q(res_do[7]), .QN(
        DP_OP_87J1_122_9642_n131) );
  DFFRX2 min_temp_reg_6_ ( .D(n123), .CK(clk), .RN(n796), .Q(res_do[6]), .QN(
        DP_OP_87J1_122_9642_n132) );
  DFFRX2 res_addr_reg_6_ ( .D(n143), .CK(clk), .RN(reset), .Q(C1_DATA4_6), 
        .QN(n752) );
  DFFRX2 sti_addr_reg_9_ ( .D(n133), .CK(clk), .RN(n796), .Q(sti_addr[9]), 
        .QN(n766) );
  DFFRX2 res_addr_reg_7_ ( .D(n142), .CK(clk), .RN(reset), .Q(n801), .QN(n754)
         );
  DFFRX2 res_addr_reg_4_ ( .D(n145), .CK(clk), .RN(reset), .Q(C1_DATA4_4), 
        .QN(n745) );
  DFFRX2 rom_buffer_reg_15_ ( .D(n169), .CK(clk), .RN(n798), .Q(rom_buffer[15]), .QN(n757) );
  DFFRX4 sti_addr_reg_6_ ( .D(n130), .CK(clk), .RN(n796), .Q(sti_addr[6]), 
        .QN(n748) );
  DFFRX1 rom_buffer_reg_1_ ( .D(n154), .CK(clk), .RN(n797), .Q(rom_buffer[1])
         );
  DFFRX1 rom_buffer_reg_14_ ( .D(n167), .CK(clk), .RN(n798), .Q(rom_buffer[14]), .QN(n785) );
  DFFRX4 res_addr_reg_11_ ( .D(n138), .CK(clk), .RN(reset), .Q(res_addr[11]), 
        .QN(n753) );
  DFFRX4 sti_addr_reg_7_ ( .D(n131), .CK(clk), .RN(n796), .Q(sti_addr[7]), 
        .QN(n743) );
  DFFRX4 res_addr_reg_10_ ( .D(n139), .CK(clk), .RN(reset), .Q(res_addr[10]), 
        .QN(n759) );
  DFFRX1 state_reg_0_ ( .D(next_state[0]), .CK(clk), .RN(reset), .Q(state[0]), 
        .QN(n751) );
  DFFRX1 rom_buffer_reg_7_ ( .D(n160), .CK(clk), .RN(n798), .Q(rom_buffer[7]), 
        .QN(n776) );
  DFFRX2 state_reg_1_ ( .D(next_state[1]), .CK(clk), .RN(n798), .Q(state[1]), 
        .QN(n763) );
  DFFRX1 rom_buffer_reg_12_ ( .D(n165), .CK(clk), .RN(n798), .Q(rom_buffer[12]), .QN(n781) );
  DFFRX1 rom_buffer_reg_5_ ( .D(n158), .CK(clk), .RN(n798), .Q(rom_buffer[5]), 
        .QN(n774) );
  DFFRX1 rom_buffer_reg_6_ ( .D(n159), .CK(clk), .RN(n798), .Q(rom_buffer[6]), 
        .QN(n779) );
  DFFRX1 rom_buffer_reg_13_ ( .D(n166), .CK(clk), .RN(n798), .Q(rom_buffer[13]), .QN(n772) );
  DFFRX1 rom_buffer_reg_4_ ( .D(n157), .CK(clk), .RN(n797), .Q(rom_buffer[4]), 
        .QN(n783) );
  OAI21XL U187 ( .A0(n522), .A1(n787), .B0(n194), .Y(n127) );
  OAI21XL U188 ( .A0(n522), .A1(n784), .B0(n664), .Y(n128) );
  OAI21XL U189 ( .A0(n522), .A1(n749), .B0(n524), .Y(n132) );
  OAI2BB1X1 U190 ( .A0N(n316), .A1N(n303), .B0(n302), .Y(n123) );
  OAI2BB1X1 U191 ( .A0N(n316), .A1N(n291), .B0(n290), .Y(n121) );
  OAI21X2 U192 ( .A0(n255), .A1(n788), .B0(n254), .Y(n117) );
  AOI2BB1X2 U193 ( .A0N(res_addr[8]), .A1N(n330), .B0(n415), .Y(n141) );
  OAI222X1 U194 ( .A0(n757), .A1(n419), .B0(n418), .B1(n417), .C0(n785), .C1(
        n416), .Y(n169) );
  OAI21XL U195 ( .A0(count[1]), .A1(res_wr), .B0(n553), .Y(n551) );
  INVX1 U196 ( .A(n395), .Y(n419) );
  OAI21XL U197 ( .A0(n680), .A1(n679), .B0(n678), .Y(n681) );
  AOI222X1 U198 ( .A0(rom_buffer[1]), .A1(n265), .B0(n395), .B1(rom_buffer[0]), 
        .C0(n678), .C1(sti_di[0]), .Y(n266) );
  AOI22X1 U199 ( .A0(n313), .A1(res_do[3]), .B0(n312), .B1(n285), .Y(n252) );
  NAND2X1 U200 ( .A(n503), .B(n522), .Y(n504) );
  AOI22X1 U201 ( .A0(n313), .A1(res_do[2]), .B0(n312), .B1(n286), .Y(n247) );
  NOR2X1 U202 ( .A(n555), .B(n547), .Y(n553) );
  NOR2X1 U203 ( .A(n305), .B(n304), .Y(n307) );
  NOR2X2 U204 ( .A(n292), .B(n297), .Y(n293) );
  INVX1 U205 ( .A(n287), .Y(n249) );
  CLKINVX1 U206 ( .A(n300), .Y(n292) );
  NAND2X1 U207 ( .A(n706), .B(n400), .Y(n408) );
  INVX1 U208 ( .A(n301), .Y(n304) );
  NAND2X1 U209 ( .A(n706), .B(n360), .Y(n376) );
  INVX1 U210 ( .A(n492), .Y(n669) );
  OAI21X1 U211 ( .A0(n508), .A1(n497), .B0(n496), .Y(n521) );
  XOR2X1 U212 ( .A(n423), .B(n762), .Y(n424) );
  NOR2X1 U213 ( .A(n298), .B(n297), .Y(n299) );
  NAND2X1 U214 ( .A(n286), .B(n285), .Y(n288) );
  CLKBUFX8 U215 ( .A(n456), .Y(n330) );
  AOI21X1 U216 ( .A0(n493), .A1(n492), .B0(n491), .Y(n508) );
  OR2X4 U217 ( .A(n445), .B(res_addr[11]), .Y(n714) );
  NAND2X1 U218 ( .A(n707), .B(res_addr[10]), .Y(n379) );
  NAND3X2 U219 ( .A(n337), .B(n336), .C(n335), .Y(n341) );
  NOR2X1 U220 ( .A(n470), .B(n469), .Y(n717) );
  NOR2BX1 U221 ( .AN(n339), .B(n742), .Y(n340) );
  CLKBUFX3 U222 ( .A(res_di[0]), .Y(n310) );
  NAND2X1 U223 ( .A(n458), .B(n698), .Y(n461) );
  NOR2X1 U224 ( .A(n620), .B(n752), .Y(n578) );
  NAND2X2 U225 ( .A(n362), .B(res_rd), .Y(n262) );
  NOR2X1 U226 ( .A(res_addr[8]), .B(res_addr[9]), .Y(n698) );
  AND2X4 U227 ( .A(n332), .B(n331), .Y(n337) );
  NOR2X4 U228 ( .A(n227), .B(n208), .Y(n209) );
  OAI21X2 U229 ( .A0(n227), .A1(n226), .B0(n225), .Y(n235) );
  INVX3 U230 ( .A(res_di[0]), .Y(n334) );
  OAI21X2 U231 ( .A0(n212), .A1(n211), .B0(n210), .Y(n222) );
  INVX8 U232 ( .A(res_di[4]), .Y(n297) );
  NAND2X4 U233 ( .A(n257), .B(n256), .Y(res_rd) );
  NOR2X1 U234 ( .A(n377), .B(n620), .Y(n359) );
  NOR2X2 U235 ( .A(res_di[1]), .B(res_do[1]), .Y(n212) );
  NAND2X1 U236 ( .A(res_di[0]), .B(n788), .Y(n211) );
  NAND2X1 U237 ( .A(res_di[1]), .B(res_do[1]), .Y(n210) );
  NAND2X1 U238 ( .A(res_di[2]), .B(n215), .Y(n218) );
  NOR2X4 U239 ( .A(res_di[5]), .B(n224), .Y(n227) );
  NAND2X1 U240 ( .A(res_di[4]), .B(n223), .Y(n226) );
  NOR2X2 U241 ( .A(res_di[3]), .B(n216), .Y(n219) );
  INVX1 U242 ( .A(n386), .Y(n328) );
  ADDHX1 U243 ( .A(DP_OP_87J1_122_9642_n132), .B(n204), .CO(n230), .S(n228) );
  BUFX4 U244 ( .A(res_di[6]), .Y(n301) );
  BUFX4 U245 ( .A(C1_DATA4_3), .Y(res_addr[3]) );
  BUFX4 U246 ( .A(res_di[2]), .Y(n286) );
  CLKBUFX8 U247 ( .A(res_di[3]), .Y(n285) );
  INVX1 U248 ( .A(n370), .Y(n242) );
  NOR2XL U249 ( .A(sti_addr[6]), .B(sti_addr[7]), .Y(n467) );
  INVXL U250 ( .A(n403), .Y(n401) );
  INVXL U251 ( .A(n698), .Y(n699) );
  NOR2XL U252 ( .A(n624), .B(sti_addr[2]), .Y(n583) );
  NOR2XL U253 ( .A(n531), .B(n538), .Y(n494) );
  CLKINVX1 U254 ( .A(n469), .Y(n427) );
  NOR2XL U255 ( .A(n700), .B(n699), .Y(n701) );
  NAND2XL U256 ( .A(n728), .B(n462), .Y(n463) );
  NAND2XL U257 ( .A(sti_addr[8]), .B(n746), .Y(n518) );
  NOR2X1 U258 ( .A(n765), .B(count[1]), .Y(n386) );
  NAND2XL U259 ( .A(n708), .B(n707), .Y(n709) );
  AOI21XL U260 ( .A0(n754), .A1(n725), .B0(n657), .Y(n592) );
  NAND2XL U261 ( .A(n637), .B(res_addr[2]), .Y(n638) );
  NAND2XL U262 ( .A(n437), .B(n388), .Y(n438) );
  AOI211XL U263 ( .A0(n721), .A1(res_addr[0]), .B0(n185), .C0(n689), .Y(n556)
         );
  NAND3XL U264 ( .A(n454), .B(n453), .C(n771), .Y(n483) );
  INVXL U265 ( .A(n549), .Y(n545) );
  INVXL U266 ( .A(res_di[1]), .Y(n311) );
  NAND2XL U267 ( .A(n179), .B(rom_buffer[2]), .Y(n324) );
  NOR3XL U268 ( .A(n202), .B(n679), .C(n751), .Y(n203) );
  NAND4X1 U269 ( .A(n189), .B(n188), .C(n187), .D(n186), .Y(n682) );
  NOR2XL U270 ( .A(n755), .B(count[1]), .Y(n256) );
  AOI2BB2X1 U271 ( .B0(n712), .B1(n711), .A0N(res_addr[10]), .A1N(n330), .Y(
        n139) );
  CLKINVX1 U272 ( .A(n266), .Y(n168) );
  AOI211XL U273 ( .A0(n764), .A1(n555), .B0(n554), .C0(n553), .Y(n152) );
  INVX6 U274 ( .A(n184), .Y(n736) );
  NOR2X6 U275 ( .A(n241), .B(n240), .Y(n243) );
  INVX4 U276 ( .A(res_rd), .Y(res_wr) );
  OAI21X2 U277 ( .A0(n451), .A1(n452), .B0(n683), .Y(n329) );
  NAND2XL U278 ( .A(n452), .B(n683), .Y(n453) );
  INVX3 U279 ( .A(n579), .Y(n621) );
  NAND2X2 U280 ( .A(n285), .B(n216), .Y(n217) );
  NOR2X4 U281 ( .A(n451), .B(n387), .Y(n388) );
  NAND2X2 U282 ( .A(n300), .B(n299), .Y(n305) );
  INVX8 U283 ( .A(n367), .Y(n417) );
  INVX12 U284 ( .A(n765), .Y(n380) );
  NOR2X8 U285 ( .A(n763), .B(state[0]), .Y(n683) );
  CLKINVX1 U286 ( .A(n286), .Y(n245) );
  CLKINVX1 U287 ( .A(n285), .Y(n250) );
  CLKINVX1 U288 ( .A(res_di[7]), .Y(n306) );
  INVX4 U289 ( .A(n294), .Y(n298) );
  OAI2BB1X2 U290 ( .A0N(n316), .A1N(n315), .B0(n314), .Y(n118) );
  INVX16 U291 ( .A(n317), .Y(n179) );
  AOI211X2 U292 ( .A0(n706), .A1(n705), .B0(n704), .C0(n703), .Y(n712) );
  INVX8 U293 ( .A(n184), .Y(n706) );
  INVX1 U294 ( .A(n552), .Y(n554) );
  OAI21X1 U295 ( .A0(n522), .A1(n748), .B0(n529), .Y(n130) );
  NAND2X4 U296 ( .A(n236), .B(n209), .Y(n239) );
  NOR2X1 U297 ( .A(n726), .B(n800), .Y(n460) );
  INVX6 U298 ( .A(n456), .Y(n657) );
  NOR2X4 U299 ( .A(n301), .B(n228), .Y(n205) );
  NAND2X4 U300 ( .A(n329), .B(n417), .Y(n456) );
  XNOR2X1 U301 ( .A(n293), .B(n298), .Y(n296) );
  XNOR2X1 U302 ( .A(n307), .B(n306), .Y(n309) );
  ADDHX1 U303 ( .A(n206), .B(DP_OP_87J1_122_9642_n133), .CO(n204), .S(n224) );
  INVX3 U304 ( .A(n244), .Y(n333) );
  NOR2X4 U305 ( .A(n214), .B(n219), .Y(n221) );
  XOR2X1 U306 ( .A(n251), .B(n250), .Y(n253) );
  XOR2X1 U307 ( .A(n305), .B(n304), .Y(n303) );
  NOR2X8 U308 ( .A(n682), .B(n417), .Y(n522) );
  ADDHX1 U309 ( .A(DP_OP_87J1_122_9642_n134), .B(n207), .CO(n206), .S(n223) );
  NAND2X2 U310 ( .A(n249), .B(n286), .Y(n251) );
  XNOR2X1 U311 ( .A(n249), .B(n245), .Y(n248) );
  INVX1 U312 ( .A(n582), .Y(n624) );
  INVX4 U313 ( .A(n683), .Y(n448) );
  NOR2X4 U314 ( .A(n286), .B(n215), .Y(n214) );
  NAND2X4 U315 ( .A(res_addr[0]), .B(res_addr[1]), .Y(n565) );
  XNOR2X1 U316 ( .A(n311), .B(n310), .Y(n315) );
  NOR2X4 U317 ( .A(n288), .B(n287), .Y(n300) );
  INVX8 U318 ( .A(n750), .Y(res_addr[2]) );
  CLKINVX2 U319 ( .A(n745), .Y(res_addr[4]) );
  CLKINVX2 U320 ( .A(n758), .Y(res_addr[12]) );
  INVX6 U321 ( .A(n747), .Y(res_addr[0]) );
  NOR2X6 U322 ( .A(n751), .B(state[1]), .Y(n367) );
  ADDHX1 U323 ( .A(DP_OP_87J1_122_9642_n136), .B(n183), .CO(n213), .S(n215) );
  OAI2BB1X2 U324 ( .A0N(n316), .A1N(n296), .B0(n295), .Y(n122) );
  AOI21X2 U325 ( .A0(n738), .A1(n443), .B0(n442), .Y(n444) );
  AOI211X2 U326 ( .A0(n732), .A1(n393), .B0(n392), .C0(n391), .Y(n394) );
  AOI211X2 U327 ( .A0(n732), .A1(n414), .B0(n413), .C0(n412), .Y(n415) );
  INVX16 U328 ( .A(n255), .Y(n313) );
  NAND3X2 U329 ( .A(n408), .B(n407), .C(n406), .Y(n413) );
  NAND4X2 U330 ( .A(n441), .B(n440), .C(n439), .D(n438), .Y(n442) );
  MXI2X4 U331 ( .A(n316), .B(n312), .S0(n310), .Y(n254) );
  AOI211X2 U332 ( .A0(n736), .A1(n735), .B0(n734), .C0(n733), .Y(n741) );
  INVX3 U333 ( .A(n398), .Y(n265) );
  OAI21X1 U334 ( .A0(res_addr[0]), .A1(n330), .B0(n559), .Y(n562) );
  OAI21X1 U335 ( .A0(res_addr[3]), .A1(n330), .B0(n643), .Y(n646) );
  OAI2BB1X2 U336 ( .A0N(n725), .A1N(n724), .B0(n723), .Y(n734) );
  OAI2BB1X2 U337 ( .A0N(n388), .A1N(n697), .B0(n696), .Y(n704) );
  AOI211X1 U338 ( .A0(n721), .A1(n695), .B0(n694), .C0(n693), .Y(n696) );
  AOI211X1 U339 ( .A0(n722), .A1(n721), .B0(n720), .C0(n719), .Y(n723) );
  OAI21X1 U340 ( .A0(n522), .A1(n766), .B0(n504), .Y(n133) );
  NAND2X4 U341 ( .A(n341), .B(n340), .Y(n344) );
  NOR2X6 U342 ( .A(n233), .B(n205), .Y(n236) );
  XOR2X1 U343 ( .A(n701), .B(res_addr[10]), .Y(n702) );
  NAND2X1 U344 ( .A(n516), .B(n522), .Y(n517) );
  XNOR2X1 U345 ( .A(n726), .B(n800), .Y(n731) );
  NAND2X4 U346 ( .A(n301), .B(n228), .Y(n232) );
  INVX1 U347 ( .A(n483), .Y(n455) );
  NOR2X6 U348 ( .A(n229), .B(n230), .Y(n233) );
  NAND2X4 U349 ( .A(n294), .B(n224), .Y(n225) );
  XNOR2X1 U350 ( .A(n192), .B(n191), .Y(n193) );
  NOR2X2 U351 ( .A(n399), .B(n379), .Y(n481) );
  OAI21X2 U352 ( .A0(n219), .A1(n218), .B0(n217), .Y(n220) );
  NOR2X4 U353 ( .A(n576), .B(n347), .Y(n459) );
  NOR2X6 U354 ( .A(n289), .B(n223), .Y(n208) );
  INVX1 U355 ( .A(n383), .Y(n384) );
  NAND2X1 U356 ( .A(n507), .B(n765), .Y(n153) );
  INVX8 U357 ( .A(n417), .Y(n678) );
  XOR2X1 U358 ( .A(n762), .B(n425), .Y(n426) );
  INVX1 U359 ( .A(n447), .Y(n449) );
  NOR2X4 U360 ( .A(res_addr[0]), .B(res_addr[1]), .Y(n564) );
  INVX1 U361 ( .A(n665), .Y(n667) );
  INVX1 U362 ( .A(n489), .Y(n190) );
  INVX1 U363 ( .A(n672), .Y(n674) );
  INVX1 U364 ( .A(n518), .Y(n498) );
  INVX1 U365 ( .A(n538), .Y(n540) );
  INVX1 U366 ( .A(n531), .Y(n525) );
  INVX1 U367 ( .A(n659), .Y(n510) );
  INVX1 U368 ( .A(n511), .Y(n513) );
  INVX1 U369 ( .A(res_addr[2]), .Y(n566) );
  INVX1 U370 ( .A(sti_di[15]), .Y(n418) );
  CLKINVX2 U371 ( .A(1'b0), .Y(sti_rd) );
  NOR4XL U373 ( .A(sti_addr[2]), .B(sti_addr[0]), .C(sti_addr[8]), .D(
        sti_addr[4]), .Y(n199) );
  NAND4XL U374 ( .A(n506), .B(n505), .C(sti_addr[9]), .D(n787), .Y(n507) );
  AOI22XL U375 ( .A0(n472), .A1(n185), .B0(n689), .B1(sti_addr[9]), .Y(n473)
         );
  NAND2XL U376 ( .A(sti_addr[9]), .B(n746), .Y(n499) );
  NOR2X1 U377 ( .A(sti_addr[7]), .B(n746), .Y(n538) );
  XNOR2XL U378 ( .A(n714), .B(n800), .Y(n724) );
  NAND2XL U379 ( .A(n715), .B(n800), .Y(n466) );
  NOR2XL U380 ( .A(n461), .B(n800), .Y(n462) );
  AOI2BB1X1 U381 ( .A0N(res_addr[11]), .A1N(n330), .B0(n394), .Y(n138) );
  INVX6 U382 ( .A(n744), .Y(res_addr[8]) );
  NAND2X4 U383 ( .A(n552), .B(n357), .Y(n184) );
  CLKAND2X3 U384 ( .A(n678), .B(n765), .Y(n185) );
  ADDHX1 U385 ( .A(DP_OP_87J1_122_9642_n135), .B(n213), .CO(n207), .S(n216) );
  NAND2X2 U386 ( .A(n230), .B(n229), .Y(n231) );
  NOR2X2 U387 ( .A(sti_addr[1]), .B(sti_addr[0]), .Y(n582) );
  NOR2X1 U388 ( .A(n691), .B(sti_addr[6]), .Y(n366) );
  NOR2X1 U389 ( .A(n509), .B(n511), .Y(n530) );
  NAND2X1 U390 ( .A(n530), .B(n494), .Y(n497) );
  AOI21X1 U391 ( .A0(n521), .A1(n519), .B0(n498), .Y(n502) );
  NOR2X1 U392 ( .A(n713), .B(n758), .Y(n482) );
  NAND2X1 U393 ( .A(n736), .B(n424), .Y(n440) );
  NAND2X2 U394 ( .A(res_di[1]), .B(n310), .Y(n287) );
  OAI2BB1X1 U395 ( .A0N(n630), .A1N(n732), .B0(n629), .Y(n631) );
  OAI2BB1X1 U396 ( .A0N(n721), .A1N(n474), .B0(n473), .Y(n475) );
  AND2X2 U397 ( .A(n702), .B(n732), .Y(n703) );
  OAI21X1 U398 ( .A0(C1_DATA4_4), .A1(n330), .B0(n616), .Y(n617) );
  OAI21X1 U399 ( .A0(res_addr[7]), .A1(n330), .B0(n594), .Y(n595) );
  AOI211X1 U400 ( .A0(n732), .A1(n477), .B0(n476), .C0(n475), .Y(n487) );
  XOR2X1 U401 ( .A(n292), .B(n297), .Y(n291) );
  AOI22X1 U402 ( .A0(n313), .A1(res_do[1]), .B0(n312), .B1(res_di[1]), .Y(n314) );
  OAI2BB1X2 U403 ( .A0N(n316), .A1N(n309), .B0(n308), .Y(n124) );
  NOR4X1 U404 ( .A(rom_buffer[1]), .B(rom_buffer[2]), .C(rom_buffer[3]), .D(
        rom_buffer[4]), .Y(n189) );
  NOR4X1 U405 ( .A(rom_buffer[5]), .B(rom_buffer[6]), .C(rom_buffer[7]), .D(
        rom_buffer[8]), .Y(n188) );
  NOR4X1 U406 ( .A(rom_buffer[9]), .B(rom_buffer[10]), .C(rom_buffer[11]), .D(
        rom_buffer[12]), .Y(n187) );
  NOR4X1 U407 ( .A(rom_buffer[13]), .B(rom_buffer[15]), .C(rom_buffer[0]), .D(
        rom_buffer[14]), .Y(n186) );
  NOR2X2 U408 ( .A(sti_addr[1]), .B(n746), .Y(n672) );
  NAND2X1 U409 ( .A(sti_addr[1]), .B(n746), .Y(n673) );
  OAI21X1 U410 ( .A0(n672), .A1(n760), .B0(n673), .Y(n492) );
  NOR2X1 U411 ( .A(sti_addr[2]), .B(n746), .Y(n665) );
  NAND2X1 U412 ( .A(sti_addr[2]), .B(n746), .Y(n666) );
  OAI21XL U413 ( .A0(n669), .A1(n665), .B0(n666), .Y(n192) );
  NOR2X1 U414 ( .A(sti_addr[3]), .B(n746), .Y(n489) );
  NAND2X1 U415 ( .A(sti_addr[3]), .B(n746), .Y(n490) );
  NAND2X1 U416 ( .A(n190), .B(n490), .Y(n191) );
  NAND2X1 U417 ( .A(n193), .B(n522), .Y(n194) );
  INVX6 U418 ( .A(n754), .Y(res_addr[7]) );
  NOR4X1 U419 ( .A(sti_di[4]), .B(sti_di[3]), .C(sti_di[2]), .D(sti_di[1]), 
        .Y(n198) );
  NOR4X1 U420 ( .A(sti_di[8]), .B(sti_di[7]), .C(sti_di[6]), .D(sti_di[5]), 
        .Y(n197) );
  NOR4X1 U421 ( .A(sti_di[12]), .B(sti_di[11]), .C(sti_di[10]), .D(sti_di[9]), 
        .Y(n196) );
  NOR4X1 U422 ( .A(sti_di[15]), .B(sti_di[0]), .C(sti_di[14]), .D(sti_di[13]), 
        .Y(n195) );
  NAND4X1 U423 ( .A(n198), .B(n197), .C(n196), .D(n195), .Y(n680) );
  CLKINVX2 U424 ( .A(n680), .Y(n202) );
  NAND4X1 U425 ( .A(n199), .B(n380), .C(n748), .D(n766), .Y(n201) );
  NAND2X1 U426 ( .A(n743), .B(sti_addr[3]), .Y(n200) );
  NOR4X1 U427 ( .A(n201), .B(sti_addr[5]), .C(sti_addr[1]), .D(n200), .Y(n679)
         );
  OAI22X1 U428 ( .A0(n203), .A1(state[1]), .B0(state[0]), .B1(n682), .Y(
        next_state[0]) );
  CLKBUFX3 U429 ( .A(res_di[4]), .Y(n289) );
  AOI21X4 U430 ( .A0(n222), .A1(n221), .B0(n220), .Y(n238) );
  BUFX4 U431 ( .A(res_di[5]), .Y(n294) );
  OAI21X4 U432 ( .A0(n233), .A1(n232), .B0(n231), .Y(n234) );
  AOI21X4 U433 ( .A0(n236), .A1(n235), .B0(n234), .Y(n237) );
  OAI21X4 U434 ( .A0(n239), .A1(n238), .B0(n237), .Y(n241) );
  CMPR22X4 U435 ( .A(DP_OP_87J1_122_9642_n131), .B(res_di[7]), .CO(n240), .S(
        n229) );
  NOR2X4 U436 ( .A(count[0]), .B(count[1]), .Y(n370) );
  NOR2X4 U437 ( .A(n242), .B(count[2]), .Y(n244) );
  NOR2X8 U438 ( .A(n243), .B(n244), .Y(n246) );
  NOR2X2 U439 ( .A(n333), .B(n765), .Y(n258) );
  NOR3X8 U440 ( .A(n246), .B(n258), .C(n448), .Y(n316) );
  NOR2X8 U441 ( .A(n246), .B(n448), .Y(n255) );
  NAND2X1 U442 ( .A(n683), .B(n380), .Y(n342) );
  NOR2X1 U443 ( .A(n342), .B(n333), .Y(n352) );
  BUFX4 U444 ( .A(n352), .Y(n312) );
  OAI2BB1X2 U445 ( .A0N(n316), .A1N(n248), .B0(n247), .Y(n119) );
  OAI2BB1X2 U446 ( .A0N(n316), .A1N(n253), .B0(n252), .Y(n120) );
  XNOR2X1 U447 ( .A(count[0]), .B(n380), .Y(n257) );
  NOR2X6 U448 ( .A(res_di[3]), .B(res_di[2]), .Y(n331) );
  AND2X8 U449 ( .A(n331), .B(n297), .Y(n351) );
  NOR2X4 U450 ( .A(n334), .B(res_di[1]), .Y(n349) );
  MXI2X4 U451 ( .A(rom_buffer[15]), .B(rom_buffer[0]), .S0(n380), .Y(n451) );
  INVX3 U452 ( .A(n451), .Y(n362) );
  AOI21X4 U453 ( .A0(n351), .A1(n349), .B0(n262), .Y(n264) );
  NOR2X4 U454 ( .A(res_di[7]), .B(res_di[6]), .Y(n261) );
  INVX1 U455 ( .A(n258), .Y(n259) );
  NOR2X4 U456 ( .A(res_di[5]), .B(n259), .Y(n260) );
  AND2X8 U457 ( .A(n261), .B(n260), .Y(n350) );
  OAI21X4 U458 ( .A0(n350), .A1(n262), .B0(n683), .Y(n263) );
  NOR2X8 U459 ( .A(n264), .B(n263), .Y(n267) );
  NAND2X6 U460 ( .A(n267), .B(n380), .Y(n398) );
  NOR2X8 U461 ( .A(n267), .B(n367), .Y(n395) );
  AOI22X1 U462 ( .A0(n395), .A1(rom_buffer[14]), .B0(n678), .B1(sti_di[14]), 
        .Y(n270) );
  INVX8 U463 ( .A(n267), .Y(n268) );
  OR2X8 U464 ( .A(n268), .B(n380), .Y(n317) );
  NAND2X1 U465 ( .A(n179), .B(rom_buffer[13]), .Y(n269) );
  OAI211X1 U466 ( .A0(n398), .A1(n757), .B0(n270), .C0(n269), .Y(n167) );
  AOI22X1 U467 ( .A0(n395), .A1(rom_buffer[13]), .B0(n678), .B1(sti_di[13]), 
        .Y(n272) );
  NAND2X1 U468 ( .A(n179), .B(rom_buffer[12]), .Y(n271) );
  OAI211X1 U469 ( .A0(n398), .A1(n785), .B0(n272), .C0(n271), .Y(n166) );
  AOI22X1 U470 ( .A0(n395), .A1(rom_buffer[11]), .B0(n678), .B1(sti_di[11]), 
        .Y(n274) );
  NAND2X1 U471 ( .A(n179), .B(rom_buffer[10]), .Y(n273) );
  OAI211X1 U472 ( .A0(n398), .A1(n781), .B0(n274), .C0(n273), .Y(n164) );
  AOI22X1 U473 ( .A0(n395), .A1(rom_buffer[10]), .B0(n678), .B1(sti_di[10]), 
        .Y(n276) );
  NAND2X1 U474 ( .A(n179), .B(rom_buffer[9]), .Y(n275) );
  OAI211X1 U475 ( .A0(n398), .A1(n775), .B0(n276), .C0(n275), .Y(n163) );
  AOI22X1 U476 ( .A0(n395), .A1(rom_buffer[8]), .B0(n678), .B1(sti_di[8]), .Y(
        n278) );
  NAND2X1 U477 ( .A(n179), .B(rom_buffer[7]), .Y(n277) );
  OAI211X1 U478 ( .A0(n398), .A1(n773), .B0(n278), .C0(n277), .Y(n161) );
  AOI22X1 U479 ( .A0(n395), .A1(rom_buffer[7]), .B0(n678), .B1(sti_di[7]), .Y(
        n280) );
  NAND2X1 U480 ( .A(n179), .B(rom_buffer[6]), .Y(n279) );
  OAI211X1 U481 ( .A0(n398), .A1(n782), .B0(n280), .C0(n279), .Y(n160) );
  AOI22X1 U482 ( .A0(n395), .A1(rom_buffer[5]), .B0(n678), .B1(sti_di[5]), .Y(
        n282) );
  NAND2X1 U483 ( .A(n179), .B(rom_buffer[4]), .Y(n281) );
  OAI211X1 U484 ( .A0(n398), .A1(n779), .B0(n282), .C0(n281), .Y(n158) );
  AOI22X1 U485 ( .A0(n395), .A1(rom_buffer[4]), .B0(n678), .B1(sti_di[4]), .Y(
        n284) );
  NAND2X1 U486 ( .A(n179), .B(rom_buffer[3]), .Y(n283) );
  OAI211X1 U487 ( .A0(n398), .A1(n774), .B0(n284), .C0(n283), .Y(n157) );
  AOI22X2 U488 ( .A0(n313), .A1(res_do[4]), .B0(n312), .B1(n289), .Y(n290) );
  AOI22X2 U489 ( .A0(n313), .A1(res_do[5]), .B0(n312), .B1(n294), .Y(n295) );
  AOI22X2 U490 ( .A0(n313), .A1(res_do[6]), .B0(n312), .B1(n301), .Y(n302) );
  AOI22X2 U491 ( .A0(n313), .A1(res_do[7]), .B0(n312), .B1(res_di[7]), .Y(n308) );
  AOI22X1 U492 ( .A0(n395), .A1(rom_buffer[12]), .B0(n678), .B1(sti_di[12]), 
        .Y(n319) );
  NAND2X1 U493 ( .A(n179), .B(rom_buffer[11]), .Y(n318) );
  OAI211X1 U494 ( .A0(n398), .A1(n772), .B0(n319), .C0(n318), .Y(n165) );
  AOI22X1 U495 ( .A0(n395), .A1(rom_buffer[9]), .B0(n678), .B1(sti_di[9]), .Y(
        n321) );
  NAND2X1 U496 ( .A(n179), .B(rom_buffer[8]), .Y(n320) );
  OAI211X1 U497 ( .A0(n398), .A1(n778), .B0(n321), .C0(n320), .Y(n162) );
  AOI22X1 U498 ( .A0(n395), .A1(rom_buffer[6]), .B0(n678), .B1(sti_di[6]), .Y(
        n323) );
  NAND2X1 U499 ( .A(n179), .B(rom_buffer[5]), .Y(n322) );
  OAI211X1 U500 ( .A0(n398), .A1(n776), .B0(n323), .C0(n322), .Y(n159) );
  AOI22X1 U501 ( .A0(n395), .A1(rom_buffer[3]), .B0(n678), .B1(sti_di[3]), .Y(
        n325) );
  OAI211X1 U502 ( .A0(n398), .A1(n783), .B0(n325), .C0(n324), .Y(n156) );
  AOI22X1 U503 ( .A0(n395), .A1(rom_buffer[1]), .B0(n678), .B1(sti_di[1]), .Y(
        n327) );
  NAND2X1 U504 ( .A(n179), .B(rom_buffer[0]), .Y(n326) );
  OAI211X1 U505 ( .A0(n398), .A1(n780), .B0(n327), .C0(n326), .Y(n154) );
  INVX4 U506 ( .A(n752), .Y(res_addr[6]) );
  NAND2X2 U507 ( .A(n328), .B(count[2]), .Y(n452) );
  NOR2X4 U508 ( .A(res_di[7]), .B(res_di[5]), .Y(n332) );
  NOR3X4 U509 ( .A(n334), .B(res_di[4]), .C(n333), .Y(n336) );
  NOR2X2 U510 ( .A(res_di[6]), .B(res_di[1]), .Y(n335) );
  NAND2X2 U511 ( .A(n683), .B(count[0]), .Y(n381) );
  NOR2X1 U512 ( .A(n381), .B(count[1]), .Y(n338) );
  MXI2X1 U513 ( .A(n338), .B(count[1]), .S0(n755), .Y(n339) );
  CLKINVX1 U514 ( .A(n342), .Y(n343) );
  AND2X8 U515 ( .A(n344), .B(n343), .Y(n732) );
  NOR2X1 U516 ( .A(res_addr[2]), .B(C1_DATA4_3), .Y(n345) );
  NAND2X2 U517 ( .A(n564), .B(n345), .Y(n576) );
  NOR2X1 U518 ( .A(n801), .B(C1_DATA4_6), .Y(n346) );
  NOR2X4 U519 ( .A(C1_DATA4_4), .B(res_addr[5]), .Y(n577) );
  NAND2X1 U520 ( .A(n346), .B(n577), .Y(n347) );
  CLKINVX1 U521 ( .A(n459), .Y(n700) );
  NAND2X1 U522 ( .A(n698), .B(n759), .Y(n383) );
  NOR2X1 U523 ( .A(n700), .B(n383), .Y(n348) );
  XOR2X1 U524 ( .A(n348), .B(res_addr[11]), .Y(n393) );
  NAND3X2 U525 ( .A(n351), .B(n350), .C(n349), .Y(n552) );
  NAND2X1 U526 ( .A(n352), .B(n362), .Y(n356) );
  XOR2X1 U527 ( .A(count[0]), .B(count[1]), .Y(n354) );
  NOR2X1 U528 ( .A(n448), .B(n380), .Y(n353) );
  OAI21XL U529 ( .A0(n354), .A1(n757), .B0(n353), .Y(n355) );
  NAND2X1 U530 ( .A(n356), .B(n355), .Y(n357) );
  NAND2X1 U531 ( .A(res_addr[7]), .B(res_addr[6]), .Y(n377) );
  NAND2X1 U532 ( .A(C1_DATA4_4), .B(res_addr[5]), .Y(n620) );
  NAND2X1 U533 ( .A(res_addr[2]), .B(res_addr[3]), .Y(n358) );
  NOR2X2 U534 ( .A(n358), .B(n565), .Y(n579) );
  NAND2X1 U535 ( .A(n359), .B(n579), .Y(n399) );
  NOR2X1 U536 ( .A(n744), .B(n762), .Y(n707) );
  XNOR2X1 U537 ( .A(n481), .B(n753), .Y(n360) );
  NAND2X1 U538 ( .A(res_addr[8]), .B(res_addr[7]), .Y(n425) );
  NOR2X1 U539 ( .A(n762), .B(n425), .Y(n687) );
  NAND2X2 U540 ( .A(n687), .B(res_addr[10]), .Y(n465) );
  XOR2X1 U541 ( .A(n465), .B(n753), .Y(n364) );
  CLKINVX1 U542 ( .A(n381), .Y(n361) );
  NAND2X2 U543 ( .A(n362), .B(n361), .Y(n549) );
  NAND2X1 U544 ( .A(n386), .B(n755), .Y(n363) );
  NOR2X4 U545 ( .A(n549), .B(n363), .Y(n721) );
  NAND2X1 U546 ( .A(n364), .B(n721), .Y(n375) );
  NOR2X1 U547 ( .A(sti_addr[2]), .B(sti_addr[3]), .Y(n365) );
  NAND2X1 U548 ( .A(n365), .B(n582), .Y(n469) );
  NOR2X1 U549 ( .A(sti_addr[4]), .B(sti_addr[5]), .Y(n468) );
  NAND2X1 U550 ( .A(n427), .B(n468), .Y(n691) );
  XOR2X1 U551 ( .A(n366), .B(sti_addr[7]), .Y(n369) );
  NAND2X1 U552 ( .A(n367), .B(n380), .Y(n716) );
  NOR2BX1 U553 ( .AN(sti_addr[7]), .B(n716), .Y(n368) );
  AOI211X1 U554 ( .A0(n369), .A1(n185), .B0(n368), .C0(n657), .Y(n374) );
  OR2X1 U555 ( .A(n801), .B(res_addr[8]), .Y(n430) );
  OR2X1 U556 ( .A(n430), .B(res_addr[9]), .Y(n688) );
  OR2X1 U557 ( .A(n688), .B(res_addr[10]), .Y(n445) );
  XNOR2X1 U558 ( .A(n445), .B(res_addr[11]), .Y(n372) );
  NAND2X1 U559 ( .A(n370), .B(n765), .Y(n447) );
  NOR3X1 U560 ( .A(n451), .B(n448), .C(n447), .Y(n371) );
  BUFX4 U561 ( .A(n371), .Y(n725) );
  NAND2X1 U562 ( .A(n372), .B(n725), .Y(n373) );
  NAND4X2 U563 ( .A(n376), .B(n375), .C(n374), .D(n373), .Y(n392) );
  MXI2X1 U564 ( .A(n754), .B(n377), .S0(n577), .Y(n378) );
  MXI2X2 U565 ( .A(n378), .B(res_addr[7]), .S0(n576), .Y(n409) );
  NOR2X2 U566 ( .A(n409), .B(n379), .Y(n478) );
  XNOR2X1 U567 ( .A(n478), .B(n753), .Y(n390) );
  NOR4X1 U568 ( .A(n381), .B(n451), .C(n380), .D(n756), .Y(n382) );
  BUFX4 U569 ( .A(n382), .Y(n738) );
  AOI21X4 U570 ( .A0(n578), .A1(n579), .B0(res_addr[7]), .Y(n728) );
  NAND2X1 U571 ( .A(n728), .B(n384), .Y(n385) );
  XNOR2X1 U572 ( .A(n385), .B(res_addr[11]), .Y(n389) );
  NAND4X1 U573 ( .A(n683), .B(n386), .C(n764), .D(count[2]), .Y(n387) );
  AO22X1 U574 ( .A0(n390), .A1(n738), .B0(n389), .B1(n388), .Y(n391) );
  AOI22X1 U575 ( .A0(n395), .A1(rom_buffer[2]), .B0(n678), .B1(sti_di[2]), .Y(
        n397) );
  NAND2X1 U576 ( .A(n179), .B(rom_buffer[1]), .Y(n396) );
  OAI211X1 U577 ( .A0(n398), .A1(n777), .B0(n397), .C0(n396), .Y(n155) );
  XNOR2X1 U578 ( .A(n700), .B(res_addr[8]), .Y(n414) );
  CLKINVX1 U579 ( .A(n399), .Y(n684) );
  XNOR2X1 U580 ( .A(n684), .B(n744), .Y(n400) );
  XOR2X1 U581 ( .A(n427), .B(sti_addr[4]), .Y(n405) );
  XNOR2X1 U582 ( .A(res_addr[7]), .B(res_addr[8]), .Y(n403) );
  AOI21X1 U583 ( .A0(n401), .A1(n721), .B0(n657), .Y(n402) );
  OAI2BB1X1 U584 ( .A0N(n725), .A1N(n403), .B0(n402), .Y(n404) );
  AOI21X1 U585 ( .A0(n405), .A1(n185), .B0(n404), .Y(n407) );
  NAND2BX1 U586 ( .AN(n716), .B(sti_addr[4]), .Y(n406) );
  XOR2X1 U587 ( .A(n728), .B(res_addr[8]), .Y(n411) );
  INVX3 U588 ( .A(n409), .Y(n708) );
  XNOR2X1 U589 ( .A(n708), .B(n744), .Y(n410) );
  AO22X1 U590 ( .A0(n411), .A1(n388), .B0(n410), .B1(n738), .Y(n412) );
  INVX1 U591 ( .A(n179), .Y(n416) );
  NAND2X1 U592 ( .A(n708), .B(res_addr[8]), .Y(n420) );
  XOR2X1 U593 ( .A(n420), .B(n762), .Y(n443) );
  NOR2X1 U594 ( .A(n700), .B(res_addr[8]), .Y(n421) );
  XOR2X1 U595 ( .A(n421), .B(res_addr[9]), .Y(n422) );
  NAND2X1 U596 ( .A(n422), .B(n732), .Y(n441) );
  NAND2X1 U597 ( .A(n684), .B(res_addr[8]), .Y(n423) );
  INVX3 U598 ( .A(n716), .Y(n689) );
  NAND2X1 U599 ( .A(n426), .B(n721), .Y(n434) );
  NAND2X1 U600 ( .A(n427), .B(n784), .Y(n428) );
  XNOR2X1 U601 ( .A(n428), .B(sti_addr[5]), .Y(n429) );
  NAND2X1 U602 ( .A(n429), .B(n185), .Y(n433) );
  XNOR2X1 U603 ( .A(n430), .B(res_addr[9]), .Y(n431) );
  NAND2X1 U604 ( .A(n431), .B(n725), .Y(n432) );
  NAND4X1 U605 ( .A(n434), .B(n433), .C(n330), .D(n432), .Y(n435) );
  AOI21X1 U606 ( .A0(sti_addr[5]), .A1(n689), .B0(n435), .Y(n439) );
  NAND2X1 U607 ( .A(n728), .B(n744), .Y(n436) );
  XNOR2X1 U608 ( .A(n436), .B(res_addr[9]), .Y(n437) );
  AOI2BB1X2 U609 ( .A0N(res_addr[9]), .A1N(n330), .B0(n444), .Y(n140) );
  OR2X1 U610 ( .A(n714), .B(n800), .Y(n446) );
  XNOR2X4 U611 ( .A(n446), .B(res_addr[13]), .Y(n450) );
  NOR2X1 U612 ( .A(n451), .B(n448), .Y(n546) );
  NAND3X1 U613 ( .A(n450), .B(n449), .C(n546), .Y(n457) );
  NAND2X1 U614 ( .A(n451), .B(n683), .Y(n454) );
  AOI21X1 U615 ( .A0(n457), .A1(n456), .B0(n455), .Y(n488) );
  NOR2X1 U616 ( .A(res_addr[11]), .B(res_addr[10]), .Y(n458) );
  INVX1 U617 ( .A(n461), .Y(n727) );
  NAND2X2 U618 ( .A(n459), .B(n727), .Y(n726) );
  XOR2X1 U619 ( .A(n460), .B(res_addr[13]), .Y(n477) );
  XNOR2X1 U620 ( .A(n463), .B(res_addr[13]), .Y(n464) );
  AND2X2 U621 ( .A(n464), .B(n388), .Y(n476) );
  NOR2X2 U622 ( .A(n465), .B(n753), .Y(n715) );
  XOR2X1 U623 ( .A(n466), .B(n771), .Y(n474) );
  NAND2X1 U624 ( .A(n468), .B(n467), .Y(n470) );
  NAND2X1 U625 ( .A(n717), .B(n749), .Y(n471) );
  XNOR2X1 U626 ( .A(n471), .B(sti_addr[9]), .Y(n472) );
  NAND2X1 U627 ( .A(n478), .B(res_addr[11]), .Y(n737) );
  NOR2X1 U628 ( .A(n737), .B(n758), .Y(n479) );
  XNOR2X1 U629 ( .A(n479), .B(n771), .Y(n480) );
  NAND3X1 U630 ( .A(n480), .B(n738), .C(n483), .Y(n486) );
  NAND2X1 U631 ( .A(n481), .B(res_addr[11]), .Y(n713) );
  XNOR2X1 U632 ( .A(n482), .B(n771), .Y(n484) );
  NAND3X1 U633 ( .A(n706), .B(n484), .C(n483), .Y(n485) );
  NAND4BX2 U634 ( .AN(n488), .B(n487), .C(n486), .D(n485), .Y(n799) );
  NOR2X1 U635 ( .A(n665), .B(n489), .Y(n493) );
  NAND2X1 U636 ( .A(n490), .B(n666), .Y(n491) );
  NOR2X1 U637 ( .A(sti_addr[4]), .B(n746), .Y(n509) );
  NOR2X2 U638 ( .A(sti_addr[5]), .B(n746), .Y(n511) );
  NOR2X2 U639 ( .A(sti_addr[6]), .B(n746), .Y(n531) );
  NAND2X1 U640 ( .A(sti_addr[5]), .B(n746), .Y(n512) );
  NAND2X1 U641 ( .A(sti_addr[4]), .B(n746), .Y(n659) );
  NAND2X1 U642 ( .A(n512), .B(n659), .Y(n533) );
  NAND2X1 U643 ( .A(sti_addr[7]), .B(n746), .Y(n539) );
  NAND2X1 U644 ( .A(sti_addr[6]), .B(n746), .Y(n535) );
  NAND2X1 U645 ( .A(n539), .B(n535), .Y(n495) );
  NOR2X1 U646 ( .A(n533), .B(n495), .Y(n496) );
  OR2X1 U647 ( .A(sti_addr[8]), .B(n746), .Y(n519) );
  OR2X1 U648 ( .A(sti_addr[9]), .B(n746), .Y(n500) );
  NAND2X1 U649 ( .A(n500), .B(n499), .Y(n501) );
  XOR2X1 U650 ( .A(n502), .B(n501), .Y(n503) );
  NOR4X1 U651 ( .A(n770), .B(n761), .C(n743), .D(n749), .Y(n506) );
  NOR4X1 U652 ( .A(n748), .B(n786), .C(n760), .D(n784), .Y(n505) );
  INVX3 U653 ( .A(n508), .Y(n662) );
  CLKINVX1 U654 ( .A(n509), .Y(n660) );
  AOI21X1 U655 ( .A0(n662), .A1(n660), .B0(n510), .Y(n515) );
  NAND2X1 U656 ( .A(n513), .B(n512), .Y(n514) );
  XOR2X1 U657 ( .A(n515), .B(n514), .Y(n516) );
  OAI21X1 U658 ( .A0(n522), .A1(n770), .B0(n517), .Y(n129) );
  NAND2X1 U659 ( .A(n519), .B(n518), .Y(n520) );
  XNOR2X1 U660 ( .A(n521), .B(n520), .Y(n523) );
  NAND2X1 U661 ( .A(n523), .B(n522), .Y(n524) );
  AOI21X1 U662 ( .A0(n662), .A1(n530), .B0(n533), .Y(n527) );
  NAND2X1 U663 ( .A(n525), .B(n535), .Y(n526) );
  XOR2X1 U664 ( .A(n527), .B(n526), .Y(n528) );
  NAND2X1 U665 ( .A(n528), .B(n522), .Y(n529) );
  CLKBUFX3 U666 ( .A(reset), .Y(n798) );
  CLKBUFX3 U667 ( .A(reset), .Y(n797) );
  CLKBUFX3 U668 ( .A(reset), .Y(n796) );
  NOR2X2 U669 ( .A(n763), .B(n751), .Y(done) );
  CLKINVX1 U670 ( .A(n530), .Y(n532) );
  NOR2X1 U671 ( .A(n532), .B(n531), .Y(n537) );
  CLKINVX1 U672 ( .A(n533), .Y(n534) );
  NAND2X1 U673 ( .A(n535), .B(n534), .Y(n536) );
  AOI21X1 U674 ( .A0(n662), .A1(n537), .B0(n536), .Y(n542) );
  NAND2X1 U675 ( .A(n540), .B(n539), .Y(n541) );
  XOR2X1 U676 ( .A(n542), .B(n541), .Y(n543) );
  NAND2X1 U677 ( .A(n543), .B(n522), .Y(n544) );
  OAI21X1 U678 ( .A0(n522), .A1(n743), .B0(n544), .Y(n131) );
  NAND2X1 U679 ( .A(n545), .B(res_rd), .Y(n548) );
  CLKINVX1 U680 ( .A(n546), .Y(n555) );
  NOR2X1 U681 ( .A(res_wr), .B(count[0]), .Y(n547) );
  MXI2X1 U682 ( .A(n548), .B(n553), .S0(count[1]), .Y(n151) );
  NOR2X1 U683 ( .A(n549), .B(n756), .Y(n550) );
  CLKMX2X2 U684 ( .A(n551), .B(n550), .S0(n755), .Y(n150) );
  CLKINVX1 U685 ( .A(res_addr[0]), .Y(n560) );
  OAI2BB1X1 U686 ( .A0N(n738), .A1N(n560), .B0(n556), .Y(n557) );
  AOI21X1 U687 ( .A0(n388), .A1(n560), .B0(n557), .Y(n563) );
  AOI21X1 U688 ( .A0(n725), .A1(res_addr[0]), .B0(n657), .Y(n558) );
  OAI2BB1X1 U689 ( .A0N(n560), .A1N(n732), .B0(n558), .Y(n559) );
  NAND3X1 U690 ( .A(n736), .B(n560), .C(n330), .Y(n561) );
  OAI211X1 U691 ( .A0(n657), .A1(n563), .B0(n562), .C0(n561), .Y(n148) );
  CLKINVX1 U692 ( .A(n564), .Y(n635) );
  XNOR2X1 U693 ( .A(n635), .B(res_addr[2]), .Y(n570) );
  CLKINVX1 U694 ( .A(n565), .Y(n637) );
  XNOR2X1 U695 ( .A(n637), .B(n566), .Y(n572) );
  AOI211X1 U696 ( .A0(n721), .A1(res_addr[2]), .B0(n185), .C0(n689), .Y(n567)
         );
  OAI2BB1X1 U697 ( .A0N(n388), .A1N(n572), .B0(n567), .Y(n568) );
  AOI21X1 U698 ( .A0(n738), .A1(n570), .B0(n568), .Y(n575) );
  AOI21X1 U699 ( .A0(n725), .A1(res_addr[2]), .B0(n657), .Y(n569) );
  OAI2BB1X1 U700 ( .A0N(n570), .A1N(n732), .B0(n569), .Y(n571) );
  OAI21X1 U701 ( .A0(C1_DATA4_2), .A1(n330), .B0(n571), .Y(n574) );
  NAND3X1 U702 ( .A(n706), .B(n572), .C(n330), .Y(n573) );
  OAI211X1 U703 ( .A0(n657), .A1(n575), .B0(n574), .C0(n573), .Y(n147) );
  CLKINVX1 U704 ( .A(n576), .Y(n610) );
  NAND2X1 U705 ( .A(n610), .B(n577), .Y(n623) );
  NOR2X1 U706 ( .A(n623), .B(res_addr[6]), .Y(n591) );
  XOR2X1 U707 ( .A(n591), .B(n754), .Y(n588) );
  CLKINVX1 U708 ( .A(n578), .Y(n580) );
  NOR2X1 U709 ( .A(n580), .B(n621), .Y(n581) );
  XNOR2X1 U710 ( .A(n581), .B(res_addr[7]), .Y(n589) );
  AND2X2 U711 ( .A(n589), .B(n388), .Y(n587) );
  XOR2X1 U712 ( .A(n583), .B(sti_addr[3]), .Y(n584) );
  AOI22X1 U713 ( .A0(n584), .A1(n185), .B0(n721), .B1(n754), .Y(n585) );
  OAI2BB1X1 U714 ( .A0N(n689), .A1N(sti_addr[3]), .B0(n585), .Y(n586) );
  AOI211X1 U715 ( .A0(n588), .A1(n738), .B0(n587), .C0(n586), .Y(n597) );
  CLKINVX1 U716 ( .A(n589), .Y(n590) );
  NAND3X1 U717 ( .A(n736), .B(n590), .C(n330), .Y(n596) );
  XOR2X1 U718 ( .A(n591), .B(res_addr[7]), .Y(n593) );
  OAI2BB1X1 U719 ( .A0N(n593), .A1N(n732), .B0(n592), .Y(n594) );
  OAI211X1 U720 ( .A0(n597), .A1(n657), .B0(n596), .C0(n595), .Y(n142) );
  NOR2X1 U721 ( .A(n621), .B(n745), .Y(n598) );
  XNOR2X1 U722 ( .A(n598), .B(n767), .Y(n603) );
  NAND2X1 U723 ( .A(n610), .B(n745), .Y(n599) );
  XNOR2X1 U724 ( .A(n599), .B(res_addr[5]), .Y(n605) );
  AO22X1 U725 ( .A0(n388), .A1(n603), .B0(n605), .B1(n738), .Y(n602) );
  XNOR2X1 U726 ( .A(sti_addr[1]), .B(sti_addr[0]), .Y(n600) );
  AO22X1 U727 ( .A0(n600), .A1(n185), .B0(n721), .B1(res_addr[5]), .Y(n601) );
  AOI211X1 U728 ( .A0(n689), .A1(sti_addr[1]), .B0(n602), .C0(n601), .Y(n609)
         );
  NAND3X1 U729 ( .A(n736), .B(n603), .C(n330), .Y(n608) );
  AOI21X1 U730 ( .A0(n725), .A1(res_addr[5]), .B0(n657), .Y(n604) );
  OAI2BB1X1 U731 ( .A0N(n605), .A1N(n732), .B0(n604), .Y(n606) );
  OAI21X2 U732 ( .A0(res_addr[5]), .A1(n330), .B0(n606), .Y(n607) );
  OAI211X1 U733 ( .A0(n609), .A1(n657), .B0(n608), .C0(n607), .Y(n144) );
  XOR2X1 U734 ( .A(n621), .B(n745), .Y(n613) );
  XOR2X1 U735 ( .A(n610), .B(C1_DATA4_4), .Y(n615) );
  AO22X1 U736 ( .A0(n738), .A1(n615), .B0(sti_addr[0]), .B1(n689), .Y(n612) );
  AO22X1 U737 ( .A0(n760), .A1(n185), .B0(n721), .B1(C1_DATA4_4), .Y(n611) );
  AOI211X1 U738 ( .A0(n388), .A1(n613), .B0(n612), .C0(n611), .Y(n619) );
  NAND3X1 U739 ( .A(n706), .B(n613), .C(n330), .Y(n618) );
  AOI21X1 U740 ( .A0(n725), .A1(C1_DATA4_4), .B0(n657), .Y(n614) );
  OAI2BB1X1 U741 ( .A0N(n615), .A1N(n732), .B0(n614), .Y(n616) );
  OAI211X1 U742 ( .A0(n619), .A1(n657), .B0(n618), .C0(n617), .Y(n145) );
  NOR2X1 U743 ( .A(n621), .B(n620), .Y(n622) );
  XNOR2X1 U744 ( .A(n622), .B(n752), .Y(n628) );
  XNOR2X1 U745 ( .A(res_addr[6]), .B(n623), .Y(n630) );
  AO22X1 U746 ( .A0(n689), .A1(sti_addr[2]), .B0(n630), .B1(n738), .Y(n627) );
  XNOR2X1 U747 ( .A(n624), .B(sti_addr[2]), .Y(n625) );
  AO22X1 U748 ( .A0(n625), .A1(n185), .B0(n721), .B1(res_addr[6]), .Y(n626) );
  AOI211X1 U749 ( .A0(n388), .A1(n628), .B0(n627), .C0(n626), .Y(n634) );
  NAND3X1 U750 ( .A(n706), .B(n628), .C(n330), .Y(n633) );
  AOI21X1 U751 ( .A0(n725), .A1(res_addr[6]), .B0(n657), .Y(n629) );
  OAI21X1 U752 ( .A0(res_addr[6]), .A1(n330), .B0(n631), .Y(n632) );
  OAI211X1 U753 ( .A0(n634), .A1(n657), .B0(n633), .C0(n632), .Y(n143) );
  NOR2X1 U754 ( .A(n635), .B(res_addr[2]), .Y(n636) );
  XOR2X1 U755 ( .A(n636), .B(res_addr[3]), .Y(n642) );
  XOR2X1 U756 ( .A(n638), .B(n768), .Y(n644) );
  AOI211X1 U757 ( .A0(n721), .A1(res_addr[3]), .B0(n185), .C0(n689), .Y(n639)
         );
  OAI2BB1X1 U758 ( .A0N(n388), .A1N(n644), .B0(n639), .Y(n640) );
  AOI21X1 U759 ( .A0(n738), .A1(n642), .B0(n640), .Y(n647) );
  AOI21X1 U760 ( .A0(n725), .A1(res_addr[3]), .B0(n657), .Y(n641) );
  OAI2BB1X1 U761 ( .A0N(n642), .A1N(n732), .B0(n641), .Y(n643) );
  NAND3X1 U762 ( .A(n736), .B(n644), .C(n330), .Y(n645) );
  OAI211X1 U763 ( .A0(n657), .A1(n647), .B0(n646), .C0(n645), .Y(n146) );
  XNOR2X1 U764 ( .A(n769), .B(res_addr[0]), .Y(n653) );
  XNOR2X1 U765 ( .A(res_addr[0]), .B(res_addr[1]), .Y(n651) );
  AOI211X1 U766 ( .A0(n721), .A1(res_addr[1]), .B0(n185), .C0(n689), .Y(n648)
         );
  OAI2BB1X1 U767 ( .A0N(n738), .A1N(n651), .B0(n648), .Y(n649) );
  AOI21X1 U768 ( .A0(n388), .A1(n653), .B0(n649), .Y(n656) );
  AOI21X1 U769 ( .A0(n725), .A1(res_addr[1]), .B0(n657), .Y(n650) );
  OAI2BB1X1 U770 ( .A0N(n651), .A1N(n732), .B0(n650), .Y(n652) );
  OAI21X2 U771 ( .A0(res_addr[1]), .A1(n330), .B0(n652), .Y(n655) );
  NAND3X1 U772 ( .A(n736), .B(n653), .C(n330), .Y(n654) );
  OAI211X1 U773 ( .A0(n657), .A1(n656), .B0(n655), .C0(n654), .Y(n149) );
  NAND2X1 U774 ( .A(n760), .B(n522), .Y(n658) );
  OAI21XL U775 ( .A0(n522), .A1(n760), .B0(n658), .Y(n134) );
  NAND2X1 U776 ( .A(n660), .B(n659), .Y(n661) );
  XNOR2X1 U777 ( .A(n662), .B(n661), .Y(n663) );
  NAND2X1 U778 ( .A(n663), .B(n522), .Y(n664) );
  NAND2X1 U779 ( .A(n667), .B(n666), .Y(n668) );
  XOR2X1 U780 ( .A(n669), .B(n668), .Y(n670) );
  NAND2X1 U781 ( .A(n670), .B(n522), .Y(n671) );
  OAI21XL U782 ( .A0(n522), .A1(n786), .B0(n671), .Y(n126) );
  NAND2X1 U783 ( .A(n674), .B(n673), .Y(n675) );
  XOR2X1 U784 ( .A(n675), .B(n760), .Y(n676) );
  NAND2X1 U785 ( .A(n676), .B(n522), .Y(n677) );
  OAI21XL U786 ( .A0(n522), .A1(n761), .B0(n677), .Y(n125) );
  OAI2BB1X1 U787 ( .A0N(n683), .A1N(n682), .B0(n681), .Y(next_state[1]) );
  NAND2X1 U788 ( .A(n684), .B(n707), .Y(n685) );
  XOR2X1 U789 ( .A(n685), .B(n759), .Y(n705) );
  NAND2X1 U790 ( .A(n728), .B(n698), .Y(n686) );
  XNOR2X1 U791 ( .A(n686), .B(res_addr[10]), .Y(n697) );
  XNOR2X1 U792 ( .A(n687), .B(n759), .Y(n695) );
  XNOR2X1 U793 ( .A(n688), .B(res_addr[10]), .Y(n690) );
  AO22X1 U794 ( .A0(n690), .A1(n725), .B0(n689), .B1(sti_addr[6]), .Y(n694) );
  XNOR2X1 U795 ( .A(n691), .B(sti_addr[6]), .Y(n692) );
  OAI2BB1X1 U796 ( .A0N(n185), .A1N(n692), .B0(n330), .Y(n693) );
  XOR2X1 U797 ( .A(n709), .B(n759), .Y(n710) );
  NAND2X1 U798 ( .A(n710), .B(n738), .Y(n711) );
  XOR2X1 U799 ( .A(n713), .B(n758), .Y(n735) );
  XNOR2X1 U800 ( .A(n715), .B(n758), .Y(n722) );
  NOR2BX1 U801 ( .AN(sti_addr[8]), .B(n716), .Y(n720) );
  XOR2X1 U802 ( .A(n717), .B(sti_addr[8]), .Y(n718) );
  OAI2BB1X2 U803 ( .A0N(n185), .A1N(n718), .B0(n330), .Y(n719) );
  NAND2X1 U804 ( .A(n728), .B(n727), .Y(n729) );
  XNOR2X1 U805 ( .A(n729), .B(n800), .Y(n730) );
  AO22X4 U806 ( .A0(n732), .A1(n731), .B0(n388), .B1(n730), .Y(n733) );
  XOR2X1 U807 ( .A(n737), .B(n758), .Y(n739) );
  NAND2X1 U808 ( .A(n739), .B(n738), .Y(n740) );
  AOI2BB2X1 U809 ( .B0(n741), .B1(n740), .A0N(n800), .A1N(n330), .Y(n137) );
endmodule

