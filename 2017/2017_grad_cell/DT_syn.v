/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : U-2022.12
// Date      : Mon Aug  5 00:39:19 2024
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
  wire   n824, n825, state, next_state, N58, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n144, n145, n146, n147, n148,
         n149, n150, n152, n153, n154, n155, n156, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, \C1/DATA2_6 , \C1/DATA2_5 , \C1/DATA2_4 , \C1/DATA2_3 ,
         \C1/DATA2_2 , \C1/DATA2_1 , \C1/DATA2_0 , \C1/DATA5_6 , \C1/DATA5_4 ,
         \C1/DATA5_3 , \C1/DATA5_1 , \C1/DATA5_0 , \C1/DATA8_13 ,
         \C1/DATA8_12 , \C1/DATA8_11 , \C1/DATA8_10 , \C1/DATA8_9 ,
         \C1/DATA8_8 , \C1/DATA8_7 , \C1/DATA8_6 , \C1/DATA8_5 , \C1/DATA8_4 ,
         \DP_OP_16_135_5330/n73 , n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, n470, n471, n472, n473, n474, n475,
         n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486,
         n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497,
         n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, n508,
         n509, n510, n511, n512, n513, n514, n515, n516, n517, n518, n519,
         n520, n521, n522, n523, n524, n525, n526, n527, n528, n529, n530,
         n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n726, n727, n728,
         n729, n730, n731, n732, n733, n734, n735, n736, n737, n738, n739,
         n740, n741, n742, n743, n744, n745, n746, n747, n748, n749, n750,
         n751, n752, n753, n754, n755, n756, n757, n758, n759, n760, n761,
         n762, n763, n764, n765, n766, n767, n768, n769, n770, n771, n772,
         n773, n774, n775, n776, n777, n778, n779, n780, n781, n782, n783,
         n784, n785, n786, n787, n788, n789, n790, n791, n792, n793, n794,
         n795, n796, n797, n798, n799, n800, n801, n802, n803, n804, n805,
         n806, n807, n808, n809, n810, n811, n812, n813, n814, n815, n820,
         n821, n822, n823;
  wire   [15:0] sti_di_buffer;
  wire   [2:0] count;
  assign res_rd = 1'b1;
  assign sti_rd = 1'b1;
  assign res_addr[6] = \C1/DATA2_6 ;
  assign res_addr[5] = \C1/DATA2_5 ;
  assign res_addr[4] = \C1/DATA2_4 ;
  assign res_addr[3] = \C1/DATA2_3 ;
  assign res_addr[1] = \C1/DATA2_1 ;
  assign res_addr[0] = \C1/DATA2_0 ;
  assign sti_addr[9] = \C1/DATA8_13 ;
  assign sti_addr[8] = \C1/DATA8_12 ;
  assign sti_addr[7] = \C1/DATA8_11 ;
  assign sti_addr[6] = \C1/DATA8_10 ;
  assign sti_addr[5] = \C1/DATA8_9 ;
  assign sti_addr[4] = \C1/DATA8_8 ;
  assign sti_addr[3] = \C1/DATA8_7 ;
  assign sti_addr[2] = \C1/DATA8_6 ;
  assign sti_addr[1] = \C1/DATA8_5 ;
  assign sti_addr[0] = \C1/DATA8_4 ;

  DFFRX4 state_reg ( .D(next_state), .CK(clk), .RN(n821), .Q(state), .QN(n780)
         );
  DFFRX4 flag_reg ( .D(n166), .CK(clk), .RN(n821), .Q(\DP_OP_16_135_5330/n73 ), 
        .QN(n774) );
  DFFRX4 \sti_addr_reg[2]  ( .D(n134), .CK(clk), .RN(n820), .Q(\C1/DATA8_6 )
         );
  DFFRX4 \sti_addr_reg[1]  ( .D(n133), .CK(clk), .RN(reset), .Q(\C1/DATA8_5 )
         );
  DFFSX4 \sti_addr_reg[3]  ( .D(n132), .CK(clk), .SN(reset), .Q(\C1/DATA8_7 ), 
        .QN(n815) );
  DFFRX1 \count_reg[2]  ( .D(n183), .CK(clk), .RN(reset), .Q(count[2]), .QN(
        n786) );
  DFFRX1 \count_reg[0]  ( .D(n184), .CK(clk), .RN(n822), .Q(count[0]), .QN(
        n777) );
  DFFRX2 \res_addr_reg[2]  ( .D(n162), .CK(clk), .RN(n820), .Q(\C1/DATA2_2 ), 
        .QN(n775) );
  DFFRX1 \sti_di_buffer_reg[13]  ( .D(n168), .CK(clk), .RN(n822), .Q(
        sti_di_buffer[13]), .QN(n796) );
  DFFRX1 \sti_di_buffer_reg[10]  ( .D(n171), .CK(clk), .RN(n822), .Q(
        sti_di_buffer[10]), .QN(n793) );
  DFFRX1 \sti_di_buffer_reg[6]  ( .D(n175), .CK(clk), .RN(reset), .Q(
        sti_di_buffer[6]), .QN(n794) );
  DFFRX1 \sti_di_buffer_reg[14]  ( .D(n167), .CK(clk), .RN(n822), .Q(
        sti_di_buffer[14]), .QN(n811) );
  DFFRX1 \sti_di_buffer_reg[9]  ( .D(n172), .CK(clk), .RN(n822), .Q(
        sti_di_buffer[9]), .QN(n801) );
  DFFRX1 \sti_di_buffer_reg[5]  ( .D(n176), .CK(clk), .RN(reset), .Q(
        sti_di_buffer[5]), .QN(n802) );
  DFFRX1 \sti_di_buffer_reg[12]  ( .D(n169), .CK(clk), .RN(n822), .Q(
        sti_di_buffer[12]), .QN(n797) );
  DFFRX1 \sti_di_buffer_reg[2]  ( .D(n179), .CK(clk), .RN(reset), .Q(
        sti_di_buffer[2]), .QN(n800) );
  DFFRX1 \sti_di_buffer_reg[8]  ( .D(n173), .CK(clk), .RN(reset), .Q(
        sti_di_buffer[8]), .QN(n798) );
  DFFRX1 \sti_di_buffer_reg[4]  ( .D(n177), .CK(clk), .RN(reset), .Q(
        sti_di_buffer[4]), .QN(n799) );
  DFFRX1 \sti_di_buffer_reg[11]  ( .D(n170), .CK(clk), .RN(n822), .Q(
        sti_di_buffer[11]), .QN(n803) );
  DFFRX1 \sti_di_buffer_reg[1]  ( .D(n180), .CK(clk), .RN(reset), .Q(
        sti_di_buffer[1]), .QN(n795) );
  DFFRX1 \sti_di_buffer_reg[7]  ( .D(n174), .CK(clk), .RN(reset), .Q(
        sti_di_buffer[7]), .QN(n804) );
  DFFRX1 \sti_di_buffer_reg[3]  ( .D(n178), .CK(clk), .RN(reset), .Q(
        sti_di_buffer[3]), .QN(n805) );
  DFFRX1 \sti_di_buffer_reg[15]  ( .D(n182), .CK(clk), .RN(reset), .Q(
        sti_di_buffer[15]), .QN(n781) );
  DFFRX1 \sti_di_buffer_reg[0]  ( .D(n181), .CK(clk), .RN(reset), .Q(
        sti_di_buffer[0]), .QN(n788) );
  DFFRX2 \res_addr_reg[8]  ( .D(n156), .CK(clk), .RN(n821), .Q(n825), .QN(n768) );
  DFFRX2 \min_temp_reg[2]  ( .D(n147), .CK(clk), .RN(reset), .Q(res_do[2]), 
        .QN(n784) );
  DFFRX2 \min_temp_reg[3]  ( .D(n146), .CK(clk), .RN(n822), .Q(res_do[3]) );
  DFFRX2 \min_temp_reg[1]  ( .D(n148), .CK(clk), .RN(reset), .Q(res_do[1]), 
        .QN(n787) );
  DFFRX2 \min_temp_reg[4]  ( .D(n145), .CK(clk), .RN(reset), .Q(res_do[4]), 
        .QN(n789) );
  DFFRX2 \res_addr_reg[10]  ( .D(n154), .CK(clk), .RN(n821), .Q(n824), .QN(
        n771) );
  DFFRX2 \res_addr_reg[4]  ( .D(n160), .CK(clk), .RN(n821), .Q(\C1/DATA5_4 ), 
        .QN(n773) );
  DFFRX4 \res_addr_reg[5]  ( .D(n159), .CK(clk), .RN(n821), .Q(\C1/DATA2_5 ), 
        .QN(n814) );
  DFFRX2 \res_addr_reg[3]  ( .D(n161), .CK(clk), .RN(n820), .Q(\C1/DATA5_3 ), 
        .QN(n778) );
  DFFRX2 \res_addr_reg[1]  ( .D(n163), .CK(clk), .RN(n820), .Q(\C1/DATA5_1 ), 
        .QN(n770) );
  DFFRX4 \min_temp_reg[7]  ( .D(n149), .CK(clk), .RN(n822), .Q(res_do[7]) );
  DFFRX4 \sti_addr_reg[4]  ( .D(n135), .CK(clk), .RN(n820), .Q(\C1/DATA8_8 ), 
        .QN(n807) );
  DFFRX4 \min_temp_reg[5]  ( .D(n144), .CK(clk), .RN(n822), .Q(res_do[5]), 
        .QN(n790) );
  DFFRX2 \min_temp_reg[0]  ( .D(n150), .CK(clk), .RN(n822), .Q(res_do[0]), 
        .QN(n785) );
  DFFRX2 \count_reg[1]  ( .D(n165), .CK(clk), .RN(n822), .Q(count[1]), .QN(
        n783) );
  DFFSX2 \res_addr_reg[7]  ( .D(n199), .CK(clk), .SN(n821), .Q(n769), .QN(
        res_addr[7]) );
  DFFRX4 \sti_addr_reg[0]  ( .D(n141), .CK(clk), .RN(n820), .Q(\C1/DATA8_4 ), 
        .QN(N58) );
  DFFRX1 \res_addr_reg[0]  ( .D(n164), .CK(clk), .RN(n820), .Q(\C1/DATA5_0 ), 
        .QN(n772) );
  DFFRX4 \res_addr_reg[12]  ( .D(n152), .CK(clk), .RN(n821), .Q(res_addr[12]), 
        .QN(n779) );
  DFFRX4 \res_addr_reg[9]  ( .D(n155), .CK(clk), .RN(n821), .Q(res_addr[9]), 
        .QN(n812) );
  DFFRX4 \sti_addr_reg[6]  ( .D(n137), .CK(clk), .RN(n820), .Q(\C1/DATA8_10 ), 
        .QN(n782) );
  DFFRX4 \res_addr_reg[11]  ( .D(n153), .CK(clk), .RN(n821), .Q(res_addr[11]), 
        .QN(n813) );
  DFFRX4 \sti_addr_reg[5]  ( .D(n136), .CK(clk), .RN(n820), .Q(\C1/DATA8_9 ), 
        .QN(n792) );
  DFFRX4 \sti_addr_reg[9]  ( .D(n140), .CK(clk), .RN(n820), .Q(\C1/DATA8_13 ), 
        .QN(n808) );
  DFFRX4 \sti_addr_reg[8]  ( .D(n139), .CK(clk), .RN(n820), .Q(\C1/DATA8_12 ), 
        .QN(n806) );
  DFFRX1 \res_addr_reg[6]  ( .D(n158), .CK(clk), .RN(n821), .Q(\C1/DATA5_6 ), 
        .QN(n776) );
  DFFRX4 \sti_addr_reg[7]  ( .D(n138), .CK(clk), .RN(n820), .Q(\C1/DATA8_11 ), 
        .QN(n809) );
  DFFRX2 \min_temp_reg[6]  ( .D(n142), .CK(clk), .RN(n822), .Q(res_do[6]), 
        .QN(n791) );
  DFFRX2 \res_addr_reg[13]  ( .D(n823), .CK(clk), .RN(n821), .Q(res_addr[13]), 
        .QN(n810) );
  OAI2BB1X2 U200 ( .A0N(n194), .A1N(res_do[2]), .B0(n347), .Y(n147) );
  INVX4 U201 ( .A(n447), .Y(n194) );
  NOR2BX2 U202 ( .AN(\C1/DATA8_7 ), .B(n539), .Y(done) );
  OAI21X1 U203 ( .A0(n426), .A1(n196), .B0(n435), .Y(n444) );
  NAND2X1 U204 ( .A(n584), .B(n355), .Y(n585) );
  INVX6 U205 ( .A(n198), .Y(n454) );
  INVX3 U206 ( .A(n457), .Y(n353) );
  NAND4X1 U207 ( .A(n405), .B(n404), .C(n403), .D(n402), .Y(n406) );
  INVX1 U208 ( .A(n710), .Y(n731) );
  NAND2X1 U209 ( .A(n195), .B(n590), .Y(n591) );
  NOR2XL U210 ( .A(res_wr), .B(n755), .Y(n466) );
  NAND2X2 U211 ( .A(n345), .B(n197), .Y(n336) );
  NAND2X6 U212 ( .A(n345), .B(n200), .Y(n340) );
  OAI21X2 U213 ( .A0(n468), .A1(\DP_OP_16_135_5330/n73 ), .B0(n462), .Y(res_wr) );
  AOI21X1 U214 ( .A0(n667), .A1(n681), .B0(n666), .Y(n668) );
  AND2X2 U215 ( .A(n202), .B(count[2]), .Y(n422) );
  CLKBUFX3 U216 ( .A(n216), .Y(n686) );
  NAND2X1 U217 ( .A(n358), .B(res_addr[10]), .Y(n387) );
  OR2X1 U218 ( .A(n375), .B(n824), .Y(n383) );
  INVX1 U219 ( .A(n400), .Y(n656) );
  NOR2X2 U220 ( .A(n774), .B(state), .Y(n225) );
  OAI21XL U221 ( .A0(n472), .A1(n461), .B0(n207), .Y(n208) );
  NOR2X2 U222 ( .A(n630), .B(n283), .Y(n358) );
  OAI21XL U223 ( .A0(n220), .A1(n783), .B0(n233), .Y(n202) );
  NAND2X1 U224 ( .A(n373), .B(res_addr[10]), .Y(n396) );
  CLKBUFX3 U225 ( .A(n780), .Y(n755) );
  INVX4 U226 ( .A(n323), .Y(n450) );
  OR2X1 U227 ( .A(n633), .B(n825), .Y(n658) );
  NAND3X2 U228 ( .A(n330), .B(n329), .C(res_di[6]), .Y(n331) );
  NOR2X1 U229 ( .A(res_addr[8]), .B(res_addr[9]), .Y(n359) );
  NAND3X4 U230 ( .A(n312), .B(n311), .C(n310), .Y(n317) );
  XNOR2X1 U231 ( .A(n328), .B(res_di[6]), .Y(n324) );
  ADDHXL U232 ( .A(n825), .B(n633), .CO(n659), .S(n634) );
  NOR2X1 U233 ( .A(\DP_OP_16_135_5330/n73 ), .B(n781), .Y(n463) );
  NOR2X1 U234 ( .A(\C1/DATA5_4 ), .B(\C1/DATA2_5 ), .Y(n273) );
  NAND2X1 U235 ( .A(\C1/DATA5_4 ), .B(\C1/DATA2_5 ), .Y(n279) );
  XOR2X2 U236 ( .A(res_di[3]), .B(res_di[2]), .Y(n314) );
  NAND2X2 U237 ( .A(n292), .B(n349), .Y(n306) );
  NAND2X6 U238 ( .A(res_di[0]), .B(res_di[1]), .Y(n313) );
  NOR2XL U239 ( .A(n414), .B(\C1/DATA8_12 ), .Y(n415) );
  NAND2X1 U240 ( .A(n547), .B(n212), .Y(n276) );
  NAND2XL U241 ( .A(n433), .B(res_addr[12]), .Y(n434) );
  AOI21XL U242 ( .A0(n368), .A1(n680), .B0(n367), .Y(n369) );
  OR2X2 U243 ( .A(n658), .B(res_addr[9]), .Y(n375) );
  NAND2XL U244 ( .A(n681), .B(\C1/DATA2_3 ), .Y(n564) );
  NAND2XL U245 ( .A(n266), .B(n687), .Y(n267) );
  AOI22XL U246 ( .A0(n635), .A1(n681), .B0(n680), .B1(n634), .Y(n640) );
  NOR2XL U247 ( .A(n431), .B(res_addr[12]), .Y(n432) );
  INVXL U248 ( .A(n695), .Y(n482) );
  NAND2XL U249 ( .A(\C1/DATA8_8 ), .B(n697), .Y(n728) );
  NAND3XL U250 ( .A(n195), .B(n436), .C(n435), .Y(n437) );
  NAND2XL U251 ( .A(\C1/DATA8_12 ), .B(n697), .Y(n694) );
  NAND2XL U252 ( .A(n195), .B(n674), .Y(n675) );
  NAND2XL U253 ( .A(n195), .B(n247), .Y(n248) );
  NAND2XL U254 ( .A(n196), .B(n568), .Y(n572) );
  NAND2XL U255 ( .A(sti_di[8]), .B(n780), .Y(n509) );
  NOR4XL U256 ( .A(sti_di_buffer[13]), .B(sti_di_buffer[14]), .C(
        sti_di_buffer[2]), .D(sti_di_buffer[1]), .Y(n764) );
  OAI2BB1X1 U257 ( .A0N(n686), .A1N(n438), .B0(n437), .Y(n439) );
  NAND2XL U258 ( .A(n723), .B(n722), .Y(n724) );
  CLKAND2X3 U259 ( .A(n467), .B(n466), .Y(n544) );
  NOR3XL U260 ( .A(n777), .B(n786), .C(count[1]), .Y(n461) );
  NOR2X2 U261 ( .A(count[0]), .B(count[1]), .Y(n460) );
  NAND2XL U262 ( .A(\C1/DATA8_9 ), .B(state), .Y(n726) );
  NAND2XL U263 ( .A(n732), .B(n755), .Y(n733) );
  NAND2XL U264 ( .A(n461), .B(\DP_OP_16_135_5330/n73 ), .Y(n462) );
  NAND2XL U265 ( .A(n460), .B(count[2]), .Y(n468) );
  CLKINVX2 U266 ( .A(n772), .Y(\C1/DATA2_0 ) );
  CLKINVX2 U267 ( .A(n773), .Y(\C1/DATA2_4 ) );
  INVX4 U268 ( .A(n422), .Y(n355) );
  INVX12 U269 ( .A(n544), .Y(n535) );
  OAI21X1 U270 ( .A0(n696), .A1(n695), .B0(n694), .Y(n701) );
  NAND2X4 U271 ( .A(n209), .B(n208), .Y(n488) );
  INVX1 U272 ( .A(n463), .Y(n464) );
  NAND2X2 U273 ( .A(n460), .B(n786), .Y(n342) );
  INVX1 U274 ( .A(n548), .Y(n562) );
  NAND2X1 U275 ( .A(\C1/DATA8_13 ), .B(state), .Y(n702) );
  INVX3 U276 ( .A(n768), .Y(res_addr[8]) );
  BUFX6 U277 ( .A(\DP_OP_16_135_5330/n73 ), .Y(n697) );
  INVX3 U278 ( .A(n778), .Y(\C1/DATA2_3 ) );
  NAND2X1 U279 ( .A(\C1/DATA8_10 ), .B(state), .Y(n717) );
  OAI21X1 U280 ( .A0(n355), .A1(n771), .B0(n289), .Y(n154) );
  OAI21X1 U281 ( .A0(n355), .A1(n813), .B0(n382), .Y(n153) );
  XOR2X1 U282 ( .A(n424), .B(res_addr[13]), .Y(n425) );
  AOI21X1 U283 ( .A0(n395), .A1(n680), .B0(n394), .Y(n404) );
  XOR2X2 U284 ( .A(n413), .B(n810), .Y(n419) );
  INVX16 U285 ( .A(n278), .Y(n195) );
  INVX1 U286 ( .A(n435), .Y(n430) );
  NAND2X1 U287 ( .A(n401), .B(n686), .Y(n402) );
  NOR2X2 U288 ( .A(n387), .B(n813), .Y(n427) );
  XNOR2X1 U289 ( .A(n358), .B(n771), .Y(n266) );
  XNOR2X1 U290 ( .A(n373), .B(n771), .Y(n284) );
  XNOR2X1 U291 ( .A(n356), .B(n824), .Y(n277) );
  INVX16 U292 ( .A(n272), .Y(n196) );
  NOR2X2 U293 ( .A(n644), .B(n283), .Y(n373) );
  NAND2X1 U294 ( .A(n400), .B(n399), .Y(n431) );
  INVX2 U295 ( .A(n389), .Y(n390) );
  INVX3 U296 ( .A(n220), .Y(n221) );
  NAND3X4 U297 ( .A(n308), .B(n307), .C(n306), .Y(n309) );
  INVX1 U298 ( .A(n713), .Y(n478) );
  INVX1 U299 ( .A(n704), .Y(n481) );
  INVX1 U300 ( .A(n721), .Y(n723) );
  INVX1 U301 ( .A(n728), .Y(n720) );
  NOR2X2 U302 ( .A(n280), .B(n279), .Y(n282) );
  INVX1 U303 ( .A(n735), .Y(n737) );
  INVX1 U304 ( .A(n359), .Y(n254) );
  NAND4XL U305 ( .A(n542), .B(n541), .C(\C1/DATA8_5 ), .D(n792), .Y(n543) );
  INVX1 U306 ( .A(n742), .Y(n744) );
  NAND2XL U307 ( .A(n765), .B(state), .Y(n766) );
  INVX1 U308 ( .A(n749), .Y(n751) );
  INVX3 U309 ( .A(n453), .Y(n332) );
  INVX1 U310 ( .A(n210), .Y(n207) );
  NOR2X1 U311 ( .A(n210), .B(n783), .Y(n211) );
  NAND2XL U312 ( .A(\C1/DATA8_13 ), .B(n697), .Y(n698) );
  INVX1 U313 ( .A(n460), .Y(n218) );
  NAND4XL U314 ( .A(n764), .B(n763), .C(n762), .D(n761), .Y(n765) );
  XOR2X1 U315 ( .A(n473), .B(count[2]), .Y(n474) );
  NAND2X2 U316 ( .A(n463), .B(state), .Y(n233) );
  NAND2XL U317 ( .A(\C1/DATA8_11 ), .B(state), .Y(n708) );
  NAND2XL U318 ( .A(\C1/DATA8_5 ), .B(state), .Y(n753) );
  NOR4X1 U319 ( .A(\C1/DATA8_11 ), .B(\C1/DATA8_10 ), .C(\C1/DATA8_12 ), .D(
        \C1/DATA8_6 ), .Y(n538) );
  NAND2XL U320 ( .A(\C1/DATA8_6 ), .B(state), .Y(n747) );
  NAND2XL U321 ( .A(\C1/DATA8_10 ), .B(\C1/DATA8_6 ), .Y(n540) );
  INVX1 U322 ( .A(n790), .Y(n452) );
  XNOR2X1 U323 ( .A(n779), .B(n412), .Y(n395) );
  ADDHX2 U324 ( .A(n824), .B(n361), .CO(n389), .S(n264) );
  XOR2X1 U325 ( .A(n391), .B(\C1/DATA8_11 ), .Y(n365) );
  INVX3 U326 ( .A(n776), .Y(\C1/DATA2_6 ) );
  NAND2X4 U327 ( .A(n470), .B(n469), .Y(n531) );
  XOR2X1 U328 ( .A(n415), .B(\C1/DATA8_13 ), .Y(n417) );
  NOR2X1 U329 ( .A(\C1/DATA8_8 ), .B(\C1/DATA8_9 ), .Y(n362) );
  XOR2X1 U330 ( .A(n386), .B(res_addr[11]), .Y(n357) );
  XOR2X1 U331 ( .A(n360), .B(res_addr[11]), .Y(n370) );
  OAI2BB1X1 U332 ( .A0N(n225), .A1N(\C1/DATA8_10 ), .B0(n262), .Y(n263) );
  ADDHXL U333 ( .A(n659), .B(res_addr[9]), .CO(n361), .S(n664) );
  NAND2X1 U334 ( .A(res_addr[12]), .B(n412), .Y(n413) );
  OR2X1 U335 ( .A(n410), .B(res_addr[12]), .Y(n411) );
  AND2X2 U336 ( .A(n341), .B(n342), .Y(n197) );
  NAND2X4 U337 ( .A(n345), .B(n344), .Y(n198) );
  OA21X2 U338 ( .A0(n355), .A1(n769), .B0(n252), .Y(n199) );
  AND2X2 U339 ( .A(n341), .B(n338), .Y(n200) );
  NAND2X4 U340 ( .A(res_di[0]), .B(n785), .Y(n302) );
  NAND2X1 U341 ( .A(n660), .B(n362), .Y(n259) );
  CLKINVX1 U342 ( .A(n633), .Y(n224) );
  NAND2X1 U343 ( .A(n217), .B(n686), .Y(n231) );
  XNOR2X1 U344 ( .A(n813), .B(n389), .Y(n368) );
  INVX3 U345 ( .A(n260), .Y(n662) );
  INVX3 U346 ( .A(n341), .Y(n343) );
  NOR2X1 U347 ( .A(n813), .B(n390), .Y(n412) );
  NOR2X1 U348 ( .A(n237), .B(n236), .Y(n249) );
  NOR3X2 U349 ( .A(n343), .B(n465), .C(n342), .Y(n344) );
  OAI2BB1X1 U350 ( .A0N(n686), .A1N(n370), .B0(n369), .Y(n371) );
  NAND2X1 U351 ( .A(n195), .B(n604), .Y(n605) );
  AOI21X1 U352 ( .A0(n680), .A1(n419), .B0(n418), .Y(n420) );
  CLKBUFX3 U353 ( .A(res_di[0]), .Y(n456) );
  NAND3X1 U354 ( .A(n287), .B(n286), .C(n285), .Y(n288) );
  NAND2X1 U355 ( .A(n595), .B(n355), .Y(n596) );
  INVX3 U356 ( .A(n770), .Y(\C1/DATA2_1 ) );
  INVX3 U357 ( .A(n775), .Y(res_addr[2]) );
  NAND2X2 U358 ( .A(\DP_OP_16_135_5330/n73 ), .B(sti_di_buffer[0]), .Y(n201)
         );
  OAI21X2 U359 ( .A0(n781), .A1(\DP_OP_16_135_5330/n73 ), .B0(n201), .Y(n206)
         );
  NAND2X2 U360 ( .A(n206), .B(state), .Y(n220) );
  INVX6 U361 ( .A(res_di[4]), .Y(n351) );
  INVX3 U362 ( .A(res_di[5]), .Y(n203) );
  NAND2X4 U363 ( .A(n351), .B(n203), .Y(n238) );
  NOR2X2 U364 ( .A(n238), .B(res_di[7]), .Y(n205) );
  INVX3 U365 ( .A(res_di[0]), .Y(n292) );
  BUFX16 U366 ( .A(res_di[1]), .Y(n349) );
  NOR2X4 U367 ( .A(n292), .B(n349), .Y(n241) );
  NAND2X1 U368 ( .A(\DP_OP_16_135_5330/n73 ), .B(state), .Y(n210) );
  NOR3X2 U369 ( .A(res_di[6]), .B(n210), .C(n342), .Y(n204) );
  NOR2X6 U370 ( .A(res_di[3]), .B(res_di[2]), .Y(n297) );
  NAND4X4 U371 ( .A(n205), .B(n241), .C(n204), .D(n297), .Y(n209) );
  CLKINVX1 U372 ( .A(n206), .Y(n472) );
  NOR2X6 U373 ( .A(n488), .B(n211), .Y(n272) );
  NOR2X2 U374 ( .A(\C1/DATA5_0 ), .B(\C1/DATA2_1 ), .Y(n547) );
  NOR2X1 U375 ( .A(res_addr[2]), .B(\C1/DATA5_3 ), .Y(n212) );
  CLKINVX1 U376 ( .A(n276), .Y(n611) );
  NAND2X1 U377 ( .A(n611), .B(n273), .Y(n597) );
  NOR2X1 U378 ( .A(n597), .B(\C1/DATA2_6 ), .Y(n232) );
  INVX3 U379 ( .A(n769), .Y(n633) );
  XOR2X1 U380 ( .A(n232), .B(n633), .Y(n213) );
  NAND2X1 U381 ( .A(n196), .B(n213), .Y(n250) );
  NAND2X1 U382 ( .A(\C1/DATA2_2 ), .B(\C1/DATA5_3 ), .Y(n214) );
  NAND2X1 U383 ( .A(\C1/DATA5_0 ), .B(\C1/DATA5_1 ), .Y(n548) );
  NOR2X4 U384 ( .A(n214), .B(n548), .Y(n281) );
  CLKINVX1 U385 ( .A(n281), .Y(n613) );
  NOR2X1 U386 ( .A(n613), .B(n279), .Y(n598) );
  NAND2X1 U387 ( .A(n598), .B(\C1/DATA2_6 ), .Y(n246) );
  XOR2X1 U388 ( .A(n246), .B(n633), .Y(n217) );
  NAND3XL U389 ( .A(n460), .B(\DP_OP_16_135_5330/n73 ), .C(count[2]), .Y(n215)
         );
  NOR2X1 U390 ( .A(n220), .B(n215), .Y(n216) );
  NOR2X1 U391 ( .A(n233), .B(n218), .Y(n219) );
  BUFX4 U392 ( .A(n219), .Y(n681) );
  NAND2X1 U393 ( .A(n221), .B(\DP_OP_16_135_5330/n73 ), .Y(n242) );
  NOR2XL U394 ( .A(count[1]), .B(count[2]), .Y(n222) );
  NAND2X1 U395 ( .A(n222), .B(count[0]), .Y(n223) );
  NOR2X4 U396 ( .A(n242), .B(n223), .Y(n680) );
  AOI22X1 U397 ( .A0(n769), .A1(n681), .B0(n680), .B1(n224), .Y(n230) );
  CLKINVX1 U398 ( .A(n225), .Y(n636) );
  NAND2BX1 U399 ( .AN(n636), .B(\C1/DATA8_7 ), .Y(n229) );
  NOR2X2 U400 ( .A(\C1/DATA8_5 ), .B(\C1/DATA8_4 ), .Y(n257) );
  CLKINVX1 U401 ( .A(n257), .Y(n599) );
  NOR2X1 U402 ( .A(n599), .B(\C1/DATA8_6 ), .Y(n226) );
  XOR2X1 U403 ( .A(n226), .B(\C1/DATA8_7 ), .Y(n227) );
  NOR2X1 U404 ( .A(\DP_OP_16_135_5330/n73 ), .B(state), .Y(n617) );
  NAND2X1 U405 ( .A(n227), .B(n617), .Y(n228) );
  NAND4X1 U406 ( .A(n231), .B(n230), .C(n229), .D(n228), .Y(n237) );
  XOR2X1 U407 ( .A(n232), .B(n224), .Y(n235) );
  CLKINVX1 U408 ( .A(n233), .Y(n234) );
  NOR2X1 U409 ( .A(n777), .B(n783), .Y(n473) );
  NAND2X1 U410 ( .A(n234), .B(n473), .Y(n429) );
  INVX3 U411 ( .A(n429), .Y(n687) );
  AND2X2 U412 ( .A(n235), .B(n687), .Y(n236) );
  NOR3X2 U413 ( .A(res_di[6]), .B(n342), .C(res_di[7]), .Y(n240) );
  INVX3 U414 ( .A(n238), .Y(n239) );
  NAND4X4 U415 ( .A(n241), .B(n240), .C(n297), .D(n239), .Y(n335) );
  CLKINVX1 U416 ( .A(n342), .Y(n337) );
  CLKINVX1 U417 ( .A(n242), .Y(n243) );
  NAND3X4 U418 ( .A(n335), .B(n337), .C(n243), .Y(n245) );
  NOR2X1 U419 ( .A(n473), .B(n460), .Y(n486) );
  NOR2X1 U420 ( .A(n755), .B(\DP_OP_16_135_5330/n73 ), .Y(n469) );
  OAI21XL U421 ( .A0(n486), .A1(n781), .B0(n469), .Y(n244) );
  AND2X8 U422 ( .A(n245), .B(n244), .Y(n278) );
  XOR2X1 U423 ( .A(n246), .B(n224), .Y(n247) );
  NAND3X1 U424 ( .A(n250), .B(n249), .C(n248), .Y(n251) );
  NAND2X2 U425 ( .A(n251), .B(n355), .Y(n252) );
  INVX3 U426 ( .A(n771), .Y(res_addr[10]) );
  NOR2X1 U427 ( .A(n279), .B(n776), .Y(n253) );
  AOI21X1 U428 ( .A0(n253), .A1(n281), .B0(n633), .Y(n400) );
  NOR2X1 U429 ( .A(n656), .B(n254), .Y(n255) );
  XOR2X1 U430 ( .A(n255), .B(res_addr[10]), .Y(n271) );
  CLKINVX1 U431 ( .A(n681), .Y(n385) );
  XNOR2X1 U432 ( .A(n375), .B(res_addr[10]), .Y(n256) );
  NAND2BX1 U433 ( .AN(n385), .B(n256), .Y(n269) );
  NOR2X1 U434 ( .A(\C1/DATA8_7 ), .B(\C1/DATA8_6 ), .Y(n258) );
  NAND2X1 U435 ( .A(n258), .B(n257), .Y(n364) );
  CLKINVX1 U436 ( .A(n364), .Y(n660) );
  XNOR2X1 U437 ( .A(n259), .B(\C1/DATA8_10 ), .Y(n261) );
  CLKINVX1 U438 ( .A(n617), .Y(n260) );
  NAND2X1 U439 ( .A(n261), .B(n662), .Y(n262) );
  AOI21X1 U440 ( .A0(n264), .A1(n680), .B0(n263), .Y(n268) );
  NAND2X1 U441 ( .A(n633), .B(\C1/DATA5_6 ), .Y(n280) );
  MXI2X2 U442 ( .A(n224), .B(n280), .S0(n273), .Y(n265) );
  MXI2X2 U443 ( .A(n265), .B(res_addr[7]), .S0(n276), .Y(n630) );
  NAND2X1 U444 ( .A(n825), .B(res_addr[9]), .Y(n283) );
  NAND3X1 U445 ( .A(n269), .B(n268), .C(n267), .Y(n270) );
  AOI21X1 U446 ( .A0(n686), .A1(n271), .B0(n270), .Y(n287) );
  NOR2X1 U447 ( .A(n633), .B(\C1/DATA5_6 ), .Y(n274) );
  NAND2X1 U448 ( .A(n274), .B(n273), .Y(n275) );
  NOR2X1 U449 ( .A(n276), .B(n275), .Y(n628) );
  NAND2X1 U450 ( .A(n628), .B(n359), .Y(n356) );
  NAND2X1 U451 ( .A(n196), .B(n277), .Y(n286) );
  NAND2X1 U452 ( .A(n282), .B(n281), .Y(n644) );
  NAND2X1 U453 ( .A(n195), .B(n284), .Y(n285) );
  NAND2X1 U454 ( .A(n288), .B(n355), .Y(n289) );
  XNOR2X2 U455 ( .A(n313), .B(res_di[2]), .Y(n346) );
  NAND2X2 U456 ( .A(n302), .B(res_do[1]), .Y(n290) );
  INVX3 U457 ( .A(n349), .Y(n303) );
  NAND2X2 U458 ( .A(n290), .B(n303), .Y(n294) );
  NOR2XL U459 ( .A(res_do[1]), .B(res_do[0]), .Y(n291) );
  NOR2XL U460 ( .A(n291), .B(n784), .Y(n293) );
  NAND3X2 U461 ( .A(n294), .B(n293), .C(n306), .Y(n295) );
  NAND2X4 U462 ( .A(n346), .B(n295), .Y(n312) );
  INVX1 U463 ( .A(res_di[3]), .Y(n296) );
  NAND2X1 U464 ( .A(n313), .B(n296), .Y(n301) );
  NOR2X2 U465 ( .A(n297), .B(res_do[3]), .Y(n300) );
  NAND2X6 U466 ( .A(res_di[3]), .B(res_di[2]), .Y(n298) );
  NOR2X8 U467 ( .A(n313), .B(n298), .Y(n330) );
  INVX3 U468 ( .A(n330), .Y(n299) );
  NAND3X2 U469 ( .A(n301), .B(n300), .C(n299), .Y(n311) );
  CLKINVX1 U470 ( .A(n302), .Y(n304) );
  NAND2X2 U471 ( .A(n304), .B(n303), .Y(n308) );
  NAND2X2 U472 ( .A(res_di[1]), .B(res_do[0]), .Y(n305) );
  NAND2X1 U473 ( .A(n305), .B(n787), .Y(n307) );
  NAND2X4 U474 ( .A(n309), .B(n784), .Y(n310) );
  MXI2X2 U475 ( .A(n314), .B(res_di[3]), .S0(n313), .Y(n448) );
  NAND2X2 U476 ( .A(n448), .B(res_do[3]), .Y(n316) );
  XOR2X4 U477 ( .A(n330), .B(n351), .Y(n319) );
  NAND2X2 U478 ( .A(n319), .B(res_do[4]), .Y(n315) );
  NAND3X6 U479 ( .A(n317), .B(n316), .C(n315), .Y(n322) );
  XOR2X1 U480 ( .A(res_di[4]), .B(res_di[5]), .Y(n318) );
  CLKMX2X4 U481 ( .A(res_di[5]), .B(n318), .S0(n330), .Y(n323) );
  NAND2X4 U482 ( .A(n323), .B(n790), .Y(n321) );
  INVX3 U483 ( .A(n319), .Y(n352) );
  NAND2X4 U484 ( .A(n352), .B(n789), .Y(n320) );
  NAND3X6 U485 ( .A(n322), .B(n321), .C(n320), .Y(n327) );
  NAND2X2 U486 ( .A(n450), .B(res_do[5]), .Y(n326) );
  NAND2X2 U487 ( .A(res_di[4]), .B(res_di[5]), .Y(n328) );
  MXI2X4 U488 ( .A(res_di[6]), .B(n324), .S0(n330), .Y(n453) );
  NAND2X2 U489 ( .A(n453), .B(res_do[6]), .Y(n325) );
  NAND3X6 U490 ( .A(n327), .B(n326), .C(n325), .Y(n334) );
  INVX3 U491 ( .A(n328), .Y(n329) );
  XOR2X4 U492 ( .A(n331), .B(res_di[7]), .Y(n445) );
  AOI2BB2X4 U493 ( .B0(n332), .B1(n791), .A0N(res_do[7]), .A1N(n445), .Y(n333)
         );
  NAND2X8 U494 ( .A(n334), .B(n333), .Y(n345) );
  NAND2X4 U495 ( .A(n445), .B(res_do[7]), .Y(n341) );
  NAND2X4 U496 ( .A(n335), .B(\DP_OP_16_135_5330/n73 ), .Y(n465) );
  NAND2X2 U497 ( .A(n465), .B(\DP_OP_16_135_5330/n73 ), .Y(n339) );
  AND2X8 U498 ( .A(n336), .B(n339), .Y(n447) );
  NAND2X1 U499 ( .A(n337), .B(n774), .Y(n338) );
  NAND2X8 U500 ( .A(n340), .B(n339), .Y(n457) );
  AOI22X4 U501 ( .A0(n353), .A1(n346), .B0(res_di[2]), .B1(n454), .Y(n347) );
  XNOR2X1 U502 ( .A(n456), .B(n349), .Y(n348) );
  AOI2BB2X2 U503 ( .B0(n454), .B1(n349), .A0N(n457), .A1N(n348), .Y(n350) );
  OAI2BB1X2 U504 ( .A0N(res_do[1]), .A1N(n194), .B0(n350), .Y(n148) );
  AOI2BB2X4 U505 ( .B0(n353), .B1(n352), .A0N(n351), .A1N(n198), .Y(n354) );
  OAI21X4 U506 ( .A0(n447), .A1(n789), .B0(n354), .Y(n145) );
  NOR2X2 U507 ( .A(n356), .B(res_addr[10]), .Y(n386) );
  NAND2X1 U508 ( .A(n196), .B(n357), .Y(n380) );
  XOR2X1 U509 ( .A(n387), .B(n813), .Y(n372) );
  NAND2X1 U510 ( .A(n359), .B(n771), .Y(n398) );
  NOR2X1 U511 ( .A(n656), .B(n398), .Y(n360) );
  NAND2X1 U512 ( .A(n362), .B(n782), .Y(n363) );
  NOR2X2 U513 ( .A(n364), .B(n363), .Y(n391) );
  NAND2X1 U514 ( .A(n365), .B(n662), .Y(n366) );
  OAI2BB1X1 U515 ( .A0N(n225), .A1N(\C1/DATA8_11 ), .B0(n366), .Y(n367) );
  AOI21X1 U516 ( .A0(n372), .A1(n687), .B0(n371), .Y(n379) );
  XOR2X1 U517 ( .A(n396), .B(n813), .Y(n374) );
  NAND2X1 U518 ( .A(n195), .B(n374), .Y(n378) );
  XNOR2X1 U519 ( .A(n383), .B(res_addr[11]), .Y(n376) );
  NAND2BX1 U520 ( .AN(n385), .B(n376), .Y(n377) );
  NAND4X2 U521 ( .A(n380), .B(n379), .C(n378), .D(n377), .Y(n381) );
  NAND2X1 U522 ( .A(n381), .B(n355), .Y(n382) );
  OR2X1 U523 ( .A(n383), .B(res_addr[11]), .Y(n410) );
  XNOR2X1 U524 ( .A(n410), .B(res_addr[12]), .Y(n384) );
  NAND2BX1 U525 ( .AN(n385), .B(n384), .Y(n409) );
  NAND2X1 U526 ( .A(n386), .B(n813), .Y(n423) );
  XNOR2X1 U527 ( .A(n423), .B(res_addr[12]), .Y(n407) );
  XNOR2X1 U528 ( .A(n427), .B(n779), .Y(n388) );
  NAND2X1 U529 ( .A(n388), .B(n687), .Y(n405) );
  NAND2X1 U530 ( .A(n391), .B(n809), .Y(n414) );
  XNOR2X1 U531 ( .A(n414), .B(\C1/DATA8_12 ), .Y(n392) );
  AOI21X1 U532 ( .A0(n392), .A1(n662), .B0(n422), .Y(n393) );
  OAI2BB1X1 U533 ( .A0N(n225), .A1N(\C1/DATA8_12 ), .B0(n393), .Y(n394) );
  NOR2X2 U534 ( .A(n396), .B(n813), .Y(n433) );
  XNOR2X1 U535 ( .A(n433), .B(n779), .Y(n397) );
  NAND2X1 U536 ( .A(n195), .B(n397), .Y(n403) );
  NOR2X1 U537 ( .A(n398), .B(res_addr[11]), .Y(n399) );
  XNOR2X1 U538 ( .A(n431), .B(res_addr[12]), .Y(n401) );
  AOI21X1 U539 ( .A0(n407), .A1(n196), .B0(n406), .Y(n408) );
  AOI2BB2X2 U540 ( .B0(n409), .B1(n408), .A0N(res_addr[12]), .A1N(n355), .Y(
        n152) );
  XNOR2X1 U541 ( .A(n411), .B(res_addr[13]), .Y(n421) );
  AOI21X1 U542 ( .A0(\C1/DATA8_13 ), .A1(n225), .B0(n422), .Y(n416) );
  OAI2BB1X1 U543 ( .A0N(n617), .A1N(n417), .B0(n416), .Y(n418) );
  OAI2BB1X1 U544 ( .A0N(n681), .A1N(n421), .B0(n420), .Y(n426) );
  NAND2X1 U545 ( .A(n422), .B(n810), .Y(n435) );
  NOR2X1 U546 ( .A(n423), .B(res_addr[12]), .Y(n424) );
  NOR2X1 U547 ( .A(n426), .B(n425), .Y(n443) );
  NAND2X1 U548 ( .A(n427), .B(res_addr[12]), .Y(n428) );
  XOR2X1 U549 ( .A(n428), .B(n810), .Y(n441) );
  NOR2X1 U550 ( .A(n430), .B(n429), .Y(n440) );
  XOR2X1 U551 ( .A(n432), .B(res_addr[13]), .Y(n438) );
  XOR2X1 U552 ( .A(n434), .B(n810), .Y(n436) );
  AOI21X1 U553 ( .A0(n441), .A1(n440), .B0(n439), .Y(n442) );
  OAI21X2 U554 ( .A0(n444), .A1(n443), .B0(n442), .Y(n823) );
  INVX3 U555 ( .A(n447), .Y(n459) );
  AOI2BB2X2 U556 ( .B0(res_di[7]), .B1(n454), .A0N(n457), .A1N(n445), .Y(n446)
         );
  OAI2BB1X2 U557 ( .A0N(res_do[7]), .A1N(n459), .B0(n446), .Y(n149) );
  AOI2BB2X2 U558 ( .B0(n454), .B1(res_di[3]), .A0N(n457), .A1N(n448), .Y(n449)
         );
  OAI2BB1X2 U559 ( .A0N(res_do[3]), .A1N(n194), .B0(n449), .Y(n146) );
  AOI2BB2X2 U560 ( .B0(n454), .B1(res_di[5]), .A0N(n457), .A1N(n450), .Y(n451)
         );
  OAI2BB1X2 U561 ( .A0N(n452), .A1N(n459), .B0(n451), .Y(n144) );
  AOI2BB2X2 U562 ( .B0(res_di[6]), .B1(n454), .A0N(n457), .A1N(n453), .Y(n455)
         );
  OAI2BB1X2 U563 ( .A0N(res_do[6]), .A1N(n194), .B0(n455), .Y(n142) );
  CLKMX2X2 U564 ( .A(n457), .B(n198), .S0(n456), .Y(n458) );
  OAI2BB1X2 U565 ( .A0N(res_do[0]), .A1N(n459), .B0(n458), .Y(n150) );
  OAI21X2 U566 ( .A0(n465), .A1(n788), .B0(n464), .Y(n467) );
  NAND2X1 U567 ( .A(n468), .B(sti_di_buffer[15]), .Y(n470) );
  AOI2BB2X1 U568 ( .B0(sti_di[15]), .B1(n780), .A0N(n531), .A1N(n811), .Y(n471) );
  OAI21X1 U569 ( .A0(n535), .A1(n781), .B0(n471), .Y(n182) );
  NAND2X1 U570 ( .A(n472), .B(state), .Y(n546) );
  NAND2X1 U571 ( .A(n544), .B(n474), .Y(n475) );
  OAI21XL U572 ( .A0(n546), .A1(n786), .B0(n475), .Y(n183) );
  NOR2X1 U573 ( .A(\C1/DATA8_6 ), .B(n697), .Y(n742) );
  NOR2X1 U574 ( .A(\C1/DATA8_7 ), .B(n697), .Y(n735) );
  NOR2X1 U575 ( .A(n742), .B(n735), .Y(n477) );
  NOR2X1 U576 ( .A(\C1/DATA8_5 ), .B(n697), .Y(n749) );
  NAND2X1 U577 ( .A(\C1/DATA8_5 ), .B(n697), .Y(n750) );
  OAI21X1 U578 ( .A0(n749), .A1(N58), .B0(n750), .Y(n734) );
  NAND2X1 U579 ( .A(\C1/DATA8_7 ), .B(n697), .Y(n736) );
  NAND2X1 U580 ( .A(\C1/DATA8_6 ), .B(n697), .Y(n743) );
  NAND2X1 U581 ( .A(n736), .B(n743), .Y(n476) );
  AOI21X2 U582 ( .A0(n477), .A1(n734), .B0(n476), .Y(n710) );
  NOR2X1 U583 ( .A(\C1/DATA8_8 ), .B(n697), .Y(n719) );
  NOR2X1 U584 ( .A(\C1/DATA8_9 ), .B(n697), .Y(n721) );
  NOR2X1 U585 ( .A(n719), .B(n721), .Y(n712) );
  OR2X1 U586 ( .A(\C1/DATA8_10 ), .B(n697), .Y(n714) );
  NAND2X1 U587 ( .A(n712), .B(n714), .Y(n480) );
  NAND2X1 U588 ( .A(\C1/DATA8_9 ), .B(n697), .Y(n722) );
  NAND2X1 U589 ( .A(n722), .B(n728), .Y(n711) );
  NAND2X1 U590 ( .A(\C1/DATA8_10 ), .B(n697), .Y(n713) );
  NOR2X1 U591 ( .A(n711), .B(n478), .Y(n479) );
  OAI21X2 U592 ( .A0(n710), .A1(n480), .B0(n479), .Y(n707) );
  OR2X1 U593 ( .A(\C1/DATA8_11 ), .B(n697), .Y(n705) );
  NAND2X1 U594 ( .A(\C1/DATA8_11 ), .B(n697), .Y(n704) );
  AOI21X1 U595 ( .A0(n707), .A1(n705), .B0(n481), .Y(n696) );
  NOR2X1 U596 ( .A(\C1/DATA8_12 ), .B(n697), .Y(n695) );
  NAND2X1 U597 ( .A(n482), .B(n694), .Y(n483) );
  XOR2X1 U598 ( .A(n696), .B(n483), .Y(n484) );
  NAND2X1 U599 ( .A(n484), .B(n755), .Y(n485) );
  OAI21X1 U600 ( .A0(n780), .A1(n806), .B0(n485), .Y(n139) );
  NAND2X1 U601 ( .A(n544), .B(n486), .Y(n487) );
  OAI21XL U602 ( .A0(n546), .A1(n783), .B0(n487), .Y(n165) );
  CLKINVX1 U603 ( .A(n488), .Y(n489) );
  INVX6 U604 ( .A(n489), .Y(n533) );
  NAND2X1 U605 ( .A(sti_di[13]), .B(n755), .Y(n490) );
  OAI21XL U606 ( .A0(n531), .A1(n797), .B0(n490), .Y(n491) );
  AOI21X1 U607 ( .A0(n533), .A1(sti_di_buffer[14]), .B0(n491), .Y(n492) );
  OAI21X1 U608 ( .A0(n535), .A1(n796), .B0(n492), .Y(n168) );
  NAND2X1 U609 ( .A(sti_di[9]), .B(n780), .Y(n493) );
  OAI21XL U610 ( .A0(n531), .A1(n798), .B0(n493), .Y(n494) );
  AOI21X1 U611 ( .A0(n533), .A1(sti_di_buffer[10]), .B0(n494), .Y(n495) );
  OAI21X1 U612 ( .A0(n535), .A1(n801), .B0(n495), .Y(n172) );
  NAND2X1 U613 ( .A(sti_di[5]), .B(n780), .Y(n496) );
  OAI21XL U614 ( .A0(n531), .A1(n799), .B0(n496), .Y(n497) );
  AOI21X1 U615 ( .A0(n533), .A1(sti_di_buffer[6]), .B0(n497), .Y(n498) );
  OAI21X1 U616 ( .A0(n535), .A1(n802), .B0(n498), .Y(n176) );
  AOI22X1 U617 ( .A0(n533), .A1(sti_di_buffer[1]), .B0(sti_di[0]), .B1(n780), 
        .Y(n499) );
  OAI21X1 U618 ( .A0(n535), .A1(n788), .B0(n499), .Y(n181) );
  NAND2X1 U619 ( .A(sti_di[1]), .B(n780), .Y(n500) );
  OAI21XL U620 ( .A0(n531), .A1(n788), .B0(n500), .Y(n501) );
  AOI21X1 U621 ( .A0(n533), .A1(sti_di_buffer[2]), .B0(n501), .Y(n502) );
  OAI21X1 U622 ( .A0(n535), .A1(n795), .B0(n502), .Y(n180) );
  NAND2X1 U623 ( .A(sti_di[6]), .B(n780), .Y(n503) );
  OAI21XL U624 ( .A0(n531), .A1(n802), .B0(n503), .Y(n504) );
  AOI21X1 U625 ( .A0(n533), .A1(sti_di_buffer[7]), .B0(n504), .Y(n505) );
  OAI21X1 U626 ( .A0(n535), .A1(n794), .B0(n505), .Y(n175) );
  NAND2X1 U627 ( .A(sti_di[2]), .B(n780), .Y(n506) );
  OAI21XL U628 ( .A0(n531), .A1(n795), .B0(n506), .Y(n507) );
  AOI21X1 U629 ( .A0(n533), .A1(sti_di_buffer[3]), .B0(n507), .Y(n508) );
  OAI21X1 U630 ( .A0(n535), .A1(n800), .B0(n508), .Y(n179) );
  OAI21XL U631 ( .A0(n531), .A1(n804), .B0(n509), .Y(n510) );
  AOI21X1 U632 ( .A0(n533), .A1(sti_di_buffer[9]), .B0(n510), .Y(n511) );
  OAI21X1 U633 ( .A0(n535), .A1(n798), .B0(n511), .Y(n173) );
  NAND2X1 U634 ( .A(sti_di[10]), .B(n780), .Y(n512) );
  OAI21XL U635 ( .A0(n531), .A1(n801), .B0(n512), .Y(n513) );
  AOI21X1 U636 ( .A0(n533), .A1(sti_di_buffer[11]), .B0(n513), .Y(n514) );
  OAI21X1 U637 ( .A0(n535), .A1(n793), .B0(n514), .Y(n171) );
  NAND2X1 U638 ( .A(sti_di[11]), .B(n755), .Y(n515) );
  OAI21XL U639 ( .A0(n531), .A1(n793), .B0(n515), .Y(n516) );
  AOI21X1 U640 ( .A0(n533), .A1(sti_di_buffer[12]), .B0(n516), .Y(n517) );
  OAI21X1 U641 ( .A0(n535), .A1(n803), .B0(n517), .Y(n170) );
  NAND2X1 U642 ( .A(sti_di[4]), .B(n780), .Y(n518) );
  OAI21XL U643 ( .A0(n531), .A1(n805), .B0(n518), .Y(n519) );
  AOI21X1 U644 ( .A0(n533), .A1(sti_di_buffer[5]), .B0(n519), .Y(n520) );
  OAI21X1 U645 ( .A0(n535), .A1(n799), .B0(n520), .Y(n177) );
  NAND2X1 U646 ( .A(sti_di[12]), .B(n755), .Y(n521) );
  OAI21XL U647 ( .A0(n531), .A1(n803), .B0(n521), .Y(n522) );
  AOI21X1 U648 ( .A0(n533), .A1(sti_di_buffer[13]), .B0(n522), .Y(n523) );
  OAI21X1 U649 ( .A0(n535), .A1(n797), .B0(n523), .Y(n169) );
  NAND2X1 U650 ( .A(sti_di[3]), .B(n780), .Y(n524) );
  OAI21XL U651 ( .A0(n531), .A1(n800), .B0(n524), .Y(n525) );
  AOI21X1 U652 ( .A0(n533), .A1(sti_di_buffer[4]), .B0(n525), .Y(n526) );
  OAI21X1 U653 ( .A0(n535), .A1(n805), .B0(n526), .Y(n178) );
  NAND2X1 U654 ( .A(sti_di[14]), .B(n780), .Y(n527) );
  OAI21XL U655 ( .A0(n531), .A1(n796), .B0(n527), .Y(n528) );
  AOI21X1 U656 ( .A0(n533), .A1(sti_di_buffer[15]), .B0(n528), .Y(n529) );
  OAI21X1 U657 ( .A0(n535), .A1(n811), .B0(n529), .Y(n167) );
  NAND2X1 U658 ( .A(sti_di[7]), .B(n780), .Y(n530) );
  OAI21XL U659 ( .A0(n531), .A1(n794), .B0(n530), .Y(n532) );
  AOI21X1 U660 ( .A0(n533), .A1(sti_di_buffer[8]), .B0(n532), .Y(n534) );
  OAI21X1 U661 ( .A0(n535), .A1(n804), .B0(n534), .Y(n174) );
  NOR3X1 U662 ( .A(n807), .B(\C1/DATA8_13 ), .C(\C1/DATA8_4 ), .Y(n537) );
  NOR2X1 U663 ( .A(n792), .B(\C1/DATA8_5 ), .Y(n536) );
  NAND4X1 U664 ( .A(n538), .B(n225), .C(n537), .D(n536), .Y(n539) );
  NOR3X1 U665 ( .A(n809), .B(n540), .C(n806), .Y(n542) );
  NOR3X1 U666 ( .A(n808), .B(N58), .C(\C1/DATA8_8 ), .Y(n541) );
  OAI22XL U667 ( .A0(done), .A1(n774), .B0(\C1/DATA8_7 ), .B1(n543), .Y(n166)
         );
  CLKBUFX3 U668 ( .A(reset), .Y(n820) );
  CLKBUFX3 U669 ( .A(reset), .Y(n822) );
  CLKBUFX3 U670 ( .A(reset), .Y(n821) );
  NAND2X1 U671 ( .A(n544), .B(n777), .Y(n545) );
  OAI21X1 U672 ( .A0(n777), .A1(n546), .B0(n545), .Y(n184) );
  CLKINVX1 U673 ( .A(n547), .Y(n560) );
  XNOR2X1 U674 ( .A(n560), .B(\C1/DATA2_2 ), .Y(n553) );
  NAND2X1 U675 ( .A(n196), .B(n553), .Y(n557) );
  XNOR2X1 U676 ( .A(n562), .B(n775), .Y(n552) );
  NAND2X1 U677 ( .A(n680), .B(\C1/DATA2_2 ), .Y(n550) );
  NOR2X1 U678 ( .A(n225), .B(n662), .Y(n683) );
  NAND2X1 U679 ( .A(n681), .B(\C1/DATA2_2 ), .Y(n549) );
  NAND3X1 U680 ( .A(n550), .B(n683), .C(n549), .Y(n551) );
  AOI21X1 U681 ( .A0(n552), .A1(n686), .B0(n551), .Y(n556) );
  NAND2X1 U682 ( .A(n195), .B(n552), .Y(n555) );
  NAND2X1 U683 ( .A(n553), .B(n687), .Y(n554) );
  NAND4X1 U684 ( .A(n557), .B(n556), .C(n555), .D(n554), .Y(n558) );
  NAND2X1 U685 ( .A(n558), .B(n355), .Y(n559) );
  OAI21X1 U686 ( .A0(n355), .A1(n775), .B0(n559), .Y(n162) );
  NOR2X1 U687 ( .A(n560), .B(\C1/DATA2_2 ), .Y(n561) );
  XOR2X1 U688 ( .A(n561), .B(\C1/DATA2_3 ), .Y(n568) );
  NAND2X1 U689 ( .A(n562), .B(\C1/DATA2_2 ), .Y(n563) );
  XOR2X1 U690 ( .A(n563), .B(n778), .Y(n567) );
  NAND2X1 U691 ( .A(n680), .B(\C1/DATA2_3 ), .Y(n565) );
  NAND3X1 U692 ( .A(n565), .B(n683), .C(n564), .Y(n566) );
  AOI21X1 U693 ( .A0(n567), .A1(n686), .B0(n566), .Y(n571) );
  NAND2X1 U694 ( .A(n195), .B(n567), .Y(n570) );
  NAND2X1 U695 ( .A(n568), .B(n687), .Y(n569) );
  NAND4X1 U696 ( .A(n572), .B(n571), .C(n570), .D(n569), .Y(n573) );
  NAND2X2 U697 ( .A(n573), .B(n355), .Y(n574) );
  OAI21X1 U698 ( .A0(n355), .A1(n778), .B0(n574), .Y(n161) );
  XNOR2X1 U699 ( .A(\C1/DATA2_0 ), .B(\C1/DATA2_1 ), .Y(n578) );
  NAND2X1 U700 ( .A(n196), .B(n578), .Y(n583) );
  NAND2X1 U701 ( .A(n680), .B(\C1/DATA2_1 ), .Y(n576) );
  NAND2X1 U702 ( .A(n681), .B(\C1/DATA2_1 ), .Y(n575) );
  NAND3X1 U703 ( .A(n576), .B(n683), .C(n575), .Y(n577) );
  AOI21X1 U704 ( .A0(n578), .A1(n687), .B0(n577), .Y(n582) );
  CLKINVX1 U705 ( .A(n578), .Y(n579) );
  NAND2X1 U706 ( .A(n195), .B(n579), .Y(n581) );
  NAND2X1 U707 ( .A(n579), .B(n686), .Y(n580) );
  NAND4X1 U708 ( .A(n583), .B(n582), .C(n581), .D(n580), .Y(n584) );
  OAI21X1 U709 ( .A0(n355), .A1(n770), .B0(n585), .Y(n163) );
  XOR2X1 U710 ( .A(n611), .B(\C1/DATA2_4 ), .Y(n589) );
  NAND2X1 U711 ( .A(n196), .B(n589), .Y(n594) );
  XOR2X1 U712 ( .A(n613), .B(n773), .Y(n590) );
  NAND2X1 U713 ( .A(N58), .B(n662), .Y(n587) );
  AOI22X1 U714 ( .A0(n680), .A1(\C1/DATA2_4 ), .B0(n681), .B1(\C1/DATA2_4 ), 
        .Y(n586) );
  NAND2X1 U715 ( .A(n587), .B(n586), .Y(n588) );
  AOI21X1 U716 ( .A0(n590), .A1(n686), .B0(n588), .Y(n593) );
  AOI22X1 U717 ( .A0(\C1/DATA8_4 ), .A1(n225), .B0(n687), .B1(n589), .Y(n592)
         );
  NAND4X1 U718 ( .A(n594), .B(n593), .C(n592), .D(n591), .Y(n595) );
  OAI21X1 U719 ( .A0(n355), .A1(n773), .B0(n596), .Y(n160) );
  XNOR2X1 U720 ( .A(n597), .B(\C1/DATA2_6 ), .Y(n603) );
  NAND2X1 U721 ( .A(n196), .B(n603), .Y(n608) );
  XNOR2X1 U722 ( .A(n776), .B(n598), .Y(n604) );
  XNOR2X1 U723 ( .A(n599), .B(\C1/DATA8_6 ), .Y(n601) );
  AOI22X1 U724 ( .A0(n680), .A1(\C1/DATA2_6 ), .B0(n681), .B1(\C1/DATA2_6 ), 
        .Y(n600) );
  OAI2BB1X1 U725 ( .A0N(n662), .A1N(n601), .B0(n600), .Y(n602) );
  AOI21X1 U726 ( .A0(n604), .A1(n686), .B0(n602), .Y(n607) );
  AOI22X1 U727 ( .A0(\C1/DATA8_6 ), .A1(n225), .B0(n687), .B1(n603), .Y(n606)
         );
  NAND4X1 U728 ( .A(n608), .B(n607), .C(n606), .D(n605), .Y(n609) );
  NAND2X2 U729 ( .A(n609), .B(n355), .Y(n610) );
  OAI21X1 U730 ( .A0(n355), .A1(n776), .B0(n610), .Y(n158) );
  NAND2X1 U731 ( .A(n611), .B(n773), .Y(n612) );
  XNOR2X1 U732 ( .A(n612), .B(\C1/DATA2_5 ), .Y(n615) );
  NAND2X1 U733 ( .A(n196), .B(n615), .Y(n625) );
  NOR2X1 U734 ( .A(n613), .B(n773), .Y(n614) );
  XNOR2X1 U735 ( .A(n614), .B(n814), .Y(n623) );
  AOI22X1 U736 ( .A0(n687), .A1(n615), .B0(n623), .B1(n686), .Y(n621) );
  XNOR2X1 U737 ( .A(\C1/DATA8_5 ), .B(\C1/DATA8_4 ), .Y(n618) );
  AO22X1 U738 ( .A0(n680), .A1(\C1/DATA2_5 ), .B0(n681), .B1(\C1/DATA2_5 ), 
        .Y(n616) );
  AOI21X1 U739 ( .A0(n618), .A1(n617), .B0(n616), .Y(n620) );
  NAND2BX1 U740 ( .AN(n636), .B(\C1/DATA8_5 ), .Y(n619) );
  NAND3X1 U741 ( .A(n621), .B(n620), .C(n619), .Y(n622) );
  AOI21X1 U742 ( .A0(n195), .A1(n623), .B0(n622), .Y(n624) );
  NAND2X1 U743 ( .A(n625), .B(n624), .Y(n626) );
  NAND2X1 U744 ( .A(n626), .B(n355), .Y(n627) );
  OAI21X1 U745 ( .A0(n355), .A1(n814), .B0(n627), .Y(n159) );
  CLKINVX1 U746 ( .A(n628), .Y(n651) );
  XNOR2X1 U747 ( .A(n651), .B(n825), .Y(n629) );
  NAND2X1 U748 ( .A(n196), .B(n629), .Y(n648) );
  CLKINVX1 U749 ( .A(n630), .Y(n654) );
  XNOR2X1 U750 ( .A(n654), .B(n768), .Y(n631) );
  AND2X2 U751 ( .A(n631), .B(n687), .Y(n643) );
  XNOR2X1 U752 ( .A(n656), .B(n825), .Y(n632) );
  NAND2X1 U753 ( .A(n632), .B(n686), .Y(n641) );
  XNOR2X1 U754 ( .A(n633), .B(n825), .Y(n635) );
  NAND2BX1 U755 ( .AN(n636), .B(\C1/DATA8_8 ), .Y(n639) );
  XOR2X1 U756 ( .A(n660), .B(\C1/DATA8_8 ), .Y(n637) );
  NAND2X1 U757 ( .A(n637), .B(n662), .Y(n638) );
  NAND4X1 U758 ( .A(n641), .B(n640), .C(n639), .D(n638), .Y(n642) );
  NOR2X1 U759 ( .A(n643), .B(n642), .Y(n647) );
  CLKINVX1 U760 ( .A(n644), .Y(n672) );
  XNOR2X1 U761 ( .A(n672), .B(n768), .Y(n645) );
  NAND2X1 U762 ( .A(n195), .B(n645), .Y(n646) );
  NAND3X1 U763 ( .A(n648), .B(n647), .C(n646), .Y(n649) );
  NAND2X1 U764 ( .A(n649), .B(n355), .Y(n650) );
  OAI21X1 U765 ( .A0(n355), .A1(n768), .B0(n650), .Y(n156) );
  NOR2X1 U766 ( .A(n651), .B(res_addr[8]), .Y(n652) );
  XOR2X1 U767 ( .A(n652), .B(res_addr[9]), .Y(n653) );
  NAND2X1 U768 ( .A(n196), .B(n653), .Y(n677) );
  NAND2X1 U769 ( .A(n654), .B(n825), .Y(n655) );
  XOR2X1 U770 ( .A(n655), .B(n812), .Y(n671) );
  NOR2X1 U771 ( .A(n656), .B(n825), .Y(n657) );
  XOR2X1 U772 ( .A(n657), .B(res_addr[9]), .Y(n669) );
  XNOR2X1 U773 ( .A(n658), .B(res_addr[9]), .Y(n667) );
  NAND2X1 U774 ( .A(n660), .B(n807), .Y(n661) );
  XNOR2X1 U775 ( .A(n661), .B(\C1/DATA8_9 ), .Y(n663) );
  AOI22X1 U776 ( .A0(n664), .A1(n680), .B0(n663), .B1(n662), .Y(n665) );
  OAI2BB1X1 U777 ( .A0N(n225), .A1N(\C1/DATA8_9 ), .B0(n665), .Y(n666) );
  OAI2BB1X1 U778 ( .A0N(n686), .A1N(n669), .B0(n668), .Y(n670) );
  AOI21X1 U779 ( .A0(n687), .A1(n671), .B0(n670), .Y(n676) );
  NAND2X1 U780 ( .A(n672), .B(n825), .Y(n673) );
  XOR2X1 U781 ( .A(n673), .B(n812), .Y(n674) );
  NAND3X1 U782 ( .A(n677), .B(n676), .C(n675), .Y(n678) );
  NAND2X2 U783 ( .A(n678), .B(n355), .Y(n679) );
  OAI21X1 U784 ( .A0(n355), .A1(n812), .B0(n679), .Y(n155) );
  NAND2X1 U785 ( .A(n196), .B(n772), .Y(n691) );
  NAND2X1 U786 ( .A(n680), .B(\C1/DATA2_0 ), .Y(n684) );
  NAND2X1 U787 ( .A(n681), .B(\C1/DATA2_0 ), .Y(n682) );
  NAND3X1 U788 ( .A(n684), .B(n683), .C(n682), .Y(n685) );
  AOI21X1 U789 ( .A0(n772), .A1(n686), .B0(n685), .Y(n690) );
  NAND2X1 U790 ( .A(n195), .B(n772), .Y(n689) );
  NAND2X1 U791 ( .A(n772), .B(n687), .Y(n688) );
  NAND4X1 U792 ( .A(n691), .B(n690), .C(n689), .D(n688), .Y(n692) );
  NAND2X2 U793 ( .A(n692), .B(n355), .Y(n693) );
  OAI21X1 U794 ( .A0(n355), .A1(n772), .B0(n693), .Y(n164) );
  OR2X1 U795 ( .A(\C1/DATA8_13 ), .B(n697), .Y(n699) );
  NAND2X1 U796 ( .A(n699), .B(n698), .Y(n700) );
  XNOR2X1 U797 ( .A(n701), .B(n700), .Y(n703) );
  OAI2BB1X1 U798 ( .A0N(n780), .A1N(n703), .B0(n702), .Y(n140) );
  NAND2X1 U799 ( .A(n705), .B(n704), .Y(n706) );
  XNOR2X1 U800 ( .A(n707), .B(n706), .Y(n709) );
  OAI2BB1X1 U801 ( .A0N(n780), .A1N(n709), .B0(n708), .Y(n138) );
  AOI21X1 U802 ( .A0(n731), .A1(n712), .B0(n711), .Y(n716) );
  NAND2X1 U803 ( .A(n714), .B(n713), .Y(n715) );
  XOR2X1 U804 ( .A(n716), .B(n715), .Y(n718) );
  OAI2BB1X1 U805 ( .A0N(n780), .A1N(n718), .B0(n717), .Y(n137) );
  CLKINVX1 U806 ( .A(n719), .Y(n729) );
  AOI21X1 U807 ( .A0(n731), .A1(n729), .B0(n720), .Y(n725) );
  XOR2X1 U808 ( .A(n725), .B(n724), .Y(n727) );
  OAI2BB1X1 U809 ( .A0N(n780), .A1N(n727), .B0(n726), .Y(n136) );
  NAND2X1 U810 ( .A(n729), .B(n728), .Y(n730) );
  XNOR2X1 U811 ( .A(n731), .B(n730), .Y(n732) );
  OAI21XL U812 ( .A0(n780), .A1(n807), .B0(n733), .Y(n135) );
  CLKINVX1 U813 ( .A(n734), .Y(n746) );
  OAI21XL U814 ( .A0(n746), .A1(n742), .B0(n743), .Y(n739) );
  NAND2X1 U815 ( .A(n737), .B(n736), .Y(n738) );
  XNOR2X1 U816 ( .A(n739), .B(n738), .Y(n740) );
  NAND2X1 U817 ( .A(n740), .B(n755), .Y(n741) );
  OAI21XL U818 ( .A0(n780), .A1(n815), .B0(n741), .Y(n132) );
  NAND2X1 U819 ( .A(n744), .B(n743), .Y(n745) );
  XOR2X1 U820 ( .A(n746), .B(n745), .Y(n748) );
  OAI2BB1X1 U821 ( .A0N(n780), .A1N(n748), .B0(n747), .Y(n134) );
  NAND2X1 U822 ( .A(n751), .B(n750), .Y(n752) );
  XOR2X1 U823 ( .A(n752), .B(N58), .Y(n754) );
  OAI2BB1X1 U824 ( .A0N(n780), .A1N(n754), .B0(n753), .Y(n133) );
  NAND2X1 U825 ( .A(N58), .B(n755), .Y(n756) );
  OAI21XL U826 ( .A0(n780), .A1(N58), .B0(n756), .Y(n141) );
  NOR4X1 U827 ( .A(sti_di[7]), .B(sti_di[8]), .C(sti_di[9]), .D(sti_di[10]), 
        .Y(n760) );
  NOR4X1 U828 ( .A(sti_di[11]), .B(sti_di[12]), .C(sti_di[13]), .D(sti_di[14]), 
        .Y(n759) );
  NOR4X1 U829 ( .A(sti_di[15]), .B(sti_di[0]), .C(sti_di[1]), .D(sti_di[2]), 
        .Y(n758) );
  NOR4X1 U830 ( .A(sti_di[3]), .B(sti_di[4]), .C(sti_di[5]), .D(sti_di[6]), 
        .Y(n757) );
  NAND4X1 U831 ( .A(n760), .B(n759), .C(n758), .D(n757), .Y(n767) );
  NOR4X1 U832 ( .A(sti_di_buffer[6]), .B(sti_di_buffer[5]), .C(
        sti_di_buffer[4]), .D(sti_di_buffer[3]), .Y(n763) );
  NOR4X1 U833 ( .A(sti_di_buffer[10]), .B(sti_di_buffer[9]), .C(
        sti_di_buffer[8]), .D(sti_di_buffer[7]), .Y(n762) );
  NOR4X1 U834 ( .A(sti_di_buffer[15]), .B(sti_di_buffer[0]), .C(
        sti_di_buffer[12]), .D(sti_di_buffer[11]), .Y(n761) );
  OAI2BB1X1 U835 ( .A0N(n780), .A1N(n767), .B0(n766), .Y(next_state) );
endmodule

