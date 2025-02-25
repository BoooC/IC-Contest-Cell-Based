/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : U-2022.12
// Date      : Fri Jan 31 01:27:32 2025
/////////////////////////////////////////////////////////////


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   n927, n928, n929, n930, n931, n932, n933, n934, n935, n936, n937,
         n938, n939, n940, n941, N6, N7, N8, N9, N10, N11, N12, N16, N17, N18,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n402, n403, n419, n422, n423,
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
         n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755, n756, n757, n758, n759, n760, n761, n762, n763, n764,
         n765, n766, n767, n768, n769, n770, n771, n772, n773, n774, n775,
         n776, n777, n778, n779, n780, n781, n782, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n832, n833, n834, n835, n836, n837, n838, n839, n840, n841,
         n842, n843, n844, n845, n846, n847, n848, n849, n850, n851, n852,
         n853, n854, n855, n856, n857, n858, n859, n860, n861, n862, n863,
         n864, n865, n866, n867, n868, n869, n870, n871, n872, n873, n874,
         n875, n876, n877, n878, n879, n880, n881, n882, n883, n884, n885,
         n886, n887, n888, n889, n890, n891, n892, n893, n894, n895, n896,
         n897, n898, n899, n900, n901, n902, n903, n904, n905, n906, n907,
         n908, n909, n910, n911, n912, n913, n914, n915, n916, n917, n918,
         n919, n920, n922, n924;
  wire   [8:0] min_reg;
  wire   [23:0] current_perm;

  DFFRX1 min_reg_reg_4_ ( .D(N10), .CK(CLK), .RN(n724), .Q(min_reg[4]) );
  DFFRX1 min_reg_reg_6_ ( .D(N12), .CK(CLK), .RN(n724), .Q(min_reg[6]) );
  DFFRX1 min_reg_reg_7_ ( .D(n886), .CK(CLK), .RN(n724), .Q(min_reg[7]), .QN(
        n911) );
  DFFRX1 min_reg_reg_8_ ( .D(n885), .CK(CLK), .RN(n724), .Q(min_reg[8]), .QN(
        n909) );
  DFFRX1 min_reg_reg_9_ ( .D(n887), .CK(CLK), .RN(n724), .QN(n913) );
  DFFRX1 current_perm_reg_7__1_ ( .D(n389), .CK(CLK), .RN(n724), .Q(
        current_perm[1]), .QN(n918) );
  DFFRX1 current_perm_reg_7__2_ ( .D(n388), .CK(CLK), .RN(n724), .Q(
        current_perm[2]), .QN(n919) );
  DFFRX4 current_perm_reg_2__1_ ( .D(n381), .CK(CLK), .RN(n724), .Q(
        current_perm[16]), .QN(n896) );
  DFFRX4 current_perm_reg_3__1_ ( .D(n380), .CK(CLK), .RN(n724), .Q(
        current_perm[13]), .QN(n874) );
  DFFRX1 current_perm_reg_7__0_ ( .D(n378), .CK(CLK), .RN(n724), .Q(
        current_perm[0]), .QN(n910) );
  DFFSX1 MinCost_reg_9_ ( .D(n399), .CK(CLK), .SN(n724), .QN(n889) );
  DFFSX4 current_perm_reg_4__0_ ( .D(n365), .CK(CLK), .SN(n724), .Q(
        current_perm[9]), .QN(n891) );
  DFFSX4 current_perm_reg_1__2_ ( .D(n370), .CK(CLK), .SN(n724), .Q(
        current_perm[20]), .QN(n895) );
  DFFSX4 current_perm_reg_2__2_ ( .D(n369), .CK(CLK), .SN(n724), .Q(
        current_perm[17]), .QN(n877) );
  DFFSX2 current_perm_reg_2__0_ ( .D(n366), .CK(CLK), .SN(n724), .Q(
        current_perm[15]), .QN(n879) );
  DFFSX2 current_perm_reg_0__2_ ( .D(n371), .CK(CLK), .SN(n724), .Q(
        current_perm[23]), .QN(n894) );
  DFFSX2 current_perm_reg_0__0_ ( .D(n372), .CK(CLK), .SN(n724), .Q(
        current_perm[21]), .QN(n880) );
  DFFSX4 current_perm_reg_5__1_ ( .D(n368), .CK(CLK), .SN(n724), .Q(
        current_perm[7]), .QN(n890) );
  DFFSX4 current_perm_reg_3__2_ ( .D(n367), .CK(CLK), .SN(n724), .Q(
        current_perm[14]), .QN(n892) );
  DFFRX1 min_reg_reg_5_ ( .D(N11), .CK(CLK), .RN(n724), .Q(min_reg[5]) );
  DFFRX1 min_reg_reg_0_ ( .D(N6), .CK(CLK), .RN(n724), .Q(min_reg[0]) );
  DFFRX1 min_reg_reg_3_ ( .D(N9), .CK(CLK), .RN(n724), .Q(min_reg[3]) );
  DFFRX1 min_reg_reg_2_ ( .D(N8), .CK(CLK), .RN(n724), .Q(min_reg[2]) );
  DFFRX1 min_reg_reg_1_ ( .D(N7), .CK(CLK), .RN(n724), .Q(min_reg[1]) );
  DFFSX1 J_reg_2_ ( .D(N16), .CK(CLK), .SN(n724), .QN(n924) );
  DFFSX1 J_reg_1_ ( .D(N17), .CK(CLK), .SN(n724), .QN(n922) );
  DFFSX1 J_reg_0_ ( .D(N18), .CK(CLK), .SN(n724), .QN(n920) );
  DFFSX1 current_perm_reg_0__1_ ( .D(n373), .CK(CLK), .SN(n724), .Q(
        current_perm[22]), .QN(n893) );
  DFFSX2 current_perm_reg_1__1_ ( .D(n363), .CK(CLK), .SN(n724), .Q(
        current_perm[19]), .QN(n875) );
  DFFSX2 current_perm_reg_4__1_ ( .D(n364), .CK(CLK), .SN(n724), .Q(
        current_perm[10]), .QN(n881) );
  DFFSX1 current_perm_reg_6__0_ ( .D(n362), .CK(CLK), .SN(n724), .Q(
        current_perm[3]), .QN(n888) );
  DFFRX2 current_perm_reg_5__0_ ( .D(n383), .CK(CLK), .RN(n724), .Q(
        current_perm[6]), .QN(n883) );
  DFFRX1 MatchCount_reg_2_ ( .D(n375), .CK(CLK), .RN(n724), .Q(n930), .QN(n916) );
  DFFRX1 MatchCount_reg_0_ ( .D(n377), .CK(CLK), .RN(n724), .Q(n932), .QN(n419) );
  DFFRX1 W_reg_1_ ( .D(n873), .CK(CLK), .RN(n724), .Q(n928), .QN(n899) );
  DFFSX1 MinCost_reg_0_ ( .D(n400), .CK(CLK), .SN(n724), .Q(n941), .QN(n901)
         );
  DFFSX1 MinCost_reg_3_ ( .D(n396), .CK(CLK), .SN(n724), .Q(n938), .QN(n903)
         );
  DFFRX1 MatchCount_reg_1_ ( .D(n376), .CK(CLK), .RN(n724), .Q(n931), .QN(n912) );
  DFFSX1 MinCost_reg_5_ ( .D(n394), .CK(CLK), .SN(n724), .Q(n936), .QN(n906)
         );
  DFFSX1 MinCost_reg_7_ ( .D(n392), .CK(CLK), .SN(n724), .Q(n934), .QN(n905)
         );
  DFFSX1 MinCost_reg_2_ ( .D(n397), .CK(CLK), .SN(n724), .Q(n939), .QN(n900)
         );
  DFFSX1 MinCost_reg_4_ ( .D(n395), .CK(CLK), .SN(n724), .Q(n937), .QN(n904)
         );
  DFFSX1 MinCost_reg_6_ ( .D(n393), .CK(CLK), .SN(n724), .Q(n935), .QN(n907)
         );
  DFFSX1 MinCost_reg_8_ ( .D(n391), .CK(CLK), .SN(n724), .Q(n933), .QN(n908)
         );
  DFFRX2 W_reg_0_ ( .D(n884), .CK(CLK), .RN(n724), .Q(n929), .QN(n884) );
  DFFRX1 MatchCount_reg_3_ ( .D(n374), .CK(CLK), .RN(n724), .QN(n915) );
  DFFRX1 Valid_reg ( .D(n390), .CK(CLK), .RN(n724), .QN(n917) );
  DFFSX1 MinCost_reg_1_ ( .D(n398), .CK(CLK), .SN(n724), .Q(n940), .QN(n902)
         );
  DFFRX2 current_perm_reg_6__1_ ( .D(n379), .CK(CLK), .RN(n724), .Q(
        current_perm[4]), .QN(n914) );
  DFFRHQX1 W_reg_2_ ( .D(n872), .CK(CLK), .RN(n724), .Q(n927) );
  DFFRX2 current_perm_reg_6__2_ ( .D(n385), .CK(CLK), .RN(n724), .Q(
        current_perm[5]), .QN(n897) );
  DFFRX2 current_perm_reg_3__0_ ( .D(n382), .CK(CLK), .RN(n724), .Q(
        current_perm[12]), .QN(n876) );
  DFFRX2 current_perm_reg_4__2_ ( .D(n384), .CK(CLK), .RN(n724), .Q(
        current_perm[11]), .QN(n882) );
  DFFRX2 current_perm_reg_5__2_ ( .D(n386), .CK(CLK), .RN(n724), .Q(
        current_perm[8]), .QN(n878) );
  DFFRX2 current_perm_reg_1__0_ ( .D(n387), .CK(CLK), .RN(n724), .Q(
        current_perm[18]), .QN(n898) );
  OAI21XL U419 ( .A0(n815), .A1(n627), .B0(n672), .Y(n363) );
  OAI21XL U420 ( .A0(n402), .A1(n615), .B0(n614), .Y(n395) );
  OAI21XL U421 ( .A0(n402), .A1(n619), .B0(n618), .Y(n393) );
  OAI21XL U422 ( .A0(n402), .A1(n621), .B0(n620), .Y(n391) );
  OAI21XL U423 ( .A0(n402), .A1(n617), .B0(n616), .Y(n397) );
  OAI21XL U424 ( .A0(n768), .A1(n697), .B0(n696), .Y(n376) );
  OR2X1 U425 ( .A(n760), .B(n714), .Y(n768) );
  OAI22XL U426 ( .A0(n425), .A1(n895), .B0(n833), .B1(n533), .Y(n632) );
  OAI22XL U427 ( .A0(n425), .A1(n875), .B0(n667), .B1(n533), .Y(n671) );
  OAI22XL U428 ( .A0(n800), .A1(n799), .B0(n829), .B1(n627), .Y(n803) );
  OAI22XL U429 ( .A0(n847), .A1(n799), .B0(n801), .B1(n844), .Y(n631) );
  OA22X1 U430 ( .A0(n832), .A1(n798), .B0(n878), .B1(n797), .Y(n833) );
  OR2X2 U431 ( .A(n760), .B(n764), .Y(n695) );
  INVX1 U432 ( .A(n869), .Y(n806) );
  CLKINVX1 U433 ( .A(n865), .Y(n800) );
  NAND2X1 U434 ( .A(n648), .B(n798), .Y(n797) );
  OAI21X1 U435 ( .A0(n447), .A1(n701), .B0(n770), .Y(n867) );
  OAI21X1 U436 ( .A0(n839), .A1(n796), .B0(n838), .Y(n807) );
  NOR4X2 U437 ( .A(current_perm[23]), .B(n625), .C(n624), .D(n623), .Y(n796)
         );
  OAI22XL U438 ( .A0(n645), .A1(n895), .B0(n877), .B1(n637), .Y(n624) );
  OAI22XL U439 ( .A0(n638), .A1(n898), .B0(n876), .B1(n637), .Y(n644) );
  OAI21XL U440 ( .A0(n888), .A1(n673), .B0(n641), .Y(n642) );
  NAND2X2 U441 ( .A(n645), .B(n640), .Y(n657) );
  CLKINVX1 U442 ( .A(n654), .Y(n655) );
  NAND2X1 U443 ( .A(n588), .B(n587), .Y(n594) );
  OAI21XL U444 ( .A0(n608), .A1(n607), .B0(n606), .Y(n609) );
  OAI21X1 U445 ( .A0(n510), .A1(n509), .B0(n508), .Y(n512) );
  OAI21X1 U446 ( .A0(n608), .A1(n592), .B0(n591), .Y(n595) );
  CLKINVX1 U447 ( .A(n599), .Y(n590) );
  AOI222XL U448 ( .A0(current_perm[15]), .A1(current_perm[16]), .B0(
        current_perm[15]), .B1(n498), .C0(current_perm[16]), .C1(n534), .Y(
        n502) );
  OAI22XL U449 ( .A0(n486), .A1(n467), .B0(n892), .B1(n633), .Y(n468) );
  OAI21XL U450 ( .A0(n561), .A1(n558), .B0(n562), .Y(n544) );
  NOR2X1 U451 ( .A(min_reg[5]), .B(Cost[5]), .Y(n583) );
  NOR2X1 U452 ( .A(min_reg[6]), .B(Cost[6]), .Y(n599) );
  INVX4 U453 ( .A(n633), .Y(n832) );
  CLKINVX1 U454 ( .A(n456), .Y(n535) );
  NAND2X2 U455 ( .A(n839), .B(n649), .Y(n447) );
  NAND2X2 U456 ( .A(n839), .B(n442), .Y(n769) );
  OAI21XL U457 ( .A0(current_perm[10]), .A1(n890), .B0(n433), .Y(n435) );
  OAI22X1 U458 ( .A0(current_perm[11]), .A1(n892), .B0(n720), .B1(n437), .Y(
        n443) );
  OAI22XL U459 ( .A0(current_perm[18]), .A1(n880), .B0(current_perm[19]), .B1(
        n893), .Y(n426) );
  OAI21XL U460 ( .A0(current_perm[16]), .A1(n874), .B0(current_perm[15]), .Y(
        n427) );
  NAND3XL U461 ( .A(n553), .B(n941), .C(n699), .Y(n554) );
  NAND2XL U462 ( .A(n787), .B(n904), .Y(n577) );
  AOI22XL U463 ( .A0(n783), .A1(n907), .B0(n732), .B1(n905), .Y(n593) );
  NOR2XL U464 ( .A(current_perm[10]), .B(n890), .Y(n483) );
  NAND2XL U465 ( .A(n691), .B(n690), .Y(n692) );
  INVXL U466 ( .A(n514), .Y(n505) );
  INVXL U467 ( .A(n447), .Y(n629) );
  NAND2XL U468 ( .A(min_reg[1]), .B(Cost[1]), .Y(n548) );
  NAND2XL U469 ( .A(n425), .B(n629), .Y(n801) );
  NOR2X2 U470 ( .A(n450), .B(n448), .Y(n866) );
  NOR2XL U471 ( .A(current_perm[1]), .B(n645), .Y(n521) );
  NOR2X1 U472 ( .A(current_perm[14]), .B(n882), .Y(n720) );
  NAND2XL U473 ( .A(n726), .B(n725), .Y(n727) );
  NAND2XL U474 ( .A(n556), .B(n558), .Y(n557) );
  OAI22XL U475 ( .A0(n818), .A1(n798), .B0(n883), .B1(n797), .Y(n819) );
  OAI21X1 U476 ( .A0(n796), .A1(n447), .B0(n773), .Y(n837) );
  NAND2X1 U477 ( .A(n422), .B(W[2]), .Y(n714) );
  NAND3XL U478 ( .A(n764), .B(n930), .C(n915), .Y(n762) );
  OR2X2 U479 ( .A(n764), .B(n694), .Y(n697) );
  NOR3XL U480 ( .A(n671), .B(n670), .C(n669), .Y(n672) );
  AOI21XL U481 ( .A0(current_perm[8]), .A1(n859), .B0(n710), .Y(n711) );
  OAI211XL U482 ( .A0(n861), .A1(n627), .B0(n817), .C0(n816), .Y(n380) );
  NAND2X4 U483 ( .A(n760), .B(n726), .Y(n402) );
  INVX6 U484 ( .A(n530), .Y(n534) );
  NOR2X2 U485 ( .A(n693), .B(n692), .Y(n725) );
  OAI2BB1XL U486 ( .A0N(n795), .A1N(Cost[0]), .B0(n794), .Y(N6) );
  NAND2X1 U487 ( .A(n757), .B(n902), .Y(n553) );
  OAI2BB1XL U488 ( .A0N(n792), .A1N(n791), .B0(n790), .Y(N8) );
  NAND2X1 U489 ( .A(n402), .B(n936), .Y(n706) );
  NAND2X1 U490 ( .A(n402), .B(n938), .Y(n708) );
  NAND2X1 U491 ( .A(n402), .B(n941), .Y(n698) );
  NAND2X1 U492 ( .A(n402), .B(n934), .Y(n704) );
  INVX3 U493 ( .A(n663), .Y(n818) );
  NOR2X6 U494 ( .A(n530), .B(n663), .Y(n498) );
  CLKBUFX8 U495 ( .A(n446), .Y(n658) );
  NAND2X4 U496 ( .A(n839), .B(n445), .Y(n450) );
  CLKINVX1 U497 ( .A(n714), .Y(n726) );
  CLKINVX1 U498 ( .A(n927), .Y(n403) );
  INVX12 U499 ( .A(RST), .Y(n724) );
  NAND2XL U500 ( .A(n812), .B(n837), .Y(n634) );
  AOI21X1 U501 ( .A0(n516), .A1(n515), .B0(n522), .Y(n517) );
  INVX1 U502 ( .A(n504), .Y(n470) );
  OAI22X1 U503 ( .A0(n502), .A1(n501), .B0(n877), .B1(n633), .Y(n507) );
  NAND2X2 U504 ( .A(n695), .B(n726), .Y(n765) );
  NAND2X4 U505 ( .A(n425), .B(n535), .Y(n536) );
  OAI2BB2X1 U506 ( .B0(n895), .B1(n628), .A0N(n532), .A1N(current_perm[2]), 
        .Y(n453) );
  INVXL U507 ( .A(n733), .Y(n621) );
  INVX8 U508 ( .A(n650), .Y(n839) );
  INVX1 U509 ( .A(n443), .Y(n438) );
  OA21XL U510 ( .A0(current_perm[21]), .A1(n898), .B0(n489), .Y(n490) );
  OA22X1 U511 ( .A0(n815), .A1(n814), .B0(n813), .B1(n536), .Y(n816) );
  AOI211X1 U512 ( .A0(n875), .A1(n675), .B0(n638), .C0(n519), .Y(n526) );
  AOI211X1 U513 ( .A0(current_perm[9]), .A1(n640), .B0(n675), .C0(n639), .Y(
        n641) );
  INVX6 U514 ( .A(n645), .Y(n675) );
  INVX2 U515 ( .A(n515), .Y(n485) );
  NAND2X2 U516 ( .A(n508), .B(n490), .Y(n630) );
  AOI222X2 U517 ( .A0(n895), .A1(n633), .B0(n895), .B1(n488), .C0(n633), .C1(
        n488), .Y(n508) );
  AOI222X1 U518 ( .A0(n894), .A1(n633), .B0(n894), .B1(n493), .C0(n633), .C1(
        n493), .Y(n494) );
  OAI211X1 U519 ( .A0(current_perm[18]), .A1(n534), .B0(n499), .C0(n487), .Y(
        n488) );
  OAI211X1 U520 ( .A0(current_perm[21]), .A1(n534), .B0(n492), .C0(n499), .Y(
        n493) );
  AOI211X2 U521 ( .A0(n891), .A1(n530), .B0(n465), .C0(n486), .Y(n466) );
  OAI22X2 U522 ( .A0(n486), .A1(n472), .B0(n897), .B1(n633), .Y(n473) );
  BUFX6 U523 ( .A(n455), .Y(n633) );
  INVX3 U524 ( .A(n486), .Y(n499) );
  AOI222X1 U525 ( .A0(current_perm[4]), .A1(current_perm[3]), .B0(
        current_perm[4]), .B1(n534), .C0(current_perm[3]), .C1(n498), .Y(n472)
         );
  INVX3 U526 ( .A(n498), .Y(n491) );
  NOR2X4 U527 ( .A(n694), .B(n912), .Y(n764) );
  NAND2X2 U528 ( .A(n425), .B(n532), .Y(n533) );
  NAND2X2 U529 ( .A(n725), .B(n932), .Y(n694) );
  NAND2X4 U530 ( .A(n769), .B(n866), .Y(n840) );
  INVX3 U531 ( .A(n700), .Y(n674) );
  INVXL U532 ( .A(n732), .Y(n705) );
  NOR2X1 U533 ( .A(n731), .B(n714), .Y(n712) );
  NAND2X1 U534 ( .A(n595), .B(min_reg[7]), .Y(n596) );
  XNOR2X2 U535 ( .A(n609), .B(n913), .Y(n731) );
  INVX4 U536 ( .A(n424), .Y(n425) );
  INVXL U537 ( .A(n715), .Y(n474) );
  OAI211X1 U538 ( .A0(n850), .A1(n846), .B0(n843), .C0(n842), .Y(n371) );
  OAI211X1 U539 ( .A0(n806), .A1(n536), .B0(n805), .C0(n804), .Y(n387) );
  OAI21X1 U540 ( .A0(n824), .A1(n854), .B0(n666), .Y(n366) );
  OAI211X1 U541 ( .A0(n829), .A1(n846), .B0(n828), .C0(n827), .Y(n372) );
  AOI211X1 U542 ( .A0(current_perm[15]), .A1(n424), .B0(n665), .C0(n664), .Y(
        n666) );
  AOI211X1 U543 ( .A0(current_perm[17]), .A1(n424), .B0(n852), .C0(n851), .Y(
        n853) );
  NAND2XL U544 ( .A(n812), .B(n867), .Y(n804) );
  INVX3 U545 ( .A(n539), .Y(n781) );
  NAND2X1 U546 ( .A(n658), .B(n657), .Y(n656) );
  INVX1 U547 ( .A(n857), .Y(n811) );
  NAND2X2 U548 ( .A(n652), .B(n512), .Y(n518) );
  NAND2X1 U549 ( .A(n402), .B(n939), .Y(n616) );
  NAND2X1 U550 ( .A(n402), .B(n935), .Y(n618) );
  NOR2X2 U551 ( .A(n765), .B(n761), .Y(n763) );
  NAND2X1 U552 ( .A(n765), .B(n930), .Y(n766) );
  NAND2X1 U553 ( .A(n402), .B(n937), .Y(n614) );
  NAND2X1 U554 ( .A(n402), .B(n933), .Y(n620) );
  NAND2X1 U555 ( .A(n765), .B(n931), .Y(n696) );
  NAND2X4 U556 ( .A(n613), .B(n612), .Y(n760) );
  NAND2X2 U557 ( .A(n598), .B(n597), .Y(n611) );
  INVX1 U558 ( .A(n536), .Y(n820) );
  XOR2X1 U559 ( .A(n727), .B(n932), .Y(n728) );
  INVX3 U560 ( .A(n836), .Y(n627) );
  NAND2X4 U561 ( .A(n451), .B(n862), .Y(n648) );
  OAI21X1 U562 ( .A0(n568), .A1(n567), .B0(n566), .Y(n570) );
  INVX3 U563 ( .A(n769), .Y(n451) );
  AND2X1 U564 ( .A(n733), .B(n792), .Y(n885) );
  AOI22X1 U565 ( .A0(n731), .A1(n889), .B0(n733), .B1(n908), .Y(n610) );
  INVX1 U566 ( .A(n785), .Y(n707) );
  INVX1 U567 ( .A(n783), .Y(n619) );
  AND2X1 U568 ( .A(n731), .B(n792), .Y(n887) );
  INVX1 U569 ( .A(n789), .Y(n709) );
  XNOR2X1 U570 ( .A(n731), .B(n889), .Y(n677) );
  AND2X1 U571 ( .A(n732), .B(n792), .Y(n886) );
  INVX1 U572 ( .A(n787), .Y(n615) );
  CLKXOR2X2 U573 ( .A(n596), .B(n909), .Y(n733) );
  OR2X2 U574 ( .A(n731), .B(n889), .Y(n612) );
  INVX1 U575 ( .A(n757), .Y(n758) );
  NAND2XL U576 ( .A(n793), .B(n792), .Y(n794) );
  MX2X1 U577 ( .A(n757), .B(Cost[1]), .S0(n795), .Y(N7) );
  INVX1 U578 ( .A(n791), .Y(n617) );
  NAND2XL U579 ( .A(Cost[5]), .B(n795), .Y(n784) );
  NAND2XL U580 ( .A(Cost[4]), .B(n795), .Y(n786) );
  NAND2XL U581 ( .A(Cost[2]), .B(n795), .Y(n790) );
  INVX2 U582 ( .A(n795), .Y(n792) );
  INVX3 U583 ( .A(n608), .Y(n584) );
  NAND2XL U584 ( .A(Cost[3]), .B(n795), .Y(n788) );
  NAND2XL U585 ( .A(Cost[6]), .B(n795), .Y(n782) );
  OAI22X1 U586 ( .A0(current_perm[4]), .A1(n890), .B0(current_perm[3]), .B1(
        n431), .Y(n432) );
  INVX1 U587 ( .A(n699), .Y(n793) );
  INVX1 U588 ( .A(n583), .Y(n574) );
  INVX1 U589 ( .A(n601), .Y(n589) );
  INVX16 U590 ( .A(n403), .Y(W[2]) );
  INVX1 U591 ( .A(n580), .Y(n573) );
  INVX1 U592 ( .A(n547), .Y(n549) );
  NAND2X2 U593 ( .A(current_perm[18]), .B(n716), .Y(n429) );
  INVX1 U594 ( .A(n582), .Y(n572) );
  INVXL U595 ( .A(n729), .Y(n730) );
  INVX1 U596 ( .A(n559), .Y(n556) );
  INVX1 U597 ( .A(n561), .Y(n563) );
  OR2X2 U598 ( .A(min_reg[0]), .B(Cost[0]), .Y(n552) );
  NOR2X1 U599 ( .A(n929), .B(n928), .Y(n729) );
  NAND2XL U600 ( .A(current_perm[13]), .B(n896), .Y(n497) );
  NOR2X2 U601 ( .A(n873), .B(n872), .Y(n754) );
  OAI21X1 U602 ( .A0(n675), .A1(n673), .B0(n848), .Y(n830) );
  OAI22XL U603 ( .A0(n857), .A1(n801), .B0(n861), .B1(n799), .Y(n670) );
  OAI22X2 U604 ( .A0(n652), .A1(n530), .B0(n653), .B1(current_perm[22]), .Y(
        n857) );
  BUFX12 U605 ( .A(n940), .Y(MinCost[1]) );
  INVX12 U606 ( .A(n917), .Y(Valid) );
  INVX12 U607 ( .A(n915), .Y(MatchCount[3]) );
  INVX12 U608 ( .A(n884), .Y(W[0]) );
  OAI22XL U609 ( .A0(n929), .A1(n740), .B0(n884), .B1(n739), .Y(N16) );
  OAI22XL U610 ( .A0(n929), .A1(n746), .B0(n884), .B1(n745), .Y(N17) );
  OAI22XL U611 ( .A0(n929), .A1(n756), .B0(n884), .B1(n755), .Y(N18) );
  INVX12 U612 ( .A(n908), .Y(MinCost[8]) );
  INVX12 U613 ( .A(n907), .Y(MinCost[6]) );
  INVX12 U614 ( .A(n904), .Y(MinCost[4]) );
  INVX12 U615 ( .A(n900), .Y(MinCost[2]) );
  INVX12 U616 ( .A(n905), .Y(MinCost[7]) );
  OAI21XL U617 ( .A0(n402), .A1(n705), .B0(n704), .Y(n392) );
  INVX12 U618 ( .A(n906), .Y(MinCost[5]) );
  OAI21XL U619 ( .A0(n402), .A1(n707), .B0(n706), .Y(n394) );
  INVX12 U620 ( .A(n912), .Y(MatchCount[1]) );
  INVX12 U621 ( .A(n903), .Y(MinCost[3]) );
  OAI21XL U622 ( .A0(n402), .A1(n709), .B0(n708), .Y(n396) );
  INVX12 U623 ( .A(n901), .Y(MinCost[0]) );
  OAI21XL U624 ( .A0(n402), .A1(n699), .B0(n698), .Y(n400) );
  INVX12 U625 ( .A(n899), .Y(W[1]) );
  INVX12 U626 ( .A(n419), .Y(MatchCount[0]) );
  INVX12 U627 ( .A(n916), .Y(MatchCount[2]) );
  NOR2X1 U628 ( .A(n683), .B(n682), .Y(n691) );
  AO21X2 U629 ( .A0(n478), .A1(n477), .B0(n482), .Y(n515) );
  OA22X1 U630 ( .A0(n534), .A1(n798), .B0(n890), .B1(n797), .Y(n667) );
  NOR2XL U631 ( .A(W[2]), .B(n422), .Y(n734) );
  OAI21XL U632 ( .A0(n560), .A1(n559), .B0(n558), .Y(n565) );
  INVX3 U633 ( .A(n652), .Y(n653) );
  OAI22X1 U634 ( .A0(n881), .A1(n657), .B0(n874), .B1(n622), .Y(n523) );
  CLKINVX1 U635 ( .A(n863), .Y(n823) );
  AOI222X1 U636 ( .A0(n531), .A1(n661), .B0(current_perm[13]), .B1(n659), .C0(
        n530), .C1(n662), .Y(n815) );
  NOR2X2 U637 ( .A(W[2]), .B(n730), .Y(n795) );
  AOI222X1 U638 ( .A0(n663), .A1(n662), .B0(n661), .B1(n660), .C0(
        current_perm[12]), .C1(n659), .Y(n829) );
  OAI22XL U639 ( .A0(n425), .A1(n881), .B0(n424), .B1(n529), .Y(n364) );
  OAI21XL U640 ( .A0(n768), .A1(n767), .B0(n766), .Y(n375) );
  OAI222XL U641 ( .A0(n844), .A1(n533), .B0(n536), .B1(n796), .C0(n897), .C1(
        n759), .Y(n385) );
  NOR2X1 U642 ( .A(n899), .B(n884), .Y(n422) );
  NOR2X1 U643 ( .A(n422), .B(n729), .Y(n873) );
  INVXL U644 ( .A(n734), .Y(n423) );
  AND2X2 U645 ( .A(n714), .B(n423), .Y(n872) );
  NAND3X2 U646 ( .A(n884), .B(W[2]), .C(n928), .Y(n424) );
  NAND2X1 U647 ( .A(current_perm[19]), .B(n893), .Y(n489) );
  OAI211X4 U648 ( .A0(current_perm[23]), .A1(n895), .B0(n489), .C0(n426), .Y(
        n628) );
  OAI21X4 U649 ( .A0(current_perm[20]), .A1(n894), .B0(n628), .Y(n650) );
  NAND2X1 U650 ( .A(current_perm[14]), .B(n877), .Y(n496) );
  OAI22X1 U651 ( .A0(current_perm[13]), .A1(n896), .B0(current_perm[12]), .B1(
        n427), .Y(n428) );
  AOI2BB2X2 U652 ( .B0(n496), .B1(n428), .A0N(current_perm[14]), .A1N(n877), 
        .Y(n440) );
  NOR2X1 U653 ( .A(n877), .B(current_perm[20]), .Y(n510) );
  NAND2X1 U654 ( .A(current_perm[16]), .B(n875), .Y(n716) );
  AOI2BB2X2 U655 ( .B0(n896), .B1(current_perm[19]), .A0N(current_perm[15]), 
        .A1N(n429), .Y(n430) );
  OAI22X4 U656 ( .A0(n895), .A1(current_perm[17]), .B0(n510), .B1(n430), .Y(
        n649) );
  NOR2BX4 U657 ( .AN(n440), .B(n649), .Y(n442) );
  NAND2X2 U658 ( .A(current_perm[4]), .B(n890), .Y(n715) );
  NAND2X1 U659 ( .A(current_perm[6]), .B(n715), .Y(n431) );
  NAND2X1 U660 ( .A(current_perm[5]), .B(n878), .Y(n477) );
  AOI2BB2X1 U661 ( .B0(n432), .B1(n477), .A0N(current_perm[5]), .A1N(n878), 
        .Y(n439) );
  OAI22X1 U662 ( .A0(current_perm[7]), .A1(n881), .B0(n891), .B1(
        current_perm[6]), .Y(n433) );
  NOR2X1 U663 ( .A(current_perm[11]), .B(n878), .Y(n434) );
  OAI22X2 U664 ( .A0(n435), .A1(n434), .B0(current_perm[8]), .B1(n882), .Y(
        n444) );
  OAI22X1 U665 ( .A0(current_perm[10]), .A1(n874), .B0(n876), .B1(
        current_perm[9]), .Y(n436) );
  OAI21X1 U666 ( .A0(current_perm[13]), .A1(n881), .B0(n436), .Y(n437) );
  OAI21X1 U667 ( .A0(n439), .A1(n444), .B0(n438), .Y(n441) );
  OAI221X4 U668 ( .A0(n441), .A1(n649), .B0(n440), .B1(n649), .C0(n839), .Y(
        n449) );
  INVX3 U669 ( .A(n449), .Y(n448) );
  OAI21X2 U670 ( .A0(n444), .A1(n443), .B0(n442), .Y(n445) );
  NAND2X1 U671 ( .A(n448), .B(n450), .Y(n446) );
  NAND2X1 U672 ( .A(n451), .B(n658), .Y(n870) );
  INVX1 U673 ( .A(n658), .Y(n454) );
  NOR2X4 U674 ( .A(n450), .B(n769), .Y(n700) );
  NOR2X2 U675 ( .A(n674), .B(n448), .Y(n532) );
  AND2X4 U676 ( .A(n449), .B(n450), .Y(n862) );
  NOR2X4 U677 ( .A(n450), .B(n449), .Y(n864) );
  NAND2X2 U678 ( .A(n451), .B(n864), .Y(n456) );
  OAI22XL U679 ( .A0(n878), .A1(n648), .B0(n897), .B1(n456), .Y(n452) );
  AOI211X4 U680 ( .A0(current_perm[11]), .A1(n454), .B0(n453), .C0(n452), .Y(
        n500) );
  OA21X2 U681 ( .A0(n877), .A1(n447), .B0(n500), .Y(n469) );
  OAI21XL U682 ( .A0(n892), .A1(n840), .B0(n469), .Y(n455) );
  NAND2X1 U683 ( .A(current_perm[4]), .B(n535), .Y(n460) );
  OAI22X1 U684 ( .A0(n881), .A1(n658), .B0(n890), .B1(n648), .Y(n458) );
  OAI22XL U685 ( .A0(n839), .A1(n875), .B0(n896), .B1(n447), .Y(n457) );
  AOI211X1 U686 ( .A0(n532), .A1(current_perm[1]), .B0(n458), .C0(n457), .Y(
        n459) );
  OAI211X4 U687 ( .A0(n840), .A1(n874), .B0(n460), .C0(n459), .Y(n530) );
  OAI22X1 U688 ( .A0(n883), .A1(n648), .B0(n891), .B1(n658), .Y(n462) );
  OAI22XL U689 ( .A0(n839), .A1(n898), .B0(n879), .B1(n447), .Y(n461) );
  AOI211X1 U690 ( .A0(n532), .A1(current_perm[0]), .B0(n462), .C0(n461), .Y(
        n464) );
  NAND2X1 U691 ( .A(current_perm[3]), .B(n535), .Y(n463) );
  OAI211X4 U692 ( .A0(n840), .A1(n876), .B0(n464), .C0(n463), .Y(n663) );
  AOI2BB1X1 U693 ( .A0N(n891), .A1N(n491), .B0(current_perm[10]), .Y(n465) );
  NOR2X4 U694 ( .A(n534), .B(n818), .Y(n486) );
  AOI222X4 U695 ( .A0(current_perm[11]), .A1(n832), .B0(current_perm[11]), 
        .B1(n466), .C0(n832), .C1(n466), .Y(n479) );
  OAI22XL U696 ( .A0(current_perm[13]), .A1(n881), .B0(current_perm[12]), .B1(
        n891), .Y(n471) );
  AOI222X1 U697 ( .A0(current_perm[13]), .A1(current_perm[12]), .B0(
        current_perm[13]), .B1(n534), .C0(current_perm[12]), .C1(n498), .Y(
        n467) );
  OAI21X1 U698 ( .A0(current_perm[14]), .A1(n469), .B0(n468), .Y(n504) );
  OAI31X1 U699 ( .A0(n720), .A1(n479), .A2(n471), .B0(n470), .Y(n513) );
  OAI21X1 U700 ( .A0(current_perm[5]), .A1(n832), .B0(n473), .Y(n484) );
  AOI211X1 U701 ( .A0(current_perm[3]), .A1(n883), .B0(n474), .C0(n484), .Y(
        n478) );
  AOI222X1 U702 ( .A0(current_perm[6]), .A1(current_perm[7]), .B0(
        current_perm[6]), .B1(n498), .C0(current_perm[7]), .C1(n534), .Y(n475)
         );
  OAI22X1 U703 ( .A0(n486), .A1(n475), .B0(n878), .B1(n633), .Y(n476) );
  OAI21X1 U704 ( .A0(current_perm[8]), .A1(n832), .B0(n476), .Y(n482) );
  OAI22XL U705 ( .A0(current_perm[9]), .A1(n883), .B0(current_perm[11]), .B1(
        n878), .Y(n481) );
  INVX1 U706 ( .A(n479), .Y(n480) );
  OAI31X1 U707 ( .A0(n483), .A1(n482), .A2(n481), .B0(n480), .Y(n516) );
  OAI21XL U708 ( .A0(n485), .A1(n484), .B0(n516), .Y(n506) );
  NOR2X1 U709 ( .A(current_perm[23]), .B(n895), .Y(n495) );
  OAI21X1 U710 ( .A0(n898), .A1(n491), .B0(n875), .Y(n487) );
  OAI21X1 U711 ( .A0(n880), .A1(n491), .B0(n893), .Y(n492) );
  OAI21X4 U712 ( .A0(n495), .A1(n630), .B0(n494), .Y(n652) );
  OAI211X1 U713 ( .A0(current_perm[15]), .A1(n876), .B0(n497), .C0(n496), .Y(
        n503) );
  OAI21XL U714 ( .A0(current_perm[17]), .A1(n500), .B0(n499), .Y(n501) );
  OAI21X1 U715 ( .A0(n504), .A1(n503), .B0(n507), .Y(n514) );
  AOI211X4 U716 ( .A0(n513), .A1(n506), .B0(n653), .C0(n505), .Y(n511) );
  OAI211X1 U717 ( .A0(current_perm[18]), .A1(n879), .B0(n507), .C0(n716), .Y(
        n509) );
  NOR2X4 U718 ( .A(n653), .B(n512), .Y(n654) );
  NOR2X8 U719 ( .A(n511), .B(n654), .Y(n645) );
  NAND2X2 U720 ( .A(n514), .B(n513), .Y(n522) );
  NOR2X2 U721 ( .A(n518), .B(n517), .Y(n520) );
  NOR2X4 U722 ( .A(n520), .B(n518), .Y(n640) );
  INVX3 U723 ( .A(n518), .Y(n638) );
  NOR2X1 U724 ( .A(n675), .B(current_perm[22]), .Y(n519) );
  NAND2BX2 U725 ( .AN(n522), .B(n520), .Y(n673) );
  AOI211X1 U726 ( .A0(n645), .A1(n914), .B0(n673), .C0(n521), .Y(n525) );
  NAND2X2 U727 ( .A(n640), .B(n675), .Y(n798) );
  NAND2X4 U728 ( .A(n522), .B(n638), .Y(n637) );
  NOR2X4 U729 ( .A(n675), .B(n637), .Y(n646) );
  OAI2BB2X1 U730 ( .B0(n890), .B1(n798), .A0N(current_perm[16]), .A1N(n646), 
        .Y(n524) );
  NOR2X4 U731 ( .A(n637), .B(n645), .Y(n662) );
  CLKINVX1 U732 ( .A(n662), .Y(n622) );
  NOR4X4 U733 ( .A(n526), .B(n525), .C(n524), .D(n523), .Y(n856) );
  OAI222X4 U734 ( .A0(n656), .A1(n881), .B0(n657), .B1(n534), .C0(n658), .C1(
        n856), .Y(n668) );
  NOR2X1 U735 ( .A(n629), .B(n646), .Y(n647) );
  AOI22X1 U736 ( .A0(current_perm[16]), .A1(n647), .B0(n646), .B1(n530), .Y(
        n813) );
  OAI21X1 U737 ( .A0(n856), .A1(n447), .B0(n813), .Y(n539) );
  OAI21XL U738 ( .A0(n875), .A1(n650), .B0(n655), .Y(n527) );
  OAI21XL U739 ( .A0(n655), .A1(n530), .B0(n527), .Y(n540) );
  OAI21X2 U740 ( .A0(n839), .A1(n856), .B0(n540), .Y(n779) );
  AOI222XL U741 ( .A0(n539), .A1(n866), .B0(n779), .B1(n864), .C0(n811), .C1(
        n862), .Y(n528) );
  AOI2BB2X1 U742 ( .B0(n870), .B1(n668), .A0N(n870), .A1N(n528), .Y(n529) );
  CLKINVX1 U743 ( .A(n856), .Y(n531) );
  CLKINVX1 U744 ( .A(n840), .Y(n661) );
  NOR2X1 U745 ( .A(n661), .B(n662), .Y(n659) );
  NOR2X2 U746 ( .A(n424), .B(n658), .Y(n812) );
  CLKINVX1 U747 ( .A(n812), .Y(n846) );
  NOR2X1 U748 ( .A(n424), .B(n648), .Y(n836) );
  CLKINVX1 U749 ( .A(n533), .Y(n848) );
  NAND3BX1 U750 ( .AN(n673), .B(n645), .C(n848), .Y(n831) );
  OAI22XL U751 ( .A0(n534), .A1(n831), .B0(n914), .B1(n830), .Y(n538) );
  OAI22XL U752 ( .A0(n425), .A1(n893), .B0(n667), .B1(n536), .Y(n537) );
  AOI211X1 U753 ( .A0(n836), .A1(n668), .B0(n538), .C0(n537), .Y(n543) );
  OAI222XL U754 ( .A0(n447), .A1(n540), .B0(n840), .B1(n781), .C0(n857), .C1(
        n839), .Y(n541) );
  NAND2X1 U755 ( .A(n425), .B(n541), .Y(n542) );
  OAI211X1 U756 ( .A0(n815), .A1(n846), .B0(n543), .C0(n542), .Y(n373) );
  NOR2X1 U757 ( .A(min_reg[1]), .B(Cost[1]), .Y(n547) );
  NAND2X1 U758 ( .A(min_reg[0]), .B(Cost[0]), .Y(n551) );
  OAI21X4 U759 ( .A0(n547), .A1(n551), .B0(n548), .Y(n555) );
  NOR2X1 U760 ( .A(min_reg[2]), .B(Cost[2]), .Y(n559) );
  NOR2X1 U761 ( .A(min_reg[3]), .B(Cost[3]), .Y(n561) );
  NOR2X1 U762 ( .A(n559), .B(n561), .Y(n545) );
  NAND2X1 U763 ( .A(min_reg[2]), .B(Cost[2]), .Y(n558) );
  NAND2X1 U764 ( .A(min_reg[3]), .B(Cost[3]), .Y(n562) );
  AOI21X4 U765 ( .A0(n555), .A1(n545), .B0(n544), .Y(n608) );
  NOR2X1 U766 ( .A(min_reg[4]), .B(Cost[4]), .Y(n580) );
  NAND2X1 U767 ( .A(min_reg[4]), .B(Cost[4]), .Y(n582) );
  NAND2X1 U768 ( .A(n573), .B(n582), .Y(n546) );
  XNOR2X1 U769 ( .A(n584), .B(n546), .Y(n787) );
  OR2X1 U770 ( .A(n787), .B(n904), .Y(n571) );
  NAND2X1 U771 ( .A(n549), .B(n548), .Y(n550) );
  XOR2X1 U772 ( .A(n550), .B(n551), .Y(n757) );
  NAND2X1 U773 ( .A(n552), .B(n551), .Y(n699) );
  OAI21XL U774 ( .A0(n757), .A1(n902), .B0(n554), .Y(n568) );
  CLKINVX1 U775 ( .A(n555), .Y(n560) );
  XOR2X1 U776 ( .A(n560), .B(n557), .Y(n791) );
  NOR2X1 U777 ( .A(n791), .B(n900), .Y(n567) );
  NAND2X1 U778 ( .A(n563), .B(n562), .Y(n564) );
  XNOR2X1 U779 ( .A(n565), .B(n564), .Y(n789) );
  AOI22X1 U780 ( .A0(n791), .A1(n900), .B0(n789), .B1(n903), .Y(n566) );
  NAND2BX1 U781 ( .AN(n789), .B(n938), .Y(n569) );
  NAND3X1 U782 ( .A(n571), .B(n570), .C(n569), .Y(n579) );
  AOI21X1 U783 ( .A0(n584), .A1(n573), .B0(n572), .Y(n576) );
  NAND2X1 U784 ( .A(min_reg[5]), .B(Cost[5]), .Y(n581) );
  NAND2X1 U785 ( .A(n574), .B(n581), .Y(n575) );
  XOR2X1 U786 ( .A(n576), .B(n575), .Y(n785) );
  NAND2X1 U787 ( .A(n785), .B(n906), .Y(n578) );
  NAND3X2 U788 ( .A(n579), .B(n578), .C(n577), .Y(n588) );
  NOR2X1 U789 ( .A(n580), .B(n583), .Y(n600) );
  OAI21X1 U790 ( .A0(n583), .A1(n582), .B0(n581), .Y(n604) );
  AOI21X1 U791 ( .A0(n584), .A1(n600), .B0(n604), .Y(n586) );
  NAND2X1 U792 ( .A(min_reg[6]), .B(Cost[6]), .Y(n601) );
  NAND2X1 U793 ( .A(n590), .B(n601), .Y(n585) );
  XOR2X1 U794 ( .A(n586), .B(n585), .Y(n783) );
  OA22X1 U795 ( .A0(n785), .A1(n906), .B0(n783), .B1(n907), .Y(n587) );
  NAND2X1 U796 ( .A(n600), .B(n590), .Y(n592) );
  AOI21X1 U797 ( .A0(n604), .A1(n590), .B0(n589), .Y(n591) );
  XNOR2X1 U798 ( .A(n595), .B(n911), .Y(n732) );
  NAND2X2 U799 ( .A(n594), .B(n593), .Y(n598) );
  OA22X1 U800 ( .A0(n732), .A1(n905), .B0(n733), .B1(n908), .Y(n597) );
  NAND2X1 U801 ( .A(min_reg[7]), .B(min_reg[8]), .Y(n602) );
  NOR2X1 U802 ( .A(n602), .B(n599), .Y(n605) );
  NAND2X1 U803 ( .A(n605), .B(n600), .Y(n607) );
  NOR2X1 U804 ( .A(n602), .B(n601), .Y(n603) );
  AOI21X1 U805 ( .A0(n605), .A1(n604), .B0(n603), .Y(n606) );
  NAND2X2 U806 ( .A(n611), .B(n610), .Y(n613) );
  INVX1 U807 ( .A(n640), .Y(n636) );
  OAI22X1 U808 ( .A0(n897), .A1(n673), .B0(n882), .B1(n636), .Y(n625) );
  OAI22X2 U809 ( .A0(n892), .A1(n622), .B0(n878), .B1(n798), .Y(n623) );
  INVX1 U810 ( .A(n796), .Y(n626) );
  AOI222X4 U811 ( .A0(n626), .A1(n661), .B0(current_perm[14]), .B1(n659), .C0(
        n633), .C1(n662), .Y(n850) );
  OAI222X4 U812 ( .A0(n656), .A1(n882), .B0(n657), .B1(n832), .C0(n658), .C1(
        n796), .Y(n849) );
  AOI32X1 U813 ( .A0(current_perm[20]), .A1(n655), .A2(n628), .B0(n654), .B1(
        n633), .Y(n838) );
  CLKINVX1 U814 ( .A(n807), .Y(n847) );
  OAI21X1 U815 ( .A0(n661), .A1(n650), .B0(n425), .Y(n799) );
  AOI21X1 U816 ( .A0(n832), .A1(n630), .B0(n894), .Y(n808) );
  CLKINVX1 U817 ( .A(n808), .Y(n844) );
  AOI211X1 U818 ( .A0(n820), .A1(n849), .B0(n632), .C0(n631), .Y(n635) );
  AOI22X1 U819 ( .A0(current_perm[17]), .A1(n647), .B0(n646), .B1(n633), .Y(
        n773) );
  OAI211X1 U820 ( .A0(n850), .A1(n627), .B0(n635), .C0(n634), .Y(n370) );
  OAI22XL U821 ( .A0(n883), .A1(n636), .B0(n910), .B1(n673), .Y(n643) );
  OAI22X1 U822 ( .A0(n638), .A1(n880), .B0(n879), .B1(n637), .Y(n639) );
  OAI31X4 U823 ( .A0(n645), .A1(n644), .A2(n643), .B0(n642), .Y(n701) );
  AOI22X1 U824 ( .A0(current_perm[15]), .A1(n647), .B0(n646), .B1(n663), .Y(
        n770) );
  INVX1 U825 ( .A(n867), .Y(n824) );
  INVXL U826 ( .A(n648), .Y(n651) );
  OAI31X1 U827 ( .A0(n651), .A1(n650), .A2(n649), .B0(n425), .Y(n854) );
  OAI22X1 U828 ( .A0(n653), .A1(n880), .B0(n652), .B1(n818), .Y(n863) );
  NAND2X1 U829 ( .A(n425), .B(n661), .Y(n845) );
  AOI32X1 U830 ( .A0(current_perm[18]), .A1(n655), .A2(n839), .B0(n654), .B1(
        n663), .Y(n825) );
  OAI21X1 U831 ( .A0(n839), .A1(n701), .B0(n825), .Y(n865) );
  OAI22XL U832 ( .A0(n823), .A1(n845), .B0(n800), .B1(n846), .Y(n665) );
  OAI222X1 U833 ( .A0(n701), .A1(n658), .B0(n657), .B1(n818), .C0(n891), .C1(
        n656), .Y(n869) );
  INVX1 U834 ( .A(n701), .Y(n660) );
  OAI22XL U835 ( .A0(n806), .A1(n533), .B0(n829), .B1(n536), .Y(n664) );
  INVX1 U836 ( .A(n779), .Y(n861) );
  INVX1 U837 ( .A(n668), .Y(n776) );
  OAI22XL U838 ( .A0(n781), .A1(n846), .B0(n776), .B1(n536), .Y(n669) );
  AOI221X1 U839 ( .A0(n675), .A1(n674), .B0(n673), .B1(n674), .C0(n424), .Y(
        n759) );
  OAI222XL U840 ( .A0(n536), .A1(n856), .B0(n533), .B1(n857), .C0(n914), .C1(
        n759), .Y(n379) );
  OAI222XL U841 ( .A0(n536), .A1(n701), .B0(n533), .B1(n823), .C0(n888), .C1(
        n759), .Y(n362) );
  OAI22XL U842 ( .A0(n848), .A1(n918), .B0(n533), .B1(n856), .Y(n389) );
  XNOR2X1 U843 ( .A(n733), .B(n908), .Y(n676) );
  NOR2X1 U844 ( .A(n677), .B(n676), .Y(n681) );
  XNOR2X1 U845 ( .A(n783), .B(n907), .Y(n679) );
  XNOR2X1 U846 ( .A(n732), .B(n905), .Y(n678) );
  NOR2X1 U847 ( .A(n679), .B(n678), .Y(n680) );
  NAND2X1 U848 ( .A(n681), .B(n680), .Y(n693) );
  XNOR2X1 U849 ( .A(n785), .B(n906), .Y(n683) );
  XNOR2X1 U850 ( .A(n787), .B(n904), .Y(n682) );
  XOR2X1 U851 ( .A(n901), .B(n793), .Y(n685) );
  XOR2X1 U852 ( .A(n902), .B(n757), .Y(n684) );
  NAND2X1 U853 ( .A(n685), .B(n684), .Y(n689) );
  XOR2X1 U854 ( .A(n903), .B(n789), .Y(n687) );
  XOR2X1 U855 ( .A(n900), .B(n791), .Y(n686) );
  NAND2X1 U856 ( .A(n687), .B(n686), .Y(n688) );
  NOR2X1 U857 ( .A(n689), .B(n688), .Y(n690) );
  OAI22XL U858 ( .A0(n848), .A1(n910), .B0(n533), .B1(n701), .Y(n378) );
  OAI21X1 U859 ( .A0(n700), .A1(n797), .B0(n425), .Y(n859) );
  OAI22XL U860 ( .A0(n823), .A1(n536), .B0(n701), .B1(n627), .Y(n702) );
  AOI21X1 U861 ( .A0(current_perm[6]), .A1(n859), .B0(n702), .Y(n703) );
  OAI21XL U862 ( .A0(n800), .A1(n533), .B0(n703), .Y(n383) );
  OAI22XL U863 ( .A0(n796), .A1(n627), .B0(n536), .B1(n844), .Y(n710) );
  OAI21XL U864 ( .A0(n847), .A1(n533), .B0(n711), .Y(n386) );
  NOR2XL U865 ( .A(n712), .B(n889), .Y(n399) );
  NAND4XL U866 ( .A(current_perm[8]), .B(current_perm[5]), .C(n879), .D(n888), 
        .Y(n723) );
  NAND4XL U867 ( .A(current_perm[13]), .B(current_perm[12]), .C(n880), .D(n877), .Y(n722) );
  NOR2XL U868 ( .A(current_perm[9]), .B(n883), .Y(n719) );
  NOR4XL U869 ( .A(current_perm[20]), .B(current_perm[23]), .C(
        current_perm[22]), .D(n898), .Y(n718) );
  NAND4XL U870 ( .A(current_perm[2]), .B(current_perm[1]), .C(current_perm[0]), 
        .D(n881), .Y(n713) );
  NOR4XL U871 ( .A(n716), .B(n715), .C(n714), .D(n713), .Y(n717) );
  NAND4XL U872 ( .A(n720), .B(n719), .C(n718), .D(n717), .Y(n721) );
  OAI31XL U873 ( .A0(n723), .A1(n722), .A2(n721), .B0(n917), .Y(n390) );
  INVX12 U874 ( .A(n924), .Y(J[2]) );
  INVX12 U875 ( .A(n920), .Y(J[0]) );
  INVX12 U876 ( .A(n922), .Y(J[1]) );
  NAND2X1 U877 ( .A(n402), .B(n728), .Y(n377) );
  INVX12 U878 ( .A(n889), .Y(MinCost[9]) );
  NAND2X1 U879 ( .A(n873), .B(W[2]), .Y(n749) );
  NOR2XL U880 ( .A(n919), .B(n749), .Y(n736) );
  NAND2X1 U881 ( .A(n873), .B(n734), .Y(n751) );
  NAND2BX1 U882 ( .AN(n873), .B(n872), .Y(n750) );
  OAI22XL U883 ( .A0(n892), .A1(n751), .B0(n878), .B1(n750), .Y(n735) );
  AOI211XL U884 ( .A0(n754), .A1(current_perm[20]), .B0(n736), .C0(n735), .Y(
        n740) );
  NOR2XL U885 ( .A(n897), .B(n749), .Y(n738) );
  OAI22XL U886 ( .A0(n877), .A1(n751), .B0(n882), .B1(n750), .Y(n737) );
  AOI211XL U887 ( .A0(current_perm[23]), .A1(n754), .B0(n738), .C0(n737), .Y(
        n739) );
  NOR2XL U888 ( .A(n918), .B(n749), .Y(n742) );
  OAI22XL U889 ( .A0(n874), .A1(n751), .B0(n890), .B1(n750), .Y(n741) );
  AOI211XL U890 ( .A0(n754), .A1(current_perm[19]), .B0(n742), .C0(n741), .Y(
        n746) );
  NOR2XL U891 ( .A(n914), .B(n749), .Y(n744) );
  OAI22XL U892 ( .A0(n881), .A1(n750), .B0(n896), .B1(n751), .Y(n743) );
  AOI211XL U893 ( .A0(n754), .A1(current_perm[22]), .B0(n744), .C0(n743), .Y(
        n745) );
  NOR2XL U894 ( .A(n910), .B(n749), .Y(n748) );
  OAI22XL U895 ( .A0(n876), .A1(n751), .B0(n883), .B1(n750), .Y(n747) );
  AOI211XL U896 ( .A0(n754), .A1(current_perm[18]), .B0(n748), .C0(n747), .Y(
        n756) );
  NOR2XL U897 ( .A(n888), .B(n749), .Y(n753) );
  OAI22XL U898 ( .A0(n879), .A1(n751), .B0(n891), .B1(n750), .Y(n752) );
  AOI211XL U899 ( .A0(n754), .A1(current_perm[21]), .B0(n753), .C0(n752), .Y(
        n755) );
  MXI2X1 U900 ( .A(n758), .B(n902), .S0(n402), .Y(n398) );
  NOR2X1 U901 ( .A(n760), .B(n930), .Y(n761) );
  OAI22X1 U902 ( .A0(n763), .A1(n915), .B0(n762), .B1(n768), .Y(n374) );
  NAND2X1 U903 ( .A(n764), .B(n916), .Y(n767) );
  AOI2BB2X1 U904 ( .B0(n812), .B1(n863), .A0N(n876), .A1N(n425), .Y(n772) );
  OAI21X1 U905 ( .A0(n866), .A1(n769), .B0(n425), .Y(n814) );
  OA22X1 U906 ( .A0(n770), .A1(n536), .B0(n829), .B1(n814), .Y(n771) );
  OAI211X1 U907 ( .A0(n800), .A1(n627), .B0(n772), .C0(n771), .Y(n382) );
  AOI2BB2X1 U908 ( .B0(n812), .B1(n808), .A0N(n892), .A1N(n425), .Y(n775) );
  OA22X1 U909 ( .A0(n773), .A1(n536), .B0(n850), .B1(n814), .Y(n774) );
  OAI211X1 U910 ( .A0(n847), .A1(n627), .B0(n775), .C0(n774), .Y(n367) );
  OAI22XL U911 ( .A0(n857), .A1(n845), .B0(n425), .B1(n896), .Y(n778) );
  OAI22XL U912 ( .A0(n776), .A1(n533), .B0(n815), .B1(n536), .Y(n777) );
  AOI211X1 U913 ( .A0(n812), .A1(n779), .B0(n778), .C0(n777), .Y(n780) );
  OAI21X1 U914 ( .A0(n781), .A1(n854), .B0(n780), .Y(n381) );
  OAI2BB1X1 U915 ( .A0N(n792), .A1N(n783), .B0(n782), .Y(N12) );
  OAI2BB1X1 U916 ( .A0N(n792), .A1N(n785), .B0(n784), .Y(N11) );
  OAI2BB1X1 U917 ( .A0N(n792), .A1N(n787), .B0(n786), .Y(N10) );
  OAI2BB1X1 U918 ( .A0N(n792), .A1N(n789), .B0(n788), .Y(N9) );
  OAI21XL U919 ( .A0(n796), .A1(n533), .B0(n919), .Y(n388) );
  OAI22XL U920 ( .A0(n823), .A1(n801), .B0(n425), .B1(n898), .Y(n802) );
  AOI211X1 U921 ( .A0(n848), .A1(n819), .B0(n803), .C0(n802), .Y(n805) );
  AOI222XL U922 ( .A0(n837), .A1(n866), .B0(n862), .B1(n808), .C0(n807), .C1(
        n864), .Y(n809) );
  AOI2BB2X1 U923 ( .B0(n870), .B1(n849), .A0N(n870), .A1N(n809), .Y(n810) );
  OAI22XL U924 ( .A0(n425), .A1(n882), .B0(n424), .B1(n810), .Y(n384) );
  AOI2BB2X1 U925 ( .B0(n812), .B1(n811), .A0N(n874), .A1N(n425), .Y(n817) );
  OAI22XL U926 ( .A0(n818), .A1(n831), .B0(n888), .B1(n830), .Y(n822) );
  AO22X1 U927 ( .A0(current_perm[21]), .A1(n424), .B0(n820), .B1(n819), .Y(
        n821) );
  AOI211X1 U928 ( .A0(n836), .A1(n869), .B0(n822), .C0(n821), .Y(n828) );
  OAI222XL U929 ( .A0(n447), .A1(n825), .B0(n840), .B1(n824), .C0(n823), .C1(
        n839), .Y(n826) );
  NAND2X1 U930 ( .A(n425), .B(n826), .Y(n827) );
  OAI22XL U931 ( .A0(n832), .A1(n831), .B0(n897), .B1(n830), .Y(n835) );
  OAI22XL U932 ( .A0(n425), .A1(n894), .B0(n833), .B1(n536), .Y(n834) );
  AOI211X1 U933 ( .A0(n836), .A1(n849), .B0(n835), .C0(n834), .Y(n843) );
  INVX1 U934 ( .A(n837), .Y(n855) );
  OAI222XL U935 ( .A0(n840), .A1(n855), .B0(n844), .B1(n839), .C0(n447), .C1(
        n838), .Y(n841) );
  NAND2X1 U936 ( .A(n425), .B(n841), .Y(n842) );
  OAI22XL U937 ( .A0(n847), .A1(n846), .B0(n845), .B1(n844), .Y(n852) );
  OAI2BB2XL U938 ( .B0(n850), .B1(n536), .A0N(n849), .A1N(n848), .Y(n851) );
  OAI21XL U939 ( .A0(n855), .A1(n854), .B0(n853), .Y(n369) );
  OAI22XL U940 ( .A0(n857), .A1(n536), .B0(n856), .B1(n627), .Y(n858) );
  AOI21X1 U941 ( .A0(current_perm[7]), .A1(n859), .B0(n858), .Y(n860) );
  OAI21XL U942 ( .A0(n861), .A1(n533), .B0(n860), .Y(n368) );
  AOI222XL U943 ( .A0(n867), .A1(n866), .B0(n865), .B1(n864), .C0(n863), .C1(
        n862), .Y(n868) );
  AOI2BB2X1 U944 ( .B0(n870), .B1(n869), .A0N(n870), .A1N(n868), .Y(n871) );
  OAI22XL U945 ( .A0(n425), .A1(n891), .B0(n424), .B1(n871), .Y(n365) );
endmodule

