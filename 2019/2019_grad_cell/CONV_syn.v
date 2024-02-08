/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Thu Feb  8 23:34:13 2024
/////////////////////////////////////////////////////////////


module CONV_DW_cmp_0 ( A, B, TC, GE_LT, GE_GT_EQ, GE_LT_GT_LE, EQ_NE );
  input [19:0] A;
  input [19:0] B;
  input TC, GE_LT, GE_GT_EQ;
  output GE_LT_GT_LE, EQ_NE;
  wire   n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179;

  OAI221XL U55 ( .A0(A[19]), .A1(n120), .B0(A[19]), .B1(n121), .C0(n122), .Y(
        GE_LT_GT_LE) );
  AOI2BB2X1 U56 ( .B0(n123), .B1(n124), .A0N(n120), .A1N(n121), .Y(n122) );
  OAI22XL U57 ( .A0(n121), .A1(n125), .B0(A[19]), .B1(n125), .Y(n124) );
  OAI21XL U58 ( .A0(A[18]), .A1(n126), .B0(n127), .Y(n125) );
  OAI22XL U59 ( .A0(n128), .A1(n129), .B0(B[17]), .B1(n128), .Y(n127) );
  NOR2BX1 U60 ( .AN(B[16]), .B(A[16]), .Y(n128) );
  OAI21XL U61 ( .A0(n130), .A1(n131), .B0(n132), .Y(n123) );
  OAI222XL U62 ( .A0(A[15]), .A1(n133), .B0(n134), .B1(n133), .C0(A[15]), .C1(
        n134), .Y(n132) );
  OAI222XL U63 ( .A0(B[14]), .A1(n135), .B0(B[14]), .B1(n136), .C0(n135), .C1(
        n136), .Y(n133) );
  OAI222XL U64 ( .A0(A[13]), .A1(n137), .B0(n138), .B1(n137), .C0(A[13]), .C1(
        n138), .Y(n136) );
  OAI222XL U65 ( .A0(B[12]), .A1(n139), .B0(B[12]), .B1(n140), .C0(n139), .C1(
        n140), .Y(n137) );
  NAND2X1 U66 ( .A(A[11]), .B(n141), .Y(n140) );
  OAI21XL U67 ( .A0(A[15]), .A1(n134), .B0(n142), .Y(n131) );
  OAI22XL U68 ( .A0(n143), .A1(n135), .B0(B[14]), .B1(n143), .Y(n142) );
  CLKINVX1 U69 ( .A(A[14]), .Y(n135) );
  OAI21XL U70 ( .A0(A[13]), .A1(n138), .B0(n144), .Y(n143) );
  OAI22XL U71 ( .A0(n145), .A1(n139), .B0(B[12]), .B1(n145), .Y(n144) );
  CLKINVX1 U72 ( .A(A[12]), .Y(n139) );
  NOR2X1 U73 ( .A(n141), .B(A[11]), .Y(n145) );
  CLKINVX1 U74 ( .A(B[11]), .Y(n141) );
  CLKINVX1 U75 ( .A(B[13]), .Y(n138) );
  CLKINVX1 U76 ( .A(B[15]), .Y(n134) );
  AOI221XL U77 ( .A0(A[10]), .A1(n146), .B0(n147), .B1(n148), .C0(n149), .Y(
        n130) );
  OAI22XL U78 ( .A0(B[10]), .A1(n150), .B0(B[10]), .B1(n151), .Y(n149) );
  OAI22XL U79 ( .A0(n150), .A1(n152), .B0(B[10]), .B1(n152), .Y(n148) );
  OAI21XL U80 ( .A0(A[9]), .A1(n153), .B0(n154), .Y(n152) );
  OAI22XL U81 ( .A0(n155), .A1(n156), .B0(B[8]), .B1(n155), .Y(n154) );
  NOR2BX1 U82 ( .AN(B[7]), .B(A[7]), .Y(n155) );
  CLKINVX1 U83 ( .A(A[10]), .Y(n150) );
  OAI21XL U84 ( .A0(n157), .A1(n158), .B0(n159), .Y(n147) );
  OAI222XL U85 ( .A0(A[6]), .A1(n160), .B0(n161), .B1(n160), .C0(A[6]), .C1(
        n161), .Y(n159) );
  OAI222XL U86 ( .A0(B[5]), .A1(n162), .B0(B[5]), .B1(n163), .C0(n162), .C1(
        n163), .Y(n160) );
  NAND2X1 U87 ( .A(A[4]), .B(n164), .Y(n163) );
  OAI21XL U88 ( .A0(A[6]), .A1(n161), .B0(n165), .Y(n158) );
  OAI22XL U89 ( .A0(n166), .A1(n162), .B0(B[5]), .B1(n166), .Y(n165) );
  CLKINVX1 U90 ( .A(A[5]), .Y(n162) );
  NOR2X1 U91 ( .A(n164), .B(A[4]), .Y(n166) );
  CLKINVX1 U92 ( .A(B[4]), .Y(n164) );
  CLKINVX1 U93 ( .A(B[6]), .Y(n161) );
  AOI221XL U94 ( .A0(A[3]), .A1(n167), .B0(n168), .B1(n169), .C0(n170), .Y(
        n157) );
  OAI22XL U95 ( .A0(B[3]), .A1(n171), .B0(B[3]), .B1(n172), .Y(n170) );
  OAI22XL U96 ( .A0(n173), .A1(n171), .B0(B[3]), .B1(n173), .Y(n169) );
  CLKINVX1 U97 ( .A(A[3]), .Y(n171) );
  NOR2BX1 U98 ( .AN(B[2]), .B(A[2]), .Y(n173) );
  AO22X1 U99 ( .A0(n174), .A1(A[0]), .B0(A[1]), .B1(n175), .Y(n168) );
  AOI2BB1X1 U100 ( .A0N(n175), .A1N(A[1]), .B0(B[0]), .Y(n174) );
  CLKINVX1 U101 ( .A(B[1]), .Y(n175) );
  CLKINVX1 U102 ( .A(n172), .Y(n167) );
  NAND2BX1 U103 ( .AN(B[2]), .B(A[2]), .Y(n172) );
  CLKINVX1 U104 ( .A(n151), .Y(n146) );
  OAI222XL U105 ( .A0(A[9]), .A1(n176), .B0(n176), .B1(n153), .C0(A[9]), .C1(
        n153), .Y(n151) );
  CLKINVX1 U106 ( .A(B[9]), .Y(n153) );
  OAI222XL U107 ( .A0(B[8]), .A1(n156), .B0(B[8]), .B1(n177), .C0(n177), .C1(
        n156), .Y(n176) );
  NAND2BX1 U108 ( .AN(B[7]), .B(A[7]), .Y(n177) );
  CLKINVX1 U109 ( .A(A[8]), .Y(n156) );
  CLKINVX1 U110 ( .A(B[19]), .Y(n121) );
  OAI222XL U111 ( .A0(A[18]), .A1(n178), .B0(n178), .B1(n126), .C0(A[18]), 
        .C1(n126), .Y(n120) );
  CLKINVX1 U112 ( .A(B[18]), .Y(n126) );
  OAI222XL U113 ( .A0(B[17]), .A1(n129), .B0(B[17]), .B1(n179), .C0(n179), 
        .C1(n129), .Y(n178) );
  NAND2BX1 U114 ( .AN(B[16]), .B(A[16]), .Y(n179) );
  CLKINVX1 U115 ( .A(A[17]), .Y(n129) );
endmodule


module CONV_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  ADDHX4 U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADDHX4 U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHX4 U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHX4 U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHX4 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHX4 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX4 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX4 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX4 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX4 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX4 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX4 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX4 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX4 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CONV_DW01_add_2 ( A, B, CI, SUM, CO );
  input [35:0] A;
  input [35:0] B;
  output [35:0] SUM;
  input CI;
  output CO;
  wire   n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22;
  wire   [35:1] carry;
  assign carry[21] = A[20];

  CLKBUFX3 U1 ( .A(A[19]), .Y(SUM[19]) );
  CLKBUFX3 U2 ( .A(A[18]), .Y(SUM[18]) );
  CLKBUFX3 U3 ( .A(A[17]), .Y(SUM[17]) );
  CLKBUFX3 U4 ( .A(A[16]), .Y(SUM[16]) );
  CLKBUFX3 U5 ( .A(A[15]), .Y(SUM[15]) );
  NAND2X4 U6 ( .A(n6), .B(n7), .Y(carry[29]) );
  XNOR2X4 U7 ( .A(A[28]), .B(carry[28]), .Y(SUM[28]) );
  CLKINVX6 U8 ( .A(A[28]), .Y(n6) );
  CLKINVX6 U9 ( .A(carry[28]), .Y(n7) );
  NAND2X4 U10 ( .A(n8), .B(n9), .Y(carry[26]) );
  XNOR2X4 U11 ( .A(A[25]), .B(carry[25]), .Y(SUM[25]) );
  CLKINVX6 U12 ( .A(A[25]), .Y(n8) );
  CLKINVX6 U13 ( .A(carry[25]), .Y(n9) );
  NAND2X4 U14 ( .A(n10), .B(n11), .Y(carry[25]) );
  XNOR2X4 U15 ( .A(A[24]), .B(carry[24]), .Y(SUM[24]) );
  CLKINVX6 U16 ( .A(A[24]), .Y(n10) );
  CLKINVX6 U17 ( .A(carry[24]), .Y(n11) );
  XOR2X4 U18 ( .A(A[35]), .B(carry[35]), .Y(SUM[35]) );
  XOR2X4 U19 ( .A(A[34]), .B(carry[34]), .Y(SUM[34]) );
  NAND2X4 U20 ( .A(A[34]), .B(carry[34]), .Y(n12) );
  CLKINVX6 U21 ( .A(n12), .Y(carry[35]) );
  XOR2X4 U22 ( .A(A[33]), .B(carry[33]), .Y(SUM[33]) );
  NAND2X4 U23 ( .A(A[33]), .B(carry[33]), .Y(n13) );
  CLKINVX6 U24 ( .A(n13), .Y(carry[34]) );
  XOR2X4 U25 ( .A(A[32]), .B(carry[32]), .Y(SUM[32]) );
  NAND2X4 U26 ( .A(A[32]), .B(carry[32]), .Y(n14) );
  CLKINVX6 U27 ( .A(n14), .Y(carry[33]) );
  XOR2X4 U28 ( .A(A[31]), .B(carry[31]), .Y(SUM[31]) );
  NAND2X4 U29 ( .A(A[31]), .B(carry[31]), .Y(n15) );
  CLKINVX6 U30 ( .A(n15), .Y(carry[32]) );
  XOR2X4 U31 ( .A(A[30]), .B(carry[30]), .Y(SUM[30]) );
  NAND2X4 U32 ( .A(A[30]), .B(carry[30]), .Y(n16) );
  CLKINVX6 U33 ( .A(n16), .Y(carry[31]) );
  XOR2X4 U34 ( .A(A[29]), .B(carry[29]), .Y(SUM[29]) );
  NAND2X4 U35 ( .A(A[29]), .B(carry[29]), .Y(n17) );
  CLKINVX6 U36 ( .A(n17), .Y(carry[30]) );
  XOR2X4 U37 ( .A(A[27]), .B(carry[27]), .Y(SUM[27]) );
  NAND2X4 U38 ( .A(A[27]), .B(carry[27]), .Y(n18) );
  CLKINVX6 U39 ( .A(n18), .Y(carry[28]) );
  XOR2X4 U40 ( .A(A[26]), .B(carry[26]), .Y(SUM[26]) );
  NAND2X4 U41 ( .A(A[26]), .B(carry[26]), .Y(n19) );
  CLKINVX6 U42 ( .A(n19), .Y(carry[27]) );
  XOR2X4 U43 ( .A(A[23]), .B(carry[23]), .Y(SUM[23]) );
  NAND2X4 U44 ( .A(A[23]), .B(carry[23]), .Y(n20) );
  CLKINVX6 U45 ( .A(n20), .Y(carry[24]) );
  XOR2X4 U46 ( .A(A[22]), .B(carry[22]), .Y(SUM[22]) );
  NAND2X4 U47 ( .A(A[22]), .B(carry[22]), .Y(n21) );
  CLKINVX6 U48 ( .A(n21), .Y(carry[23]) );
  XOR2X4 U49 ( .A(A[21]), .B(carry[21]), .Y(SUM[21]) );
  NAND2X4 U50 ( .A(A[21]), .B(carry[21]), .Y(n22) );
  CLKINVX6 U51 ( .A(n22), .Y(carry[22]) );
  CLKINVX6 U52 ( .A(carry[21]), .Y(SUM[20]) );
endmodule


module CONV_DW01_add_3 ( A, B, CI, SUM, CO );
  input [35:0] A;
  input [35:0] B;
  output [35:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29;
  wire   [35:1] carry;
  assign carry[17] = A[16];

  CLKBUFX3 U1 ( .A(A[15]), .Y(SUM[15]) );
  XNOR2X4 U2 ( .A(A[35]), .B(carry[35]), .Y(SUM[35]) );
  NAND2X4 U3 ( .A(n2), .B(n3), .Y(carry[35]) );
  XNOR2X4 U4 ( .A(A[34]), .B(carry[34]), .Y(SUM[34]) );
  CLKINVX6 U5 ( .A(A[34]), .Y(n2) );
  CLKINVX6 U6 ( .A(carry[34]), .Y(n3) );
  NAND2X4 U7 ( .A(n4), .B(n5), .Y(carry[34]) );
  XNOR2X4 U8 ( .A(A[33]), .B(carry[33]), .Y(SUM[33]) );
  CLKINVX6 U9 ( .A(A[33]), .Y(n4) );
  CLKINVX6 U10 ( .A(carry[33]), .Y(n5) );
  NAND2X4 U11 ( .A(n6), .B(n7), .Y(carry[33]) );
  XNOR2X4 U12 ( .A(A[32]), .B(carry[32]), .Y(SUM[32]) );
  CLKINVX6 U13 ( .A(A[32]), .Y(n6) );
  CLKINVX6 U14 ( .A(carry[32]), .Y(n7) );
  NAND2X4 U15 ( .A(n8), .B(n9), .Y(carry[31]) );
  XNOR2X4 U16 ( .A(A[30]), .B(carry[30]), .Y(SUM[30]) );
  CLKINVX6 U17 ( .A(A[30]), .Y(n8) );
  CLKINVX6 U18 ( .A(carry[30]), .Y(n9) );
  NAND2X4 U19 ( .A(n10), .B(n11), .Y(carry[30]) );
  XNOR2X4 U20 ( .A(A[29]), .B(carry[29]), .Y(SUM[29]) );
  CLKINVX6 U21 ( .A(A[29]), .Y(n10) );
  CLKINVX6 U22 ( .A(carry[29]), .Y(n11) );
  NAND2X4 U23 ( .A(n12), .B(n13), .Y(carry[29]) );
  XNOR2X4 U24 ( .A(A[28]), .B(carry[28]), .Y(SUM[28]) );
  CLKINVX6 U25 ( .A(A[28]), .Y(n12) );
  CLKINVX6 U26 ( .A(carry[28]), .Y(n13) );
  NAND2X4 U27 ( .A(n14), .B(n15), .Y(carry[26]) );
  XNOR2X4 U28 ( .A(A[25]), .B(carry[25]), .Y(SUM[25]) );
  CLKINVX6 U29 ( .A(A[25]), .Y(n14) );
  CLKINVX6 U30 ( .A(carry[25]), .Y(n15) );
  NAND2X4 U31 ( .A(n16), .B(n17), .Y(carry[24]) );
  XNOR2X4 U32 ( .A(A[23]), .B(carry[23]), .Y(SUM[23]) );
  CLKINVX6 U33 ( .A(A[23]), .Y(n16) );
  CLKINVX6 U34 ( .A(carry[23]), .Y(n17) );
  NAND2X4 U35 ( .A(n18), .B(n19), .Y(carry[21]) );
  XNOR2X4 U36 ( .A(A[20]), .B(carry[20]), .Y(SUM[20]) );
  CLKINVX6 U37 ( .A(A[20]), .Y(n18) );
  CLKINVX6 U38 ( .A(carry[20]), .Y(n19) );
  NAND2X4 U39 ( .A(n20), .B(n21), .Y(carry[19]) );
  XNOR2X4 U40 ( .A(A[18]), .B(carry[18]), .Y(SUM[18]) );
  CLKINVX6 U41 ( .A(A[18]), .Y(n20) );
  CLKINVX6 U42 ( .A(carry[18]), .Y(n21) );
  XOR2X4 U43 ( .A(A[31]), .B(carry[31]), .Y(SUM[31]) );
  NAND2X4 U44 ( .A(A[31]), .B(carry[31]), .Y(n22) );
  CLKINVX6 U45 ( .A(n22), .Y(carry[32]) );
  XOR2X4 U46 ( .A(A[27]), .B(carry[27]), .Y(SUM[27]) );
  NAND2X4 U47 ( .A(A[27]), .B(carry[27]), .Y(n23) );
  CLKINVX6 U48 ( .A(n23), .Y(carry[28]) );
  XOR2X4 U49 ( .A(A[26]), .B(carry[26]), .Y(SUM[26]) );
  NAND2X4 U50 ( .A(A[26]), .B(carry[26]), .Y(n24) );
  CLKINVX6 U51 ( .A(n24), .Y(carry[27]) );
  XOR2X4 U52 ( .A(A[24]), .B(carry[24]), .Y(SUM[24]) );
  NAND2X4 U53 ( .A(A[24]), .B(carry[24]), .Y(n25) );
  CLKINVX6 U54 ( .A(n25), .Y(carry[25]) );
  XOR2X4 U55 ( .A(A[22]), .B(carry[22]), .Y(SUM[22]) );
  NAND2X4 U56 ( .A(A[22]), .B(carry[22]), .Y(n26) );
  CLKINVX6 U57 ( .A(n26), .Y(carry[23]) );
  XOR2X4 U58 ( .A(A[21]), .B(carry[21]), .Y(SUM[21]) );
  NAND2X4 U59 ( .A(A[21]), .B(carry[21]), .Y(n27) );
  CLKINVX6 U60 ( .A(n27), .Y(carry[22]) );
  XOR2X4 U61 ( .A(A[19]), .B(carry[19]), .Y(SUM[19]) );
  NAND2X4 U62 ( .A(A[19]), .B(carry[19]), .Y(n28) );
  CLKINVX6 U63 ( .A(n28), .Y(carry[20]) );
  XOR2X4 U64 ( .A(A[17]), .B(carry[17]), .Y(SUM[17]) );
  NAND2X4 U65 ( .A(A[17]), .B(carry[17]), .Y(n29) );
  CLKINVX6 U66 ( .A(n29), .Y(carry[18]) );
  CLKINVX6 U67 ( .A(carry[17]), .Y(SUM[16]) );
endmodule


module CONV_DW01_add_4 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:1] carry;
  assign carry[1] = A[0];

  XOR2XL U1 ( .A(A[2]), .B(carry[2]), .Y(SUM[2]) );
  NAND2X1 U2 ( .A(A[2]), .B(carry[2]), .Y(n10) );
  XOR2XL U3 ( .A(A[4]), .B(carry[4]), .Y(SUM[4]) );
  NAND2X1 U4 ( .A(A[4]), .B(carry[4]), .Y(n8) );
  XOR2XL U5 ( .A(A[3]), .B(carry[3]), .Y(SUM[3]) );
  NAND2XL U6 ( .A(A[3]), .B(carry[3]), .Y(n9) );
  XOR2XL U7 ( .A(A[5]), .B(carry[5]), .Y(SUM[5]) );
  NAND2X1 U8 ( .A(A[5]), .B(carry[5]), .Y(n7) );
  XOR2XL U9 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  NAND2X1 U10 ( .A(A[7]), .B(carry[7]), .Y(n6) );
  XOR2XL U11 ( .A(A[9]), .B(carry[9]), .Y(SUM[9]) );
  NAND2XL U12 ( .A(A[9]), .B(carry[9]), .Y(n4) );
  XOR2XL U13 ( .A(A[1]), .B(carry[1]), .Y(SUM[1]) );
  NAND2XL U14 ( .A(A[1]), .B(carry[1]), .Y(n11) );
  XOR2XL U15 ( .A(A[8]), .B(carry[8]), .Y(SUM[8]) );
  NAND2XL U16 ( .A(A[8]), .B(carry[8]), .Y(n5) );
  XOR2XL U17 ( .A(A[10]), .B(carry[10]), .Y(SUM[10]) );
  NAND2XL U18 ( .A(A[10]), .B(carry[10]), .Y(n3) );
  XNOR2XL U19 ( .A(A[6]), .B(carry[6]), .Y(SUM[6]) );
  INVXL U20 ( .A(A[6]), .Y(n1) );
  NAND2X4 U21 ( .A(n1), .B(n2), .Y(carry[7]) );
  CLKINVX6 U22 ( .A(carry[6]), .Y(n2) );
  XOR2X4 U23 ( .A(A[11]), .B(carry[11]), .Y(SUM[11]) );
  CLKINVX6 U24 ( .A(n3), .Y(carry[11]) );
  CLKINVX6 U25 ( .A(n4), .Y(carry[10]) );
  CLKINVX6 U26 ( .A(n5), .Y(carry[9]) );
  CLKINVX6 U27 ( .A(n6), .Y(carry[8]) );
  CLKINVX6 U28 ( .A(n7), .Y(carry[6]) );
  CLKINVX6 U29 ( .A(n8), .Y(carry[5]) );
  CLKINVX6 U30 ( .A(n9), .Y(carry[4]) );
  CLKINVX6 U31 ( .A(n10), .Y(carry[3]) );
  CLKINVX6 U32 ( .A(n11), .Y(carry[2]) );
  CLKINVX1 U33 ( .A(carry[1]), .Y(SUM[0]) );
endmodule


module CONV_DW01_add_6 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [11:1] carry;
  assign carry[1] = A[0];

  XNOR2XL U1 ( .A(A[2]), .B(carry[2]), .Y(SUM[2]) );
  INVXL U2 ( .A(A[2]), .Y(n7) );
  XNOR2XL U3 ( .A(A[4]), .B(carry[4]), .Y(SUM[4]) );
  CLKINVX1 U4 ( .A(A[4]), .Y(n3) );
  XNOR2XL U5 ( .A(A[3]), .B(carry[3]), .Y(SUM[3]) );
  CLKINVX1 U6 ( .A(A[3]), .Y(n5) );
  XNOR2XL U7 ( .A(A[5]), .B(carry[5]), .Y(SUM[5]) );
  CLKINVX1 U8 ( .A(A[5]), .Y(n1) );
  XOR2XL U9 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  NAND2XL U10 ( .A(A[7]), .B(carry[7]), .Y(n14) );
  XOR2XL U11 ( .A(A[9]), .B(carry[9]), .Y(SUM[9]) );
  NAND2X1 U12 ( .A(A[9]), .B(carry[9]), .Y(n12) );
  XNOR2XL U13 ( .A(A[1]), .B(carry[1]), .Y(SUM[1]) );
  INVXL U14 ( .A(A[1]), .Y(n9) );
  XOR2XL U15 ( .A(A[8]), .B(carry[8]), .Y(SUM[8]) );
  NAND2XL U16 ( .A(A[8]), .B(carry[8]), .Y(n13) );
  XOR2XL U17 ( .A(A[10]), .B(carry[10]), .Y(SUM[10]) );
  NAND2XL U18 ( .A(A[10]), .B(carry[10]), .Y(n11) );
  XOR2XL U19 ( .A(A[6]), .B(carry[6]), .Y(SUM[6]) );
  NAND2XL U20 ( .A(A[6]), .B(carry[6]), .Y(n15) );
  NAND2X4 U21 ( .A(n1), .B(n2), .Y(carry[6]) );
  CLKINVX6 U22 ( .A(carry[5]), .Y(n2) );
  NAND2X4 U23 ( .A(n3), .B(n4), .Y(carry[5]) );
  CLKINVX6 U24 ( .A(carry[4]), .Y(n4) );
  NAND2X4 U25 ( .A(n5), .B(n6), .Y(carry[4]) );
  CLKINVX6 U26 ( .A(carry[3]), .Y(n6) );
  NAND2X4 U27 ( .A(n7), .B(n8), .Y(carry[3]) );
  CLKINVX6 U28 ( .A(carry[2]), .Y(n8) );
  NAND2X4 U29 ( .A(n9), .B(n10), .Y(carry[2]) );
  CLKINVX6 U30 ( .A(carry[1]), .Y(n10) );
  XOR2X4 U31 ( .A(A[11]), .B(carry[11]), .Y(SUM[11]) );
  CLKINVX6 U32 ( .A(n11), .Y(carry[11]) );
  CLKINVX6 U33 ( .A(n12), .Y(carry[10]) );
  CLKINVX6 U34 ( .A(n13), .Y(carry[9]) );
  CLKINVX6 U35 ( .A(n14), .Y(carry[8]) );
  CLKINVX6 U36 ( .A(n15), .Y(carry[7]) );
  CLKINVX1 U37 ( .A(carry[1]), .Y(SUM[0]) );
endmodule


module CONV_DW01_dec_0 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  OAI2BB1XL U1 ( .A0N(n10), .A1N(A[2]), .B0(n9), .Y(SUM[2]) );
  OAI2BB1XL U2 ( .A0N(n8), .A1N(A[4]), .B0(n7), .Y(SUM[4]) );
  OAI2BB1XL U3 ( .A0N(n9), .A1N(A[3]), .B0(n8), .Y(SUM[3]) );
  OAI2BB1XL U4 ( .A0N(n7), .A1N(A[5]), .B0(n6), .Y(SUM[5]) );
  OAI2BB1XL U5 ( .A0N(n5), .A1N(A[7]), .B0(n4), .Y(SUM[7]) );
  OAI2BB1XL U6 ( .A0N(A[0]), .A1N(A[1]), .B0(n10), .Y(SUM[1]) );
  AO21XL U7 ( .A0(n4), .A1(A[8]), .B0(n1), .Y(SUM[8]) );
  XNOR2XL U8 ( .A(A[10]), .B(n3), .Y(SUM[10]) );
  NOR2XL U9 ( .A(A[10]), .B(n3), .Y(n11) );
  OAI2BB1XL U10 ( .A0N(n6), .A1N(A[6]), .B0(n5), .Y(SUM[6]) );
  OR2XL U11 ( .A(n6), .B(A[6]), .Y(n5) );
  OAI21XL U12 ( .A0(n1), .A1(n2), .B0(n3), .Y(SUM[9]) );
  XOR2X1 U13 ( .A(A[11]), .B(n11), .Y(SUM[11]) );
  NAND2X1 U14 ( .A(n1), .B(n2), .Y(n3) );
  CLKINVX1 U15 ( .A(A[9]), .Y(n2) );
  NOR2X1 U16 ( .A(n4), .B(A[8]), .Y(n1) );
  OR2X1 U17 ( .A(n5), .B(A[7]), .Y(n4) );
  OR2X1 U18 ( .A(n7), .B(A[5]), .Y(n6) );
  OR2X1 U19 ( .A(n8), .B(A[4]), .Y(n7) );
  OR2X1 U20 ( .A(n9), .B(A[3]), .Y(n8) );
  OR2X1 U21 ( .A(n10), .B(A[2]), .Y(n9) );
  NAND2BX1 U22 ( .AN(A[1]), .B(SUM[0]), .Y(n10) );
  CLKINVX1 U23 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CONV_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [12:0] carry;
  assign carry[1] = A[0];

  XOR2XL U1 ( .A(A[2]), .B(carry[2]), .Y(DIFF[2]) );
  NAND2XL U2 ( .A(A[2]), .B(carry[2]), .Y(n12) );
  XOR2XL U3 ( .A(A[4]), .B(carry[4]), .Y(DIFF[4]) );
  NAND2XL U4 ( .A(A[4]), .B(carry[4]), .Y(n14) );
  XOR2XL U5 ( .A(A[3]), .B(carry[3]), .Y(DIFF[3]) );
  NAND2XL U6 ( .A(A[3]), .B(carry[3]), .Y(n13) );
  XOR2XL U7 ( .A(A[5]), .B(carry[5]), .Y(DIFF[5]) );
  NAND2XL U8 ( .A(A[5]), .B(carry[5]), .Y(n15) );
  XNOR2XL U9 ( .A(A[7]), .B(carry[7]), .Y(DIFF[7]) );
  INVXL U10 ( .A(A[7]), .Y(n5) );
  XNOR2XL U11 ( .A(A[9]), .B(carry[9]), .Y(DIFF[9]) );
  INVXL U12 ( .A(A[9]), .Y(n9) );
  XOR2XL U13 ( .A(A[1]), .B(carry[1]), .Y(DIFF[1]) );
  NAND2XL U14 ( .A(A[1]), .B(carry[1]), .Y(n11) );
  XNOR2XL U15 ( .A(A[8]), .B(carry[8]), .Y(DIFF[8]) );
  INVXL U16 ( .A(A[8]), .Y(n7) );
  XNOR2XL U17 ( .A(A[10]), .B(carry[10]), .Y(DIFF[10]) );
  INVXL U18 ( .A(A[10]), .Y(n1) );
  XNOR2XL U19 ( .A(A[6]), .B(carry[6]), .Y(DIFF[6]) );
  INVXL U20 ( .A(A[6]), .Y(n3) );
  NAND2X4 U21 ( .A(n1), .B(n2), .Y(carry[11]) );
  CLKINVX6 U22 ( .A(carry[10]), .Y(n2) );
  XNOR2X4 U23 ( .A(A[11]), .B(carry[11]), .Y(DIFF[11]) );
  NAND2X4 U24 ( .A(n3), .B(n4), .Y(carry[7]) );
  CLKINVX6 U25 ( .A(carry[6]), .Y(n4) );
  NAND2X4 U26 ( .A(n5), .B(n6), .Y(carry[8]) );
  CLKINVX6 U27 ( .A(carry[7]), .Y(n6) );
  NAND2X4 U28 ( .A(n7), .B(n8), .Y(carry[9]) );
  CLKINVX6 U29 ( .A(carry[8]), .Y(n8) );
  NAND2X4 U30 ( .A(n9), .B(n10), .Y(carry[10]) );
  CLKINVX6 U31 ( .A(carry[9]), .Y(n10) );
  CLKINVX6 U32 ( .A(n11), .Y(carry[2]) );
  CLKINVX6 U33 ( .A(n12), .Y(carry[3]) );
  CLKINVX6 U34 ( .A(n13), .Y(carry[4]) );
  CLKINVX6 U35 ( .A(n14), .Y(carry[5]) );
  CLKINVX6 U36 ( .A(n15), .Y(carry[6]) );
  CLKINVX1 U37 ( .A(carry[1]), .Y(DIFF[0]) );
endmodule


module CONV_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19;
  wire   [12:0] carry;
  assign carry[1] = A[0];

  XNOR2XL U1 ( .A(A[2]), .B(carry[2]), .Y(DIFF[2]) );
  INVXL U2 ( .A(A[2]), .Y(n5) );
  XNOR2XL U3 ( .A(A[4]), .B(carry[4]), .Y(DIFF[4]) );
  INVXL U4 ( .A(A[4]), .Y(n9) );
  XNOR2XL U5 ( .A(A[3]), .B(carry[3]), .Y(DIFF[3]) );
  INVXL U6 ( .A(A[3]), .Y(n7) );
  XNOR2XL U7 ( .A(A[5]), .B(carry[5]), .Y(DIFF[5]) );
  INVXL U8 ( .A(A[5]), .Y(n11) );
  XNOR2XL U9 ( .A(A[7]), .B(carry[7]), .Y(DIFF[7]) );
  INVXL U10 ( .A(A[7]), .Y(n13) );
  XNOR2XL U11 ( .A(A[9]), .B(carry[9]), .Y(DIFF[9]) );
  INVXL U12 ( .A(A[9]), .Y(n17) );
  XNOR2XL U13 ( .A(A[1]), .B(carry[1]), .Y(DIFF[1]) );
  INVXL U14 ( .A(A[1]), .Y(n3) );
  XNOR2XL U15 ( .A(A[8]), .B(carry[8]), .Y(DIFF[8]) );
  INVXL U16 ( .A(A[8]), .Y(n15) );
  XNOR2XL U17 ( .A(A[10]), .B(carry[10]), .Y(DIFF[10]) );
  INVXL U18 ( .A(A[10]), .Y(n1) );
  XOR2XL U19 ( .A(A[6]), .B(carry[6]), .Y(DIFF[6]) );
  NAND2XL U20 ( .A(A[6]), .B(carry[6]), .Y(n19) );
  NAND2X4 U21 ( .A(n1), .B(n2), .Y(carry[11]) );
  CLKINVX6 U22 ( .A(carry[10]), .Y(n2) );
  XNOR2X4 U23 ( .A(A[11]), .B(carry[11]), .Y(DIFF[11]) );
  NAND2X4 U24 ( .A(n3), .B(n4), .Y(carry[2]) );
  CLKINVX6 U25 ( .A(carry[1]), .Y(n4) );
  NAND2X4 U26 ( .A(n5), .B(n6), .Y(carry[3]) );
  CLKINVX6 U27 ( .A(carry[2]), .Y(n6) );
  NAND2X4 U28 ( .A(n7), .B(n8), .Y(carry[4]) );
  CLKINVX6 U29 ( .A(carry[3]), .Y(n8) );
  NAND2X4 U30 ( .A(n9), .B(n10), .Y(carry[5]) );
  CLKINVX6 U31 ( .A(carry[4]), .Y(n10) );
  NAND2X4 U32 ( .A(n11), .B(n12), .Y(carry[6]) );
  CLKINVX6 U33 ( .A(carry[5]), .Y(n12) );
  NAND2X4 U34 ( .A(n13), .B(n14), .Y(carry[8]) );
  CLKINVX6 U35 ( .A(carry[7]), .Y(n14) );
  NAND2X4 U36 ( .A(n15), .B(n16), .Y(carry[9]) );
  CLKINVX6 U37 ( .A(carry[8]), .Y(n16) );
  NAND2X4 U38 ( .A(n17), .B(n18), .Y(carry[10]) );
  CLKINVX6 U39 ( .A(carry[9]), .Y(n18) );
  CLKINVX6 U40 ( .A(n19), .Y(carry[7]) );
  CLKINVX1 U41 ( .A(carry[1]), .Y(DIFF[0]) );
endmodule


module CONV_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHX4 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHX4 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX4 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX4 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX4 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX4 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX4 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX4 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX4 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX4 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CONV_DW01_inc_2_DW01_inc_3 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  XOR2X1 U1 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module CONV_DW01_add_8 ( A, B, CI, SUM, CO );
  input [39:0] A;
  input [39:0] B;
  output [39:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [39:1] carry;

  ADDFHX4 U1_38 ( .A(A[38]), .B(B[38]), .CI(carry[38]), .CO(carry[39]), .S(
        SUM[38]) );
  ADDFHX4 U1_37 ( .A(A[37]), .B(B[37]), .CI(carry[37]), .CO(carry[38]), .S(
        SUM[37]) );
  ADDFHX4 U1_36 ( .A(A[36]), .B(B[36]), .CI(carry[36]), .CO(carry[37]), .S(
        SUM[36]) );
  ADDFHX4 U1_35 ( .A(A[35]), .B(B[35]), .CI(carry[35]), .CO(carry[36]), .S(
        SUM[35]) );
  ADDFHX4 U1_34 ( .A(A[34]), .B(B[34]), .CI(carry[34]), .CO(carry[35]), .S(
        SUM[34]) );
  ADDFHX4 U1_33 ( .A(A[33]), .B(B[33]), .CI(carry[33]), .CO(carry[34]), .S(
        SUM[33]) );
  ADDFHX4 U1_32 ( .A(A[32]), .B(B[32]), .CI(carry[32]), .CO(carry[33]), .S(
        SUM[32]) );
  ADDFHX4 U1_31 ( .A(B[31]), .B(A[31]), .CI(carry[31]), .CO(carry[32]), .S(
        SUM[31]) );
  ADDFHX4 U1_30 ( .A(A[30]), .B(B[30]), .CI(carry[30]), .CO(carry[31]), .S(
        SUM[30]) );
  ADDFHX4 U1_29 ( .A(A[29]), .B(B[29]), .CI(carry[29]), .CO(carry[30]), .S(
        SUM[29]) );
  ADDFHX4 U1_28 ( .A(A[28]), .B(B[28]), .CI(carry[28]), .CO(carry[29]), .S(
        SUM[28]) );
  ADDFHX4 U1_27 ( .A(A[27]), .B(B[27]), .CI(carry[27]), .CO(carry[28]), .S(
        SUM[27]) );
  ADDFHX4 U1_26 ( .A(A[26]), .B(B[26]), .CI(carry[26]), .CO(carry[27]), .S(
        SUM[26]) );
  ADDFHX4 U1_25 ( .A(A[25]), .B(B[25]), .CI(carry[25]), .CO(carry[26]), .S(
        SUM[25]) );
  ADDFHX4 U1_24 ( .A(A[24]), .B(B[24]), .CI(carry[24]), .CO(carry[25]), .S(
        SUM[24]) );
  ADDFHX4 U1_23 ( .A(A[23]), .B(B[23]), .CI(carry[23]), .CO(carry[24]), .S(
        SUM[23]) );
  ADDFHX4 U1_22 ( .A(A[22]), .B(B[22]), .CI(carry[22]), .CO(carry[23]), .S(
        SUM[22]) );
  ADDFHX4 U1_21 ( .A(A[21]), .B(B[21]), .CI(carry[21]), .CO(carry[22]), .S(
        SUM[21]) );
  ADDFHX4 U1_20 ( .A(A[20]), .B(B[20]), .CI(carry[20]), .CO(carry[21]), .S(
        SUM[20]) );
  ADDFHX4 U1_19 ( .A(A[19]), .B(B[19]), .CI(carry[19]), .CO(carry[20]), .S(
        SUM[19]) );
  ADDFHX4 U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  ADDFHX4 U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  ADDFHX4 U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  ADDFHX4 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFHX4 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFHX4 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFHX4 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFHX4 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFHX4 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX4 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFHX4 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX4 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX4 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX4 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  XOR3X4 U1_39 ( .A(A[39]), .B(B[39]), .C(carry[39]), .Y(SUM[39]) );
  XOR2X4 U1 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  NAND2X4 U2 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKINVX6 U3 ( .A(n1), .Y(carry[1]) );
endmodule


module CONV_DW01_add_7 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n1, n3,
         n5, n7, n9, n11, n13, n15, n17, n19, n21, n23, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34;
  wire   [11:1] carry;

  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(n40) );
  NAND2X1 U1 ( .A(A[2]), .B(carry[2]), .Y(n33) );
  NAND2X1 U2 ( .A(A[4]), .B(carry[4]), .Y(n31) );
  NAND2X1 U3 ( .A(A[3]), .B(carry[3]), .Y(n32) );
  NAND2XL U4 ( .A(A[5]), .B(carry[5]), .Y(n30) );
  NAND2XL U5 ( .A(A[7]), .B(carry[7]), .Y(n28) );
  NAND2XL U6 ( .A(A[9]), .B(carry[9]), .Y(n26) );
  NAND2XL U7 ( .A(A[1]), .B(carry[1]), .Y(n34) );
  NAND2XL U8 ( .A(A[8]), .B(carry[8]), .Y(n27) );
  NAND2XL U9 ( .A(A[10]), .B(carry[10]), .Y(n25) );
  INVXL U10 ( .A(n40), .Y(n1) );
  INVX12 U11 ( .A(n1), .Y(SUM[6]) );
  INVXL U12 ( .A(n35), .Y(n3) );
  INVX12 U13 ( .A(n3), .Y(SUM[11]) );
  XOR2X1 U14 ( .A(A[11]), .B(carry[11]), .Y(n35) );
  INVXL U15 ( .A(n36), .Y(n5) );
  INVX12 U16 ( .A(n5), .Y(SUM[10]) );
  XOR2XL U17 ( .A(A[10]), .B(carry[10]), .Y(n36) );
  INVXL U18 ( .A(n37), .Y(n7) );
  INVX12 U19 ( .A(n7), .Y(SUM[9]) );
  XOR2XL U20 ( .A(A[9]), .B(carry[9]), .Y(n37) );
  INVXL U21 ( .A(n38), .Y(n9) );
  INVX12 U22 ( .A(n9), .Y(SUM[8]) );
  XOR2XL U23 ( .A(A[8]), .B(carry[8]), .Y(n38) );
  INVXL U24 ( .A(n39), .Y(n11) );
  INVX12 U25 ( .A(n11), .Y(SUM[7]) );
  XOR2XL U26 ( .A(A[7]), .B(carry[7]), .Y(n39) );
  INVXL U27 ( .A(n46), .Y(n13) );
  INVX12 U28 ( .A(n13), .Y(SUM[0]) );
  XOR2XL U29 ( .A(B[0]), .B(A[0]), .Y(n46) );
  INVXL U30 ( .A(n41), .Y(n15) );
  INVX12 U31 ( .A(n15), .Y(SUM[5]) );
  XOR2XL U32 ( .A(A[5]), .B(carry[5]), .Y(n41) );
  INVXL U33 ( .A(n42), .Y(n17) );
  INVX12 U34 ( .A(n17), .Y(SUM[4]) );
  XOR2XL U35 ( .A(A[4]), .B(carry[4]), .Y(n42) );
  INVXL U36 ( .A(n43), .Y(n19) );
  INVX12 U37 ( .A(n19), .Y(SUM[3]) );
  XOR2XL U38 ( .A(A[3]), .B(carry[3]), .Y(n43) );
  INVXL U39 ( .A(n44), .Y(n21) );
  INVX12 U40 ( .A(n21), .Y(SUM[2]) );
  XOR2XL U41 ( .A(A[2]), .B(carry[2]), .Y(n44) );
  INVXL U42 ( .A(n45), .Y(n23) );
  INVX12 U43 ( .A(n23), .Y(SUM[1]) );
  XOR2XL U44 ( .A(A[1]), .B(carry[1]), .Y(n45) );
  CLKINVX6 U45 ( .A(n25), .Y(carry[11]) );
  CLKINVX6 U46 ( .A(n26), .Y(carry[10]) );
  CLKINVX6 U47 ( .A(n27), .Y(carry[9]) );
  CLKINVX6 U48 ( .A(n28), .Y(carry[8]) );
  NAND2X4 U49 ( .A(B[0]), .B(A[0]), .Y(n29) );
  CLKINVX6 U50 ( .A(n29), .Y(carry[1]) );
  CLKINVX6 U51 ( .A(n30), .Y(carry[6]) );
  CLKINVX6 U52 ( .A(n31), .Y(carry[5]) );
  CLKINVX6 U53 ( .A(n32), .Y(carry[4]) );
  CLKINVX6 U54 ( .A(n33), .Y(carry[3]) );
  CLKINVX6 U55 ( .A(n34), .Y(carry[2]) );
endmodule


module CONV_DW_mult_tc_2 ( a, b, product );
  input [19:0] a;
  input [19:0] b;
  output [39:0] product;
  wire   n1, n6, n7, n9, n12, n13, n16, n18, n19, n22, n24, n25, n28, n30, n31,
         n34, n36, n37, n40, n42, n43, n46, n48, n49, n52, n54, n55, n58, n60,
         n61, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n104, n105, n106,
         n107, n108, n109, n110, n111, n113, n116, n117, n118, n119, n120,
         n126, n127, n128, n129, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n152, n153, n154, n155, n156, n157, n158, n159, n162, n163,
         n164, n165, n166, n168, n169, n170, n171, n172, n173, n174, n175,
         n178, n179, n180, n181, n182, n183, n184, n186, n187, n188, n189,
         n190, n191, n192, n193, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n217,
         n218, n219, n220, n221, n222, n225, n226, n227, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n270, n271, n272, n273, n274, n275, n276,
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
         n783, n784, n785, n786, n787, n788, n789, n790, n791, n792, n793,
         n794, n795, n796, n797, n798, n799, n800, n801, n802, n803, n804,
         n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826,
         n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837,
         n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848,
         n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859,
         n860, n861, n862, n863, n864, n865, n866, n867, n868, n869, n870,
         n871, n872, n873, n874, n875, n876, n877, n878, n879, n880, n881,
         n882, n883, n884, n885, n886, n887, n888, n889, n890, n891, n892,
         n893, n894, n895, n896, n897, n898, n899, n900, n901, n903, n904,
         n905, n906, n907, n908, n909, n910, n911, n912, n932, n933, n934,
         n935, n936, n937, n938, n939, n940, n941, n942, n1023, n1024, n1025,
         n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035,
         n1036, n1037, n1038;
  assign n1 = a[1];
  assign n7 = a[3];
  assign n13 = a[5];
  assign n19 = a[7];
  assign n25 = a[9];
  assign n31 = a[11];
  assign n37 = a[13];
  assign n43 = a[15];
  assign n49 = a[17];
  assign n55 = a[19];
  assign n61 = b[0];
  assign n886 = b[17];
  assign n887 = b[15];
  assign n888 = b[14];
  assign n889 = b[13];
  assign n890 = b[12];
  assign n891 = b[11];
  assign n892 = b[10];
  assign n893 = b[9];
  assign n894 = b[8];
  assign n895 = b[7];
  assign n896 = b[6];
  assign n897 = b[5];
  assign n898 = b[4];
  assign n899 = b[3];
  assign n900 = b[2];
  assign n901 = b[1];

  CLKXOR2X8 U70 ( .A(n98), .B(n66), .Y(product[35]) );
  AOI21X4 U73 ( .A0(n100), .A1(n94), .B0(n95), .Y(n93) );
  NAND2X8 U76 ( .A(n94), .B(n97), .Y(n66) );
  NOR2X8 U78 ( .A(n534), .B(n292), .Y(n96) );
  NAND2X8 U79 ( .A(n534), .B(n292), .Y(n97) );
  CLKXOR2X8 U80 ( .A(n107), .B(n67), .Y(product[34]) );
  NOR2X8 U82 ( .A(n119), .B(n101), .Y(n99) );
  OAI21X4 U83 ( .A0(n120), .A1(n101), .B0(n102), .Y(n100) );
  NAND2X8 U84 ( .A(n271), .B(n270), .Y(n101) );
  AOI21X4 U85 ( .A0(n270), .A1(n113), .B0(n104), .Y(n102) );
  NAND2X8 U88 ( .A(n270), .B(n106), .Y(n67) );
  CLKXOR2X8 U92 ( .A(n116), .B(n68), .Y(product[33]) );
  NOR2X8 U94 ( .A(n119), .B(n110), .Y(n108) );
  OAI21X4 U95 ( .A0(n120), .A1(n110), .B0(n111), .Y(n109) );
  NAND2X8 U100 ( .A(n271), .B(n111), .Y(n68) );
  NAND2X8 U112 ( .A(n273), .B(n272), .Y(n119) );
  AOI21X4 U113 ( .A0(n272), .A1(n131), .B0(n126), .Y(n120) );
  NAND2X8 U116 ( .A(n272), .B(n128), .Y(n69) );
  NOR2X8 U118 ( .A(n1032), .B(n296), .Y(n127) );
  NAND2X8 U119 ( .A(n1032), .B(n296), .Y(n128) );
  XNOR2X4 U120 ( .A(n134), .B(n70), .Y(product[31]) );
  AOI21X4 U121 ( .A0(n134), .A1(n273), .B0(n131), .Y(n129) );
  NAND2X8 U124 ( .A(n273), .B(n133), .Y(n70) );
  XNOR2X4 U128 ( .A(n144), .B(n71), .Y(product[30]) );
  AOI21X4 U130 ( .A0(n204), .A1(n136), .B0(n137), .Y(n135) );
  NOR2X8 U131 ( .A(n172), .B(n138), .Y(n136) );
  OAI21X4 U132 ( .A0(n173), .A1(n138), .B0(n139), .Y(n137) );
  AOI21X4 U134 ( .A0(n140), .A1(n157), .B0(n141), .Y(n139) );
  NOR2X8 U135 ( .A(n149), .B(n142), .Y(n140) );
  OAI21X4 U136 ( .A0(n142), .A1(n152), .B0(n143), .Y(n141) );
  NAND2X8 U137 ( .A(n274), .B(n143), .Y(n71) );
  NOR2X8 U139 ( .A(n1030), .B(n304), .Y(n142) );
  XNOR2X4 U141 ( .A(n153), .B(n72), .Y(product[29]) );
  NAND2X8 U143 ( .A(n147), .B(n174), .Y(n145) );
  AOI21X4 U144 ( .A0(n175), .A1(n147), .B0(n148), .Y(n146) );
  NOR2X8 U145 ( .A(n158), .B(n149), .Y(n147) );
  OAI21X4 U146 ( .A0(n159), .A1(n149), .B0(n152), .Y(n148) );
  NAND2X8 U149 ( .A(n275), .B(n152), .Y(n72) );
  NOR2X8 U151 ( .A(n583), .B(n309), .Y(n149) );
  NAND2X8 U152 ( .A(n583), .B(n309), .Y(n152) );
  XNOR2X4 U153 ( .A(n164), .B(n73), .Y(product[28]) );
  NAND2X8 U155 ( .A(n174), .B(n156), .Y(n154) );
  AOI21X4 U156 ( .A0(n175), .A1(n156), .B0(n157), .Y(n155) );
  NOR2X8 U161 ( .A(n169), .B(n162), .Y(n156) );
  OAI21X4 U162 ( .A0(n162), .A1(n170), .B0(n163), .Y(n157) );
  NAND2X8 U163 ( .A(n276), .B(n163), .Y(n73) );
  XNOR2X4 U167 ( .A(n171), .B(n74), .Y(product[27]) );
  NAND2X8 U169 ( .A(n174), .B(n277), .Y(n165) );
  AOI21X4 U170 ( .A0(n175), .A1(n277), .B0(n168), .Y(n166) );
  NAND2X8 U173 ( .A(n277), .B(n170), .Y(n74) );
  NOR2X8 U175 ( .A(n600), .B(n321), .Y(n169) );
  NAND2X8 U176 ( .A(n600), .B(n321), .Y(n170) );
  XNOR2X4 U177 ( .A(n182), .B(n75), .Y(product[26]) );
  NAND2X8 U183 ( .A(n192), .B(n178), .Y(n172) );
  AOI21X4 U184 ( .A0(n178), .A1(n193), .B0(n179), .Y(n173) );
  NOR2X8 U185 ( .A(n187), .B(n180), .Y(n178) );
  OAI21X4 U186 ( .A0(n180), .A1(n188), .B0(n181), .Y(n179) );
  NAND2X8 U187 ( .A(n278), .B(n181), .Y(n75) );
  XNOR2X4 U191 ( .A(n189), .B(n76), .Y(product[25]) );
  NAND2X8 U193 ( .A(n192), .B(n279), .Y(n183) );
  AOI21X4 U194 ( .A0(n193), .A1(n279), .B0(n186), .Y(n184) );
  NAND2X8 U197 ( .A(n279), .B(n188), .Y(n76) );
  NOR2X8 U199 ( .A(n617), .B(n335), .Y(n187) );
  NAND2X8 U200 ( .A(n617), .B(n335), .Y(n188) );
  XNOR2X4 U201 ( .A(n200), .B(n77), .Y(product[24]) );
  NOR2X8 U209 ( .A(n201), .B(n198), .Y(n192) );
  OAI21X4 U210 ( .A0(n198), .A1(n202), .B0(n199), .Y(n193) );
  NAND2X8 U211 ( .A(n280), .B(n199), .Y(n77) );
  NOR2X8 U213 ( .A(n618), .B(n343), .Y(n198) );
  NAND2X8 U214 ( .A(n618), .B(n343), .Y(n199) );
  NAND2X8 U217 ( .A(n281), .B(n202), .Y(n78) );
  NOR2X8 U219 ( .A(n635), .B(n353), .Y(n201) );
  NAND2X8 U220 ( .A(n635), .B(n353), .Y(n202) );
  CLKXOR2X8 U221 ( .A(n211), .B(n79), .Y(product[22]) );
  OAI21X4 U223 ( .A0(n233), .A1(n205), .B0(n206), .Y(n204) );
  NAND2X8 U224 ( .A(n219), .B(n207), .Y(n205) );
  AOI21X4 U225 ( .A0(n207), .A1(n220), .B0(n208), .Y(n206) );
  NOR2X8 U226 ( .A(n214), .B(n209), .Y(n207) );
  OAI21X4 U227 ( .A0(n209), .A1(n217), .B0(n210), .Y(n208) );
  NAND2X8 U228 ( .A(n282), .B(n210), .Y(n79) );
  NOR2X8 U230 ( .A(n636), .B(n362), .Y(n209) );
  NAND2X8 U231 ( .A(n636), .B(n362), .Y(n210) );
  CLKXOR2X8 U232 ( .A(n218), .B(n80), .Y(product[21]) );
  AOI21X4 U233 ( .A0(n232), .A1(n212), .B0(n213), .Y(n211) );
  NOR2X8 U234 ( .A(n221), .B(n214), .Y(n212) );
  OAI21X4 U235 ( .A0(n222), .A1(n214), .B0(n217), .Y(n213) );
  NAND2X8 U238 ( .A(n283), .B(n217), .Y(n80) );
  NOR2X8 U240 ( .A(n653), .B(n373), .Y(n214) );
  NAND2X8 U241 ( .A(n653), .B(n373), .Y(n217) );
  CLKXOR2X8 U242 ( .A(n227), .B(n81), .Y(product[20]) );
  AOI21X4 U243 ( .A0(n232), .A1(n219), .B0(n220), .Y(n218) );
  NOR2X8 U248 ( .A(n230), .B(n225), .Y(n219) );
  OAI21X4 U249 ( .A0(n225), .A1(n231), .B0(n226), .Y(n220) );
  NAND2X8 U250 ( .A(n284), .B(n226), .Y(n81) );
  NOR2X8 U252 ( .A(n654), .B(n384), .Y(n225) );
  NAND2X8 U253 ( .A(n654), .B(n384), .Y(n226) );
  XNOR2X4 U254 ( .A(n232), .B(n82), .Y(product[19]) );
  AOI21X4 U255 ( .A0(n232), .A1(n285), .B0(n229), .Y(n227) );
  NAND2X8 U258 ( .A(n285), .B(n231), .Y(n82) );
  NOR2X8 U260 ( .A(n671), .B(n397), .Y(n230) );
  NAND2X8 U261 ( .A(n671), .B(n397), .Y(n231) );
  XNOR2X4 U262 ( .A(n238), .B(n83), .Y(product[18]) );
  AOI21X4 U264 ( .A0(n234), .A1(n242), .B0(n235), .Y(n233) );
  NOR2X8 U265 ( .A(n239), .B(n236), .Y(n234) );
  OAI21X4 U266 ( .A0(n236), .A1(n240), .B0(n237), .Y(n235) );
  NAND2X8 U267 ( .A(n286), .B(n237), .Y(n83) );
  NOR2X8 U269 ( .A(n672), .B(n409), .Y(n236) );
  NAND2X8 U270 ( .A(n672), .B(n409), .Y(n237) );
  CLKXOR2X8 U271 ( .A(n241), .B(n84), .Y(product[17]) );
  OAI21X4 U272 ( .A0(n241), .A1(n239), .B0(n240), .Y(n238) );
  NAND2X8 U273 ( .A(n287), .B(n240), .Y(n84) );
  NOR2X8 U275 ( .A(n689), .B(n422), .Y(n239) );
  NAND2X8 U276 ( .A(n689), .B(n422), .Y(n240) );
  XNOR2X4 U277 ( .A(n85), .B(n245), .Y(product[16]) );
  OAI21X4 U279 ( .A0(n243), .A1(n64), .B0(n244), .Y(n242) );
  NAND2X8 U281 ( .A(n288), .B(n244), .Y(n85) );
  NOR2X8 U283 ( .A(n690), .B(n435), .Y(n243) );
  NAND2X8 U284 ( .A(n690), .B(n435), .Y(n244) );
  ADDFXL U294 ( .A(n515), .B(n516), .CI(n268), .CO(n254), .S(product[6]) );
  XNOR2X4 U296 ( .A(n260), .B(n86), .Y(product[5]) );
  NOR2X8 U298 ( .A(n258), .B(n261), .Y(n256) );
  OAI21X4 U299 ( .A0(n258), .A1(n262), .B0(n259), .Y(n257) );
  NAND2X8 U300 ( .A(n289), .B(n259), .Y(n86) );
  NOR2X8 U302 ( .A(n517), .B(n520), .Y(n258) );
  NAND2X8 U303 ( .A(n517), .B(n520), .Y(n259) );
  OAI21X4 U305 ( .A0(n65), .A1(n261), .B0(n262), .Y(n260) );
  NAND2X8 U307 ( .A(n290), .B(n262), .Y(n87) );
  NOR2X8 U309 ( .A(n521), .B(n702), .Y(n261) );
  NAND2X8 U310 ( .A(n521), .B(n702), .Y(n262) );
  ADDFXL U312 ( .A(n265), .B(n704), .CI(n688), .CO(n264), .S(product[2]) );
  NAND2X8 U315 ( .A(n291), .B(n267), .Y(n88) );
  NOR2X8 U317 ( .A(n705), .B(n533), .Y(n266) );
  NAND2X8 U318 ( .A(n705), .B(n533), .Y(n267) );
  ADDFHX4 U321 ( .A(n298), .B(n299), .CI(n300), .CO(n295), .S(n296) );
  CMPR42X2 U324 ( .A(n306), .B(n310), .C(n538), .D(n307), .ICI(n308), .S(n304), 
        .ICO(n302), .CO(n303) );
  CMPR42X2 U326 ( .A(n311), .B(n315), .C(n539), .D(n312), .ICI(n313), .S(n309), 
        .ICO(n307), .CO(n308) );
  CMPR42X2 U328 ( .A(n316), .B(n323), .C(n540), .D(n319), .ICI(n320), .S(n314), 
        .ICO(n312), .CO(n313) );
  ADDFHX4 U329 ( .A(n555), .B(n318), .CI(n322), .CO(n315), .S(n316) );
  CMPR42X2 U331 ( .A(n324), .B(n329), .C(n541), .D(n325), .ICI(n326), .S(n321), 
        .ICO(n319), .CO(n320) );
  CMPR42X2 U333 ( .A(n337), .B(n330), .C(n542), .D(n333), .ICI(n334), .S(n327), 
        .ICO(n325), .CO(n326) );
  CMPR42X2 U334 ( .A(n332), .B(n586), .C(n571), .D(n339), .ICI(n336), .S(n330), 
        .ICO(n328), .CO(n329) );
  CMPR42X2 U336 ( .A(n338), .B(n345), .C(n543), .D(n341), .ICI(n342), .S(n335), 
        .ICO(n333), .CO(n334) );
  CMPR42X2 U337 ( .A(n587), .B(n557), .C(n340), .D(n347), .ICI(n344), .S(n338), 
        .ICO(n336), .CO(n337) );
  CMPR42X2 U339 ( .A(n346), .B(n355), .C(n544), .D(n351), .ICI(n352), .S(n343), 
        .ICO(n341), .CO(n342) );
  CMPR42X2 U340 ( .A(n558), .B(n357), .C(n348), .D(n358), .ICI(n354), .S(n346), 
        .ICO(n344), .CO(n345) );
  CMPR42X2 U343 ( .A(n364), .B(n356), .C(n545), .D(n360), .ICI(n361), .S(n353), 
        .ICO(n351), .CO(n352) );
  CMPR42X2 U344 ( .A(n604), .B(n573), .C(n367), .D(n359), .ICI(n363), .S(n356), 
        .ICO(n354), .CO(n355) );
  CMPR42X2 U345 ( .A(n589), .B(n369), .C(n559), .D(n619), .ICI(n366), .S(n359), 
        .ICO(n357), .CO(n358) );
  CMPR42X2 U346 ( .A(n365), .B(n375), .C(n546), .D(n371), .ICI(n372), .S(n362), 
        .ICO(n360), .CO(n361) );
  CMPR42X2 U347 ( .A(n574), .B(n380), .C(n378), .D(n368), .ICI(n374), .S(n365), 
        .ICO(n363), .CO(n364) );
  CMPR42X2 U348 ( .A(n560), .B(n370), .C(n620), .D(n605), .ICI(n377), .S(n368), 
        .ICO(n366), .CO(n367) );
  CMPR42X2 U350 ( .A(n386), .B(n376), .C(n547), .D(n382), .ICI(n383), .S(n373), 
        .ICO(n371), .CO(n372) );
  CMPR42X2 U351 ( .A(n381), .B(n391), .C(n379), .D(n389), .ICI(n385), .S(n376), 
        .ICO(n374), .CO(n375) );
  CMPR42X2 U352 ( .A(n606), .B(n561), .C(n621), .D(n590), .ICI(n388), .S(n379), 
        .ICO(n377), .CO(n378) );
  CMPR42X2 U354 ( .A(n399), .B(n387), .C(n548), .D(n395), .ICI(n396), .S(n384), 
        .ICO(n382), .CO(n383) );
  CMPR42X2 U355 ( .A(n392), .B(n405), .C(n402), .D(n390), .ICI(n398), .S(n387), 
        .ICO(n385), .CO(n386) );
  CMPR42X2 U356 ( .A(n622), .B(n562), .C(n591), .D(n404), .ICI(n401), .S(n390), 
        .ICO(n388), .CO(n389) );
  ADDFHX4 U357 ( .A(n576), .B(n394), .CI(n638), .CO(n391), .S(n392) );
  CMPR42X2 U359 ( .A(n407), .B(n400), .C(n408), .D(n524), .ICI(n549), .S(n397), 
        .ICO(n395), .CO(n396) );
  CMPR42X2 U360 ( .A(n410), .B(n406), .C(n414), .D(n403), .ICI(n411), .S(n400), 
        .ICO(n398), .CO(n399) );
  CMPR42X2 U361 ( .A(n623), .B(n639), .C(n563), .D(n607), .ICI(n413), .S(n403), 
        .ICO(n401), .CO(n402) );
  CMPR42X2 U362 ( .A(n592), .B(n577), .C(n655), .D(n418), .ICI(n416), .S(n406), 
        .ICO(n404), .CO(n405) );
  CMPR42X2 U363 ( .A(n415), .B(n424), .C(n412), .D(n420), .ICI(n421), .S(n409), 
        .ICO(n407), .CO(n408) );
  CMPR42X2 U364 ( .A(n640), .B(n429), .C(n417), .D(n426), .ICI(n427), .S(n412), 
        .ICO(n410), .CO(n411) );
  CMPR42X2 U365 ( .A(n431), .B(n578), .C(n419), .D(n608), .ICI(n423), .S(n415), 
        .ICO(n413), .CO(n414) );
  ADDFHX4 U366 ( .A(n624), .B(n564), .CI(n656), .CO(n416), .S(n417) );
  XNOR2X4 U367 ( .A(n593), .B(n550), .Y(n419) );
  OR2X8 U368 ( .A(n593), .B(n550), .Y(n418) );
  CMPR42X2 U369 ( .A(n428), .B(n437), .C(n425), .D(n433), .ICI(n434), .S(n422), 
        .ICO(n420), .CO(n421) );
  CMPR42X2 U370 ( .A(n442), .B(n432), .C(n430), .D(n436), .ICI(n440), .S(n425), 
        .ICO(n423), .CO(n424) );
  CMPR42X2 U371 ( .A(n565), .B(n657), .C(n579), .D(n625), .ICI(n439), .S(n428), 
        .ICO(n426), .CO(n427) );
  XNOR2X4 U373 ( .A(n594), .B(n641), .Y(n432) );
  OR2X8 U374 ( .A(n594), .B(n641), .Y(n431) );
  CMPR42X2 U375 ( .A(n448), .B(n441), .C(n438), .D(n444), .ICI(n445), .S(n435), 
        .ICO(n433), .CO(n434) );
  CMPR42X2 U376 ( .A(n453), .B(n626), .C(n443), .D(n450), .ICI(n451), .S(n438), 
        .ICO(n436), .CO(n437) );
  CMPR42X2 U377 ( .A(n610), .B(n674), .C(n658), .D(n595), .ICI(n447), .S(n441), 
        .ICO(n439), .CO(n440) );
  ADDFHX4 U378 ( .A(n566), .B(n642), .CI(n580), .CO(n442), .S(n443) );
  CMPR42X2 U379 ( .A(n462), .B(n452), .C(n459), .D(n449), .ICI(n455), .S(n446), 
        .ICO(n444), .CO(n445) );
  CMPR42X2 U380 ( .A(n611), .B(n675), .C(n454), .D(n643), .ICI(n461), .S(n449), 
        .ICO(n447), .CO(n448) );
  CMPR42X2 U381 ( .A(n581), .B(n659), .C(n691), .D(n596), .ICI(n458), .S(n452), 
        .ICO(n450), .CO(n451) );
  CMPR42X2 U383 ( .A(n676), .B(n463), .C(n468), .D(n460), .ICI(n464), .S(n457), 
        .ICO(n455), .CO(n456) );
  CMPR42X2 U384 ( .A(n692), .B(n472), .C(n612), .D(n644), .ICI(n467), .S(n460), 
        .ICO(n458), .CO(n459) );
  CMPR42X2 U385 ( .A(n582), .B(n597), .C(n660), .D(n628), .ICI(n470), .S(n463), 
        .ICO(n461), .CO(n462) );
  CMPR42X2 U386 ( .A(n480), .B(n471), .C(n478), .D(n469), .ICI(n474), .S(n466), 
        .ICO(n464), .CO(n465) );
  CMPR42X2 U387 ( .A(n473), .B(n693), .C(n613), .D(n661), .ICI(n477), .S(n469), 
        .ICO(n467), .CO(n468) );
  ADDFHX4 U388 ( .A(n645), .B(n598), .CI(n629), .CO(n470), .S(n471) );
  CMPR22X4 U389 ( .A(n677), .B(n527), .CO(n472), .S(n473) );
  CMPR42X2 U390 ( .A(n481), .B(n662), .C(n486), .D(n482), .ICI(n479), .S(n476), 
        .ICO(n474), .CO(n475) );
  CMPR42X2 U391 ( .A(n614), .B(n488), .C(n694), .D(n630), .ICI(n485), .S(n479), 
        .ICO(n477), .CO(n478) );
  ADDFHX4 U392 ( .A(n678), .B(n599), .CI(n646), .CO(n480), .S(n481) );
  CMPR42X2 U393 ( .A(n663), .B(n679), .C(n494), .D(n490), .ICI(n487), .S(n484), 
        .ICO(n482), .CO(n483) );
  CMPR42X2 U394 ( .A(n528), .B(n615), .C(n489), .D(n631), .ICI(n493), .S(n487), 
        .ICO(n485), .CO(n486) );
  CMPR22X4 U395 ( .A(n695), .B(n647), .CO(n488), .S(n489) );
  CMPR42X2 U396 ( .A(n648), .B(n680), .C(n499), .D(n496), .ICI(n495), .S(n492), 
        .ICO(n490), .CO(n491) );
  CMPR42X2 U397 ( .A(n616), .B(n696), .C(n664), .D(n632), .ICI(n501), .S(n495), 
        .ICO(n493), .CO(n494) );
  CMPR42X2 U398 ( .A(n506), .B(n649), .C(n697), .D(n500), .ICI(n503), .S(n498), 
        .ICO(n496), .CO(n497) );
  ADDFHX4 U399 ( .A(n633), .B(n529), .CI(n502), .CO(n499), .S(n500) );
  CMPR22X4 U400 ( .A(n681), .B(n665), .CO(n501), .S(n502) );
  CMPR42X2 U401 ( .A(n511), .B(n666), .C(n507), .D(n698), .ICI(n508), .S(n505), 
        .ICO(n503), .CO(n504) );
  ADDFHX4 U402 ( .A(n682), .B(n634), .CI(n650), .CO(n506), .S(n507) );
  CMPR42X2 U403 ( .A(n651), .B(n530), .C(n512), .D(n667), .ICI(n513), .S(n510), 
        .ICO(n508), .CO(n509) );
  CMPR22X4 U404 ( .A(n699), .B(n683), .CO(n511), .S(n512) );
  CMPR42X2 U405 ( .A(n700), .B(n652), .C(n668), .D(n518), .ICI(n684), .S(n515), 
        .ICO(n513), .CO(n514) );
  ADDFHX4 U406 ( .A(n669), .B(n519), .CI(n685), .CO(n516), .S(n517) );
  CMPR22X4 U407 ( .A(n701), .B(n531), .CO(n518), .S(n519) );
  ADDFHX4 U408 ( .A(n670), .B(n686), .CI(n522), .CO(n520), .S(n521) );
  CMPR22X4 U409 ( .A(n532), .B(n687), .CO(n522), .S(n523) );
  XNOR2X4 U430 ( .A(n55), .B(n887), .Y(n707) );
  XNOR2X4 U431 ( .A(n55), .B(n888), .Y(n708) );
  XNOR2X4 U432 ( .A(n55), .B(n889), .Y(n709) );
  XNOR2X4 U433 ( .A(n55), .B(n890), .Y(n710) );
  XNOR2X4 U434 ( .A(n55), .B(n891), .Y(n711) );
  XNOR2X4 U435 ( .A(n55), .B(n892), .Y(n712) );
  XNOR2X4 U436 ( .A(n55), .B(n893), .Y(n713) );
  XNOR2X4 U437 ( .A(n55), .B(n894), .Y(n714) );
  XNOR2X4 U438 ( .A(n55), .B(n895), .Y(n715) );
  XNOR2X4 U439 ( .A(n55), .B(n896), .Y(n716) );
  XNOR2X4 U445 ( .A(n55), .B(n61), .Y(n722) );
  NAND2BX4 U446 ( .AN(n61), .B(n55), .Y(n723) );
  OAI22X4 U521 ( .A0(n42), .A1(n936), .B0(n1037), .B1(n777), .Y(n527) );
  OAI22X4 U525 ( .A0(n763), .A1(n42), .B0(n762), .B1(n1037), .Y(n586) );
  OAI22X4 U526 ( .A0(n764), .A1(n42), .B0(n763), .B1(n1037), .Y(n587) );
  OAI22X4 U534 ( .A0(n42), .A1(n772), .B0(n1037), .B1(n771), .Y(n594) );
  OAI22X4 U535 ( .A0(n773), .A1(n42), .B0(n1037), .B1(n772), .Y(n595) );
  OAI22X4 U536 ( .A0(n773), .A1(n1037), .B0(n42), .B1(n774), .Y(n596) );
  NOR2BX4 U539 ( .AN(n61), .B(n1037), .Y(n599) );
  OAI22X4 U595 ( .A0(n30), .A1(n938), .B0(n1036), .B1(n813), .Y(n529) );
  AO21X4 U596 ( .A0(n30), .A1(n1036), .B0(n796), .Y(n617) );
  OAI22X4 U602 ( .A0(n30), .A1(n802), .B0(n1036), .B1(n801), .Y(n623) );
  NOR2BX4 U613 ( .AN(n61), .B(n1036), .Y(n634) );
  AO21X4 U633 ( .A0(n24), .A1(n1033), .B0(n814), .Y(n635) );
  OAI22X4 U634 ( .A0(n814), .A1(n1033), .B0(n24), .B1(n815), .Y(n636) );
  OAI22X4 U635 ( .A0(n816), .A1(n24), .B0(n1033), .B1(n815), .Y(n637) );
  OAI22X4 U636 ( .A0(n817), .A1(n24), .B0(n816), .B1(n1033), .Y(n638) );
  OAI22X4 U637 ( .A0(n818), .A1(n24), .B0(n817), .B1(n1033), .Y(n639) );
  OAI22X4 U638 ( .A0(n818), .A1(n1033), .B0(n24), .B1(n819), .Y(n640) );
  OAI22X4 U639 ( .A0(n24), .A1(n820), .B0(n1033), .B1(n819), .Y(n641) );
  OAI22X4 U641 ( .A0(n822), .A1(n24), .B0(n1033), .B1(n821), .Y(n643) );
  OAI22X4 U642 ( .A0(n822), .A1(n1033), .B0(n24), .B1(n823), .Y(n644) );
  OAI22X4 U643 ( .A0(n24), .A1(n824), .B0(n1033), .B1(n823), .Y(n645) );
  OAI22X4 U644 ( .A0(n24), .A1(n825), .B0(n1033), .B1(n824), .Y(n646) );
  OAI22X4 U645 ( .A0(n24), .A1(n826), .B0(n1033), .B1(n825), .Y(n647) );
  OAI22X4 U646 ( .A0(n827), .A1(n24), .B0(n1033), .B1(n826), .Y(n648) );
  OAI22X4 U647 ( .A0(n827), .A1(n1033), .B0(n24), .B1(n828), .Y(n649) );
  OAI22X4 U649 ( .A0(n24), .A1(n830), .B0(n1033), .B1(n829), .Y(n651) );
  XNOR2X4 U688 ( .A(n886), .B(n13), .Y(n832) );
  XNOR2X4 U689 ( .A(n13), .B(n887), .Y(n833) );
  XNOR2X4 U690 ( .A(n888), .B(n13), .Y(n834) );
  XNOR2X4 U691 ( .A(n889), .B(n13), .Y(n835) );
  XNOR2X4 U692 ( .A(n890), .B(n13), .Y(n836) );
  XNOR2X4 U694 ( .A(n13), .B(n892), .Y(n838) );
  XNOR2X4 U695 ( .A(n13), .B(n893), .Y(n839) );
  XNOR2X4 U696 ( .A(n894), .B(n13), .Y(n840) );
  XNOR2X4 U697 ( .A(n13), .B(n895), .Y(n841) );
  XNOR2X4 U698 ( .A(n13), .B(n896), .Y(n842) );
  XNOR2X4 U699 ( .A(n13), .B(n897), .Y(n843) );
  XNOR2X4 U700 ( .A(n13), .B(n898), .Y(n844) );
  OAI22X4 U706 ( .A0(n12), .A1(n941), .B0(n1035), .B1(n867), .Y(n532) );
  AO21X4 U707 ( .A0(n12), .A1(n1035), .B0(n850), .Y(n671) );
  OAI22X4 U708 ( .A0(n850), .A1(n1035), .B0(n12), .B1(n851), .Y(n672) );
  OAI22X4 U709 ( .A0(n852), .A1(n12), .B0(n1035), .B1(n851), .Y(n673) );
  OAI22X4 U710 ( .A0(n853), .A1(n12), .B0(n852), .B1(n1035), .Y(n674) );
  OAI22X4 U711 ( .A0(n854), .A1(n12), .B0(n853), .B1(n1035), .Y(n675) );
  OAI22X4 U712 ( .A0(n854), .A1(n1035), .B0(n12), .B1(n855), .Y(n676) );
  OAI22X4 U713 ( .A0(n12), .A1(n856), .B0(n1035), .B1(n855), .Y(n677) );
  OAI22X4 U714 ( .A0(n12), .A1(n857), .B0(n1035), .B1(n856), .Y(n678) );
  OAI22X4 U715 ( .A0(n858), .A1(n12), .B0(n1035), .B1(n857), .Y(n679) );
  OAI22X4 U716 ( .A0(n858), .A1(n1035), .B0(n12), .B1(n859), .Y(n680) );
  OAI22X4 U717 ( .A0(n12), .A1(n860), .B0(n1035), .B1(n859), .Y(n681) );
  OAI22X4 U718 ( .A0(n12), .A1(n861), .B0(n1035), .B1(n860), .Y(n682) );
  OAI22X4 U719 ( .A0(n12), .A1(n862), .B0(n1035), .B1(n861), .Y(n683) );
  OAI22X4 U720 ( .A0(n863), .A1(n12), .B0(n1035), .B1(n862), .Y(n684) );
  OAI22X4 U721 ( .A0(n863), .A1(n1035), .B0(n12), .B1(n864), .Y(n685) );
  OAI22X4 U722 ( .A0(n12), .A1(n865), .B0(n1035), .B1(n864), .Y(n686) );
  OAI22X4 U723 ( .A0(n12), .A1(n866), .B0(n1035), .B1(n865), .Y(n687) );
  NOR2BX4 U724 ( .AN(n61), .B(n1035), .Y(n688) );
  OAI22X4 U743 ( .A0(n6), .A1(n942), .B0(n885), .B1(n932), .Y(n533) );
  AO21X4 U744 ( .A0(n6), .A1(n932), .B0(n868), .Y(n689) );
  OAI22X4 U745 ( .A0(n868), .A1(n932), .B0(n869), .B1(n6), .Y(n690) );
  OAI22X4 U746 ( .A0(n870), .A1(n6), .B0(n869), .B1(n932), .Y(n691) );
  OAI22X4 U747 ( .A0(n871), .A1(n6), .B0(n870), .B1(n932), .Y(n692) );
  OAI22X4 U748 ( .A0(n872), .A1(n6), .B0(n871), .B1(n932), .Y(n693) );
  OAI22X4 U749 ( .A0(n872), .A1(n932), .B0(n873), .B1(n6), .Y(n694) );
  OAI22X4 U750 ( .A0(n873), .A1(n932), .B0(n6), .B1(n874), .Y(n695) );
  OAI22X4 U751 ( .A0(n6), .A1(n875), .B0(n874), .B1(n932), .Y(n696) );
  OAI22X4 U752 ( .A0(n876), .A1(n6), .B0(n875), .B1(n932), .Y(n697) );
  OAI22X4 U753 ( .A0(n876), .A1(n932), .B0(n6), .B1(n877), .Y(n698) );
  OAI22X4 U754 ( .A0(n6), .A1(n878), .B0(n877), .B1(n932), .Y(n699) );
  OAI22X4 U755 ( .A0(n6), .A1(n879), .B0(n878), .B1(n932), .Y(n700) );
  OAI22X4 U756 ( .A0(n880), .A1(n6), .B0(n879), .B1(n932), .Y(n701) );
  OAI22X4 U757 ( .A0(n881), .A1(n6), .B0(n880), .B1(n932), .Y(n702) );
  OAI22X4 U758 ( .A0(n881), .A1(n932), .B0(n6), .B1(n882), .Y(n703) );
  OAI22X4 U759 ( .A0(n6), .A1(n883), .B0(n882), .B1(n932), .Y(n704) );
  OAI22X4 U760 ( .A0(n6), .A1(n884), .B0(n883), .B1(n932), .Y(n705) );
  NOR2BX4 U761 ( .AN(n61), .B(n932), .Y(product[0]) );
  XNOR2X4 U808 ( .A(n49), .B(a[18]), .Y(n58) );
  NAND2X8 U809 ( .A(n904), .B(n52), .Y(n54) );
  XNOR2X4 U811 ( .A(n43), .B(a[16]), .Y(n52) );
  NAND2X8 U812 ( .A(n905), .B(n46), .Y(n48) );
  XNOR2X4 U814 ( .A(a[14]), .B(n37), .Y(n46) );
  NAND2X8 U815 ( .A(n1037), .B(n906), .Y(n42) );
  NAND2X8 U818 ( .A(n907), .B(n34), .Y(n36) );
  XNOR2X4 U820 ( .A(a[10]), .B(n25), .Y(n34) );
  NAND2X8 U821 ( .A(n908), .B(n1036), .Y(n30) );
  NAND2X8 U824 ( .A(n1033), .B(n909), .Y(n24) );
  XNOR2X4 U829 ( .A(n7), .B(a[4]), .Y(n16) );
  NAND2X8 U830 ( .A(n911), .B(n1035), .Y(n12) );
  NAND2X8 U833 ( .A(n912), .B(n932), .Y(n6) );
  XNOR2X1 U838 ( .A(n49), .B(n900), .Y(n738) );
  OAI22XL U839 ( .A0(n30), .A1(n806), .B0(n1036), .B1(n805), .Y(n627) );
  XNOR2X1 U840 ( .A(n25), .B(n895), .Y(n805) );
  OAI22X1 U841 ( .A0(n42), .A1(n771), .B0(n1037), .B1(n770), .Y(n593) );
  XNOR2X1 U842 ( .A(n37), .B(n896), .Y(n770) );
  OAI22XL U843 ( .A0(n30), .A1(n803), .B0(n1036), .B1(n802), .Y(n624) );
  XNOR2X1 U844 ( .A(n25), .B(n893), .Y(n803) );
  CMPR42X1 U845 ( .A(n553), .B(n305), .C(n537), .D(n302), .ICI(n303), .S(n301), 
        .ICO(n299), .CO(n300) );
  INVXL U846 ( .A(n305), .Y(n306) );
  CMPR42X1 U847 ( .A(n556), .B(n331), .C(n585), .D(n570), .ICI(n328), .S(n324), 
        .ICO(n322), .CO(n323) );
  INVXL U848 ( .A(n331), .Y(n332) );
  XNOR2X1 U849 ( .A(n37), .B(n900), .Y(n774) );
  XNOR2X1 U850 ( .A(n31), .B(n900), .Y(n792) );
  XNOR2X1 U851 ( .A(n13), .B(n891), .Y(n837) );
  XNOR2X1 U852 ( .A(n891), .B(n25), .Y(n801) );
  XNOR2X1 U853 ( .A(n31), .B(n887), .Y(n779) );
  XNOR2XL U854 ( .A(n889), .B(n31), .Y(n781) );
  XNOR2XL U855 ( .A(n888), .B(n31), .Y(n780) );
  XNOR2XL U856 ( .A(n890), .B(n31), .Y(n782) );
  INVXL U857 ( .A(n31), .Y(n937) );
  NAND2BXL U858 ( .AN(n61), .B(n31), .Y(n795) );
  XNOR2XL U859 ( .A(n31), .B(n61), .Y(n794) );
  XNOR2XL U860 ( .A(n31), .B(n891), .Y(n783) );
  XNOR2XL U861 ( .A(n894), .B(n31), .Y(n786) );
  XNOR2X1 U862 ( .A(n31), .B(n901), .Y(n793) );
  XNOR2X1 U863 ( .A(n899), .B(n31), .Y(n791) );
  XNOR2X1 U864 ( .A(n31), .B(n893), .Y(n785) );
  XNOR2X1 U865 ( .A(n31), .B(n898), .Y(n790) );
  XNOR2X1 U866 ( .A(n31), .B(n896), .Y(n788) );
  XNOR2X1 U867 ( .A(n31), .B(n897), .Y(n789) );
  XNOR2X1 U868 ( .A(n31), .B(n892), .Y(n784) );
  XNOR2X1 U869 ( .A(n31), .B(n895), .Y(n787) );
  XOR2X1 U870 ( .A(n31), .B(a[10]), .Y(n907) );
  XNOR2X1 U871 ( .A(n886), .B(n1), .Y(n868) );
  XNOR2X1 U872 ( .A(n1), .B(n893), .Y(n875) );
  XNOR2X1 U873 ( .A(n894), .B(n1), .Y(n876) );
  XNOR2X1 U874 ( .A(n1), .B(n892), .Y(n874) );
  XNOR2X1 U875 ( .A(n890), .B(n1), .Y(n872) );
  XNOR2X1 U876 ( .A(n891), .B(n1), .Y(n873) );
  XNOR2X1 U877 ( .A(n1), .B(n895), .Y(n877) );
  XNOR2X1 U878 ( .A(n889), .B(n1), .Y(n871) );
  XNOR2X1 U879 ( .A(n887), .B(n1), .Y(n869) );
  XNOR2X1 U880 ( .A(n888), .B(n1), .Y(n870) );
  XNOR2X1 U881 ( .A(n899), .B(n1), .Y(n881) );
  XNOR2X1 U882 ( .A(n1), .B(n896), .Y(n878) );
  XNOR2X1 U883 ( .A(n897), .B(n1), .Y(n879) );
  XNOR2X1 U884 ( .A(n898), .B(n1), .Y(n880) );
  INVXL U885 ( .A(n1), .Y(n942) );
  NAND2BX1 U886 ( .AN(n61), .B(n1), .Y(n885) );
  XNOR2X1 U887 ( .A(n1), .B(n900), .Y(n882) );
  XOR2X1 U888 ( .A(a[0]), .B(n1), .Y(n912) );
  XNOR2X1 U889 ( .A(n886), .B(n19), .Y(n814) );
  XNOR2X1 U890 ( .A(n888), .B(n19), .Y(n816) );
  XNOR2X1 U891 ( .A(n887), .B(n19), .Y(n815) );
  XNOR2X1 U892 ( .A(n899), .B(n19), .Y(n827) );
  XNOR2X1 U893 ( .A(n889), .B(n19), .Y(n817) );
  XNOR2X1 U894 ( .A(n890), .B(n19), .Y(n818) );
  NAND2BXL U895 ( .AN(n61), .B(n19), .Y(n831) );
  INVXL U896 ( .A(n19), .Y(n939) );
  XNOR2X1 U897 ( .A(n894), .B(n19), .Y(n822) );
  XNOR2XL U898 ( .A(n19), .B(n61), .Y(n830) );
  XNOR2X1 U899 ( .A(n891), .B(n19), .Y(n819) );
  XNOR2X1 U900 ( .A(n19), .B(n901), .Y(n829) );
  XNOR2X1 U901 ( .A(n897), .B(n19), .Y(n825) );
  XNOR2X1 U902 ( .A(n898), .B(n19), .Y(n826) );
  XNOR2X1 U903 ( .A(n19), .B(n900), .Y(n828) );
  XNOR2X1 U904 ( .A(n19), .B(n896), .Y(n824) );
  XNOR2X1 U905 ( .A(n19), .B(n895), .Y(n823) );
  XNOR2X1 U906 ( .A(n19), .B(n893), .Y(n821) );
  XNOR2X1 U907 ( .A(n19), .B(n892), .Y(n820) );
  XOR2X1 U908 ( .A(a[6]), .B(n19), .Y(n909) );
  XNOR2X1 U909 ( .A(n886), .B(n7), .Y(n850) );
  XNOR2X1 U910 ( .A(n7), .B(n893), .Y(n857) );
  XNOR2X1 U911 ( .A(n894), .B(n7), .Y(n858) );
  XNOR2X1 U912 ( .A(n7), .B(n895), .Y(n859) );
  XNOR2X1 U913 ( .A(n7), .B(n896), .Y(n860) );
  XNOR2X1 U914 ( .A(n889), .B(n7), .Y(n853) );
  XNOR2X1 U915 ( .A(n890), .B(n7), .Y(n854) );
  XNOR2X1 U916 ( .A(n7), .B(n897), .Y(n861) );
  XNOR2X1 U917 ( .A(n888), .B(n7), .Y(n852) );
  XNOR2X1 U918 ( .A(n887), .B(n7), .Y(n851) );
  XNOR2X1 U919 ( .A(n898), .B(n7), .Y(n862) );
  XNOR2X1 U920 ( .A(n7), .B(n892), .Y(n856) );
  XNOR2X1 U921 ( .A(n891), .B(n7), .Y(n855) );
  NAND2BXL U922 ( .AN(n61), .B(n7), .Y(n867) );
  INVXL U923 ( .A(n7), .Y(n941) );
  XNOR2X1 U924 ( .A(n899), .B(n7), .Y(n863) );
  XNOR2XL U925 ( .A(n7), .B(n61), .Y(n866) );
  XNOR2X1 U926 ( .A(n7), .B(n900), .Y(n864) );
  XNOR2X1 U927 ( .A(n7), .B(n901), .Y(n865) );
  XOR2X1 U928 ( .A(a[2]), .B(n7), .Y(n911) );
  XNOR2X1 U929 ( .A(n1), .B(n901), .Y(n883) );
  INVXL U930 ( .A(n720), .Y(n1023) );
  INVXL U931 ( .A(n1023), .Y(n1024) );
  INVXL U932 ( .A(n721), .Y(n1025) );
  INVXL U933 ( .A(n1025), .Y(n1026) );
  INVXL U934 ( .A(n739), .Y(n1027) );
  INVXL U935 ( .A(n1027), .Y(n1028) );
  XNOR2X1 U936 ( .A(n43), .B(n893), .Y(n749) );
  ADDFXL U937 ( .A(n350), .B(n603), .CI(n588), .CO(n347), .S(n348) );
  OAI22X1 U938 ( .A0(n781), .A1(n36), .B0(n780), .B1(n34), .Y(n603) );
  OAI22XL U939 ( .A0(n48), .A1(n758), .B0(n46), .B1(n757), .Y(n581) );
  OAI22XL U940 ( .A0(n48), .A1(n757), .B0(n46), .B1(n756), .Y(n580) );
  OAI22X1 U941 ( .A0(n796), .A1(n1036), .B0(n30), .B1(n797), .Y(n618) );
  XNOR2X1 U942 ( .A(n887), .B(n25), .Y(n797) );
  ADDFX2 U943 ( .A(n297), .B(n536), .CI(n295), .CO(n292), .S(n294) );
  CLKINVX1 U944 ( .A(n297), .Y(n298) );
  OAI22X1 U945 ( .A0(n60), .A1(n709), .B0(n708), .B1(n58), .Y(n297) );
  OAI22XL U946 ( .A0(n42), .A1(n770), .B0(n1037), .B1(n769), .Y(n592) );
  OAI22XL U947 ( .A0(n768), .A1(n1037), .B0(n42), .B1(n769), .Y(n591) );
  XNOR2X1 U948 ( .A(n37), .B(n895), .Y(n769) );
  OAI22XL U949 ( .A0(n762), .A1(n42), .B0(n1037), .B1(n761), .Y(n585) );
  XNOR2X1 U950 ( .A(n887), .B(n37), .Y(n761) );
  OAI22XL U951 ( .A0(n30), .A1(n812), .B0(n1036), .B1(n811), .Y(n633) );
  OAI22XL U952 ( .A0(n30), .A1(n811), .B0(n1036), .B1(n810), .Y(n632) );
  XNOR2X1 U953 ( .A(n25), .B(n901), .Y(n811) );
  OAI22X1 U954 ( .A0(n42), .A1(n776), .B0(n1037), .B1(n775), .Y(n598) );
  OAI22XL U955 ( .A0(n42), .A1(n775), .B0(n1037), .B1(n774), .Y(n597) );
  XNOR2X1 U956 ( .A(n37), .B(n901), .Y(n775) );
  OAI22XL U957 ( .A0(n30), .A1(n808), .B0(n1036), .B1(n807), .Y(n629) );
  OAI22XL U958 ( .A0(n30), .A1(n807), .B0(n1036), .B1(n806), .Y(n628) );
  XNOR2X1 U959 ( .A(n897), .B(n25), .Y(n807) );
  OAI22XL U960 ( .A0(n768), .A1(n42), .B0(n1037), .B1(n767), .Y(n590) );
  OAI22X1 U961 ( .A0(n42), .A1(n767), .B0(n1037), .B1(n766), .Y(n369) );
  XNOR2X1 U962 ( .A(n37), .B(n893), .Y(n767) );
  XNOR2X1 U963 ( .A(n897), .B(n37), .Y(n771) );
  XNOR2X1 U964 ( .A(n25), .B(n892), .Y(n802) );
  XNOR2X1 U965 ( .A(n25), .B(n896), .Y(n806) );
  OAI22XL U966 ( .A0(n764), .A1(n1037), .B0(n42), .B1(n765), .Y(n588) );
  OAI22XL U967 ( .A0(n42), .A1(n766), .B0(n1037), .B1(n765), .Y(n589) );
  XNOR2X1 U968 ( .A(n891), .B(n37), .Y(n765) );
  XNOR2X1 U969 ( .A(n898), .B(n37), .Y(n772) );
  XNOR2X1 U970 ( .A(n886), .B(n25), .Y(n796) );
  AO21X1 U971 ( .A0(n42), .A1(n1037), .B0(n760), .Y(n583) );
  OAI22X1 U972 ( .A0(n760), .A1(n1037), .B0(n42), .B1(n761), .Y(n584) );
  XNOR2X1 U973 ( .A(n886), .B(n37), .Y(n760) );
  ADDFXL U974 ( .A(n393), .B(n575), .CI(n637), .CO(n380), .S(n381) );
  CLKINVX1 U975 ( .A(n393), .Y(n394) );
  ADDFXL U976 ( .A(n349), .B(n572), .CI(n602), .CO(n339), .S(n340) );
  CLKINVX1 U977 ( .A(n349), .Y(n350) );
  OAI22XL U978 ( .A0(n799), .A1(n30), .B0(n798), .B1(n1036), .Y(n620) );
  OAI22XL U979 ( .A0(n798), .A1(n30), .B0(n1036), .B1(n797), .Y(n619) );
  XNOR2X1 U980 ( .A(n888), .B(n25), .Y(n798) );
  XNOR2X1 U981 ( .A(n888), .B(n37), .Y(n762) );
  XNOR2X1 U982 ( .A(n889), .B(n37), .Y(n763) );
  OAI22XL U983 ( .A0(n809), .A1(n1036), .B0(n30), .B1(n810), .Y(n631) );
  OAI22XL U984 ( .A0(n809), .A1(n30), .B0(n1036), .B1(n808), .Y(n630) );
  XNOR2X1 U985 ( .A(n899), .B(n25), .Y(n809) );
  OAI22XL U986 ( .A0(n800), .A1(n1036), .B0(n30), .B1(n801), .Y(n622) );
  OAI22XL U987 ( .A0(n800), .A1(n30), .B0(n799), .B1(n1036), .Y(n621) );
  XNOR2X1 U988 ( .A(n890), .B(n25), .Y(n800) );
  OAI22XL U989 ( .A0(n804), .A1(n1036), .B0(n30), .B1(n805), .Y(n626) );
  OAI22XL U990 ( .A0(n804), .A1(n30), .B0(n1036), .B1(n803), .Y(n625) );
  XNOR2X1 U991 ( .A(n894), .B(n25), .Y(n804) );
  XNOR2X1 U992 ( .A(n890), .B(n37), .Y(n764) );
  XNOR2X1 U993 ( .A(n894), .B(n37), .Y(n768) );
  XNOR2X1 U994 ( .A(n899), .B(n37), .Y(n773) );
  INVXL U995 ( .A(n568), .Y(n1029) );
  CLKINVX1 U996 ( .A(n1029), .Y(n1030) );
  ADDFXL U997 ( .A(n569), .B(n317), .CI(n554), .CO(n310), .S(n311) );
  CLKINVX1 U998 ( .A(n317), .Y(n318) );
  NAND2X1 U999 ( .A(n535), .B(n293), .Y(n106) );
  NOR2X1 U1000 ( .A(n535), .B(n293), .Y(n105) );
  INVXL U1001 ( .A(n552), .Y(n1031) );
  CLKINVX1 U1002 ( .A(n1031), .Y(n1032) );
  NAND2X1 U1003 ( .A(n601), .B(n327), .Y(n181) );
  NOR2X2 U1004 ( .A(n601), .B(n327), .Y(n180) );
  AO21X1 U1005 ( .A0(n60), .A1(n58), .B0(n706), .Y(n534) );
  XNOR2XL U1006 ( .A(n886), .B(n55), .Y(n706) );
  NAND2X1 U1007 ( .A(n551), .B(n294), .Y(n111) );
  NOR2X2 U1008 ( .A(n551), .B(n294), .Y(n110) );
  AO21X1 U1009 ( .A0(n36), .A1(n34), .B0(n778), .Y(n600) );
  XNOR2XL U1010 ( .A(n886), .B(n31), .Y(n778) );
  NOR2X1 U1011 ( .A(n567), .B(n301), .Y(n132) );
  NAND2X1 U1012 ( .A(n567), .B(n301), .Y(n133) );
  XNOR2XL U1013 ( .A(n43), .B(n901), .Y(n757) );
  XNOR2XL U1014 ( .A(n49), .B(n901), .Y(n739) );
  XOR2X1 U1015 ( .A(n49), .B(a[16]), .Y(n904) );
  XNOR2XL U1016 ( .A(n49), .B(n898), .Y(n736) );
  XNOR2XL U1017 ( .A(n55), .B(n900), .Y(n720) );
  XNOR2XL U1018 ( .A(n55), .B(n901), .Y(n721) );
  XNOR2XL U1019 ( .A(n55), .B(n899), .Y(n719) );
  XNOR2XL U1020 ( .A(n55), .B(n898), .Y(n718) );
  XNOR2XL U1021 ( .A(n55), .B(n897), .Y(n717) );
  XNOR2XL U1022 ( .A(n1), .B(n61), .Y(n884) );
  NAND2BXL U1023 ( .AN(n61), .B(n13), .Y(n849) );
  NAND2X4 U1024 ( .A(n903), .B(n58), .Y(n60) );
  XOR2XL U1025 ( .A(n55), .B(a[18]), .Y(n903) );
  XOR2XL U1026 ( .A(n13), .B(a[6]), .Y(n22) );
  CLKINVX8 U1027 ( .A(n22), .Y(n1033) );
  AO21X1 U1028 ( .A0(n18), .A1(n16), .B0(n832), .Y(n653) );
  OAI22X1 U1029 ( .A0(n832), .A1(n16), .B0(n18), .B1(n833), .Y(n654) );
  OAI22XL U1030 ( .A0(n840), .A1(n16), .B0(n18), .B1(n841), .Y(n662) );
  OAI22XL U1031 ( .A0(n18), .A1(n842), .B0(n841), .B1(n16), .Y(n663) );
  OAI22XL U1032 ( .A0(n834), .A1(n18), .B0(n833), .B1(n16), .Y(n655) );
  OAI22XL U1033 ( .A0(n840), .A1(n18), .B0(n839), .B1(n16), .Y(n661) );
  OAI22XL U1034 ( .A0(n835), .A1(n18), .B0(n834), .B1(n16), .Y(n656) );
  OAI22XL U1035 ( .A0(n836), .A1(n18), .B0(n835), .B1(n16), .Y(n657) );
  OAI22XL U1036 ( .A0(n18), .A1(n843), .B0(n842), .B1(n16), .Y(n664) );
  OAI22XL U1037 ( .A0(n836), .A1(n16), .B0(n18), .B1(n837), .Y(n658) );
  OAI22XL U1038 ( .A0(n18), .A1(n839), .B0(n838), .B1(n16), .Y(n660) );
  OAI22XL U1039 ( .A0(n18), .A1(n838), .B0(n837), .B1(n16), .Y(n659) );
  OAI22XL U1040 ( .A0(n845), .A1(n18), .B0(n844), .B1(n16), .Y(n666) );
  OAI22XL U1041 ( .A0(n18), .A1(n844), .B0(n843), .B1(n16), .Y(n665) );
  OAI22XL U1042 ( .A0(n845), .A1(n16), .B0(n18), .B1(n846), .Y(n667) );
  OAI22XL U1043 ( .A0(n18), .A1(n847), .B0(n846), .B1(n16), .Y(n668) );
  NOR2BXL U1044 ( .AN(n61), .B(n16), .Y(n670) );
  OAI22XL U1045 ( .A0(n18), .A1(n848), .B0(n847), .B1(n16), .Y(n669) );
  OAI22XL U1046 ( .A0(n18), .A1(n940), .B0(n849), .B1(n16), .Y(n531) );
  NAND2X4 U1047 ( .A(n910), .B(n16), .Y(n18) );
  INVX4 U1048 ( .A(n9), .Y(n1034) );
  CLKINVX16 U1049 ( .A(n1034), .Y(n1035) );
  XNOR2X1 U1050 ( .A(a[2]), .B(n1), .Y(n9) );
  XOR2XL U1051 ( .A(a[8]), .B(n19), .Y(n28) );
  INVX6 U1052 ( .A(n28), .Y(n1036) );
  XOR2XL U1053 ( .A(n31), .B(a[12]), .Y(n40) );
  CLKINVX6 U1054 ( .A(n40), .Y(n1037) );
  ADDHX1 U1055 ( .A(n526), .B(n627), .CO(n453), .S(n454) );
  AOI21X2 U1056 ( .A0(n263), .A1(n256), .B0(n257), .Y(n255) );
  XNOR2X1 U1057 ( .A(n263), .B(n87), .Y(product[4]) );
  CLKINVX1 U1058 ( .A(n263), .Y(n65) );
  ADDFX2 U1059 ( .A(n492), .B(n497), .CI(n251), .CO(n250), .S(product[10]) );
  ADDFX2 U1060 ( .A(n498), .B(n504), .CI(n252), .CO(n251), .S(product[9]) );
  ADDFHX2 U1061 ( .A(n484), .B(n491), .CI(n250), .CO(n249), .S(product[11]) );
  ADDFX2 U1062 ( .A(n703), .B(n523), .CI(n264), .CO(n263), .S(product[3]) );
  OAI22X1 U1063 ( .A0(n36), .A1(n790), .B0(n789), .B1(n34), .Y(n611) );
  OAI22X1 U1064 ( .A0(n36), .A1(n788), .B0(n787), .B1(n34), .Y(n609) );
  OAI22X1 U1065 ( .A0(n36), .A1(n789), .B0(n788), .B1(n34), .Y(n610) );
  OAI22X1 U1066 ( .A0(n791), .A1(n36), .B0(n790), .B1(n34), .Y(n612) );
  OAI22X1 U1067 ( .A0(n791), .A1(n34), .B0(n36), .B1(n792), .Y(n613) );
  INVX4 U1068 ( .A(n120), .Y(n118) );
  ADDFX1 U1069 ( .A(n525), .B(n609), .CI(n673), .CO(n429), .S(n430) );
  NOR2X4 U1070 ( .A(n584), .B(n314), .Y(n162) );
  NAND2X4 U1071 ( .A(n584), .B(n314), .Y(n163) );
  OAI21X4 U1072 ( .A0(n203), .A1(n145), .B0(n146), .Y(n144) );
  OAI22X1 U1073 ( .A0(n48), .A1(n935), .B0(n46), .B1(n759), .Y(n526) );
  OAI22XL U1074 ( .A0(n706), .A1(n58), .B0(n60), .B1(n707), .Y(n535) );
  OAI22XL U1075 ( .A0(n60), .A1(n708), .B0(n707), .B1(n58), .Y(n536) );
  OAI22XL U1076 ( .A0(n60), .A1(n710), .B0(n709), .B1(n58), .Y(n537) );
  OAI22XL U1077 ( .A0(n60), .A1(n711), .B0(n710), .B1(n58), .Y(n538) );
  OAI22XL U1078 ( .A0(n60), .A1(n712), .B0(n711), .B1(n58), .Y(n539) );
  OAI22XL U1079 ( .A0(n60), .A1(n713), .B0(n712), .B1(n58), .Y(n540) );
  OAI22XL U1080 ( .A0(n60), .A1(n714), .B0(n713), .B1(n58), .Y(n541) );
  OAI22XL U1081 ( .A0(n60), .A1(n715), .B0(n714), .B1(n58), .Y(n542) );
  OAI22XL U1082 ( .A0(n60), .A1(n716), .B0(n715), .B1(n58), .Y(n543) );
  XNOR2XL U1083 ( .A(n886), .B(n49), .Y(n724) );
  OAI22XL U1084 ( .A0(n60), .A1(n717), .B0(n716), .B1(n58), .Y(n544) );
  OAI22XL U1085 ( .A0(n60), .A1(n718), .B0(n717), .B1(n58), .Y(n545) );
  XNOR2XL U1086 ( .A(n49), .B(n887), .Y(n725) );
  OAI22XL U1087 ( .A0(n60), .A1(n719), .B0(n718), .B1(n58), .Y(n546) );
  OAI22XL U1088 ( .A0(n60), .A1(n722), .B0(n1026), .B1(n58), .Y(n549) );
  OAI22XL U1089 ( .A0(n60), .A1(n1024), .B0(n719), .B1(n58), .Y(n547) );
  OAI22XL U1090 ( .A0(n60), .A1(n933), .B0(n723), .B1(n58), .Y(n524) );
  OAI22XL U1091 ( .A0(n60), .A1(n1026), .B0(n1024), .B1(n58), .Y(n548) );
  XNOR2XL U1092 ( .A(n889), .B(n49), .Y(n727) );
  XNOR2XL U1093 ( .A(n888), .B(n49), .Y(n726) );
  XNOR2XL U1094 ( .A(n890), .B(n49), .Y(n728) );
  XNOR2XL U1095 ( .A(n49), .B(n891), .Y(n729) );
  XNOR2XL U1096 ( .A(n894), .B(n49), .Y(n732) );
  XNOR2X1 U1097 ( .A(n49), .B(n893), .Y(n731) );
  NOR2BX1 U1098 ( .AN(n61), .B(n58), .Y(n550) );
  XNOR2X1 U1099 ( .A(n49), .B(n892), .Y(n730) );
  XNOR2X1 U1100 ( .A(n49), .B(n895), .Y(n733) );
  XNOR2X1 U1101 ( .A(n49), .B(n896), .Y(n734) );
  NAND2BXL U1102 ( .AN(n61), .B(n49), .Y(n741) );
  INVX4 U1103 ( .A(n49), .Y(n934) );
  XNOR2X1 U1104 ( .A(n49), .B(n897), .Y(n735) );
  XNOR2X1 U1105 ( .A(n899), .B(n49), .Y(n737) );
  XNOR2XL U1106 ( .A(n49), .B(n61), .Y(n740) );
  XOR2X4 U1107 ( .A(n129), .B(n69), .Y(product[32]) );
  OAI21X1 U1108 ( .A0(n203), .A1(n154), .B0(n155), .Y(n153) );
  AO21XL U1109 ( .A0(n54), .A1(n52), .B0(n724), .Y(n551) );
  OAI21X1 U1110 ( .A0(n203), .A1(n165), .B0(n166), .Y(n164) );
  OAI21X1 U1111 ( .A0(n203), .A1(n172), .B0(n173), .Y(n171) );
  OAI22XL U1112 ( .A0(n724), .A1(n52), .B0(n54), .B1(n725), .Y(n552) );
  OAI21X1 U1113 ( .A0(n203), .A1(n183), .B0(n184), .Y(n182) );
  OAI21X1 U1114 ( .A0(n203), .A1(n190), .B0(n191), .Y(n189) );
  OAI21X2 U1115 ( .A0(n203), .A1(n201), .B0(n202), .Y(n200) );
  XOR2X4 U1116 ( .A(n203), .B(n78), .Y(product[23]) );
  OAI22XL U1117 ( .A0(n726), .A1(n54), .B0(n725), .B1(n52), .Y(n553) );
  INVX6 U1118 ( .A(n204), .Y(n203) );
  OAI22XL U1119 ( .A0(n727), .A1(n54), .B0(n726), .B1(n52), .Y(n305) );
  OAI22XL U1120 ( .A0(n728), .A1(n54), .B0(n727), .B1(n52), .Y(n554) );
  OAI22XL U1121 ( .A0(n728), .A1(n52), .B0(n54), .B1(n729), .Y(n555) );
  XNOR2XL U1122 ( .A(n886), .B(n43), .Y(n742) );
  OAI22XL U1123 ( .A0(n54), .A1(n730), .B0(n729), .B1(n52), .Y(n556) );
  OAI22XL U1124 ( .A0(n54), .A1(n731), .B0(n730), .B1(n52), .Y(n331) );
  OAI22XL U1125 ( .A0(n732), .A1(n54), .B0(n731), .B1(n52), .Y(n557) );
  OAI22XL U1126 ( .A0(n732), .A1(n52), .B0(n54), .B1(n733), .Y(n558) );
  XNOR2XL U1127 ( .A(n887), .B(n43), .Y(n743) );
  OAI22XL U1128 ( .A0(n54), .A1(n734), .B0(n733), .B1(n52), .Y(n559) );
  XNOR2XL U1129 ( .A(n890), .B(n43), .Y(n746) );
  OAI22XL U1130 ( .A0(n54), .A1(n735), .B0(n734), .B1(n52), .Y(n560) );
  OAI22XL U1131 ( .A0(n54), .A1(n736), .B0(n735), .B1(n52), .Y(n561) );
  OAI22XL U1132 ( .A0(n737), .A1(n54), .B0(n736), .B1(n52), .Y(n562) );
  OAI22XL U1133 ( .A0(n737), .A1(n52), .B0(n54), .B1(n738), .Y(n563) );
  XNOR2XL U1134 ( .A(n889), .B(n43), .Y(n745) );
  XNOR2XL U1135 ( .A(n888), .B(n43), .Y(n744) );
  OAI22X1 U1136 ( .A0(n54), .A1(n1028), .B0(n738), .B1(n52), .Y(n564) );
  OAI22XL U1137 ( .A0(n54), .A1(n740), .B0(n1028), .B1(n52), .Y(n565) );
  OAI22XL U1138 ( .A0(n54), .A1(n934), .B0(n741), .B1(n52), .Y(n525) );
  XNOR2XL U1139 ( .A(n894), .B(n43), .Y(n750) );
  NOR2BXL U1140 ( .AN(n61), .B(n52), .Y(n566) );
  XNOR2XL U1141 ( .A(n891), .B(n43), .Y(n747) );
  XNOR2XL U1142 ( .A(n43), .B(n892), .Y(n748) );
  XNOR2XL U1143 ( .A(n43), .B(n896), .Y(n752) );
  XNOR2XL U1144 ( .A(n43), .B(n895), .Y(n751) );
  NAND2BXL U1145 ( .AN(n61), .B(n43), .Y(n759) );
  XNOR2XL U1146 ( .A(n899), .B(n43), .Y(n755) );
  XNOR2XL U1147 ( .A(n898), .B(n43), .Y(n754) );
  XNOR2XL U1148 ( .A(n43), .B(n897), .Y(n753) );
  INVX4 U1149 ( .A(n43), .Y(n935) );
  XNOR2XL U1150 ( .A(n43), .B(n61), .Y(n758) );
  XNOR2X1 U1151 ( .A(n43), .B(n900), .Y(n756) );
  CLKXOR2X2 U1152 ( .A(a[14]), .B(n43), .Y(n905) );
  INVX8 U1153 ( .A(n135), .Y(n134) );
  INVX12 U1154 ( .A(n127), .Y(n272) );
  XOR2X1 U1155 ( .A(n13), .B(a[4]), .Y(n910) );
  XNOR2X1 U1156 ( .A(n13), .B(n901), .Y(n847) );
  XNOR2X1 U1157 ( .A(n13), .B(n900), .Y(n846) );
  XNOR2XL U1158 ( .A(n13), .B(n61), .Y(n848) );
  XNOR2X2 U1159 ( .A(n899), .B(n13), .Y(n845) );
  NOR2BX1 U1160 ( .AN(n61), .B(n1033), .Y(n652) );
  OAI22X2 U1161 ( .A0(n24), .A1(n939), .B0(n1033), .B1(n831), .Y(n530) );
  OAI22X2 U1162 ( .A0(n24), .A1(n829), .B0(n1033), .B1(n828), .Y(n650) );
  OAI22X2 U1163 ( .A0(n24), .A1(n821), .B0(n1033), .B1(n820), .Y(n642) );
  AOI21X1 U1164 ( .A0(n134), .A1(n99), .B0(n100), .Y(n98) );
  AOI21X1 U1165 ( .A0(n134), .A1(n108), .B0(n109), .Y(n107) );
  AOI21X2 U1166 ( .A0(n134), .A1(n117), .B0(n118), .Y(n116) );
  NAND2X6 U1167 ( .A(n156), .B(n140), .Y(n138) );
  OAI22XL U1168 ( .A0(n778), .A1(n34), .B0(n36), .B1(n779), .Y(n601) );
  OAI22XL U1169 ( .A0(n780), .A1(n36), .B0(n779), .B1(n34), .Y(n602) );
  OAI22XL U1170 ( .A0(n782), .A1(n36), .B0(n781), .B1(n34), .Y(n604) );
  OAI22XL U1171 ( .A0(n782), .A1(n34), .B0(n36), .B1(n783), .Y(n605) );
  OAI22XL U1172 ( .A0(n36), .A1(n784), .B0(n783), .B1(n34), .Y(n606) );
  OAI22XL U1173 ( .A0(n36), .A1(n785), .B0(n784), .B1(n34), .Y(n393) );
  OAI22XL U1174 ( .A0(n786), .A1(n36), .B0(n785), .B1(n34), .Y(n607) );
  OAI22XL U1175 ( .A0(n786), .A1(n34), .B0(n36), .B1(n787), .Y(n608) );
  OAI22XL U1176 ( .A0(n36), .A1(n794), .B0(n793), .B1(n34), .Y(n615) );
  OAI22XL U1177 ( .A0(n36), .A1(n937), .B0(n795), .B1(n34), .Y(n528) );
  OAI22XL U1178 ( .A0(n36), .A1(n793), .B0(n792), .B1(n34), .Y(n614) );
  NOR2BXL U1179 ( .AN(n61), .B(n34), .Y(n616) );
  NAND2BXL U1180 ( .AN(n61), .B(n25), .Y(n813) );
  XNOR2XL U1181 ( .A(n889), .B(n25), .Y(n799) );
  INVX4 U1182 ( .A(n25), .Y(n938) );
  XNOR2XL U1183 ( .A(n25), .B(n900), .Y(n810) );
  XNOR2XL U1184 ( .A(n25), .B(n61), .Y(n812) );
  XNOR2XL U1185 ( .A(n898), .B(n25), .Y(n808) );
  CLKXOR2X2 U1186 ( .A(a[8]), .B(n25), .Y(n908) );
  CLKINVX12 U1187 ( .A(n105), .Y(n270) );
  OAI21X4 U1188 ( .A0(n135), .A1(n92), .B0(n93), .Y(n63) );
  NAND2X2 U1189 ( .A(n99), .B(n94), .Y(n92) );
  INVX4 U1190 ( .A(n142), .Y(n274) );
  AO21XL U1191 ( .A0(n48), .A1(n46), .B0(n742), .Y(n567) );
  NAND2X4 U1192 ( .A(n1030), .B(n304), .Y(n143) );
  OAI22XL U1193 ( .A0(n742), .A1(n46), .B0(n48), .B1(n743), .Y(n568) );
  OAI22XL U1194 ( .A0(n744), .A1(n48), .B0(n46), .B1(n743), .Y(n569) );
  OAI22XL U1195 ( .A0(n745), .A1(n48), .B0(n744), .B1(n46), .Y(n317) );
  OAI22XL U1196 ( .A0(n746), .A1(n48), .B0(n745), .B1(n46), .Y(n570) );
  OAI22XL U1197 ( .A0(n746), .A1(n46), .B0(n48), .B1(n747), .Y(n571) );
  OAI22XL U1198 ( .A0(n48), .A1(n748), .B0(n46), .B1(n747), .Y(n572) );
  OAI22XL U1199 ( .A0(n750), .A1(n48), .B0(n46), .B1(n749), .Y(n573) );
  OAI22XL U1200 ( .A0(n750), .A1(n46), .B0(n48), .B1(n751), .Y(n574) );
  OAI22XL U1201 ( .A0(n48), .A1(n749), .B0(n46), .B1(n748), .Y(n349) );
  OAI22XL U1202 ( .A0(n48), .A1(n752), .B0(n46), .B1(n751), .Y(n575) );
  OAI22XL U1203 ( .A0(n48), .A1(n753), .B0(n46), .B1(n752), .Y(n576) );
  OAI22XL U1204 ( .A0(n755), .A1(n48), .B0(n46), .B1(n754), .Y(n578) );
  OAI22XL U1205 ( .A0(n48), .A1(n754), .B0(n46), .B1(n753), .Y(n577) );
  OAI22XL U1206 ( .A0(n755), .A1(n46), .B0(n48), .B1(n756), .Y(n579) );
  NOR2BXL U1207 ( .AN(n61), .B(n46), .Y(n582) );
  XNOR2XL U1208 ( .A(n37), .B(n892), .Y(n766) );
  NAND2BXL U1209 ( .AN(n61), .B(n37), .Y(n777) );
  INVX4 U1210 ( .A(n37), .Y(n936) );
  XNOR2XL U1211 ( .A(n37), .B(n61), .Y(n776) );
  CLKXOR2X2 U1212 ( .A(a[12]), .B(n37), .Y(n906) );
  ADDFHX4 U1213 ( .A(n457), .B(n465), .CI(n247), .CO(n246), .S(product[14]) );
  CLKINVX8 U1214 ( .A(n242), .Y(n241) );
  CLKINVX8 U1215 ( .A(n245), .Y(n64) );
  ADDFHX4 U1216 ( .A(n466), .B(n475), .CI(n248), .CO(n247), .S(product[13]) );
  ADDFHX2 U1217 ( .A(n476), .B(n483), .CI(n249), .CO(n248), .S(product[12]) );
  ADDFHX4 U1218 ( .A(n505), .B(n509), .CI(n253), .CO(n252), .S(product[8]) );
  ADDFHX2 U1219 ( .A(n510), .B(n514), .CI(n254), .CO(n253), .S(product[7]) );
  ADDFHX4 U1220 ( .A(n446), .B(n456), .CI(n246), .CO(n245), .S(product[15]) );
  INVX3 U1221 ( .A(n1038), .Y(product[37]) );
  INVX3 U1222 ( .A(n1038), .Y(product[39]) );
  INVX3 U1223 ( .A(n1038), .Y(product[38]) );
  CLKINVX3 U1224 ( .A(product[36]), .Y(n1038) );
  CLKINVX6 U1225 ( .A(n63), .Y(product[36]) );
  CLKINVX6 U1226 ( .A(n88), .Y(product[1]) );
  CLKINVX6 U1227 ( .A(n97), .Y(n95) );
  CLKINVX6 U1228 ( .A(n13), .Y(n940) );
  CLKINVX6 U1229 ( .A(n55), .Y(n933) );
  CLKINVX6 U1230 ( .A(n369), .Y(n370) );
  CLKINVX6 U1231 ( .A(a[0]), .Y(n932) );
  CLKINVX6 U1232 ( .A(n292), .Y(n293) );
  CLKINVX6 U1233 ( .A(n266), .Y(n291) );
  CLKINVX6 U1234 ( .A(n261), .Y(n290) );
  CLKINVX6 U1235 ( .A(n258), .Y(n289) );
  CLKINVX6 U1236 ( .A(n243), .Y(n288) );
  CLKINVX6 U1237 ( .A(n239), .Y(n287) );
  CLKINVX6 U1238 ( .A(n236), .Y(n286) );
  CLKINVX6 U1239 ( .A(n225), .Y(n284) );
  CLKINVX6 U1240 ( .A(n214), .Y(n283) );
  CLKINVX6 U1241 ( .A(n209), .Y(n282) );
  CLKINVX6 U1242 ( .A(n201), .Y(n281) );
  CLKINVX6 U1243 ( .A(n198), .Y(n280) );
  CLKINVX6 U1244 ( .A(n180), .Y(n278) );
  CLKINVX6 U1245 ( .A(n162), .Y(n276) );
  CLKINVX6 U1246 ( .A(n149), .Y(n275) );
  CLKINVX6 U1247 ( .A(n96), .Y(n94) );
  CLKINVX6 U1248 ( .A(n255), .Y(n268) );
  CLKINVX6 U1249 ( .A(n267), .Y(n265) );
  CLKINVX6 U1250 ( .A(n233), .Y(n232) );
  CLKINVX6 U1251 ( .A(n231), .Y(n229) );
  CLKINVX6 U1252 ( .A(n230), .Y(n285) );
  CLKINVX6 U1253 ( .A(n220), .Y(n222) );
  CLKINVX6 U1254 ( .A(n219), .Y(n221) );
  CLKINVX6 U1255 ( .A(n193), .Y(n191) );
  CLKINVX6 U1256 ( .A(n192), .Y(n190) );
  CLKINVX6 U1257 ( .A(n188), .Y(n186) );
  CLKINVX6 U1258 ( .A(n187), .Y(n279) );
  CLKINVX6 U1259 ( .A(n173), .Y(n175) );
  CLKINVX6 U1260 ( .A(n172), .Y(n174) );
  CLKINVX6 U1261 ( .A(n170), .Y(n168) );
  CLKINVX6 U1262 ( .A(n169), .Y(n277) );
  CLKINVX6 U1263 ( .A(n157), .Y(n159) );
  CLKINVX6 U1264 ( .A(n156), .Y(n158) );
  CLKINVX6 U1265 ( .A(n133), .Y(n131) );
  CLKINVX6 U1266 ( .A(n132), .Y(n273) );
  CLKINVX6 U1267 ( .A(n128), .Y(n126) );
  CLKINVX6 U1268 ( .A(n119), .Y(n117) );
  CLKINVX6 U1269 ( .A(n111), .Y(n113) );
  CLKINVX6 U1270 ( .A(n110), .Y(n271) );
  CLKINVX6 U1271 ( .A(n106), .Y(n104) );
endmodule


module CONV ( clk, reset, busy, ready, iaddr, idata, cwr, caddr_wr, cdata_wr, 
        crd, caddr_rd, cdata_rd, csel );
  output [11:0] iaddr;
  input [19:0] idata;
  output [11:0] caddr_wr;
  output [19:0] cdata_wr;
  output [11:0] caddr_rd;
  input [19:0] cdata_rd;
  output [2:0] csel;
  input clk, reset, ready;
  output busy, cwr, crd;
  wire   n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, layer_0_flag, count_done,
         one_stride_done, pool_one_stride_done, flat_one_stride_done,
         kernel0_done, kernel1_done, layer_0_done, pooling_done, flatten_done,
         flat_mem_wr_en, first_row, N68, final_row, first_col, final_col,
         padding_flag, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N81,
         N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95,
         N96, N97, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107,
         N108, N109, N110, N111, N112, N114, N115, N116, N117, N118, N119,
         N120, N121, N122, N123, N124, N125, N126, N127, N128, N129,
         \pool_address[6] , pool_address_0, N135, N137, N138, N139, N140, N141,
         N142, N143, N144, N145, N146, N147, N148, N149, N150, N151, N152,
         N153, N154, N159, N160, N162, N163, N164, N165, N166, N167, N168,
         N169, N170, N171, N172, N173, N174, N175, N176, N177, N178, N179,
         N180, N181, N182, N183, N184, N185, N186, N187, N188, N189, N190,
         N191, N192, N193, N211, N212, N214, N215, N216, N217, N218, N219,
         N220, N221, N222, N223, N224, N225, N226, N227, N228, N229, N230,
         N231, N232, N233, N234, N235, N236, N237, N238, N239, N240, N241,
         N242, N243, N244, N245, N261, N262, N264, N265, N266, N267, N268,
         N269, N270, N271, N272, N273, N274, N275, N276, N277, N278, N279,
         N280, N281, N282, N283, N284, N285, N286, N287, N288, N289, N290,
         N291, N292, N293, N294, N295, N303, N304, N305, N306, N330, N331,
         N332, N350, N351, N352, N353, N354, N355, N356, N357, N358, N359,
         N360, N362, N363, N364, N365, N366, N367, N368, N369, N370, N371,
         N372, N410, N411, N412, N413, N414, N415, N416, N417, N418, N419,
         N420, N421, N422, N428, N433, N434, N435, N436, N441, N442, N443,
         N444, N445, N454, N455, N456, N457, N458, N459, N460, N461, N462,
         N463, N464, N465, N504, N505, N506, N507, N508, N509, N510, N511,
         N512, N513, N514, N515, N516, N521, N524, N525, N526, N527, N528,
         N529, N530, N531, N532, N533, N534, N535, N536, N537, N538, N539,
         N540, N541, N542, N543, N544, N545, N546, N547, N548, N549, N550,
         N551, N552, N553, N554, N555, N556, N557, N558, N559, N560, N561,
         N562, N563, N564, N566, N567, N568, N572, N573, N579, N580, N581,
         N585, N586, N592, N593, N596, N597, N598, N599, N600, N601, N602,
         N603, N604, N605, N606, N607, N608, N609, N610, N611, N612, N613,
         N614, N615, N616, N620, N623, N624, N625, N626, N628, N629, N630,
         N631, N632, N633, N634, N635, N636, N637, N638, N639, N640, N641,
         N642, N643, N644, N645, N646, N647, N648, N649, N650, N651, N652,
         N653, N654, N655, N656, N657, N658, N659, N660, N661, N662, N663,
         N664, N665, N666, N667, N668, N669, N670, N671, N672, N673, N674,
         N675, N676, N677, N678, N679, N680, N681, N682, N683, N684, N685,
         N686, N687, N688, N689, N690, N691, N692, N693, N694, N695, N696,
         N697, N698, N699, N700, N701, N702, N703, N704, N705, N706, N707,
         N708, N709, N710, N711, N712, N713, N714, N715, N716, N717, N718,
         N719, N720, N721, N722, N723, N724, N725, N726, N727, N728, N729,
         N730, N731, N732, N733, N734, N735, N736, N737, N738, N739, N740,
         N741, N742, N743, N744, N745, N746, N747, N748, N749, N750, N751,
         N752, N753, N754, N755, N756, N757, N758, N759, N760, N761, N762,
         N763, N764, N765, N766, N767, N768, N769, N770, N771, N772, N773,
         N774, N775, N776, N777, N778, N779, N780, N781, N782, N783, N784,
         N785, N786, N787, N788, N789, N790, N791, N792, N793, N794, N795,
         N796, N797, N798, N799, N800, N801, N802, N803, N804, N805, N806,
         N807, N808, N809, N810, N811, N812, N813, N814, N815, N816, N817,
         N818, N819, N820, N821, N822, N823, N824, N825, N826, N827, N828,
         N829, N830, N832, N833, N834, N836, N837, N838, N840, N841, N842,
         N843, N844, N845, N846, N847, N848, N849, N850, N851, N852, N853,
         N854, N855, N856, N857, N858, N866, N867, N868, N869, N870, N871,
         N872, N873, N874, N875, N876, N877, N878, N879, N880, N881, N882,
         N883, N884, N885, N886, N887, N888, N889, N890, N891, N892, N898,
         N899, N900, N901, N902, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, \product[9] , \product[8] , \product[7] , \product[6] ,
         \product[5] , \product[4] , \product[3] , \product[39] ,
         \product[38] , \product[37] , \product[36] , \product[35] ,
         \product[34] , \product[33] , \product[32] , \product[31] ,
         \product[30] , \product[2] , \product[29] , \product[28] ,
         \product[27] , \product[26] , \product[25] , \product[24] ,
         \product[23] , \product[22] , \product[21] , \product[20] ,
         \product[1] , \product[19] , \product[18] , \product[17] ,
         \product[16] , \product[15] , \product[14] , \product[13] ,
         \product[12] , \product[11] , \product[10] , \product[0] , N865, N859,
         \add_257_2/carry[3] , \add_257_2/carry[4] , \add_257_2/carry[5] ,
         \add_257_2/carry[6] , \add_257_2/carry[7] , \add_257_2/carry[8] ,
         \add_257_2/carry[9] , \add_257_2/carry[10] , \add_257_2/carry[11] ,
         \add_257/carry[3] , \add_257/carry[4] , \add_257/carry[5] ,
         \add_257/carry[6] , \add_257/carry[7] , \add_257/carry[8] ,
         \add_257/carry[9] , \add_257/carry[10] , \add_257/carry[11] ,
         \add_105/carry[8] , \add_105/carry[9] , \add_105/carry[10] ,
         \add_105/carry[11] , \sub_99/carry[8] , \sub_99/carry[9] ,
         \sub_99/carry[10] , \sub_99/carry[11] , n380, n382, n384, n386, n388,
         n390, n392, n394, n395, n396, n397, n398, n399, n401, n402, n404,
         n405, n407, n408, n410, n411, n413, n414, n416, n417, n419, n420,
         n422, n423, n425, n427, n429, n431, n433, n435, n437, n439, n441,
         n443, n445, n447, n449, n451, n453, n455, n457, n459, n461, n463,
         n465, n467, n469, n471, n473, n475, n477, n479, n481, n483, n485,
         n486, n488, n489, n491, n492, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548;
  wire   [2:0] state;
  wire   [3:0] count;
  wire   [11:0] Top_Left_addr;
  wire   [11:0] Top_Mid_addr;
  wire   [11:0] Top_Right_addr;
  wire   [11:0] Mid_Left_addr;
  wire   [11:0] Mid_addr;
  wire   [11:0] Mid_Right_addr;
  wire   [11:0] Bottom_Left_addr;
  wire   [11:0] Bottom_addr;
  wire   [11:0] Bottom_Right_addr;
  wire   [19:0] ifmap;
  wire   [19:0] weight;
  wire   [39:0] psum_reg;
  wire   [39:0] psum;
  wire   [35:15] psum_bias;
  wire   [19:0] max_temp;
  wire   [2:0] next_state;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  AND2X8 C1958 ( .A(N901), .B(n512), .Y(N902) );
  AND2X8 C1957 ( .A(N902), .B(N843), .Y(N581) );
  AND2X8 C1956 ( .A(N754), .B(N858), .Y(N900) );
  AND2X8 C1955 ( .A(N900), .B(n512), .Y(N580) );
  AND2X8 C1954 ( .A(N858), .B(layer_0_done), .Y(N579) );
  AND2X8 C1941 ( .A(N899), .B(N843), .Y(N568) );
  AND2X8 C1940 ( .A(N743), .B(N858), .Y(N567) );
  AND2X8 C1939 ( .A(N858), .B(layer_0_done), .Y(N566) );
  OR2X8 C1897 ( .A(N852), .B(N843), .Y(N898) );
  OR2X8 C1896 ( .A(N898), .B(N827), .Y(N428) );
  AND2X8 C1872 ( .A(N852), .B(one_stride_done), .Y(N330) );
  CLKINVX6 I_108 ( .A(N305), .Y(N306) );
  CLKINVX6 I_107 ( .A(N303), .Y(N304) );
  CLKINVX6 I_105 ( .A(N294), .Y(N295) );
  CLKINVX6 I_104 ( .A(N290), .Y(N291) );
  CLKINVX6 I_103 ( .A(N286), .Y(N287) );
  CLKINVX6 I_102 ( .A(N282), .Y(N283) );
  CLKINVX6 I_101 ( .A(N278), .Y(N279) );
  CLKINVX6 I_100 ( .A(N274), .Y(N275) );
  CLKINVX6 I_99 ( .A(N270), .Y(N271) );
  CLKINVX6 I_98 ( .A(N266), .Y(N267) );
  CLKINVX6 I_97 ( .A(N244), .Y(N245) );
  CLKINVX6 I_96 ( .A(N240), .Y(N241) );
  CLKINVX6 I_95 ( .A(N236), .Y(N237) );
  CLKINVX6 I_94 ( .A(N232), .Y(N233) );
  CLKINVX6 I_93 ( .A(N228), .Y(N229) );
  CLKINVX6 I_92 ( .A(N224), .Y(N225) );
  CLKINVX6 I_91 ( .A(N220), .Y(N221) );
  CLKINVX6 I_90 ( .A(N216), .Y(N217) );
  CLKINVX6 I_89 ( .A(N192), .Y(N193) );
  CLKINVX6 I_88 ( .A(N188), .Y(N189) );
  CLKINVX6 I_87 ( .A(N184), .Y(N185) );
  CLKINVX6 I_86 ( .A(N180), .Y(N181) );
  CLKINVX6 I_85 ( .A(N176), .Y(N177) );
  CLKINVX6 I_84 ( .A(N172), .Y(N173) );
  CLKINVX6 I_83 ( .A(N168), .Y(N169) );
  CLKINVX6 I_82 ( .A(N164), .Y(N165) );
  CLKINVX6 I_80 ( .A(N153), .Y(N154) );
  CLKINVX6 I_79 ( .A(N150), .Y(N151) );
  CLKINVX6 I_78 ( .A(N147), .Y(N148) );
  CLKINVX6 I_77 ( .A(N144), .Y(N145) );
  CLKINVX6 I_76 ( .A(N141), .Y(N142) );
  CLKINVX6 I_75 ( .A(N138), .Y(N139) );
  AND2X8 C1678 ( .A(N827), .B(flat_mem_wr_en), .Y(N892) );
  OR2X8 C1676 ( .A(N858), .B(N890), .Y(N891) );
  CLKINVX6 I_74 ( .A(flat_mem_wr_en), .Y(N889) );
  OR2X8 C1649 ( .A(first_row), .B(final_row), .Y(N886) );
  OR2X8 C1648 ( .A(N886), .B(first_col), .Y(N887) );
  OR2X8 C1647 ( .A(N887), .B(final_col), .Y(padding_flag) );
  OR2X8 C1646 ( .A(N814), .B(N818), .Y(N884) );
  OR2X8 C1645 ( .A(N884), .B(N822), .Y(N885) );
  AND2X8 C1644 ( .A(N810), .B(N885), .Y(final_col) );
  OR2X8 C1643 ( .A(N797), .B(N801), .Y(N882) );
  OR2X8 C1642 ( .A(N882), .B(N805), .Y(N883) );
  AND2X8 C1641 ( .A(N793), .B(N883), .Y(first_col) );
  OR2X8 C1640 ( .A(N778), .B(N782), .Y(N880) );
  OR2X8 C1639 ( .A(N880), .B(N787), .Y(N881) );
  AND2X8 C1638 ( .A(N68), .B(N881), .Y(final_row) );
  OR2X8 C1637 ( .A(N766), .B(N770), .Y(N878) );
  OR2X8 C1636 ( .A(N878), .B(N774), .Y(N879) );
  CLKINVX6 I_67 ( .A(N876), .Y(N877) );
  AND2X8 C1629 ( .A(N877), .B(N879), .Y(first_row) );
  OR2X8 C1628 ( .A(N758), .B(N762), .Y(N871) );
  AND2X8 C1627 ( .A(N827), .B(N871), .Y(flat_mem_wr_en) );
  AND2X8 C1626 ( .A(N665), .B(flat_one_stride_done), .Y(flatten_done) );
  AND2X8 C1625 ( .A(N843), .B(n512), .Y(N870) );
  AND2X8 C1624 ( .A(N870), .B(kernel1_done), .Y(pooling_done) );
  AND2X8 C1623 ( .A(layer_0_flag), .B(n512), .Y(N869) );
  AND2X8 C1622 ( .A(N869), .B(kernel1_done), .Y(layer_0_done) );
  OR2X8 C1613 ( .A(N846), .B(N849), .Y(N866) );
  OR2X8 C1612 ( .A(N866), .B(N852), .Y(N867) );
  OR2X8 C1611 ( .A(N867), .B(N855), .Y(N868) );
  CLKINVX6 I_64 ( .A(N857), .Y(N858) );
  OR2X8 C1569 ( .A(state[0]), .B(N856), .Y(N857) );
  OR2X8 C1568 ( .A(state[1]), .B(N823), .Y(N856) );
  CLKINVX6 I_63 ( .A(N854), .Y(N855) );
  OR2X8 C1565 ( .A(N840), .B(N853), .Y(N854) );
  CLKINVX6 I_62 ( .A(N851), .Y(N852) );
  CLKINVX6 I_61 ( .A(N848), .Y(N849) );
  CLKINVX6 I_60 ( .A(N845), .Y(N846) );
  CLKINVX6 I_59 ( .A(N842), .Y(N843) );
  OR2X8 C1549 ( .A(N840), .B(N841), .Y(N842) );
  OR2X8 C1548 ( .A(state[1]), .B(N823), .Y(N841) );
  OR2X8 C1544 ( .A(N628), .B(N837), .Y(N838) );
  OR2X8 C1543 ( .A(N623), .B(N836), .Y(N837) );
  OR2X8 C1542 ( .A(n504), .B(n514), .Y(N836) );
  OR2X8 C1531 ( .A(n504), .B(N783), .Y(N828) );
  CLKINVX6 I_54 ( .A(N826), .Y(N827) );
  OR2X8 C1528 ( .A(state[0]), .B(N825), .Y(N826) );
  OR2X8 C1527 ( .A(N824), .B(N823), .Y(N825) );
  CLKINVX6 I_51 ( .A(N821), .Y(N822) );
  OR2X8 C1521 ( .A(n504), .B(N783), .Y(N819) );
  CLKINVX6 I_50 ( .A(N817), .Y(N818) );
  OR2X8 C1518 ( .A(N628), .B(N816), .Y(N817) );
  CLKINVX6 I_49 ( .A(N813), .Y(N814) );
  OR2X8 C1511 ( .A(N623), .B(N811), .Y(N812) );
  OR2X8 C1510 ( .A(n504), .B(n514), .Y(N811) );
  AND2X8 C1508 ( .A(n499), .B(N809), .Y(N810) );
  CLKINVX6 I_48 ( .A(N804), .Y(N805) );
  OR2X8 C1501 ( .A(N623), .B(N802), .Y(N803) );
  CLKINVX6 I_47 ( .A(N800), .Y(N801) );
  OR2X8 C1496 ( .A(N628), .B(N799), .Y(N800) );
  OR2X8 C1495 ( .A(N623), .B(N798), .Y(N799) );
  OR2X8 C1494 ( .A(n504), .B(n514), .Y(N798) );
  CLKINVX6 I_46 ( .A(N796), .Y(N797) );
  OR2X8 C1488 ( .A(n504), .B(n514), .Y(N794) );
  CLKINVX6 I_45 ( .A(N792), .Y(N793) );
  OR2X8 C1486 ( .A(n499), .B(N791), .Y(N792) );
  CLKINVX6 I_44 ( .A(N786), .Y(N787) );
  OR2X8 C1478 ( .A(n504), .B(N783), .Y(N784) );
  CLKINVX6 I_42 ( .A(N781), .Y(N782) );
  OR2X8 C1475 ( .A(N628), .B(N780), .Y(N781) );
  OR2X8 C1474 ( .A(N623), .B(N779), .Y(N780) );
  CLKINVX6 I_41 ( .A(N777), .Y(N778) );
  OR2X8 C1467 ( .A(N623), .B(N775), .Y(N776) );
  CLKINVX6 I_40 ( .A(N773), .Y(N774) );
  OR2X8 C1461 ( .A(N623), .B(N771), .Y(N772) );
  OR2X8 C1460 ( .A(n504), .B(n514), .Y(N771) );
  CLKINVX6 I_39 ( .A(N769), .Y(N770) );
  OR2X8 C1457 ( .A(N628), .B(N768), .Y(N769) );
  OR2X8 C1455 ( .A(n504), .B(n514), .Y(N767) );
  CLKINVX6 I_38 ( .A(N765), .Y(N766) );
  OR2X8 C1450 ( .A(n504), .B(n514), .Y(N763) );
  CLKINVX6 I_37 ( .A(N761), .Y(N762) );
  OR2X8 C1448 ( .A(N628), .B(N760), .Y(N761) );
  OR2X8 C1447 ( .A(N623), .B(N759), .Y(N760) );
  OR2X8 C1446 ( .A(n504), .B(n514), .Y(N759) );
  CLKINVX6 I_36 ( .A(N757), .Y(N758) );
  OR2X8 C1442 ( .A(N628), .B(N756), .Y(N757) );
  OR2X8 C1440 ( .A(n504), .B(n514), .Y(N755) );
  AND2X8 C1438 ( .A(n499), .B(N753), .Y(N754) );
  CLKINVX6 I_35 ( .A(N742), .Y(N743) );
  OR2X8 C1426 ( .A(n499), .B(N741), .Y(N742) );
  CLKINVX6 I_34 ( .A(N730), .Y(N731) );
  OR2X8 C1414 ( .A(N719), .B(N729), .Y(N730) );
  OR2X8 C1413 ( .A(N718), .B(N728), .Y(N729) );
  OR2X8 C1412 ( .A(N717), .B(N727), .Y(N728) );
  OR2X8 C1411 ( .A(N716), .B(N726), .Y(N727) );
  OR2X8 C1410 ( .A(N715), .B(N725), .Y(N726) );
  OR2X8 C1409 ( .A(N714), .B(N724), .Y(N725) );
  OR2X8 C1408 ( .A(N713), .B(N723), .Y(N724) );
  OR2X8 C1407 ( .A(N712), .B(N722), .Y(N723) );
  OR2X8 C1406 ( .A(N711), .B(N721), .Y(N722) );
  OR2X8 C1405 ( .A(N710), .B(N720), .Y(N721) );
  OR2X8 C1404 ( .A(n492), .B(n486), .Y(N720) );
  CLKINVX6 I_23 ( .A(N708), .Y(N709) );
  OR2X8 C1392 ( .A(N653), .B(N707), .Y(N708) );
  OR2X8 C1391 ( .A(N652), .B(N706), .Y(N707) );
  OR2X8 C1390 ( .A(N651), .B(N705), .Y(N706) );
  OR2X8 C1389 ( .A(N650), .B(N704), .Y(N705) );
  OR2X8 C1388 ( .A(N649), .B(N703), .Y(N704) );
  OR2X8 C1387 ( .A(N648), .B(N702), .Y(N703) );
  OR2X8 C1386 ( .A(N647), .B(N701), .Y(N702) );
  OR2X8 C1385 ( .A(N646), .B(N700), .Y(N701) );
  OR2X8 C1384 ( .A(N645), .B(N699), .Y(N700) );
  OR2X8 C1383 ( .A(N644), .B(N698), .Y(N699) );
  CLKINVX6 I_22 ( .A(N696), .Y(N697) );
  OR2X8 C1370 ( .A(n499), .B(N695), .Y(N696) );
  OR2X8 C1369 ( .A(N652), .B(N694), .Y(N695) );
  OR2X8 C1368 ( .A(N651), .B(N693), .Y(N694) );
  OR2X8 C1367 ( .A(N650), .B(N692), .Y(N693) );
  OR2X8 C1366 ( .A(N649), .B(N648), .Y(N692) );
  CLKINVX6 I_21 ( .A(N690), .Y(N691) );
  OR2X8 C1359 ( .A(n499), .B(N689), .Y(N690) );
  OR2X8 C1358 ( .A(N652), .B(N688), .Y(N689) );
  OR2X8 C1357 ( .A(N651), .B(N687), .Y(N688) );
  OR2X8 C1356 ( .A(N650), .B(N686), .Y(N687) );
  OR2X8 C1355 ( .A(N649), .B(N685), .Y(N686) );
  OR2X8 C1354 ( .A(N648), .B(N684), .Y(N685) );
  OR2X8 C1352 ( .A(N646), .B(N682), .Y(N683) );
  OR2X8 C1351 ( .A(N645), .B(N681), .Y(N682) );
  OR2X8 C1350 ( .A(N644), .B(N680), .Y(N681) );
  OR2X8 C1349 ( .A(N667), .B(N666), .Y(N680) );
  CLKINVX6 I_20 ( .A(N678), .Y(N679) );
  OR2X8 C1337 ( .A(n499), .B(N677), .Y(N678) );
  OR2X8 C1336 ( .A(N652), .B(N676), .Y(N677) );
  OR2X8 C1335 ( .A(N651), .B(N675), .Y(N676) );
  OR2X8 C1334 ( .A(N650), .B(N674), .Y(N675) );
  OR2X8 C1333 ( .A(N649), .B(N673), .Y(N674) );
  OR2X8 C1332 ( .A(N648), .B(N672), .Y(N673) );
  OR2X8 C1330 ( .A(N646), .B(N670), .Y(N671) );
  OR2X8 C1329 ( .A(N645), .B(N669), .Y(N670) );
  OR2X8 C1328 ( .A(N644), .B(N668), .Y(N669) );
  OR2X8 C1327 ( .A(N667), .B(N666), .Y(N668) );
  CLKINVX6 I_17 ( .A(N664), .Y(N665) );
  OR2X8 C1315 ( .A(N653), .B(N663), .Y(N664) );
  OR2X8 C1314 ( .A(N652), .B(N662), .Y(N663) );
  OR2X8 C1313 ( .A(N651), .B(N661), .Y(N662) );
  OR2X8 C1312 ( .A(N650), .B(N660), .Y(N661) );
  OR2X8 C1311 ( .A(N649), .B(N659), .Y(N660) );
  OR2X8 C1310 ( .A(N648), .B(N658), .Y(N659) );
  OR2X8 C1309 ( .A(N647), .B(N657), .Y(N658) );
  OR2X8 C1308 ( .A(N646), .B(N656), .Y(N657) );
  OR2X8 C1307 ( .A(N645), .B(N655), .Y(N656) );
  OR2X8 C1306 ( .A(N644), .B(N654), .Y(N655) );
  CLKINVX6 I_6 ( .A(N642), .Y(N643) );
  OR2X8 C1291 ( .A(n504), .B(n514), .Y(N640) );
  AND2X8 C1290 ( .A(state[0]), .B(N638), .Y(N639) );
  CLKINVX6 I_5 ( .A(N636), .Y(N637) );
  CLKINVX6 I_3 ( .A(N631), .Y(N632) );
  OR2X8 C1282 ( .A(N628), .B(N630), .Y(N631) );
  OR2X8 C1280 ( .A(n504), .B(n514), .Y(N629) );
  CLKINVX6 I_2 ( .A(n502), .Y(N628) );
  OR2X8 C1276 ( .A(N623), .B(N624), .Y(N625) );
  OR2X8 C1275 ( .A(n504), .B(n514), .Y(N624) );
  CLKINVX6 I_0 ( .A(count[1]), .Y(N623) );
  OR2X8 C540 ( .A(N783), .B(n504), .Y(N292) );
  OR2X8 C536 ( .A(N623), .B(N628), .Y(N289) );
  OR2X8 C512 ( .A(N623), .B(N628), .Y(N273) );
  OR2X8 C511 ( .A(n514), .B(n504), .Y(N272) );
  OR2X8 C505 ( .A(n514), .B(n504), .Y(N268) );
  OR2X8 C500 ( .A(n514), .B(n504), .Y(N264) );
  OR2X8 C428 ( .A(N783), .B(n504), .Y(N242) );
  OR2X8 C424 ( .A(N623), .B(N628), .Y(N239) );
  OR2X8 C400 ( .A(N623), .B(N628), .Y(N223) );
  OR2X8 C399 ( .A(n514), .B(n504), .Y(N222) );
  OR2X8 C393 ( .A(n514), .B(n504), .Y(N218) );
  OR2X8 C388 ( .A(n514), .B(n504), .Y(N214) );
  AND2X8 C385 ( .A(N623), .B(N628), .Y(N212) );
  OR2X8 C335 ( .A(N783), .B(n504), .Y(N190) );
  OR2X8 C331 ( .A(N623), .B(N628), .Y(N187) );
  OR2X8 C307 ( .A(N623), .B(N628), .Y(N171) );
  OR2X8 C306 ( .A(n514), .B(n504), .Y(N170) );
  OR2X8 C300 ( .A(n514), .B(n504), .Y(N166) );
  OR2X8 C295 ( .A(n514), .B(n504), .Y(N162) );
  AND2X8 C292 ( .A(N623), .B(N628), .Y(N160) );
  OR2X8 C227 ( .A(N823), .B(N824), .Y(N152) );
  OR2X8 C222 ( .A(N823), .B(state[1]), .Y(N149) );
  OR2X8 C217 ( .A(N823), .B(state[1]), .Y(N146) );
  AND2X8 C201 ( .A(N823), .B(N824), .Y(N135) );
  DFFRX4 kernel1_done_reg ( .D(n377), .CK(clk), .RN(n256), .Q(kernel1_done) );
  DFFRX4 \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(n256), .Q(state[1]), 
        .QN(N824) );
  DFFRX4 \state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(n256), .Q(state[0]), 
        .QN(n132) );
  DFFRX4 \psum_reg_reg[1]  ( .D(n337), .CK(clk), .RN(n256), .Q(psum_reg[1]) );
  DFFRX4 \psum_reg_reg[2]  ( .D(n338), .CK(clk), .RN(n256), .Q(psum_reg[2]) );
  DFFRX4 \psum_reg_reg[3]  ( .D(n339), .CK(clk), .RN(n256), .Q(psum_reg[3]) );
  DFFRX4 \psum_reg_reg[4]  ( .D(n340), .CK(clk), .RN(n256), .Q(psum_reg[4]) );
  DFFRX4 \psum_reg_reg[5]  ( .D(n341), .CK(clk), .RN(n256), .Q(psum_reg[5]) );
  DFFRX4 \psum_reg_reg[6]  ( .D(n342), .CK(clk), .RN(n256), .Q(psum_reg[6]) );
  DFFRX4 \psum_reg_reg[7]  ( .D(n343), .CK(clk), .RN(n256), .Q(psum_reg[7]) );
  DFFRX4 \psum_reg_reg[8]  ( .D(n344), .CK(clk), .RN(n256), .Q(psum_reg[8]) );
  DFFRX4 \psum_reg_reg[9]  ( .D(n345), .CK(clk), .RN(n256), .Q(psum_reg[9]) );
  DFFRX4 \psum_reg_reg[10]  ( .D(n346), .CK(clk), .RN(n256), .Q(psum_reg[10])
         );
  DFFRX4 \psum_reg_reg[11]  ( .D(n347), .CK(clk), .RN(n256), .Q(psum_reg[11])
         );
  DFFRX4 \psum_reg_reg[12]  ( .D(n348), .CK(clk), .RN(n256), .Q(psum_reg[12])
         );
  DFFRX4 \psum_reg_reg[13]  ( .D(n349), .CK(clk), .RN(n256), .Q(psum_reg[13])
         );
  DFFRX4 \psum_reg_reg[14]  ( .D(n350), .CK(clk), .RN(n256), .Q(psum_reg[14])
         );
  DFFRX4 \psum_reg_reg[15]  ( .D(n351), .CK(clk), .RN(n256), .Q(psum_reg[15])
         );
  DFFRX4 \psum_reg_reg[16]  ( .D(n352), .CK(clk), .RN(n256), .Q(psum_reg[16])
         );
  DFFRX4 \psum_reg_reg[17]  ( .D(n353), .CK(clk), .RN(n256), .Q(psum_reg[17])
         );
  DFFRX4 \psum_reg_reg[18]  ( .D(n354), .CK(clk), .RN(n256), .Q(psum_reg[18])
         );
  DFFRX4 \psum_reg_reg[19]  ( .D(n355), .CK(clk), .RN(n256), .Q(psum_reg[19])
         );
  DFFRX4 \psum_reg_reg[20]  ( .D(n356), .CK(clk), .RN(n256), .Q(psum_reg[20])
         );
  DFFRX4 \psum_reg_reg[21]  ( .D(n357), .CK(clk), .RN(n256), .Q(psum_reg[21])
         );
  DFFRX4 \psum_reg_reg[22]  ( .D(n358), .CK(clk), .RN(n256), .Q(psum_reg[22])
         );
  DFFRX4 \psum_reg_reg[23]  ( .D(n359), .CK(clk), .RN(n256), .Q(psum_reg[23])
         );
  DFFRX4 \psum_reg_reg[24]  ( .D(n360), .CK(clk), .RN(n256), .Q(psum_reg[24])
         );
  DFFRX4 \psum_reg_reg[25]  ( .D(n361), .CK(clk), .RN(n256), .Q(psum_reg[25])
         );
  DFFRX4 \psum_reg_reg[26]  ( .D(n362), .CK(clk), .RN(n256), .Q(psum_reg[26])
         );
  DFFRX4 \psum_reg_reg[27]  ( .D(n363), .CK(clk), .RN(n256), .Q(psum_reg[27])
         );
  DFFRX4 \psum_reg_reg[28]  ( .D(n364), .CK(clk), .RN(n256), .Q(psum_reg[28])
         );
  DFFRX4 \psum_reg_reg[29]  ( .D(n365), .CK(clk), .RN(n256), .Q(psum_reg[29])
         );
  DFFRX4 \psum_reg_reg[30]  ( .D(n366), .CK(clk), .RN(n256), .Q(psum_reg[30])
         );
  DFFRX4 \psum_reg_reg[31]  ( .D(n367), .CK(clk), .RN(n256), .Q(psum_reg[31])
         );
  DFFRX4 \psum_reg_reg[32]  ( .D(n368), .CK(clk), .RN(n256), .Q(psum_reg[32])
         );
  DFFRX4 \psum_reg_reg[33]  ( .D(n369), .CK(clk), .RN(n256), .Q(psum_reg[33])
         );
  DFFRX4 \psum_reg_reg[34]  ( .D(n370), .CK(clk), .RN(n256), .Q(psum_reg[34])
         );
  DFFRX4 \psum_reg_reg[35]  ( .D(n371), .CK(clk), .RN(n256), .Q(psum_reg[35])
         );
  DFFRX4 \psum_reg_reg[36]  ( .D(n372), .CK(clk), .RN(n256), .Q(psum_reg[36])
         );
  DFFRX4 \psum_reg_reg[37]  ( .D(n373), .CK(clk), .RN(n256), .Q(psum_reg[37])
         );
  DFFRX4 \psum_reg_reg[38]  ( .D(n374), .CK(clk), .RN(n256), .Q(psum_reg[38])
         );
  DFFRX4 \psum_reg_reg[39]  ( .D(n375), .CK(clk), .RN(n256), .Q(psum_reg[39])
         );
  DFFRX4 \psum_reg_reg[0]  ( .D(n376), .CK(clk), .RN(n256), .Q(psum_reg[0]) );
  DFFRX4 \addr_reg[1]  ( .D(n336), .CK(clk), .RN(n256), .Q(Top_Mid_addr[1]), 
        .QN(N652) );
  DFFRX4 \addr_reg[2]  ( .D(n334), .CK(clk), .RN(n256), .Q(Top_Mid_addr[2]), 
        .QN(N651) );
  DFFRX4 \addr_reg[3]  ( .D(n333), .CK(clk), .RN(n256), .Q(Top_Mid_addr[3]), 
        .QN(N650) );
  DFFRX4 \addr_reg[11]  ( .D(n325), .CK(clk), .RN(n256), .Q(Mid_addr[11]), 
        .QN(N666) );
  DFFRX4 \addr_reg[10]  ( .D(n326), .CK(clk), .RN(n256), .Q(Mid_addr[10]), 
        .QN(N667) );
  DFFRX4 \addr_reg[4]  ( .D(n332), .CK(clk), .RN(n256), .Q(Top_Mid_addr[4]), 
        .QN(N649) );
  DFFRX4 \addr_reg[5]  ( .D(n331), .CK(clk), .RN(n256), .Q(Top_Mid_addr[5]), 
        .QN(N648) );
  DFFRX4 \addr_reg[6]  ( .D(n330), .CK(clk), .RN(n256), .Q(Mid_addr[6]), .QN(
        N647) );
  DFFRX4 \addr_reg[7]  ( .D(n329), .CK(clk), .RN(n256), .Q(Mid_addr[7]), .QN(
        N646) );
  DFFRX4 \addr_reg[8]  ( .D(n328), .CK(clk), .RN(n256), .Q(Mid_addr[8]), .QN(
        N645) );
  DFFRX4 \addr_reg[9]  ( .D(n327), .CK(clk), .RN(n256), .Q(Mid_addr[9]), .QN(
        N644) );
  DFFRX4 \caddr_wr_reg[1]  ( .D(n319), .CK(clk), .RN(n256), .Q(n577), .QN(N718) );
  DFFRX4 \caddr_wr_reg[0]  ( .D(n318), .CK(clk), .RN(n256), .Q(n578), .QN(N719) );
  DFFRX4 \caddr_wr_reg[2]  ( .D(n317), .CK(clk), .RN(n256), .Q(n576), .QN(N717) );
  DFFRX4 \caddr_wr_reg[3]  ( .D(n316), .CK(clk), .RN(n256), .Q(n575), .QN(N716) );
  DFFRX4 \caddr_wr_reg[4]  ( .D(n315), .CK(clk), .RN(n256), .Q(n574), .QN(N715) );
  DFFRX4 \caddr_wr_reg[5]  ( .D(n314), .CK(clk), .RN(n256), .Q(n573), .QN(N714) );
  DFFRX4 \caddr_wr_reg[6]  ( .D(n313), .CK(clk), .RN(n256), .Q(n572), .QN(N713) );
  DFFRX4 \caddr_wr_reg[7]  ( .D(n312), .CK(clk), .RN(n256), .Q(n571), .QN(N712) );
  DFFRX4 \caddr_wr_reg[8]  ( .D(n311), .CK(clk), .RN(n256), .Q(n570), .QN(N711) );
  DFFRX4 \caddr_wr_reg[9]  ( .D(n310), .CK(clk), .RN(n256), .Q(n569), .QN(N710) );
  DFFRX4 \caddr_wr_reg[10]  ( .D(n309), .CK(clk), .RN(n256), .Q(n568) );
  DFFRX4 \caddr_wr_reg[11]  ( .D(n308), .CK(clk), .RN(n256), .Q(n567) );
  DFFRX4 \max_temp_reg[0]  ( .D(n307), .CK(clk), .RN(n256), .Q(max_temp[0]) );
  DFFRX4 \max_temp_reg[1]  ( .D(n288), .CK(clk), .RN(n256), .Q(max_temp[1]) );
  DFFRX4 \max_temp_reg[2]  ( .D(n289), .CK(clk), .RN(n256), .Q(max_temp[2]) );
  DFFRX4 \max_temp_reg[3]  ( .D(n290), .CK(clk), .RN(n256), .Q(max_temp[3]) );
  DFFRX4 \max_temp_reg[4]  ( .D(n291), .CK(clk), .RN(n256), .Q(max_temp[4]) );
  DFFRX4 \max_temp_reg[5]  ( .D(n292), .CK(clk), .RN(n256), .Q(max_temp[5]) );
  DFFRX4 \max_temp_reg[6]  ( .D(n293), .CK(clk), .RN(n256), .Q(max_temp[6]) );
  DFFRX4 \max_temp_reg[7]  ( .D(n294), .CK(clk), .RN(n256), .Q(max_temp[7]) );
  DFFRX4 \max_temp_reg[8]  ( .D(n295), .CK(clk), .RN(n256), .Q(max_temp[8]) );
  DFFRX4 \max_temp_reg[9]  ( .D(n296), .CK(clk), .RN(n256), .Q(max_temp[9]) );
  DFFRX4 \max_temp_reg[10]  ( .D(n297), .CK(clk), .RN(n256), .Q(max_temp[10])
         );
  DFFRX4 \max_temp_reg[11]  ( .D(n298), .CK(clk), .RN(n256), .Q(max_temp[11])
         );
  DFFRX4 \max_temp_reg[12]  ( .D(n299), .CK(clk), .RN(n256), .Q(max_temp[12])
         );
  DFFRX4 \max_temp_reg[13]  ( .D(n300), .CK(clk), .RN(n256), .Q(max_temp[13])
         );
  DFFRX4 \max_temp_reg[14]  ( .D(n301), .CK(clk), .RN(n256), .Q(max_temp[14])
         );
  DFFRX4 \max_temp_reg[15]  ( .D(n302), .CK(clk), .RN(n256), .Q(max_temp[15])
         );
  DFFRX4 \max_temp_reg[16]  ( .D(n303), .CK(clk), .RN(n256), .Q(max_temp[16])
         );
  DFFRX4 \max_temp_reg[17]  ( .D(n304), .CK(clk), .RN(n256), .Q(max_temp[17])
         );
  DFFRX4 \max_temp_reg[18]  ( .D(n305), .CK(clk), .RN(n256), .Q(max_temp[18])
         );
  DFFRX4 \max_temp_reg[19]  ( .D(n306), .CK(clk), .RN(n256), .Q(max_temp[19])
         );
  NOR2X1 U6 ( .A(n71), .B(n72), .Y(n64) );
  CLKINVX1 U7 ( .A(n73), .Y(n71) );
  NAND2X1 U9 ( .A(N177), .B(n501), .Y(n66) );
  CLKINVX1 U13 ( .A(n80), .Y(n78) );
  NAND2X1 U29 ( .A(N173), .B(n501), .Y(n83) );
  OA21XL U30 ( .A0(n512), .A1(n84), .B0(n85), .Y(n77) );
  OAI31XL U31 ( .A0(N221), .A1(N237), .A2(N225), .B0(n512), .Y(n85) );
  NOR2X1 U32 ( .A(N165), .B(n86), .Y(n84) );
  NOR2X1 U34 ( .A(N189), .B(n88), .Y(n87) );
  NAND2X1 U36 ( .A(n80), .B(n501), .Y(n89) );
  NAND2X1 U37 ( .A(n90), .B(n91), .Y(n80) );
  AND3X1 U39 ( .A(n94), .B(n68), .C(n70), .Y(n93) );
  NOR2BX1 U42 ( .AN(n67), .B(weight[1]), .Y(n96) );
  NAND2X1 U44 ( .A(n97), .B(n91), .Y(n86) );
  AOI21X1 U45 ( .A0(n512), .A1(N233), .B0(n72), .Y(n81) );
  CLKINVX1 U46 ( .A(n94), .Y(n72) );
  NAND2X1 U47 ( .A(N181), .B(n501), .Y(n94) );
  CLKINVX1 U48 ( .A(N193), .Y(n90) );
  NOR2X1 U50 ( .A(N165), .B(N173), .Y(n98) );
  AND2X1 U51 ( .A(n61), .B(n92), .Y(n69) );
  NOR2X1 U52 ( .A(N245), .B(N225), .Y(n92) );
  NOR2BX1 U53 ( .AN(n99), .B(N241), .Y(n61) );
  AOI2BB2X1 U55 ( .B0(N221), .B1(n512), .A0N(n512), .A1N(n91), .Y(n100) );
  NAND2X1 U56 ( .A(N160), .B(N159), .Y(n91) );
  AND2X1 U57 ( .A(n70), .B(n101), .Y(n65) );
  OAI21XL U58 ( .A0(N217), .A1(N237), .B0(n512), .Y(n101) );
  OA21XL U59 ( .A0(n512), .A1(n102), .B0(n82), .Y(n76) );
  OA21XL U60 ( .A0(n501), .A1(n103), .B0(n75), .Y(n82) );
  NAND2X1 U61 ( .A(N189), .B(n501), .Y(n75) );
  NAND2X1 U64 ( .A(N229), .B(n512), .Y(n67) );
  CLKINVX1 U65 ( .A(N245), .Y(n79) );
  CLKINVX1 U66 ( .A(n88), .Y(n104) );
  NAND2X1 U67 ( .A(n102), .B(n97), .Y(n88) );
  CLKINVX1 U68 ( .A(N185), .Y(n97) );
  NOR3X1 U69 ( .A(N181), .B(N193), .C(N177), .Y(n102) );
  AOI2BB2X1 U71 ( .B0(n501), .B1(N193), .A0N(n501), .A1N(n99), .Y(n105) );
  NOR2X1 U72 ( .A(N237), .B(n95), .Y(n99) );
  CLKINVX1 U73 ( .A(n103), .Y(n95) );
  NAND2X1 U74 ( .A(N212), .B(N211), .Y(n103) );
  NAND2X1 U77 ( .A(N169), .B(n501), .Y(n70) );
  CLKINVX1 U78 ( .A(n106), .Y(psum_bias[31]) );
  CLKINVX1 U79 ( .A(n107), .Y(psum_bias[30]) );
  CLKINVX1 U80 ( .A(n108), .Y(psum_bias[29]) );
  CLKINVX1 U81 ( .A(n109), .Y(psum_bias[28]) );
  CLKINVX1 U82 ( .A(n110), .Y(psum_bias[27]) );
  CLKINVX1 U83 ( .A(n111), .Y(psum_bias[26]) );
  CLKINVX1 U84 ( .A(n112), .Y(psum_bias[25]) );
  CLKINVX1 U85 ( .A(n113), .Y(psum_bias[24]) );
  CLKINVX1 U86 ( .A(n114), .Y(psum_bias[23]) );
  CLKINVX1 U87 ( .A(n115), .Y(psum_bias[22]) );
  CLKINVX1 U88 ( .A(n116), .Y(psum_bias[21]) );
  CLKINVX1 U89 ( .A(n117), .Y(psum_bias[20]) );
  CLKINVX1 U90 ( .A(n118), .Y(psum_bias[19]) );
  CLKINVX1 U91 ( .A(n119), .Y(psum_bias[18]) );
  CLKINVX1 U92 ( .A(n120), .Y(psum_bias[17]) );
  CLKINVX1 U93 ( .A(n121), .Y(psum_bias[16]) );
  NOR3X1 U94 ( .A(n122), .B(n514), .C(n504), .Y(pool_address_0) );
  AOI2BB1X1 U95 ( .A0N(n123), .A1N(n124), .B0(N304), .Y(n122) );
  NOR3X1 U96 ( .A(n125), .B(n514), .C(n504), .Y(\pool_address[6] ) );
  AOI2BB1X1 U97 ( .A0N(n123), .A1N(n124), .B0(N306), .Y(n125) );
  NAND4BBXL U98 ( .AN(N145), .BN(N151), .C(n126), .D(n127), .Y(next_state[2])
         );
  NAND2X1 U99 ( .A(layer_0_done), .B(N148), .Y(n126) );
  NAND3BX1 U100 ( .AN(N139), .B(n127), .C(n128), .Y(next_state[1]) );
  AOI22X1 U101 ( .A0(one_stride_done), .A1(N142), .B0(pooling_done), .B1(N151), 
        .Y(n128) );
  CLKINVX1 U102 ( .A(N154), .Y(n127) );
  NAND4BBXL U103 ( .AN(N142), .BN(N148), .C(n129), .D(n130), .Y(next_state[0])
         );
  AOI22X1 U104 ( .A0(N151), .A1(n131), .B0(flatten_done), .B1(N154), .Y(n130)
         );
  NAND3X1 U105 ( .A(N135), .B(n132), .C(ready), .Y(n129) );
  NOR2BX1 U106 ( .AN(idata[9]), .B(padding_flag), .Y(ifmap[9]) );
  NOR2BX1 U107 ( .AN(idata[8]), .B(padding_flag), .Y(ifmap[8]) );
  NOR2BX1 U109 ( .AN(idata[6]), .B(padding_flag), .Y(ifmap[6]) );
  NOR2BX1 U111 ( .AN(idata[4]), .B(padding_flag), .Y(ifmap[4]) );
  NOR2BX1 U113 ( .AN(idata[2]), .B(padding_flag), .Y(ifmap[2]) );
  NOR2BX1 U116 ( .AN(idata[18]), .B(padding_flag), .Y(ifmap[18]) );
  NOR2BX1 U118 ( .AN(idata[16]), .B(padding_flag), .Y(ifmap[16]) );
  NOR2BX1 U120 ( .AN(idata[14]), .B(padding_flag), .Y(ifmap[14]) );
  NOR2BX1 U121 ( .AN(idata[13]), .B(padding_flag), .Y(ifmap[13]) );
  NOR2BX1 U122 ( .AN(idata[12]), .B(padding_flag), .Y(ifmap[12]) );
  NOR2BX1 U124 ( .AN(idata[10]), .B(padding_flag), .Y(ifmap[10]) );
  NOR2BX1 U125 ( .AN(idata[0]), .B(padding_flag), .Y(ifmap[0]) );
  NAND3X1 U126 ( .A(n133), .B(n134), .C(n135), .Y(n556) );
  AOI221XL U127 ( .A0(Top_Mid_addr[9]), .A1(N267), .B0(Top_Right_addr[9]), 
        .B1(N271), .C0(n136), .Y(n135) );
  AO22X1 U128 ( .A0(N279), .A1(Mid_addr[9]), .B0(N283), .B1(Mid_Right_addr[9]), 
        .Y(n136) );
  AOI222XL U129 ( .A0(N295), .A1(Bottom_Right_addr[9]), .B0(Top_Left_addr[9]), 
        .B1(n137), .C0(N287), .C1(Bottom_Left_addr[9]), .Y(n134) );
  AOI22X1 U130 ( .A0(N291), .A1(Bottom_addr[9]), .B0(N275), .B1(
        Mid_Left_addr[9]), .Y(n133) );
  NAND3X1 U131 ( .A(n138), .B(n139), .C(n140), .Y(n557) );
  AOI221XL U132 ( .A0(Top_Mid_addr[8]), .A1(N267), .B0(Top_Right_addr[8]), 
        .B1(N271), .C0(n141), .Y(n140) );
  AOI222XL U134 ( .A0(Bottom_Right_addr[8]), .A1(N295), .B0(Top_Left_addr[8]), 
        .B1(n137), .C0(Bottom_Left_addr[8]), .C1(N287), .Y(n139) );
  AOI22X1 U135 ( .A0(Bottom_addr[8]), .A1(N291), .B0(Mid_Left_addr[8]), .B1(
        N275), .Y(n138) );
  NAND3X1 U136 ( .A(n142), .B(n143), .C(n144), .Y(n558) );
  AOI221XL U137 ( .A0(Top_Mid_addr[7]), .A1(N267), .B0(Top_Right_addr[7]), 
        .B1(N271), .C0(n145), .Y(n144) );
  AOI222XL U139 ( .A0(Bottom_Right_addr[7]), .A1(N295), .B0(Top_Left_addr[7]), 
        .B1(n137), .C0(Bottom_Left_addr[7]), .C1(N287), .Y(n143) );
  AOI22X1 U140 ( .A0(Bottom_addr[7]), .A1(N291), .B0(Mid_Left_addr[7]), .B1(
        N275), .Y(n142) );
  NAND3X1 U141 ( .A(n146), .B(n147), .C(n148), .Y(n559) );
  AOI221XL U142 ( .A0(Top_Mid_addr[6]), .A1(N267), .B0(Top_Right_addr[6]), 
        .B1(N271), .C0(n149), .Y(n148) );
  AOI222XL U144 ( .A0(Bottom_Right_addr[6]), .A1(N295), .B0(Top_Left_addr[6]), 
        .B1(n137), .C0(Bottom_Left_addr[6]), .C1(N287), .Y(n147) );
  AOI22X1 U145 ( .A0(Bottom_addr[6]), .A1(N291), .B0(Mid_Left_addr[6]), .B1(
        N275), .Y(n146) );
  NAND3X1 U146 ( .A(n150), .B(n151), .C(n152), .Y(n560) );
  AOI221XL U147 ( .A0(Top_Mid_addr[5]), .A1(N267), .B0(Top_Right_addr[5]), 
        .B1(N271), .C0(n153), .Y(n152) );
  AOI222XL U149 ( .A0(Bottom_Right_addr[5]), .A1(N295), .B0(Top_Left_addr[5]), 
        .B1(n137), .C0(Bottom_Left_addr[5]), .C1(N287), .Y(n151) );
  NAND3X1 U151 ( .A(n154), .B(n155), .C(n156), .Y(n561) );
  AOI221XL U152 ( .A0(Top_Mid_addr[4]), .A1(N267), .B0(Top_Right_addr[4]), 
        .B1(N271), .C0(n157), .Y(n156) );
  AOI222XL U154 ( .A0(Bottom_Right_addr[4]), .A1(N295), .B0(Top_Left_addr[4]), 
        .B1(n137), .C0(Bottom_Left_addr[4]), .C1(N287), .Y(n155) );
  NAND3X1 U156 ( .A(n158), .B(n159), .C(n160), .Y(n562) );
  AOI221XL U157 ( .A0(Top_Mid_addr[3]), .A1(N267), .B0(Top_Right_addr[3]), 
        .B1(N271), .C0(n161), .Y(n160) );
  AOI222XL U159 ( .A0(Bottom_Right_addr[3]), .A1(N295), .B0(Top_Left_addr[3]), 
        .B1(n137), .C0(Bottom_Left_addr[3]), .C1(N287), .Y(n159) );
  NAND3X1 U161 ( .A(n162), .B(n163), .C(n164), .Y(n563) );
  AOI221XL U162 ( .A0(Top_Mid_addr[2]), .A1(N267), .B0(Top_Right_addr[2]), 
        .B1(N271), .C0(n165), .Y(n164) );
  AOI222XL U164 ( .A0(Bottom_Right_addr[2]), .A1(N295), .B0(Top_Left_addr[2]), 
        .B1(n137), .C0(Bottom_Left_addr[2]), .C1(N287), .Y(n163) );
  NAND3X1 U166 ( .A(n166), .B(n167), .C(n168), .Y(n564) );
  AOI221XL U167 ( .A0(Top_Mid_addr[1]), .A1(N267), .B0(Top_Right_addr[1]), 
        .B1(N271), .C0(n169), .Y(n168) );
  AOI222XL U169 ( .A0(Bottom_Right_addr[1]), .A1(N295), .B0(Top_Left_addr[1]), 
        .B1(n137), .C0(Bottom_Left_addr[1]), .C1(N287), .Y(n167) );
  NAND3X1 U171 ( .A(n170), .B(n171), .C(n172), .Y(n554) );
  AOI221XL U172 ( .A0(Top_Mid_addr[11]), .A1(N267), .B0(Top_Right_addr[11]), 
        .B1(N271), .C0(n173), .Y(n172) );
  AO22X1 U173 ( .A0(Mid_addr[11]), .A1(N279), .B0(Mid_Right_addr[11]), .B1(
        N283), .Y(n173) );
  AOI222XL U174 ( .A0(Bottom_Right_addr[11]), .A1(N295), .B0(Top_Left_addr[11]), .B1(n137), .C0(Bottom_Left_addr[11]), .C1(N287), .Y(n171) );
  AOI22X1 U175 ( .A0(Bottom_addr[11]), .A1(N291), .B0(Mid_Left_addr[11]), .B1(
        N275), .Y(n170) );
  NAND3X1 U176 ( .A(n174), .B(n175), .C(n176), .Y(n555) );
  AOI221XL U177 ( .A0(Top_Mid_addr[10]), .A1(N267), .B0(Top_Right_addr[10]), 
        .B1(N271), .C0(n177), .Y(n176) );
  AOI222XL U179 ( .A0(Bottom_Right_addr[10]), .A1(N295), .B0(Top_Left_addr[10]), .B1(n137), .C0(Bottom_Left_addr[10]), .C1(N287), .Y(n175) );
  AOI22X1 U180 ( .A0(Bottom_addr[10]), .A1(N291), .B0(Mid_Left_addr[10]), .B1(
        N275), .Y(n174) );
  NAND3X1 U181 ( .A(n178), .B(n179), .C(n180), .Y(n565) );
  AOI221XL U182 ( .A0(n499), .A1(N267), .B0(Top_Right_addr[0]), .B1(N271), 
        .C0(n181), .Y(n180) );
  AO22X1 U183 ( .A0(n499), .A1(N279), .B0(Mid_Right_addr[0]), .B1(N283), .Y(
        n181) );
  AOI222XL U184 ( .A0(Bottom_Right_addr[0]), .A1(N295), .B0(Top_Left_addr[0]), 
        .B1(n137), .C0(Bottom_Left_addr[0]), .C1(N287), .Y(n179) );
  AOI22X1 U186 ( .A0(n499), .A1(N291), .B0(Mid_Left_addr[0]), .B1(N275), .Y(
        n178) );
  AOI31X1 U188 ( .A0(n185), .A1(n186), .A2(n187), .B0(n188), .Y(n184) );
  CLKINVX1 U189 ( .A(N643), .Y(n186) );
  AO21X1 U190 ( .A0(n512), .A1(n189), .B0(n190), .Y(n600) );
  OAI31XL U191 ( .A0(n182), .A1(n512), .A2(n183), .B0(n191), .Y(n190) );
  OAI21XL U192 ( .A0(pool_one_stride_done), .A1(n192), .B0(n193), .Y(n189) );
  NAND3BX1 U193 ( .AN(n188), .B(n191), .C(n194), .Y(n601) );
  AOI22X1 U194 ( .A0(N632), .A1(n187), .B0(n501), .B1(n195), .Y(n194) );
  NAND2X1 U195 ( .A(N643), .B(n187), .Y(n191) );
  AND2X1 U196 ( .A(N842), .B(n193), .Y(n187) );
  NOR3X1 U197 ( .A(n185), .B(N643), .C(n195), .Y(n188) );
  NAND2BX1 U198 ( .AN(N632), .B(N626), .Y(n185) );
  CLKINVX1 U200 ( .A(layer_0_flag), .Y(n193) );
  AOI22X1 U203 ( .A0(max_temp[9]), .A1(n196), .B0(n200), .B1(cdata_rd[9]), .Y(
        n199) );
  NAND2X1 U204 ( .A(N123), .B(n201), .Y(n198) );
  AOI22X1 U205 ( .A0(N81), .A1(n512), .B0(N102), .B1(n501), .Y(n112) );
  AOI22X1 U207 ( .A0(max_temp[8]), .A1(n196), .B0(n200), .B1(cdata_rd[8]), .Y(
        n203) );
  NAND2X1 U208 ( .A(N122), .B(n201), .Y(n202) );
  AOI22X1 U209 ( .A0(N80), .A1(n512), .B0(N101), .B1(n501), .Y(n113) );
  AOI22X1 U211 ( .A0(max_temp[7]), .A1(n196), .B0(n200), .B1(cdata_rd[7]), .Y(
        n205) );
  NAND2X1 U212 ( .A(N121), .B(n201), .Y(n204) );
  AOI22X1 U213 ( .A0(N79), .A1(n512), .B0(N100), .B1(n501), .Y(n114) );
  AOI22X1 U215 ( .A0(max_temp[6]), .A1(n196), .B0(n200), .B1(cdata_rd[6]), .Y(
        n207) );
  NAND2X1 U216 ( .A(N120), .B(n201), .Y(n206) );
  AOI22X1 U217 ( .A0(N99), .A1(n501), .B0(N78), .B1(n512), .Y(n115) );
  AOI22X1 U219 ( .A0(max_temp[5]), .A1(n196), .B0(n200), .B1(cdata_rd[5]), .Y(
        n209) );
  NAND2X1 U220 ( .A(N119), .B(n201), .Y(n208) );
  AOI22X1 U221 ( .A0(N98), .A1(n501), .B0(N77), .B1(n512), .Y(n116) );
  AOI22X1 U223 ( .A0(max_temp[4]), .A1(n196), .B0(n200), .B1(cdata_rd[4]), .Y(
        n211) );
  NAND2X1 U224 ( .A(N118), .B(n201), .Y(n210) );
  AOI22X1 U225 ( .A0(N97), .A1(n501), .B0(N76), .B1(n512), .Y(n117) );
  AOI22X1 U227 ( .A0(max_temp[3]), .A1(n196), .B0(n200), .B1(cdata_rd[3]), .Y(
        n213) );
  NAND2X1 U228 ( .A(N117), .B(n201), .Y(n212) );
  AOI22X1 U229 ( .A0(N96), .A1(n501), .B0(N75), .B1(n512), .Y(n118) );
  AOI22X1 U231 ( .A0(max_temp[2]), .A1(n196), .B0(n200), .B1(cdata_rd[2]), .Y(
        n215) );
  NAND2X1 U232 ( .A(N116), .B(n201), .Y(n214) );
  AOI22X1 U233 ( .A0(N95), .A1(n501), .B0(N74), .B1(n512), .Y(n119) );
  AOI22X1 U235 ( .A0(max_temp[1]), .A1(n196), .B0(n200), .B1(cdata_rd[1]), .Y(
        n217) );
  NAND2X1 U236 ( .A(N115), .B(n201), .Y(n216) );
  AOI22X1 U237 ( .A0(N94), .A1(n501), .B0(N73), .B1(n512), .Y(n120) );
  AO22X1 U238 ( .A0(cdata_rd[19]), .A1(n200), .B0(max_temp[19]), .B1(n196), 
        .Y(n579) );
  OAI211X1 U239 ( .A0(n195), .A1(n218), .B0(n219), .C0(n220), .Y(n580) );
  AOI22X1 U240 ( .A0(N111), .A1(n221), .B0(N90), .B1(n222), .Y(n220) );
  NAND2X1 U241 ( .A(max_temp[18]), .B(n196), .Y(n219) );
  OAI211X1 U242 ( .A0(n195), .A1(n223), .B0(n224), .C0(n225), .Y(n581) );
  AOI22X1 U243 ( .A0(N110), .A1(n221), .B0(N89), .B1(n222), .Y(n225) );
  NAND2X1 U244 ( .A(max_temp[17]), .B(n196), .Y(n224) );
  OAI211X1 U245 ( .A0(n195), .A1(n226), .B0(n227), .C0(n228), .Y(n582) );
  AOI22X1 U246 ( .A0(N109), .A1(n221), .B0(N88), .B1(n222), .Y(n228) );
  AND2X1 U247 ( .A(n229), .B(n512), .Y(n222) );
  AND2X1 U248 ( .A(n229), .B(n501), .Y(n221) );
  NAND2X1 U249 ( .A(max_temp[16]), .B(n196), .Y(n227) );
  CLKINVX1 U250 ( .A(n200), .Y(n195) );
  OAI211X1 U251 ( .A0(n106), .A1(n197), .B0(n230), .C0(n231), .Y(n583) );
  AOI22X1 U252 ( .A0(max_temp[15]), .A1(n196), .B0(n200), .B1(cdata_rd[15]), 
        .Y(n231) );
  NAND2X1 U253 ( .A(N129), .B(n201), .Y(n230) );
  AOI22X1 U254 ( .A0(N87), .A1(n512), .B0(N108), .B1(n501), .Y(n106) );
  OAI211X1 U255 ( .A0(n107), .A1(n197), .B0(n232), .C0(n233), .Y(n584) );
  AOI22X1 U256 ( .A0(max_temp[14]), .A1(n196), .B0(n200), .B1(cdata_rd[14]), 
        .Y(n233) );
  NAND2X1 U257 ( .A(N128), .B(n201), .Y(n232) );
  AOI22X1 U258 ( .A0(N86), .A1(n512), .B0(N107), .B1(n501), .Y(n107) );
  NAND2X1 U261 ( .A(N127), .B(n201), .Y(n234) );
  AOI22X1 U262 ( .A0(N85), .A1(n512), .B0(N106), .B1(n501), .Y(n108) );
  NAND2X1 U265 ( .A(N126), .B(n201), .Y(n236) );
  AOI22X1 U266 ( .A0(N84), .A1(n512), .B0(N105), .B1(n501), .Y(n109) );
  NAND2X1 U269 ( .A(N125), .B(n201), .Y(n238) );
  AOI22X1 U270 ( .A0(N83), .A1(n512), .B0(N104), .B1(n501), .Y(n110) );
  NAND2X1 U273 ( .A(N124), .B(n201), .Y(n240) );
  AOI22X1 U274 ( .A0(N82), .A1(n512), .B0(N103), .B1(n501), .Y(n111) );
  CLKINVX1 U279 ( .A(N843), .Y(n192) );
  NAND2X1 U280 ( .A(N114), .B(n201), .Y(n242) );
  AOI22X1 U283 ( .A0(N92), .A1(n501), .B0(N71), .B1(n512), .Y(n244) );
  AND2X1 U284 ( .A(n245), .B(layer_0_flag), .Y(n229) );
  OAI22XL U285 ( .A0(N91), .A1(n501), .B0(n512), .B1(N112), .Y(n245) );
  AOI22X1 U286 ( .A0(N93), .A1(n501), .B0(N72), .B1(n512), .Y(n121) );
  OR2X1 U287 ( .A(N639), .B(ready), .Y(N620) );
  NOR2BX1 U288 ( .AN(cdata_rd[19]), .B(n246), .Y(N616) );
  NOR2X1 U289 ( .A(n218), .B(n246), .Y(N615) );
  CLKINVX1 U290 ( .A(cdata_rd[18]), .Y(n218) );
  NOR2X1 U291 ( .A(n223), .B(n246), .Y(N614) );
  CLKINVX1 U292 ( .A(cdata_rd[17]), .Y(n223) );
  NOR2X1 U293 ( .A(n226), .B(n246), .Y(N613) );
  CLKINVX1 U294 ( .A(cdata_rd[16]), .Y(n226) );
  NOR2BX1 U295 ( .AN(cdata_rd[15]), .B(n246), .Y(N612) );
  NOR2BX1 U296 ( .AN(cdata_rd[14]), .B(n246), .Y(N611) );
  NOR2BX1 U297 ( .AN(cdata_rd[13]), .B(n246), .Y(N610) );
  NOR2BX1 U298 ( .AN(cdata_rd[12]), .B(n246), .Y(N609) );
  NOR2BX1 U299 ( .AN(cdata_rd[11]), .B(n246), .Y(N608) );
  NOR2BX1 U300 ( .AN(cdata_rd[10]), .B(n246), .Y(N607) );
  NOR2BX1 U301 ( .AN(cdata_rd[9]), .B(n246), .Y(N606) );
  NOR2BX1 U302 ( .AN(cdata_rd[8]), .B(n246), .Y(N605) );
  NOR2BX1 U303 ( .AN(cdata_rd[7]), .B(n246), .Y(N604) );
  NOR2BX1 U304 ( .AN(cdata_rd[6]), .B(n246), .Y(N603) );
  NOR2BX1 U305 ( .AN(cdata_rd[5]), .B(n246), .Y(N602) );
  NOR2BX1 U306 ( .AN(cdata_rd[4]), .B(n246), .Y(N601) );
  NOR2BX1 U307 ( .AN(cdata_rd[3]), .B(n246), .Y(N600) );
  NOR2BX1 U308 ( .AN(cdata_rd[2]), .B(n246), .Y(N599) );
  NOR2BX1 U309 ( .AN(cdata_rd[1]), .B(n246), .Y(N598) );
  NOR2BX1 U310 ( .AN(cdata_rd[0]), .B(n246), .Y(N597) );
  CLKINVX1 U313 ( .A(N637), .Y(n247) );
  NOR2X1 U314 ( .A(N579), .B(n248), .Y(N586) );
  NAND2BX1 U315 ( .AN(N579), .B(n248), .Y(N585) );
  NOR2X1 U316 ( .A(N580), .B(N581), .Y(n248) );
  NOR2X1 U317 ( .A(N566), .B(n249), .Y(N573) );
  NAND2BX1 U318 ( .AN(N566), .B(n249), .Y(N572) );
  NOR2X1 U319 ( .A(N567), .B(N568), .Y(n249) );
  NOR2BX1 U321 ( .AN(psum[38]), .B(n250), .Y(N563) );
  NOR2BX1 U322 ( .AN(psum[37]), .B(n250), .Y(N562) );
  NOR2BX1 U323 ( .AN(psum[36]), .B(n250), .Y(N561) );
  NOR2BX1 U324 ( .AN(psum[35]), .B(n250), .Y(N560) );
  NOR2BX1 U325 ( .AN(psum[34]), .B(n250), .Y(N559) );
  NOR2BX1 U326 ( .AN(psum[33]), .B(n250), .Y(N558) );
  NOR2BX1 U327 ( .AN(psum[32]), .B(n250), .Y(N557) );
  NOR2BX1 U328 ( .AN(psum[31]), .B(n250), .Y(N556) );
  NOR2BX1 U329 ( .AN(psum[30]), .B(n250), .Y(N555) );
  NOR2BX1 U330 ( .AN(psum[29]), .B(n250), .Y(N554) );
  NOR2BX1 U331 ( .AN(psum[28]), .B(n250), .Y(N553) );
  NOR2BX1 U332 ( .AN(psum[27]), .B(n250), .Y(N552) );
  NOR2BX1 U333 ( .AN(psum[26]), .B(n250), .Y(N551) );
  NOR2BX1 U334 ( .AN(psum[25]), .B(n250), .Y(N550) );
  NOR2BX1 U335 ( .AN(psum[24]), .B(n250), .Y(N549) );
  NOR2BX1 U336 ( .AN(psum[23]), .B(n250), .Y(N548) );
  NOR2BX1 U337 ( .AN(psum[22]), .B(n250), .Y(N547) );
  NOR2BX1 U338 ( .AN(psum[21]), .B(n250), .Y(N546) );
  NOR2BX1 U339 ( .AN(psum[20]), .B(n250), .Y(N545) );
  NOR2BX1 U340 ( .AN(psum[19]), .B(n250), .Y(N544) );
  NOR2BX1 U341 ( .AN(psum[18]), .B(n250), .Y(N543) );
  NOR2BX1 U342 ( .AN(psum[17]), .B(n250), .Y(N542) );
  NOR2BX1 U343 ( .AN(psum[16]), .B(n250), .Y(N541) );
  NOR2BX1 U344 ( .AN(psum[15]), .B(n250), .Y(N540) );
  NOR2BX1 U345 ( .AN(psum[14]), .B(n250), .Y(N539) );
  NOR2BX1 U346 ( .AN(psum[13]), .B(n250), .Y(N538) );
  NOR2BX1 U347 ( .AN(psum[12]), .B(n250), .Y(N537) );
  NOR2BX1 U348 ( .AN(psum[11]), .B(n250), .Y(N536) );
  NOR2BX1 U349 ( .AN(psum[10]), .B(n250), .Y(N535) );
  NOR2BX1 U350 ( .AN(psum[9]), .B(n250), .Y(N534) );
  NOR2BX1 U351 ( .AN(psum[8]), .B(n250), .Y(N533) );
  NOR2BX1 U352 ( .AN(psum[7]), .B(n250), .Y(N532) );
  NOR2BX1 U353 ( .AN(psum[6]), .B(n250), .Y(N531) );
  NOR2BX1 U354 ( .AN(psum[5]), .B(n250), .Y(N530) );
  NOR2BX1 U355 ( .AN(psum[4]), .B(n250), .Y(N529) );
  NOR2BX1 U356 ( .AN(psum[3]), .B(n250), .Y(N528) );
  NOR2BX1 U357 ( .AN(psum[2]), .B(n250), .Y(N527) );
  NOR2BX1 U358 ( .AN(psum[1]), .B(n250), .Y(N526) );
  NOR2BX1 U359 ( .AN(psum[0]), .B(n250), .Y(N525) );
  AND2X1 U362 ( .A(N465), .B(n252), .Y(N516) );
  AND2X1 U363 ( .A(N464), .B(n252), .Y(N515) );
  AND2X1 U364 ( .A(N463), .B(n252), .Y(N514) );
  AND2X1 U365 ( .A(N462), .B(n252), .Y(N513) );
  AND2X1 U366 ( .A(N461), .B(n252), .Y(N512) );
  AND2X1 U367 ( .A(N460), .B(n252), .Y(N511) );
  AND2X1 U368 ( .A(N459), .B(n252), .Y(N510) );
  AND2X1 U369 ( .A(N458), .B(n252), .Y(N509) );
  AND2X1 U370 ( .A(N457), .B(n252), .Y(N508) );
  AND2X1 U371 ( .A(N456), .B(n252), .Y(N507) );
  AND2X1 U372 ( .A(N455), .B(n252), .Y(N506) );
  AND2X1 U373 ( .A(N454), .B(n252), .Y(N505) );
  NAND2X1 U376 ( .A(flat_mem_wr_en), .B(n182), .Y(n253) );
  CLKINVX1 U378 ( .A(N858), .Y(n251) );
  NOR2BX1 U379 ( .AN(N436), .B(n254), .Y(N445) );
  NOR2BX1 U380 ( .AN(N435), .B(n254), .Y(N444) );
  NOR2BX1 U381 ( .AN(N434), .B(n254), .Y(N443) );
  NAND2BX1 U383 ( .AN(n255), .B(N888), .Y(n254) );
  NAND3X1 U384 ( .A(n131), .B(n256), .C(n255), .Y(N441) );
  NAND3X1 U385 ( .A(n131), .B(n256), .C(N428), .Y(n255) );
  CLKINVX1 U387 ( .A(pooling_done), .Y(n131) );
  OAI21XL U388 ( .A0(n257), .A1(n258), .B0(n259), .Y(N422) );
  AOI22X1 U389 ( .A0(N372), .A1(n260), .B0(N360), .B1(n261), .Y(n259) );
  CLKINVX1 U390 ( .A(Mid_Right_addr[11]), .Y(n258) );
  OAI21XL U391 ( .A0(n257), .A1(n262), .B0(n263), .Y(N421) );
  AOI22X1 U392 ( .A0(N371), .A1(n260), .B0(N359), .B1(n261), .Y(n263) );
  CLKINVX1 U393 ( .A(Mid_Right_addr[10]), .Y(n262) );
  OAI21XL U394 ( .A0(n257), .A1(n264), .B0(n265), .Y(N420) );
  AOI22X1 U395 ( .A0(N370), .A1(n260), .B0(N358), .B1(n261), .Y(n265) );
  CLKINVX1 U396 ( .A(Mid_Right_addr[9]), .Y(n264) );
  OAI21XL U397 ( .A0(n257), .A1(n266), .B0(n267), .Y(N419) );
  CLKINVX1 U399 ( .A(Mid_Right_addr[8]), .Y(n266) );
  OAI21XL U400 ( .A0(n257), .A1(n268), .B0(n269), .Y(N418) );
  CLKINVX1 U402 ( .A(Mid_Right_addr[7]), .Y(n268) );
  OAI21XL U403 ( .A0(n257), .A1(n270), .B0(n271), .Y(N417) );
  CLKINVX1 U405 ( .A(Mid_Right_addr[6]), .Y(n270) );
  OAI21XL U406 ( .A0(n257), .A1(n272), .B0(n273), .Y(N416) );
  CLKINVX1 U408 ( .A(Mid_Right_addr[5]), .Y(n272) );
  OAI21XL U409 ( .A0(n257), .A1(n274), .B0(n275), .Y(N415) );
  AOI22X1 U410 ( .A0(N365), .A1(n260), .B0(N353), .B1(n261), .Y(n275) );
  CLKINVX1 U411 ( .A(Mid_Right_addr[4]), .Y(n274) );
  OAI21XL U412 ( .A0(n257), .A1(n276), .B0(n277), .Y(N414) );
  AOI22X1 U413 ( .A0(N364), .A1(n260), .B0(N352), .B1(n261), .Y(n277) );
  CLKINVX1 U414 ( .A(Mid_Right_addr[3]), .Y(n276) );
  OAI21XL U415 ( .A0(n257), .A1(n278), .B0(n279), .Y(N413) );
  AOI22X1 U416 ( .A0(N363), .A1(n260), .B0(N351), .B1(n261), .Y(n279) );
  CLKINVX1 U417 ( .A(Mid_Right_addr[2]), .Y(n278) );
  OAI21XL U418 ( .A0(n257), .A1(n280), .B0(n281), .Y(N412) );
  CLKINVX1 U420 ( .A(Mid_Right_addr[1]), .Y(n280) );
  OAI21XL U421 ( .A0(n257), .A1(n282), .B0(n283), .Y(N411) );
  CLKINVX1 U425 ( .A(Mid_Right_addr[0]), .Y(n282) );
  NAND2BX1 U428 ( .AN(N331), .B(N332), .Y(n285) );
  NAND2X1 U429 ( .A(N331), .B(n286), .Y(n284) );
  OR2X1 U435 ( .A(N292), .B(N293), .Y(N294) );
  OR2X1 U436 ( .A(N288), .B(N289), .Y(N290) );
  OR2X1 U437 ( .A(N284), .B(N285), .Y(N286) );
  OR2X1 U438 ( .A(N280), .B(N281), .Y(N282) );
  OR2X1 U439 ( .A(N276), .B(N277), .Y(N278) );
  OR2X1 U440 ( .A(N272), .B(N273), .Y(N274) );
  OR2X1 U441 ( .A(N268), .B(N269), .Y(N270) );
  OR2X1 U442 ( .A(N264), .B(N265), .Y(N266) );
  OR2X1 U443 ( .A(N242), .B(N243), .Y(N244) );
  OR2X1 U444 ( .A(N238), .B(N239), .Y(N240) );
  OR2X1 U445 ( .A(N234), .B(N235), .Y(N236) );
  OR2X1 U446 ( .A(N230), .B(N231), .Y(N232) );
  OR2X1 U447 ( .A(N226), .B(N227), .Y(N228) );
  OR2X1 U448 ( .A(N222), .B(N223), .Y(N224) );
  OR2X1 U449 ( .A(N218), .B(N219), .Y(N220) );
  OR2X1 U450 ( .A(N214), .B(N215), .Y(N216) );
  OR2X1 U451 ( .A(N190), .B(N191), .Y(N192) );
  OR2X1 U452 ( .A(N186), .B(N187), .Y(N188) );
  OR2X1 U453 ( .A(N182), .B(N183), .Y(N184) );
  OR2X1 U454 ( .A(N178), .B(N179), .Y(N180) );
  OR2X1 U455 ( .A(N174), .B(N175), .Y(N176) );
  OR2X1 U456 ( .A(N170), .B(N171), .Y(N172) );
  OR2X1 U457 ( .A(N166), .B(N167), .Y(N168) );
  OR2X1 U458 ( .A(N162), .B(N163), .Y(N164) );
  OR2X1 U459 ( .A(N152), .B(state[0]), .Y(N153) );
  OR2X1 U460 ( .A(N149), .B(n132), .Y(N150) );
  OR2X1 U461 ( .A(N146), .B(state[0]), .Y(N147) );
  OR2X1 U462 ( .A(N143), .B(n132), .Y(N144) );
  OR2X1 U463 ( .A(N140), .B(state[0]), .Y(N141) );
  OR2X1 U464 ( .A(N137), .B(n132), .Y(N138) );
  CLKMX2X6 U465 ( .A(kernel1_done), .B(N586), .S0(N585), .Y(n377) );
  CLKMX2X6 U466 ( .A(psum_reg[0]), .B(N525), .S0(n516), .Y(n376) );
  CLKMX2X6 U469 ( .A(psum_reg[37]), .B(N562), .S0(n516), .Y(n373) );
  CLKMX2X6 U470 ( .A(psum_reg[36]), .B(N561), .S0(n516), .Y(n372) );
  CLKMX2X6 U471 ( .A(psum_reg[35]), .B(N560), .S0(n516), .Y(n371) );
  CLKMX2X6 U472 ( .A(psum_reg[34]), .B(N559), .S0(n516), .Y(n370) );
  CLKMX2X6 U473 ( .A(psum_reg[33]), .B(N558), .S0(n516), .Y(n369) );
  CLKMX2X6 U474 ( .A(psum_reg[32]), .B(N557), .S0(n516), .Y(n368) );
  CLKMX2X6 U475 ( .A(psum_reg[31]), .B(N556), .S0(n516), .Y(n367) );
  CLKMX2X6 U476 ( .A(psum_reg[30]), .B(N555), .S0(n516), .Y(n366) );
  CLKMX2X6 U477 ( .A(psum_reg[29]), .B(N554), .S0(n516), .Y(n365) );
  CLKMX2X6 U478 ( .A(psum_reg[28]), .B(N553), .S0(n516), .Y(n364) );
  CLKMX2X6 U479 ( .A(psum_reg[27]), .B(N552), .S0(n516), .Y(n363) );
  CLKMX2X6 U480 ( .A(psum_reg[26]), .B(N551), .S0(n516), .Y(n362) );
  CLKMX2X6 U481 ( .A(psum_reg[25]), .B(N550), .S0(n516), .Y(n361) );
  CLKMX2X6 U482 ( .A(psum_reg[24]), .B(N549), .S0(n516), .Y(n360) );
  CLKMX2X6 U483 ( .A(psum_reg[23]), .B(N548), .S0(n516), .Y(n359) );
  CLKMX2X6 U484 ( .A(psum_reg[22]), .B(N547), .S0(n516), .Y(n358) );
  CLKMX2X6 U485 ( .A(psum_reg[21]), .B(N546), .S0(n516), .Y(n357) );
  CLKMX2X6 U486 ( .A(psum_reg[20]), .B(N545), .S0(n516), .Y(n356) );
  CLKMX2X6 U487 ( .A(psum_reg[19]), .B(N544), .S0(n516), .Y(n355) );
  CLKMX2X6 U488 ( .A(psum_reg[18]), .B(N543), .S0(n516), .Y(n354) );
  CLKMX2X6 U489 ( .A(psum_reg[17]), .B(N542), .S0(n516), .Y(n353) );
  CLKMX2X6 U490 ( .A(psum_reg[16]), .B(N541), .S0(n516), .Y(n352) );
  CLKMX2X6 U491 ( .A(psum_reg[15]), .B(N540), .S0(n516), .Y(n351) );
  CLKMX2X6 U492 ( .A(psum_reg[14]), .B(N539), .S0(n516), .Y(n350) );
  CLKMX2X6 U493 ( .A(psum_reg[13]), .B(N538), .S0(n516), .Y(n349) );
  CLKMX2X6 U494 ( .A(psum_reg[12]), .B(N537), .S0(n516), .Y(n348) );
  CLKMX2X6 U495 ( .A(psum_reg[11]), .B(N536), .S0(n516), .Y(n347) );
  CLKMX2X6 U496 ( .A(psum_reg[10]), .B(N535), .S0(n516), .Y(n346) );
  CLKMX2X6 U497 ( .A(psum_reg[9]), .B(N534), .S0(n516), .Y(n345) );
  CLKMX2X6 U498 ( .A(psum_reg[8]), .B(N533), .S0(n516), .Y(n344) );
  CLKMX2X6 U499 ( .A(psum_reg[7]), .B(N532), .S0(n516), .Y(n343) );
  CLKMX2X6 U500 ( .A(psum_reg[6]), .B(N531), .S0(n516), .Y(n342) );
  CLKMX2X6 U501 ( .A(psum_reg[5]), .B(N530), .S0(n516), .Y(n341) );
  CLKMX2X6 U502 ( .A(psum_reg[4]), .B(N529), .S0(n516), .Y(n340) );
  CLKMX2X6 U503 ( .A(psum_reg[3]), .B(N528), .S0(n516), .Y(n339) );
  CLKMX2X6 U504 ( .A(psum_reg[2]), .B(N527), .S0(n516), .Y(n338) );
  CLKMX2X6 U505 ( .A(psum_reg[1]), .B(N526), .S0(n516), .Y(n337) );
  CLKMX2X6 U507 ( .A(n499), .B(N411), .S0(N410), .Y(n335) );
  CLKMX2X6 U517 ( .A(Mid_addr[11]), .B(N422), .S0(N410), .Y(n325) );
  CLKMX2X6 U518 ( .A(n512), .B(N573), .S0(N572), .Y(n324) );
  CLKMX2X6 U529 ( .A(n423), .B(N511), .S0(N504), .Y(n313) );
  CLKMX2X6 U530 ( .A(n420), .B(N512), .S0(N504), .Y(n312) );
  CLKMX2X6 U531 ( .A(n417), .B(N513), .S0(N504), .Y(n311) );
  CLKMX2X6 U532 ( .A(n414), .B(N514), .S0(N504), .Y(n310) );
  CLKMX2X6 U533 ( .A(n492), .B(N515), .S0(N504), .Y(n309) );
  CLKMX2X6 U534 ( .A(n486), .B(N516), .S0(N504), .Y(n308) );
  CLKMX2X6 U535 ( .A(max_temp[0]), .B(N597), .S0(n510), .Y(n307) );
  CLKMX2X6 U536 ( .A(max_temp[19]), .B(N616), .S0(n510), .Y(n306) );
  CLKMX2X6 U537 ( .A(max_temp[18]), .B(N615), .S0(n510), .Y(n305) );
  CLKMX2X6 U538 ( .A(max_temp[17]), .B(N614), .S0(n510), .Y(n304) );
  CLKMX2X6 U539 ( .A(max_temp[16]), .B(N613), .S0(n510), .Y(n303) );
  CLKMX2X6 U540 ( .A(max_temp[15]), .B(N612), .S0(n510), .Y(n302) );
  CLKMX2X6 U541 ( .A(max_temp[14]), .B(N611), .S0(n510), .Y(n301) );
  CLKMX2X6 U542 ( .A(max_temp[13]), .B(N610), .S0(n510), .Y(n300) );
  CLKMX2X6 U543 ( .A(max_temp[12]), .B(N609), .S0(n510), .Y(n299) );
  CLKMX2X6 U544 ( .A(max_temp[11]), .B(N608), .S0(n510), .Y(n298) );
  CLKMX2X6 U545 ( .A(max_temp[10]), .B(N607), .S0(n510), .Y(n297) );
  CLKMX2X6 U546 ( .A(max_temp[9]), .B(N606), .S0(n510), .Y(n296) );
  CLKMX2X6 U547 ( .A(max_temp[8]), .B(N605), .S0(n510), .Y(n295) );
  CLKMX2X6 U548 ( .A(max_temp[7]), .B(N604), .S0(n510), .Y(n294) );
  CLKMX2X6 U549 ( .A(max_temp[6]), .B(N603), .S0(n510), .Y(n293) );
  CLKMX2X6 U550 ( .A(max_temp[5]), .B(N602), .S0(n510), .Y(n292) );
  CLKMX2X6 U551 ( .A(max_temp[4]), .B(N601), .S0(n510), .Y(n291) );
  CLKMX2X6 U552 ( .A(max_temp[3]), .B(N600), .S0(n510), .Y(n290) );
  CLKMX2X6 U553 ( .A(max_temp[2]), .B(N599), .S0(n510), .Y(n289) );
  CLKMX2X6 U554 ( .A(max_temp[1]), .B(N598), .S0(n510), .Y(n288) );
  CLKMX2X6 U555 ( .A(busy), .B(ready), .S0(N620), .Y(n287) );
  XNOR2X1 U559 ( .A(n504), .B(n378), .Y(N435) );
  NOR2BX1 U560 ( .AN(n504), .B(n378), .Y(n379) );
  XOR2X1 U561 ( .A(n514), .B(n379), .Y(N436) );
  CONV_DW_cmp_0 gt_345 ( .A(cdata_rd), .B(max_temp), .TC(1'b1), .GE_LT(1'b0), 
        .GE_GT_EQ(1'b1), .GE_LT_GT_LE(N592) );
  CONV_DW01_inc_0_DW01_inc_1 add_124 ( .A(psum_bias[31:16]), .SUM({N129, N128, 
        N127, N126, N125, N124, N123, N122, N121, N120, N119, N118, N117, N116, 
        N115, N114}) );
  CONV_DW01_add_2 add_123_2 ( .A(psum_reg[35:0]), .B({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM({
        N112, N111, N110, N109, N108, N107, N106, N105, N104, N103, N102, N101, 
        N100, N99, N98, N97, N96, N95, N94, N93, N92, SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14}) );
  CONV_DW01_add_3 add_123 ( .A(psum_reg[35:0]), .B({1'b1, 1'b1, 1'b1, 1'b1, 
        1'b0, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1, 
        1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM({N91, 
        N90, N89, N88, N87, N86, N85, N84, N83, N82, N81, N80, N79, N78, N77, 
        N76, N75, N74, N73, N72, N71, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  CONV_DW01_add_4 add_106 ( .A({Mid_addr[11:7], n505, Top_Mid_addr[5:1], n499}), .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), 
        .CI(1'b0), .SUM(Bottom_Right_addr) );
  CONV_DW01_add_6 add_104 ( .A({Mid_addr[11:7], n508, Top_Mid_addr[5:1], n499}), .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .CI(1'b0), .SUM(Bottom_Left_addr) );
  CONV_DW01_dec_0 sub_101 ( .A({Mid_addr[11:7], n507, Top_Mid_addr[5:1], n499}), .SUM(Mid_Left_addr) );
  CONV_DW01_sub_0 sub_100 ( .A({Mid_addr[11:7], n508, Top_Mid_addr[5:1], n499}), .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), 
        .CI(1'b0), .DIFF(Top_Right_addr) );
  CONV_DW01_sub_2 sub_98 ( .A({Mid_addr[11:7], n507, Top_Mid_addr[5:1], n499}), 
        .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1}), .CI(1'b0), .DIFF(Top_Left_addr) );
  CONV_DW01_inc_1_DW01_inc_2 r458 ( .A({n486, n492, n414, n417, n420, n423, 
        n399, n402, n405, n408, n411, n489}), .SUM({N465, N464, N463, N462, 
        N461, N460, N459, N458, N457, N456, N455, N454}) );
  CONV_DW01_inc_2_DW01_inc_3 r444 ( .A({Mid_addr[11:7], n506, 
        Top_Mid_addr[5:1], n499}), .SUM(Mid_Right_addr) );
  CONV_DW01_add_8 add_122 ( .A({\product[39] , \product[38] , \product[37] , 
        \product[36] , \product[35] , \product[34] , \product[33] , 
        \product[32] , \product[31] , \product[30] , \product[29] , 
        \product[28] , \product[27] , \product[26] , \product[25] , 
        \product[24] , \product[23] , \product[22] , \product[21] , 
        \product[20] , \product[19] , \product[18] , \product[17] , 
        \product[16] , \product[15] , \product[14] , \product[13] , 
        \product[12] , \product[11] , \product[10] , \product[9] , 
        \product[8] , \product[7] , \product[6] , \product[5] , \product[4] , 
        \product[3] , \product[2] , \product[1] , \product[0] }), .B(psum_reg), 
        .CI(1'b0), .SUM(psum) );
  CONV_DW01_add_7 add_133_aco ( .A({Mid_addr[11:7], n508, Top_Mid_addr[5:1], 
        n499}), .B({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, N865, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, N859}), .CI(1'b0), .SUM(caddr_rd) );
  CONV_DW_mult_tc_2 mult_121 ( .a({n395, ifmap[18:14], n495, ifmap[12:10], 
        n497, ifmap[8:6], n397, ifmap[4:0]}), .b({weight[19], weight[19], 
        weight[19], weight[19], weight[15:0]}), .product({\product[39] , 
        \product[38] , \product[37] , \product[36] , \product[35] , 
        \product[34] , \product[33] , \product[32] , \product[31] , 
        \product[30] , \product[29] , \product[28] , \product[27] , 
        \product[26] , \product[25] , \product[24] , \product[23] , 
        \product[22] , \product[21] , \product[20] , \product[19] , 
        \product[18] , \product[17] , \product[16] , \product[15] , 
        \product[14] , \product[13] , \product[12] , \product[11] , 
        \product[10] , \product[9] , \product[8] , \product[7] , \product[6] , 
        \product[5] , \product[4] , \product[3] , \product[2] , \product[1] , 
        \product[0] }) );
  EDFFX4 \count_reg[2]  ( .D(N444), .E(N441), .CK(clk), .Q(count[2]), .QN(N633) );
  EDFFX4 \count_reg[1]  ( .D(N443), .E(N441), .CK(clk), .Q(count[1]), .QN(n123) );
  DFFRX1 busy_reg ( .D(n287), .CK(clk), .RN(n256), .Q(n553) );
  EDFFX2 \count_reg[3]  ( .D(N445), .E(N441), .CK(clk), .Q(count[3]), .QN(N783) );
  EDFFX1 \count_reg[0]  ( .D(N442), .E(N441), .CK(clk), .Q(count[0]), .QN(n124) );
  DFFRX1 kernel0_done_reg ( .D(n324), .CK(clk), .RN(n256), .Q(kernel0_done), 
        .QN(n62) );
  DFFRX1 \addr_reg[0]  ( .D(n335), .CK(clk), .RN(n256), .Q(Top_Mid_addr[0]), 
        .QN(N653) );
  DFFRX2 \state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(n256), .Q(state[2]), 
        .QN(N823) );
  OR2XL U562 ( .A(n514), .B(N633), .Y(N288) );
  AND2XL U563 ( .A(N783), .B(N633), .Y(N261) );
  OR2XL U564 ( .A(n514), .B(N633), .Y(N284) );
  OR2XL U565 ( .A(N633), .B(n514), .Y(N634) );
  OR2XL U566 ( .A(n514), .B(N633), .Y(N276) );
  OR2X1 U567 ( .A(n514), .B(N633), .Y(N280) );
  OR2X1 U568 ( .A(N633), .B(n514), .Y(N832) );
  OR2X1 U569 ( .A(n514), .B(N633), .Y(N226) );
  OR2X1 U570 ( .A(n514), .B(N633), .Y(N178) );
  AND2X2 U571 ( .A(N783), .B(N633), .Y(N159) );
  OR2X1 U572 ( .A(n514), .B(N633), .Y(N234) );
  OR2X1 U573 ( .A(n514), .B(N633), .Y(N230) );
  OR2X1 U574 ( .A(n514), .B(N633), .Y(N186) );
  AND2X2 U575 ( .A(N783), .B(N633), .Y(N211) );
  OR2X1 U576 ( .A(n514), .B(N633), .Y(N238) );
  OR2X1 U577 ( .A(n514), .B(N633), .Y(N182) );
  OR2X1 U578 ( .A(n514), .B(N633), .Y(N174) );
  OR2X1 U579 ( .A(N633), .B(n514), .Y(N779) );
  OR2X1 U580 ( .A(N633), .B(n514), .Y(N815) );
  OR2X1 U581 ( .A(N633), .B(n514), .Y(N802) );
  OR2X1 U582 ( .A(N633), .B(n514), .Y(N775) );
  MX2XL U583 ( .A(Top_Mid_addr[2]), .B(N413), .S0(N410), .Y(n334) );
  AND2XL U584 ( .A(Top_Mid_addr[2]), .B(N751), .Y(N752) );
  OR2XL U585 ( .A(Top_Mid_addr[2]), .B(N739), .Y(N740) );
  AOI22XL U586 ( .A0(Top_Mid_addr[2]), .A1(N291), .B0(Mid_Left_addr[2]), .B1(
        N275), .Y(n162) );
  AO22XL U587 ( .A0(Top_Mid_addr[2]), .A1(N279), .B0(Mid_Right_addr[2]), .B1(
        N283), .Y(n165) );
  AND2X2 U588 ( .A(Top_Mid_addr[2]), .B(N807), .Y(N808) );
  OR2X1 U589 ( .A(Top_Mid_addr[2]), .B(N789), .Y(N790) );
  MX2XL U590 ( .A(Top_Mid_addr[4]), .B(N415), .S0(N410), .Y(n332) );
  XOR2XL U591 ( .A(Top_Mid_addr[4]), .B(\add_257_2/carry[4] ), .Y(N365) );
  XOR2XL U592 ( .A(Top_Mid_addr[4]), .B(\add_257/carry[4] ), .Y(N353) );
  AOI22XL U593 ( .A0(Top_Mid_addr[4]), .A1(N291), .B0(Mid_Left_addr[4]), .B1(
        N275), .Y(n154) );
  AND2XL U594 ( .A(Top_Mid_addr[4]), .B(N749), .Y(N750) );
  OR2XL U595 ( .A(Top_Mid_addr[4]), .B(N737), .Y(N738) );
  AO22XL U596 ( .A0(Top_Mid_addr[4]), .A1(N279), .B0(Mid_Right_addr[4]), .B1(
        N283), .Y(n157) );
  NAND2XL U597 ( .A(Top_Mid_addr[4]), .B(\add_257/carry[4] ), .Y(n531) );
  NAND2XL U598 ( .A(Top_Mid_addr[4]), .B(\add_257_2/carry[4] ), .Y(n541) );
  MX2XL U599 ( .A(Top_Mid_addr[3]), .B(N414), .S0(N410), .Y(n333) );
  XOR2XL U600 ( .A(Top_Mid_addr[3]), .B(\add_257_2/carry[3] ), .Y(N364) );
  XOR2XL U601 ( .A(Top_Mid_addr[3]), .B(\add_257/carry[3] ), .Y(N352) );
  AND2XL U602 ( .A(Top_Mid_addr[3]), .B(N750), .Y(N751) );
  OR2XL U603 ( .A(Top_Mid_addr[3]), .B(N738), .Y(N739) );
  AOI22XL U604 ( .A0(Top_Mid_addr[3]), .A1(N291), .B0(Mid_Left_addr[3]), .B1(
        N275), .Y(n158) );
  AO22XL U605 ( .A0(Top_Mid_addr[3]), .A1(N279), .B0(Mid_Right_addr[3]), .B1(
        N283), .Y(n161) );
  NAND2XL U606 ( .A(Top_Mid_addr[3]), .B(\add_257/carry[3] ), .Y(n530) );
  NAND2XL U607 ( .A(Top_Mid_addr[3]), .B(\add_257_2/carry[3] ), .Y(n540) );
  AND2X2 U608 ( .A(Top_Mid_addr[3]), .B(N806), .Y(N807) );
  OR2X1 U609 ( .A(Top_Mid_addr[3]), .B(N788), .Y(N789) );
  OA21X2 U610 ( .A0(n79), .A1(n501), .B0(n67), .Y(n63) );
  CLKAND2X12 U611 ( .A(N888), .B(N889), .Y(crd) );
  CLKINVX1 U612 ( .A(count_done), .Y(N888) );
  INVXL U613 ( .A(n566), .Y(n380) );
  INVX12 U614 ( .A(n380), .Y(cwr) );
  OR2X1 U615 ( .A(N891), .B(N892), .Y(n566) );
  INVXL U616 ( .A(n599), .Y(n382) );
  INVX12 U617 ( .A(n382), .Y(csel[2]) );
  OAI31XL U618 ( .A0(n182), .A1(n501), .A2(n183), .B0(n184), .Y(n599) );
  INVXL U619 ( .A(n598), .Y(n384) );
  INVX12 U620 ( .A(n384), .Y(cdata_wr[0]) );
  OAI211X1 U621 ( .A0(n121), .A1(n197), .B0(n242), .C0(n243), .Y(n598) );
  INVXL U622 ( .A(n588), .Y(n386) );
  INVX12 U623 ( .A(n386), .Y(cdata_wr[10]) );
  OAI211X1 U624 ( .A0(n111), .A1(n197), .B0(n240), .C0(n241), .Y(n588) );
  INVXL U625 ( .A(n587), .Y(n388) );
  INVX12 U626 ( .A(n388), .Y(cdata_wr[11]) );
  OAI211X1 U627 ( .A0(n110), .A1(n197), .B0(n238), .C0(n239), .Y(n587) );
  INVXL U628 ( .A(n586), .Y(n390) );
  INVX12 U629 ( .A(n390), .Y(cdata_wr[12]) );
  OAI211X1 U630 ( .A0(n109), .A1(n197), .B0(n236), .C0(n237), .Y(n586) );
  INVXL U631 ( .A(n585), .Y(n392) );
  INVX12 U632 ( .A(n392), .Y(cdata_wr[13]) );
  INVXL U633 ( .A(ifmap[19]), .Y(n394) );
  INVX4 U634 ( .A(n394), .Y(n395) );
  NOR2BX1 U635 ( .AN(idata[19]), .B(padding_flag), .Y(ifmap[19]) );
  OR2X1 U636 ( .A(state[1]), .B(state[2]), .Y(N844) );
  OR2X1 U637 ( .A(state[1]), .B(state[2]), .Y(N847) );
  OR2X1 U638 ( .A(N824), .B(state[2]), .Y(N850) );
  OR2X1 U639 ( .A(N824), .B(state[2]), .Y(N853) );
  OR2X1 U640 ( .A(state[2]), .B(N824), .Y(N140) );
  OR2X1 U641 ( .A(state[2]), .B(N824), .Y(N143) );
  OAI31X1 U642 ( .A0(N225), .A1(N241), .A2(N233), .B0(n512), .Y(n74) );
  NAND4X6 U643 ( .A(n70), .B(n73), .C(n74), .D(n105), .Y(weight[0]) );
  NAND4X2 U644 ( .A(n81), .B(n82), .C(n77), .D(n83), .Y(weight[2]) );
  OAI31X1 U645 ( .A0(N165), .A1(N185), .A2(N177), .B0(n501), .Y(n73) );
  INVXL U646 ( .A(ifmap[5]), .Y(n396) );
  INVX6 U647 ( .A(n396), .Y(n397) );
  NOR2BX1 U648 ( .AN(idata[5]), .B(padding_flag), .Y(ifmap[5]) );
  CLKINVX1 U649 ( .A(n573), .Y(n398) );
  CLKINVX1 U650 ( .A(n398), .Y(n399) );
  INVX12 U651 ( .A(n398), .Y(caddr_wr[5]) );
  CLKINVX1 U652 ( .A(n574), .Y(n401) );
  CLKINVX1 U653 ( .A(n401), .Y(n402) );
  INVX12 U654 ( .A(n401), .Y(caddr_wr[4]) );
  CLKINVX1 U655 ( .A(n575), .Y(n404) );
  CLKINVX1 U656 ( .A(n404), .Y(n405) );
  INVX12 U657 ( .A(n404), .Y(caddr_wr[3]) );
  CLKINVX1 U658 ( .A(n576), .Y(n407) );
  CLKINVX1 U659 ( .A(n407), .Y(n408) );
  INVX12 U660 ( .A(n407), .Y(caddr_wr[2]) );
  CLKINVX1 U661 ( .A(n577), .Y(n410) );
  CLKINVX1 U662 ( .A(n410), .Y(n411) );
  INVX12 U663 ( .A(n410), .Y(caddr_wr[1]) );
  CLKINVX1 U664 ( .A(n569), .Y(n413) );
  CLKINVX1 U665 ( .A(n413), .Y(n414) );
  INVX12 U666 ( .A(n413), .Y(caddr_wr[9]) );
  CLKINVX1 U667 ( .A(n570), .Y(n416) );
  CLKINVX1 U668 ( .A(n416), .Y(n417) );
  INVX12 U669 ( .A(n416), .Y(caddr_wr[8]) );
  CLKINVX1 U670 ( .A(n571), .Y(n419) );
  CLKINVX1 U671 ( .A(n419), .Y(n420) );
  INVX12 U672 ( .A(n419), .Y(caddr_wr[7]) );
  CLKINVX1 U673 ( .A(n572), .Y(n422) );
  CLKINVX1 U674 ( .A(n422), .Y(n423) );
  INVX12 U675 ( .A(n422), .Y(caddr_wr[6]) );
  NAND4X2 U676 ( .A(n76), .B(n65), .C(n100), .D(n63), .Y(weight[11]) );
  NAND4X2 U677 ( .A(n89), .B(n75), .C(n68), .D(n73), .Y(weight[15]) );
  OAI21X2 U678 ( .A0(n512), .A1(n87), .B0(n68), .Y(weight[19]) );
  OAI31X1 U679 ( .A0(n95), .A1(N241), .A2(N221), .B0(n512), .Y(n68) );
  AND2X2 U680 ( .A(N262), .B(N261), .Y(n137) );
  AND2X2 U681 ( .A(N623), .B(N628), .Y(N262) );
  OAI2BB1X4 U682 ( .A0N(n512), .A1N(N217), .B0(n77), .Y(weight[7]) );
  OAI2BB1X2 U683 ( .A0N(n501), .A1N(n86), .B0(n65), .Y(weight[1]) );
  OAI211X4 U684 ( .A0(N731), .A1(n182), .B0(n253), .C0(n251), .Y(n252) );
  CLKINVX1 U685 ( .A(pool_one_stride_done), .Y(n182) );
  NAND3X4 U686 ( .A(n284), .B(n286), .C(n285), .Y(N410) );
  AOI22XL U687 ( .A0(n499), .A1(n260), .B0(n499), .B1(n261), .Y(n283) );
  AOI22XL U688 ( .A0(N362), .A1(n260), .B0(N350), .B1(n261), .Y(n281) );
  AOI22XL U689 ( .A0(N366), .A1(n260), .B0(N354), .B1(n261), .Y(n273) );
  AOI22XL U690 ( .A0(N367), .A1(n260), .B0(N355), .B1(n261), .Y(n271) );
  AOI22XL U691 ( .A0(N368), .A1(n260), .B0(N356), .B1(n261), .Y(n269) );
  AOI22XL U692 ( .A0(N369), .A1(n260), .B0(N357), .B1(n261), .Y(n267) );
  NOR2X4 U693 ( .A(n284), .B(N697), .Y(n260) );
  NOR2BX4 U694 ( .AN(N697), .B(n284), .Y(n261) );
  NOR2BX4 U695 ( .AN(n229), .B(n244), .Y(n201) );
  OA21X2 U696 ( .A0(N709), .A1(n285), .B0(n286), .Y(n257) );
  INVX1 U697 ( .A(N330), .Y(n286) );
  MX2XL U698 ( .A(n411), .B(N506), .S0(N504), .Y(n319) );
  CLKMX2X2 U699 ( .A(n489), .B(N505), .S0(N504), .Y(n318) );
  MX2XL U700 ( .A(n408), .B(N507), .S0(N504), .Y(n317) );
  MX2XL U701 ( .A(n405), .B(N508), .S0(N504), .Y(n316) );
  MX2XL U702 ( .A(n402), .B(N509), .S0(N504), .Y(n315) );
  MX2XL U703 ( .A(n399), .B(N510), .S0(N504), .Y(n314) );
  NAND3X4 U704 ( .A(n251), .B(n182), .C(n253), .Y(N504) );
  OAI211X4 U705 ( .A0(n108), .A1(n197), .B0(n234), .C0(n235), .Y(n585) );
  NAND2X4 U706 ( .A(n229), .B(n244), .Y(n197) );
  OAI211X4 U707 ( .A0(n61), .A1(n501), .B0(n63), .C0(n64), .Y(weight[9]) );
  NAND4X2 U708 ( .A(n63), .B(n66), .C(n74), .D(n75), .Y(weight[5]) );
  OAI211X4 U709 ( .A0(n512), .A1(n104), .B0(n70), .C0(n63), .Y(weight[10]) );
  OAI211X4 U710 ( .A0(n69), .A1(n501), .B0(n70), .C0(n64), .Y(weight[6]) );
  NAND2BX2 U711 ( .AN(weight[7]), .B(n76), .Y(weight[4]) );
  INVXL U712 ( .A(n584), .Y(n425) );
  INVX12 U713 ( .A(n425), .Y(cdata_wr[14]) );
  INVXL U714 ( .A(n583), .Y(n427) );
  INVX12 U715 ( .A(n427), .Y(cdata_wr[15]) );
  INVXL U716 ( .A(n582), .Y(n429) );
  INVX12 U717 ( .A(n429), .Y(cdata_wr[16]) );
  INVXL U718 ( .A(n581), .Y(n431) );
  INVX12 U719 ( .A(n431), .Y(cdata_wr[17]) );
  INVXL U720 ( .A(n580), .Y(n433) );
  INVX12 U721 ( .A(n433), .Y(cdata_wr[18]) );
  INVXL U722 ( .A(n579), .Y(n435) );
  INVX12 U723 ( .A(n435), .Y(cdata_wr[19]) );
  INVXL U724 ( .A(n597), .Y(n437) );
  INVX12 U725 ( .A(n437), .Y(cdata_wr[1]) );
  OAI211XL U726 ( .A0(n120), .A1(n197), .B0(n216), .C0(n217), .Y(n597) );
  INVXL U727 ( .A(n596), .Y(n439) );
  INVX12 U728 ( .A(n439), .Y(cdata_wr[2]) );
  OAI211XL U729 ( .A0(n119), .A1(n197), .B0(n214), .C0(n215), .Y(n596) );
  INVXL U730 ( .A(n595), .Y(n441) );
  INVX12 U731 ( .A(n441), .Y(cdata_wr[3]) );
  OAI211XL U732 ( .A0(n118), .A1(n197), .B0(n212), .C0(n213), .Y(n595) );
  INVXL U733 ( .A(n594), .Y(n443) );
  INVX12 U734 ( .A(n443), .Y(cdata_wr[4]) );
  OAI211XL U735 ( .A0(n117), .A1(n197), .B0(n210), .C0(n211), .Y(n594) );
  INVXL U736 ( .A(n593), .Y(n445) );
  INVX12 U737 ( .A(n445), .Y(cdata_wr[5]) );
  OAI211XL U738 ( .A0(n116), .A1(n197), .B0(n208), .C0(n209), .Y(n593) );
  INVXL U739 ( .A(n592), .Y(n447) );
  INVX12 U740 ( .A(n447), .Y(cdata_wr[6]) );
  OAI211XL U741 ( .A0(n115), .A1(n197), .B0(n206), .C0(n207), .Y(n592) );
  INVXL U742 ( .A(n591), .Y(n449) );
  INVX12 U743 ( .A(n449), .Y(cdata_wr[7]) );
  OAI211XL U744 ( .A0(n114), .A1(n197), .B0(n204), .C0(n205), .Y(n591) );
  INVXL U745 ( .A(n590), .Y(n451) );
  INVX12 U746 ( .A(n451), .Y(cdata_wr[8]) );
  OAI211XL U747 ( .A0(n113), .A1(n197), .B0(n202), .C0(n203), .Y(n590) );
  INVXL U748 ( .A(n589), .Y(n453) );
  INVX12 U749 ( .A(n453), .Y(cdata_wr[9]) );
  OAI211XL U750 ( .A0(n112), .A1(n197), .B0(n198), .C0(n199), .Y(n589) );
  INVXL U751 ( .A(n601), .Y(n455) );
  INVX12 U752 ( .A(n455), .Y(csel[0]) );
  INVXL U753 ( .A(n600), .Y(n457) );
  INVX12 U754 ( .A(n457), .Y(csel[1]) );
  INVXL U755 ( .A(n565), .Y(n459) );
  INVX12 U756 ( .A(n459), .Y(iaddr[0]) );
  INVXL U757 ( .A(n555), .Y(n461) );
  INVX12 U758 ( .A(n461), .Y(iaddr[10]) );
  INVXL U759 ( .A(n554), .Y(n463) );
  INVX12 U760 ( .A(n463), .Y(iaddr[11]) );
  INVXL U761 ( .A(n564), .Y(n465) );
  INVX12 U762 ( .A(n465), .Y(iaddr[1]) );
  INVXL U763 ( .A(n563), .Y(n467) );
  INVX12 U764 ( .A(n467), .Y(iaddr[2]) );
  INVXL U765 ( .A(n562), .Y(n469) );
  INVX12 U766 ( .A(n469), .Y(iaddr[3]) );
  INVXL U767 ( .A(n561), .Y(n471) );
  INVX12 U768 ( .A(n471), .Y(iaddr[4]) );
  INVXL U769 ( .A(n560), .Y(n473) );
  INVX12 U770 ( .A(n473), .Y(iaddr[5]) );
  INVXL U771 ( .A(n559), .Y(n475) );
  INVX12 U772 ( .A(n475), .Y(iaddr[6]) );
  INVXL U773 ( .A(n558), .Y(n477) );
  INVX12 U774 ( .A(n477), .Y(iaddr[7]) );
  INVXL U775 ( .A(n557), .Y(n479) );
  INVX12 U776 ( .A(n479), .Y(iaddr[8]) );
  INVXL U777 ( .A(n556), .Y(n481) );
  INVX12 U778 ( .A(n481), .Y(iaddr[9]) );
  CLKINVX1 U779 ( .A(n553), .Y(n483) );
  INVX16 U780 ( .A(n483), .Y(busy) );
  OAI211X4 U781 ( .A0(n92), .A1(n501), .B0(n75), .C0(n93), .Y(weight[14]) );
  OAI211X4 U782 ( .A0(n512), .A1(n90), .B0(n81), .C0(n96), .Y(weight[13]) );
  OAI22X4 U783 ( .A0(n69), .A1(n501), .B0(n512), .B1(n98), .Y(weight[12]) );
  NAND4X2 U784 ( .A(n65), .B(n66), .C(n67), .D(n68), .Y(weight[8]) );
  OAI221X4 U785 ( .A0(n512), .A1(n78), .B0(n79), .B1(n501), .C0(n74), .Y(
        weight[3]) );
  NOR2X4 U786 ( .A(N843), .B(layer_0_flag), .Y(n200) );
  OR2X2 U787 ( .A(N868), .B(N858), .Y(layer_0_flag) );
  MX2XL U788 ( .A(Top_Mid_addr[5]), .B(N416), .S0(N410), .Y(n331) );
  XOR2XL U789 ( .A(Top_Mid_addr[5]), .B(\add_257_2/carry[5] ), .Y(N366) );
  XOR2XL U790 ( .A(Top_Mid_addr[5]), .B(\add_257/carry[5] ), .Y(N354) );
  AND2XL U791 ( .A(Top_Mid_addr[5]), .B(N748), .Y(N749) );
  OR2XL U792 ( .A(Top_Mid_addr[5]), .B(N736), .Y(N737) );
  NAND2XL U793 ( .A(Top_Mid_addr[5]), .B(\add_257/carry[5] ), .Y(n532) );
  NAND2XL U794 ( .A(Top_Mid_addr[5]), .B(\add_257_2/carry[5] ), .Y(n542) );
  AOI22XL U795 ( .A0(Top_Mid_addr[5]), .A1(N291), .B0(Mid_Left_addr[5]), .B1(
        N275), .Y(n150) );
  AO22XL U796 ( .A0(Top_Mid_addr[5]), .A1(N279), .B0(Mid_Right_addr[5]), .B1(
        N283), .Y(n153) );
  AND2XL U797 ( .A(Top_Mid_addr[4]), .B(Top_Mid_addr[5]), .Y(N806) );
  OR2XL U798 ( .A(Top_Mid_addr[4]), .B(Top_Mid_addr[5]), .Y(N788) );
  XNOR2XL U799 ( .A(count[1]), .B(N433), .Y(N434) );
  OR2XL U800 ( .A(count[1]), .B(N634), .Y(N635) );
  OR2XL U801 ( .A(count[1]), .B(N755), .Y(N756) );
  NAND2XL U802 ( .A(count[1]), .B(n124), .Y(N305) );
  OR2XL U803 ( .A(count[1]), .B(N628), .Y(N265) );
  OR2XL U804 ( .A(count[1]), .B(N628), .Y(N281) );
  OR2XL U805 ( .A(count[1]), .B(N828), .Y(N829) );
  OR2XL U806 ( .A(count[1]), .B(N832), .Y(N833) );
  OR2XL U807 ( .A(count[1]), .B(N629), .Y(N630) );
  OR2XL U808 ( .A(count[1]), .B(N640), .Y(N641) );
  OR2XL U809 ( .A(count[1]), .B(N628), .Y(N179) );
  OR2XL U810 ( .A(count[1]), .B(N628), .Y(N215) );
  OR2XL U811 ( .A(count[1]), .B(N815), .Y(N816) );
  OR2XL U812 ( .A(count[1]), .B(N819), .Y(N820) );
  OR2XL U813 ( .A(count[1]), .B(N767), .Y(N768) );
  OR2XL U814 ( .A(count[1]), .B(N794), .Y(N795) );
  OR2XL U815 ( .A(count[1]), .B(N784), .Y(N785) );
  OR2X1 U816 ( .A(count[1]), .B(N763), .Y(N764) );
  OR2X1 U817 ( .A(count[1]), .B(N628), .Y(N163) );
  OR2X1 U818 ( .A(count[1]), .B(N628), .Y(N231) );
  CLKINVX1 U819 ( .A(n567), .Y(n485) );
  INVX1 U820 ( .A(n485), .Y(n486) );
  INVX12 U821 ( .A(n485), .Y(caddr_wr[11]) );
  CLKINVX1 U822 ( .A(n578), .Y(n488) );
  INVX1 U823 ( .A(n488), .Y(n489) );
  INVX12 U824 ( .A(n488), .Y(caddr_wr[0]) );
  CLKINVX1 U825 ( .A(n568), .Y(n491) );
  INVX1 U826 ( .A(n491), .Y(n492) );
  INVX12 U827 ( .A(n491), .Y(caddr_wr[10]) );
  MX2XL U828 ( .A(Mid_addr[7]), .B(N418), .S0(N410), .Y(n329) );
  XOR2XL U829 ( .A(Mid_addr[7]), .B(\add_257_2/carry[7] ), .Y(N368) );
  XOR2XL U830 ( .A(Mid_addr[7]), .B(\add_257/carry[7] ), .Y(N356) );
  AND2XL U831 ( .A(Mid_addr[7]), .B(N746), .Y(N747) );
  NAND2XL U832 ( .A(Mid_addr[7]), .B(\add_257_2/carry[7] ), .Y(n544) );
  NAND2XL U833 ( .A(Mid_addr[7]), .B(\add_257/carry[7] ), .Y(n533) );
  OR2XL U834 ( .A(Mid_addr[7]), .B(N734), .Y(N735) );
  AO22XL U835 ( .A0(Mid_addr[7]), .A1(N279), .B0(Mid_Right_addr[7]), .B1(N283), 
        .Y(n145) );
  INVXL U836 ( .A(Mid_addr[7]), .Y(n522) );
  OR2X1 U837 ( .A(N874), .B(Mid_addr[7]), .Y(N875) );
  MX2XL U838 ( .A(Mid_addr[9]), .B(N420), .S0(N410), .Y(n327) );
  XOR2XL U839 ( .A(Mid_addr[9]), .B(\add_257_2/carry[9] ), .Y(N370) );
  XOR2XL U840 ( .A(Mid_addr[9]), .B(\add_257/carry[9] ), .Y(N358) );
  NAND2XL U841 ( .A(Mid_addr[9]), .B(\add_257_2/carry[9] ), .Y(n546) );
  NAND2XL U842 ( .A(Mid_addr[9]), .B(\add_257/carry[9] ), .Y(n535) );
  AND2XL U843 ( .A(Mid_addr[9]), .B(N744), .Y(N745) );
  OR2XL U844 ( .A(Mid_addr[9]), .B(N732), .Y(N733) );
  XOR2XL U845 ( .A(Mid_addr[9]), .B(\add_105/carry[9] ), .Y(Bottom_addr[9]) );
  XNOR2XL U846 ( .A(Mid_addr[9]), .B(\sub_99/carry[9] ), .Y(Top_Mid_addr[9])
         );
  NAND2XL U847 ( .A(Mid_addr[9]), .B(\add_105/carry[9] ), .Y(n527) );
  INVXL U848 ( .A(Mid_addr[9]), .Y(n518) );
  OR2X1 U849 ( .A(N872), .B(Mid_addr[9]), .Y(N873) );
  INVXL U850 ( .A(ifmap[13]), .Y(n494) );
  INVX4 U851 ( .A(n494), .Y(n495) );
  INVXL U852 ( .A(ifmap[9]), .Y(n496) );
  INVX4 U853 ( .A(n496), .Y(n497) );
  NOR2BX4 U854 ( .AN(idata[15]), .B(padding_flag), .Y(ifmap[15]) );
  NAND2X4 U855 ( .A(N593), .B(n247), .Y(n246) );
  AND2X2 U856 ( .A(N843), .B(N592), .Y(N593) );
  MX2XL U857 ( .A(Top_Mid_addr[1]), .B(N412), .S0(N410), .Y(n336) );
  INVXL U858 ( .A(Top_Mid_addr[1]), .Y(N362) );
  INVXL U859 ( .A(Top_Mid_addr[1]), .Y(N350) );
  XOR2XL U860 ( .A(Top_Mid_addr[2]), .B(Top_Mid_addr[1]), .Y(N363) );
  OR2XL U861 ( .A(Top_Mid_addr[1]), .B(N740), .Y(N741) );
  AND2XL U862 ( .A(Top_Mid_addr[1]), .B(N752), .Y(N753) );
  XOR2XL U863 ( .A(Top_Mid_addr[2]), .B(Top_Mid_addr[1]), .Y(N351) );
  NAND2XL U864 ( .A(Top_Mid_addr[2]), .B(Top_Mid_addr[1]), .Y(n529) );
  NAND2XL U865 ( .A(Top_Mid_addr[2]), .B(Top_Mid_addr[1]), .Y(n539) );
  AOI22XL U866 ( .A0(Top_Mid_addr[1]), .A1(N291), .B0(Mid_Left_addr[1]), .B1(
        N275), .Y(n166) );
  AO22XL U867 ( .A0(Top_Mid_addr[1]), .A1(N279), .B0(Mid_Right_addr[1]), .B1(
        N283), .Y(n169) );
  AND2X2 U868 ( .A(Top_Mid_addr[1]), .B(N808), .Y(N809) );
  OR2X1 U869 ( .A(Top_Mid_addr[1]), .B(N790), .Y(N791) );
  NOR2BX4 U870 ( .AN(idata[17]), .B(padding_flag), .Y(ifmap[17]) );
  MX2XL U871 ( .A(Mid_addr[8]), .B(N419), .S0(N410), .Y(n328) );
  XOR2XL U872 ( .A(Mid_addr[8]), .B(\add_257_2/carry[8] ), .Y(N369) );
  XOR2XL U873 ( .A(Mid_addr[8]), .B(\add_257/carry[8] ), .Y(N357) );
  NAND2XL U874 ( .A(Mid_addr[8]), .B(\add_257_2/carry[8] ), .Y(n545) );
  NAND2XL U875 ( .A(Mid_addr[8]), .B(\add_257/carry[8] ), .Y(n534) );
  AND2XL U876 ( .A(Mid_addr[8]), .B(N745), .Y(N746) );
  OR2XL U877 ( .A(Mid_addr[8]), .B(N733), .Y(N734) );
  XOR2XL U878 ( .A(Mid_addr[8]), .B(\add_105/carry[8] ), .Y(Bottom_addr[8]) );
  AO22XL U879 ( .A0(Mid_addr[8]), .A1(N279), .B0(Mid_Right_addr[8]), .B1(N283), 
        .Y(n141) );
  XNOR2XL U880 ( .A(Mid_addr[8]), .B(\sub_99/carry[8] ), .Y(Top_Mid_addr[8])
         );
  INVXL U881 ( .A(Mid_addr[8]), .Y(n520) );
  NAND2XL U882 ( .A(Mid_addr[8]), .B(\add_105/carry[8] ), .Y(n526) );
  AND4XL U883 ( .A(Mid_addr[8]), .B(Mid_addr[7]), .C(Mid_addr[9]), .D(n548), 
        .Y(N68) );
  OR2X1 U884 ( .A(N873), .B(Mid_addr[8]), .Y(N874) );
  CLKINVX1 U885 ( .A(n196), .Y(n183) );
  AOI22XL U886 ( .A0(max_temp[11]), .A1(n196), .B0(n200), .B1(cdata_rd[11]), 
        .Y(n239) );
  AOI22XL U887 ( .A0(max_temp[12]), .A1(n196), .B0(n200), .B1(cdata_rd[12]), 
        .Y(n237) );
  AOI22XL U888 ( .A0(max_temp[13]), .A1(n196), .B0(n200), .B1(cdata_rd[13]), 
        .Y(n235) );
  NOR2X4 U889 ( .A(n192), .B(layer_0_flag), .Y(n196) );
  INVXL U890 ( .A(Top_Mid_addr[0]), .Y(n498) );
  INVX6 U891 ( .A(n498), .Y(n499) );
  INVXL U892 ( .A(n62), .Y(n500) );
  INVX6 U893 ( .A(n500), .Y(n501) );
  CLKBUFX6 U894 ( .A(count[0]), .Y(n502) );
  NOR2XL U895 ( .A(n502), .B(n254), .Y(N442) );
  INVXL U896 ( .A(n502), .Y(N433) );
  NAND2XL U897 ( .A(count[1]), .B(n502), .Y(n378) );
  OR2XL U898 ( .A(n502), .B(N635), .Y(N636) );
  NAND2XL U899 ( .A(n502), .B(n123), .Y(N303) );
  OR2XL U900 ( .A(count[1]), .B(n502), .Y(N293) );
  OR2XL U901 ( .A(N623), .B(n502), .Y(N269) );
  OR2XL U902 ( .A(N623), .B(n502), .Y(N285) );
  OR2XL U903 ( .A(count[1]), .B(n502), .Y(N277) );
  OR2XL U904 ( .A(n502), .B(N829), .Y(N830) );
  OR2XL U905 ( .A(n502), .B(N833), .Y(N834) );
  OR2XL U906 ( .A(n502), .B(N641), .Y(N642) );
  OR2XL U907 ( .A(n502), .B(N625), .Y(N626) );
  OR2XL U908 ( .A(count[1]), .B(n502), .Y(N227) );
  OR2XL U909 ( .A(N623), .B(n502), .Y(N167) );
  OR2XL U910 ( .A(N623), .B(n502), .Y(N219) );
  OR2XL U911 ( .A(N623), .B(n502), .Y(N183) );
  OR2XL U912 ( .A(count[1]), .B(n502), .Y(N175) );
  OR2XL U913 ( .A(n502), .B(N820), .Y(N821) );
  OR2XL U914 ( .A(count[1]), .B(n502), .Y(N243) );
  OR2XL U915 ( .A(n502), .B(N812), .Y(N813) );
  OR2XL U916 ( .A(n502), .B(N803), .Y(N804) );
  OR2XL U917 ( .A(N623), .B(n502), .Y(N235) );
  OR2XL U918 ( .A(n502), .B(N795), .Y(N796) );
  OR2XL U919 ( .A(n502), .B(N772), .Y(N773) );
  OR2XL U920 ( .A(n502), .B(N785), .Y(N786) );
  OR2XL U921 ( .A(n502), .B(N764), .Y(N765) );
  OR2XL U922 ( .A(n502), .B(N776), .Y(N777) );
  OR2XL U923 ( .A(count[1]), .B(n502), .Y(N191) );
  MX2XL U924 ( .A(Mid_addr[10]), .B(N421), .S0(N410), .Y(n326) );
  XOR2XL U925 ( .A(Mid_addr[10]), .B(\add_257_2/carry[10] ), .Y(N371) );
  XOR2XL U926 ( .A(Mid_addr[10]), .B(\add_257/carry[10] ), .Y(N359) );
  NAND2XL U927 ( .A(Mid_addr[10]), .B(\add_257_2/carry[10] ), .Y(n547) );
  NAND2XL U928 ( .A(Mid_addr[10]), .B(\add_257/carry[10] ), .Y(n536) );
  OR2XL U929 ( .A(Mid_addr[10]), .B(Mid_addr[11]), .Y(N654) );
  AND2XL U930 ( .A(Mid_addr[10]), .B(Mid_addr[11]), .Y(N744) );
  OR2XL U931 ( .A(Mid_addr[10]), .B(Mid_addr[11]), .Y(N732) );
  OR2XL U932 ( .A(Mid_addr[10]), .B(Mid_addr[11]), .Y(N698) );
  XOR2XL U933 ( .A(Mid_addr[10]), .B(\add_105/carry[10] ), .Y(Bottom_addr[10])
         );
  AO22XL U934 ( .A0(Mid_addr[10]), .A1(N279), .B0(Mid_Right_addr[10]), .B1(
        N283), .Y(n177) );
  XNOR2XL U935 ( .A(Mid_addr[10]), .B(\sub_99/carry[10] ), .Y(Top_Mid_addr[10]) );
  NAND2XL U936 ( .A(Mid_addr[10]), .B(\add_105/carry[10] ), .Y(n528) );
  INVXL U937 ( .A(Mid_addr[10]), .Y(n524) );
  OR2X1 U938 ( .A(Mid_addr[11]), .B(Mid_addr[10]), .Y(N872) );
  INVXL U939 ( .A(count[2]), .Y(n503) );
  INVX8 U940 ( .A(n503), .Y(n504) );
  CLKBUFX2 U941 ( .A(Mid_addr[6]), .Y(n505) );
  CLKBUFX2 U942 ( .A(Mid_addr[6]), .Y(n506) );
  CLKBUFX2 U943 ( .A(Mid_addr[6]), .Y(n507) );
  CLKBUFX2 U944 ( .A(Mid_addr[6]), .Y(n508) );
  MX2XL U945 ( .A(n505), .B(N417), .S0(N410), .Y(n330) );
  XOR2XL U946 ( .A(n508), .B(\add_257_2/carry[6] ), .Y(N367) );
  XNOR2XL U947 ( .A(n507), .B(\add_257/carry[6] ), .Y(N355) );
  AND2XL U948 ( .A(n506), .B(N747), .Y(N748) );
  OR2XL U949 ( .A(n505), .B(N735), .Y(N736) );
  OR2XL U950 ( .A(n508), .B(N671), .Y(N672) );
  INVXL U951 ( .A(n505), .Y(n538) );
  NAND2XL U952 ( .A(n506), .B(\add_257_2/carry[6] ), .Y(n543) );
  OR2XL U953 ( .A(n507), .B(N683), .Y(N684) );
  INVXL U954 ( .A(n506), .Y(Bottom_addr[6]) );
  INVXL U955 ( .A(n505), .Y(Top_Mid_addr[6]) );
  AO22XL U956 ( .A0(n507), .A1(N279), .B0(Mid_Right_addr[6]), .B1(N283), .Y(
        n149) );
  XOR2XL U957 ( .A(Mid_addr[7]), .B(n508), .Y(Bottom_addr[7]) );
  XNOR2XL U958 ( .A(Mid_addr[7]), .B(n507), .Y(Top_Mid_addr[7]) );
  NAND2XL U959 ( .A(Mid_addr[7]), .B(n505), .Y(n525) );
  INVXL U960 ( .A(n506), .Y(n521) );
  OR2XL U961 ( .A(N875), .B(n506), .Y(N876) );
  AND3XL U962 ( .A(Mid_addr[11]), .B(Mid_addr[10]), .C(n505), .Y(n548) );
  INVXL U963 ( .A(N596), .Y(n509) );
  INVX6 U964 ( .A(n509), .Y(n510) );
  NAND2XL U965 ( .A(n247), .B(n246), .Y(N596) );
  INVXL U966 ( .A(kernel0_done), .Y(n511) );
  INVX8 U967 ( .A(n511), .Y(n512) );
  INVXL U968 ( .A(count[3]), .Y(n513) );
  INVX12 U969 ( .A(n513), .Y(n514) );
  NAND2X8 U970 ( .A(N521), .B(n251), .Y(n250) );
  AND2X2 U971 ( .A(layer_0_flag), .B(N852), .Y(N521) );
  INVXL U972 ( .A(N524), .Y(n515) );
  INVX12 U973 ( .A(n515), .Y(n516) );
  NAND2XL U974 ( .A(n251), .B(n250), .Y(N524) );
  INVX20 U975 ( .A(reset), .Y(n256) );
  NOR2BX4 U976 ( .AN(idata[7]), .B(padding_flag), .Y(ifmap[7]) );
  NOR2BX4 U977 ( .AN(idata[11]), .B(padding_flag), .Y(ifmap[11]) );
  NOR2BX4 U978 ( .AN(psum[39]), .B(n250), .Y(N564) );
  MX2X2 U979 ( .A(psum_reg[38]), .B(N563), .S0(n516), .Y(n374) );
  NOR2BX4 U980 ( .AN(idata[3]), .B(padding_flag), .Y(ifmap[3]) );
  MX2X2 U981 ( .A(psum_reg[39]), .B(N564), .S0(n516), .Y(n375) );
  NOR2BX4 U982 ( .AN(idata[1]), .B(padding_flag), .Y(ifmap[1]) );
  AOI22XL U983 ( .A0(max_temp[0]), .A1(n196), .B0(n200), .B1(cdata_rd[0]), .Y(
        n243) );
  AOI22XL U984 ( .A0(max_temp[10]), .A1(n196), .B0(n200), .B1(cdata_rd[10]), 
        .Y(n241) );
  CLKINVX12 U985 ( .A(state[0]), .Y(N840) );
  OR2X4 U986 ( .A(state[0]), .B(N844), .Y(N845) );
  OR2X6 U987 ( .A(state[0]), .B(N850), .Y(N851) );
  OAI222X4 U988 ( .A0(n183), .A1(N834), .B0(n195), .B1(N838), .C0(N830), .C1(
        n193), .Y(count_done) );
  OR2X2 U989 ( .A(state[2]), .B(state[1]), .Y(N137) );
  CLKAND2X8 U990 ( .A(state[1]), .B(state[2]), .Y(N638) );
  CLKAND2X8 U991 ( .A(N827), .B(count_done), .Y(flat_one_stride_done) );
  CLKAND2X8 U992 ( .A(N679), .B(count_done), .Y(N899) );
  CLKAND2X8 U993 ( .A(N691), .B(count_done), .Y(N901) );
  CLKAND2X8 U994 ( .A(N843), .B(count_done), .Y(N890) );
  CLKAND2X8 U995 ( .A(N843), .B(count_done), .Y(N331) );
  CLKAND2X8 U996 ( .A(N827), .B(count_done), .Y(N332) );
  CLKAND2X8 U997 ( .A(layer_0_flag), .B(count_done), .Y(one_stride_done) );
  AND2X6 U998 ( .A(N843), .B(count_done), .Y(pool_one_stride_done) );
  OR2X6 U999 ( .A(N840), .B(N847), .Y(N848) );
  AND2X1 U1000 ( .A(pool_address_0), .B(N843), .Y(N859) );
  AND2X1 U1001 ( .A(N843), .B(\pool_address[6] ), .Y(N865) );
  CLKINVX6 U1002 ( .A(\sub_99/carry[9] ), .Y(n517) );
  NAND2X4 U1003 ( .A(n518), .B(n517), .Y(\sub_99/carry[10] ) );
  CLKINVX6 U1004 ( .A(\sub_99/carry[8] ), .Y(n519) );
  NAND2X4 U1005 ( .A(n520), .B(n519), .Y(\sub_99/carry[9] ) );
  NAND2X4 U1006 ( .A(n522), .B(n521), .Y(\sub_99/carry[8] ) );
  XNOR2X4 U1007 ( .A(Mid_addr[11]), .B(\sub_99/carry[11] ), .Y(
        Top_Mid_addr[11]) );
  CLKINVX6 U1008 ( .A(\sub_99/carry[10] ), .Y(n523) );
  NAND2X4 U1009 ( .A(n524), .B(n523), .Y(\sub_99/carry[11] ) );
  CLKINVX6 U1010 ( .A(n525), .Y(\add_105/carry[8] ) );
  CLKINVX6 U1011 ( .A(n526), .Y(\add_105/carry[9] ) );
  CLKINVX6 U1012 ( .A(n527), .Y(\add_105/carry[10] ) );
  CLKINVX6 U1013 ( .A(n528), .Y(\add_105/carry[11] ) );
  XOR2X4 U1014 ( .A(Mid_addr[11]), .B(\add_105/carry[11] ), .Y(Bottom_addr[11]) );
  CLKINVX6 U1015 ( .A(n529), .Y(\add_257/carry[3] ) );
  CLKINVX6 U1016 ( .A(n530), .Y(\add_257/carry[4] ) );
  CLKINVX6 U1017 ( .A(n531), .Y(\add_257/carry[5] ) );
  CLKINVX6 U1018 ( .A(n532), .Y(\add_257/carry[6] ) );
  CLKINVX6 U1019 ( .A(n533), .Y(\add_257/carry[8] ) );
  CLKINVX6 U1020 ( .A(n534), .Y(\add_257/carry[9] ) );
  CLKINVX6 U1021 ( .A(n535), .Y(\add_257/carry[10] ) );
  CLKINVX6 U1022 ( .A(n536), .Y(\add_257/carry[11] ) );
  XOR2X4 U1023 ( .A(Mid_addr[11]), .B(\add_257/carry[11] ), .Y(N360) );
  CLKINVX6 U1024 ( .A(\add_257/carry[6] ), .Y(n537) );
  NAND2X4 U1025 ( .A(n538), .B(n537), .Y(\add_257/carry[7] ) );
  CLKINVX6 U1026 ( .A(n539), .Y(\add_257_2/carry[3] ) );
  CLKINVX6 U1027 ( .A(n540), .Y(\add_257_2/carry[4] ) );
  CLKINVX6 U1028 ( .A(n541), .Y(\add_257_2/carry[5] ) );
  CLKINVX6 U1029 ( .A(n542), .Y(\add_257_2/carry[6] ) );
  CLKINVX6 U1030 ( .A(n543), .Y(\add_257_2/carry[7] ) );
  CLKINVX6 U1031 ( .A(n544), .Y(\add_257_2/carry[8] ) );
  CLKINVX6 U1032 ( .A(n545), .Y(\add_257_2/carry[9] ) );
  CLKINVX6 U1033 ( .A(n546), .Y(\add_257_2/carry[10] ) );
  CLKINVX6 U1034 ( .A(n547), .Y(\add_257_2/carry[11] ) );
  XOR2X4 U1035 ( .A(Mid_addr[11]), .B(\add_257_2/carry[11] ), .Y(N372) );
endmodule

