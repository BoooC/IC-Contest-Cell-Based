/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Fri Mar 22 02:59:01 2024
/////////////////////////////////////////////////////////////


module STI ( clk, reset, load, pi_msb, pi_low, pi_data, pi_length, pi_fill, 
        so_data, nxt_so_data, so_valid );
  input [15:0] pi_data;
  input [1:0] pi_length;
  input clk, reset, load, pi_msb, pi_low, pi_fill;
  output so_data, nxt_so_data, so_valid;
  wire   N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, n207, N31, N32, N34,
         N35, N36, N37, N43, N44, load_reg, \next_state[0] , N75, N76, N77,
         N78, N79, n13, n21, n22, n23, n24, n25, n26, n27, n29, n53, n54, n55,
         n56, n57, n58, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         \r389/carry[4] , \r389/carry[3] , \r389/carry[2] , n1, n2, n3, n4, n5,
         n6, n8, n9, n10, n11, n12, n14, n15, n16, n17, n18, n19, n20, n28,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n59, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205;
  wire   [31:0] pi_data_reg;

  DFFRX1 \state_reg[0]  ( .D(\next_state[0] ), .CK(clk), .RN(n181), .QN(n13)
         );
  DFFRX1 \pi_data_reg_reg[19]  ( .D(n112), .CK(clk), .RN(n173), .Q(
        pi_data_reg[19]), .QN(n25) );
  DFFRX1 \pi_data_reg_reg[17]  ( .D(n114), .CK(clk), .RN(n173), .Q(
        pi_data_reg[17]), .QN(n27) );
  DFFRX1 \pi_data_reg_reg[23]  ( .D(n108), .CK(clk), .RN(n173), .Q(
        pi_data_reg[23]), .QN(n21) );
  DFFRX1 \pi_data_reg_reg[18]  ( .D(n113), .CK(clk), .RN(n173), .Q(
        pi_data_reg[18]), .QN(n26) );
  DFFRX1 \pi_data_reg_reg[21]  ( .D(n110), .CK(clk), .RN(n173), .Q(
        pi_data_reg[21]), .QN(n23) );
  DFFRX1 \pi_data_reg_reg[22]  ( .D(n109), .CK(clk), .RN(n173), .Q(
        pi_data_reg[22]), .QN(n22) );
  DFFRX1 \pi_data_reg_reg[20]  ( .D(n111), .CK(clk), .RN(n173), .Q(
        pi_data_reg[20]), .QN(n24) );
  DFFRXL \count_reg[0]  ( .D(N75), .CK(clk), .RN(n181), .Q(N18), .QN(n1) );
  DFFRXL \pi_data_reg_reg[31]  ( .D(n100), .CK(clk), .RN(n181), .Q(
        pi_data_reg[31]) );
  DFFRXL \pi_data_reg_reg[30]  ( .D(n101), .CK(clk), .RN(n181), .Q(
        pi_data_reg[30]) );
  DFFRXL \pi_data_reg_reg[29]  ( .D(n102), .CK(clk), .RN(n181), .Q(
        pi_data_reg[29]) );
  DFFRXL \pi_data_reg_reg[28]  ( .D(n103), .CK(clk), .RN(n181), .Q(
        pi_data_reg[28]) );
  DFFRXL \pi_data_reg_reg[27]  ( .D(n104), .CK(clk), .RN(n181), .Q(
        pi_data_reg[27]) );
  DFFRXL \pi_data_reg_reg[26]  ( .D(n105), .CK(clk), .RN(n181), .Q(
        pi_data_reg[26]) );
  DFFRXL \pi_data_reg_reg[25]  ( .D(n106), .CK(clk), .RN(n181), .Q(
        pi_data_reg[25]) );
  DFFRXL \pi_data_reg_reg[24]  ( .D(n107), .CK(clk), .RN(n181), .Q(
        pi_data_reg[24]) );
  DFFRXL \pi_data_reg_reg[16]  ( .D(n115), .CK(clk), .RN(n181), .Q(
        pi_data_reg[16]) );
  DFFRXL \pi_data_reg_reg[15]  ( .D(n116), .CK(clk), .RN(n181), .Q(
        pi_data_reg[15]) );
  DFFRXL \pi_data_reg_reg[14]  ( .D(n117), .CK(clk), .RN(n181), .Q(
        pi_data_reg[14]) );
  DFFRXL \pi_data_reg_reg[13]  ( .D(n118), .CK(clk), .RN(n181), .Q(
        pi_data_reg[13]) );
  DFFRXL \pi_data_reg_reg[12]  ( .D(n119), .CK(clk), .RN(n181), .Q(
        pi_data_reg[12]) );
  DFFRXL \pi_data_reg_reg[11]  ( .D(n120), .CK(clk), .RN(n181), .Q(
        pi_data_reg[11]) );
  DFFRXL \pi_data_reg_reg[10]  ( .D(n121), .CK(clk), .RN(n181), .Q(
        pi_data_reg[10]) );
  DFFRXL \pi_data_reg_reg[9]  ( .D(n122), .CK(clk), .RN(n181), .Q(
        pi_data_reg[9]) );
  DFFRXL \pi_data_reg_reg[8]  ( .D(n123), .CK(clk), .RN(n181), .Q(
        pi_data_reg[8]) );
  DFFRXL \pi_data_reg_reg[7]  ( .D(n130), .CK(clk), .RN(n181), .Q(
        pi_data_reg[7]) );
  DFFRXL \pi_data_reg_reg[6]  ( .D(n129), .CK(clk), .RN(n181), .Q(
        pi_data_reg[6]) );
  DFFRXL \pi_data_reg_reg[5]  ( .D(n128), .CK(clk), .RN(n181), .Q(
        pi_data_reg[5]) );
  DFFRXL \pi_data_reg_reg[4]  ( .D(n127), .CK(clk), .RN(n181), .Q(
        pi_data_reg[4]) );
  DFFRXL \pi_data_reg_reg[3]  ( .D(n126), .CK(clk), .RN(n181), .Q(
        pi_data_reg[3]) );
  DFFRXL \pi_data_reg_reg[2]  ( .D(n125), .CK(clk), .RN(n181), .Q(
        pi_data_reg[2]) );
  DFFRXL \pi_data_reg_reg[1]  ( .D(n124), .CK(clk), .RN(n181), .Q(
        pi_data_reg[1]) );
  DFFRXL \pi_data_reg_reg[0]  ( .D(n131), .CK(clk), .RN(n181), .Q(
        pi_data_reg[0]) );
  DFFRX2 load_reg_reg ( .D(load), .CK(clk), .RN(n181), .Q(load_reg), .QN(n29)
         );
  DFFRX2 \count_reg[3]  ( .D(N78), .CK(clk), .RN(n181), .Q(N21), .QN(n51) );
  DFFRX2 \count_reg[1]  ( .D(N76), .CK(clk), .RN(n181), .Q(N19), .QN(n59) );
  DFFRX1 \count_reg[4]  ( .D(N79), .CK(clk), .RN(n181), .Q(N22), .QN(n132) );
  DFFRX1 \count_reg[2]  ( .D(N77), .CK(clk), .RN(n181), .Q(N20), .QN(n52) );
  NAND2X1 U3 ( .A(pi_length[1]), .B(pi_length[0]), .Y(n57) );
  NAND2X1 U4 ( .A(pi_length[1]), .B(n203), .Y(n56) );
  NOR2BX2 U5 ( .AN(n82), .B(load_reg), .Y(n87) );
  OR4X1 U6 ( .A(n60), .B(N20), .C(N22), .D(N21), .Y(n2) );
  INVX6 U7 ( .A(reset), .Y(n181) );
  NAND2X2 U8 ( .A(N19), .B(n1), .Y(n41) );
  NAND2X2 U9 ( .A(n1), .B(n59), .Y(n39) );
  NAND2X2 U10 ( .A(N19), .B(n172), .Y(n42) );
  NAND2X2 U11 ( .A(n172), .B(n59), .Y(n40) );
  NAND2X2 U12 ( .A(N24), .B(N23), .Y(n156) );
  INVX16 U13 ( .A(n13), .Y(so_valid) );
  NOR2X1 U14 ( .A(n182), .B(n9), .Y(n6) );
  INVX1 U15 ( .A(N24), .Y(n169) );
  OR2X1 U16 ( .A(n5), .B(n6), .Y(N24) );
  INVX3 U17 ( .A(pi_msb), .Y(n182) );
  NOR2BX1 U18 ( .AN(N44), .B(n53), .Y(nxt_so_data) );
  NOR2X1 U19 ( .A(pi_data_reg[29]), .B(n154), .Y(n3) );
  NOR2XL U20 ( .A(pi_data_reg[28]), .B(n153), .Y(n4) );
  OR2X1 U21 ( .A(n3), .B(n4), .Y(n152) );
  NAND2X2 U22 ( .A(N23), .B(n169), .Y(n154) );
  NAND2X2 U23 ( .A(n165), .B(n169), .Y(n153) );
  NOR2XL U24 ( .A(pi_msb), .B(n179), .Y(n5) );
  AOI21XL U25 ( .A0(n172), .A1(N19), .B0(n174), .Y(n9) );
  NAND2X2 U26 ( .A(N24), .B(n165), .Y(n155) );
  CLKINVX1 U27 ( .A(n56), .Y(n201) );
  CLKINVX1 U28 ( .A(n57), .Y(n202) );
  CLKINVX1 U29 ( .A(pi_length[0]), .Y(n203) );
  CLKINVX1 U30 ( .A(pi_fill), .Y(n204) );
  INVX1 U31 ( .A(N23), .Y(n165) );
  NAND2XL U32 ( .A(n54), .B(n95), .Y(n81) );
  OAI22X1 U33 ( .A0(pi_msb), .A1(n178), .B0(n182), .B1(n8), .Y(N25) );
  NAND2XL U34 ( .A(n66), .B(n201), .Y(n67) );
  INVXL U35 ( .A(pi_length[1]), .Y(n200) );
  AO22XL U36 ( .A0(N37), .A1(n182), .B0(N32), .B1(pi_msb), .Y(N27) );
  AOI32XL U37 ( .A0(n66), .A1(n202), .A2(pi_data[0]), .B0(n177), .B1(
        pi_data[8]), .Y(n71) );
  NOR2X1 U38 ( .A(n29), .B(n204), .Y(n66) );
  XOR2XL U39 ( .A(pi_length[0]), .B(N21), .Y(n63) );
  XOR2XL U40 ( .A(pi_length[1]), .B(N22), .Y(n62) );
  NAND3XL U41 ( .A(n172), .B(n182), .C(N19), .Y(n61) );
  OR3XL U42 ( .A(n172), .B(N19), .C(n182), .Y(n60) );
  NAND2XL U43 ( .A(n29), .B(n182), .Y(n99) );
  NAND2X1 U44 ( .A(pi_msb), .B(load_reg), .Y(n98) );
  BUFX12 U45 ( .A(n207), .Y(so_data) );
  NOR2BX1 U46 ( .AN(N43), .B(n53), .Y(n207) );
  NOR2X1 U47 ( .A(n201), .B(n202), .Y(n54) );
  CLKINVX1 U48 ( .A(N25), .Y(n168) );
  OAI22X1 U49 ( .A0(pi_msb), .A1(n172), .B0(n182), .B1(n172), .Y(N23) );
  NAND2X1 U50 ( .A(n81), .B(n97), .Y(n83) );
  OAI21XL U51 ( .A0(n202), .A1(n201), .B0(n204), .Y(n97) );
  CLKINVX1 U52 ( .A(N26), .Y(n167) );
  NAND2X1 U53 ( .A(n200), .B(n203), .Y(n95) );
  NOR2BX2 U54 ( .AN(n66), .B(n64), .Y(n65) );
  CLKBUFX3 U55 ( .A(n67), .Y(n170) );
  NAND2X1 U56 ( .A(n66), .B(n202), .Y(n68) );
  OAI221XL U57 ( .A0(n99), .A1(n178), .B0(n182), .B1(n8), .C0(n98), .Y(N77) );
  OAI221XL U58 ( .A0(n99), .A1(n179), .B0(n182), .B1(n9), .C0(n98), .Y(N76) );
  OA21XL U59 ( .A0(n174), .A1(n52), .B0(n175), .Y(n8) );
  CLKINVX1 U60 ( .A(N34), .Y(n179) );
  CLKINVX1 U61 ( .A(N35), .Y(n178) );
  CLKBUFX3 U62 ( .A(n181), .Y(n173) );
  OAI33X1 U63 ( .A0(n54), .A1(pi_fill), .A2(n132), .B0(n55), .B1(N22), .B2(
        n204), .Y(n53) );
  OA21XL U64 ( .A0(N21), .A1(n56), .B0(n57), .Y(n55) );
  CLKINVX1 U65 ( .A(N27), .Y(n166) );
  CLKBUFX3 U66 ( .A(N18), .Y(n172) );
  NAND2X2 U67 ( .A(load_reg), .B(n96), .Y(n84) );
  OAI21XL U68 ( .A0(pi_low), .A1(n95), .B0(n199), .Y(n96) );
  CLKINVX1 U69 ( .A(n83), .Y(n199) );
  OAI221XL U70 ( .A0(n198), .A1(n84), .B0(n190), .B1(n85), .C0(n94), .Y(n131)
         );
  NAND2X1 U71 ( .A(pi_data_reg[0]), .B(n87), .Y(n94) );
  OAI221XL U72 ( .A0(n191), .A1(n84), .B0(n183), .B1(n85), .C0(n93), .Y(n130)
         );
  NAND2X1 U73 ( .A(pi_data_reg[7]), .B(n87), .Y(n93) );
  OAI221XL U74 ( .A0(n192), .A1(n84), .B0(n184), .B1(n85), .C0(n92), .Y(n129)
         );
  NAND2X1 U75 ( .A(pi_data_reg[6]), .B(n87), .Y(n92) );
  OAI221XL U76 ( .A0(n193), .A1(n84), .B0(n185), .B1(n85), .C0(n91), .Y(n128)
         );
  NAND2X1 U77 ( .A(pi_data_reg[5]), .B(n87), .Y(n91) );
  OAI221XL U78 ( .A0(n194), .A1(n84), .B0(n186), .B1(n85), .C0(n90), .Y(n127)
         );
  NAND2X1 U79 ( .A(pi_data_reg[4]), .B(n87), .Y(n90) );
  OAI221XL U80 ( .A0(n195), .A1(n84), .B0(n187), .B1(n85), .C0(n89), .Y(n126)
         );
  NAND2X1 U81 ( .A(pi_data_reg[3]), .B(n87), .Y(n89) );
  OAI221XL U82 ( .A0(n196), .A1(n84), .B0(n188), .B1(n85), .C0(n88), .Y(n125)
         );
  NAND2X1 U83 ( .A(pi_data_reg[2]), .B(n87), .Y(n88) );
  OAI221XL U84 ( .A0(n197), .A1(n84), .B0(n189), .B1(n85), .C0(n86), .Y(n124)
         );
  NAND2X1 U85 ( .A(pi_data_reg[1]), .B(n87), .Y(n86) );
  AO22X1 U86 ( .A0(N36), .A1(n182), .B0(N31), .B1(pi_msb), .Y(N26) );
  OAI21X2 U87 ( .A0(n56), .A1(n29), .B0(n64), .Y(n69) );
  OA21X2 U88 ( .A0(n29), .A1(n57), .B0(n82), .Y(n64) );
  OAI221XL U89 ( .A0(n189), .A1(n72), .B0(n197), .B1(n170), .C0(n79), .Y(n122)
         );
  NAND2X1 U90 ( .A(pi_data_reg[9]), .B(n171), .Y(n79) );
  OAI221XL U91 ( .A0(n187), .A1(n72), .B0(n195), .B1(n170), .C0(n77), .Y(n120)
         );
  NAND2X1 U92 ( .A(pi_data_reg[11]), .B(n171), .Y(n77) );
  OAI221XL U93 ( .A0(n185), .A1(n72), .B0(n193), .B1(n170), .C0(n75), .Y(n118)
         );
  NAND2X1 U94 ( .A(pi_data_reg[13]), .B(n171), .Y(n75) );
  OAI221XL U95 ( .A0(n183), .A1(n72), .B0(n191), .B1(n170), .C0(n73), .Y(n116)
         );
  NAND2X1 U96 ( .A(pi_data_reg[15]), .B(n171), .Y(n73) );
  OAI221XL U97 ( .A0(n190), .A1(n72), .B0(n198), .B1(n170), .C0(n80), .Y(n123)
         );
  NAND2X1 U98 ( .A(pi_data_reg[8]), .B(n171), .Y(n80) );
  OAI221XL U99 ( .A0(n188), .A1(n72), .B0(n196), .B1(n170), .C0(n78), .Y(n121)
         );
  NAND2X1 U100 ( .A(pi_data_reg[10]), .B(n171), .Y(n78) );
  OAI221XL U101 ( .A0(n186), .A1(n72), .B0(n194), .B1(n170), .C0(n76), .Y(n119) );
  NAND2X1 U102 ( .A(pi_data_reg[12]), .B(n171), .Y(n76) );
  OAI221XL U103 ( .A0(n184), .A1(n72), .B0(n192), .B1(n170), .C0(n74), .Y(n117) );
  NAND2X1 U104 ( .A(pi_data_reg[14]), .B(n171), .Y(n74) );
  CLKBUFX3 U105 ( .A(n70), .Y(n171) );
  AOI2BB1X1 U106 ( .A0N(n29), .A1N(n81), .B0(n69), .Y(n70) );
  OAI2BB1X1 U107 ( .A0N(pi_data_reg[16]), .A1N(n171), .B0(n71), .Y(n115) );
  CLKINVX1 U108 ( .A(n170), .Y(n177) );
  NAND2X2 U109 ( .A(load_reg), .B(n83), .Y(n72) );
  AO22X1 U110 ( .A0(pi_data_reg[24]), .A1(n64), .B0(pi_data[8]), .B1(n65), .Y(
        n107) );
  AO22X1 U111 ( .A0(pi_data_reg[25]), .A1(n64), .B0(pi_data[9]), .B1(n65), .Y(
        n106) );
  AO22X1 U112 ( .A0(pi_data_reg[26]), .A1(n64), .B0(pi_data[10]), .B1(n65), 
        .Y(n105) );
  AO22X1 U113 ( .A0(pi_data_reg[27]), .A1(n64), .B0(pi_data[11]), .B1(n65), 
        .Y(n104) );
  AO22X1 U114 ( .A0(pi_data_reg[28]), .A1(n64), .B0(pi_data[12]), .B1(n65), 
        .Y(n103) );
  AO22X1 U115 ( .A0(pi_data_reg[29]), .A1(n64), .B0(pi_data[13]), .B1(n65), 
        .Y(n102) );
  AO22X1 U116 ( .A0(pi_data_reg[30]), .A1(n64), .B0(pi_data[14]), .B1(n65), 
        .Y(n101) );
  AO22X1 U117 ( .A0(pi_data_reg[31]), .A1(n64), .B0(pi_data[15]), .B1(n65), 
        .Y(n100) );
  OAI222XL U118 ( .A0(n189), .A1(n170), .B0(n68), .B1(n197), .C0(n69), .C1(n27), .Y(n114) );
  OAI222XL U119 ( .A0(n188), .A1(n170), .B0(n68), .B1(n196), .C0(n69), .C1(n26), .Y(n113) );
  OAI222XL U120 ( .A0(n187), .A1(n170), .B0(n68), .B1(n195), .C0(n69), .C1(n25), .Y(n112) );
  OAI222XL U121 ( .A0(n186), .A1(n170), .B0(n68), .B1(n194), .C0(n69), .C1(n24), .Y(n111) );
  OAI222XL U122 ( .A0(n185), .A1(n170), .B0(n68), .B1(n193), .C0(n69), .C1(n23), .Y(n110) );
  OAI222XL U123 ( .A0(n184), .A1(n170), .B0(n68), .B1(n192), .C0(n69), .C1(n22), .Y(n109) );
  OAI222XL U124 ( .A0(n183), .A1(n170), .B0(n68), .B1(n191), .C0(n69), .C1(n21), .Y(n108) );
  NAND3BX2 U125 ( .AN(n95), .B(load_reg), .C(pi_low), .Y(n85) );
  MXI2X1 U126 ( .A(n205), .B(n29), .S0(n13), .Y(\next_state[0] ) );
  NAND2X1 U127 ( .A(n2), .B(n180), .Y(n205) );
  CLKINVX1 U128 ( .A(n58), .Y(n180) );
  NOR4BX1 U129 ( .AN(N20), .B(n61), .C(n62), .D(n63), .Y(n58) );
  OAI2BB2XL U130 ( .B0(n203), .B1(n98), .A0N(n29), .A1N(N26), .Y(N78) );
  OAI2BB2XL U131 ( .B0(n200), .B1(n98), .A0N(n29), .A1N(N27), .Y(N79) );
  OAI221XL U132 ( .A0(n99), .A1(n172), .B0(n182), .B1(n172), .C0(n98), .Y(N75)
         );
  CLKINVX1 U133 ( .A(pi_data[1]), .Y(n197) );
  CLKINVX1 U134 ( .A(pi_data[2]), .Y(n196) );
  CLKINVX1 U135 ( .A(pi_data[3]), .Y(n195) );
  CLKINVX1 U136 ( .A(pi_data[4]), .Y(n194) );
  CLKINVX1 U137 ( .A(pi_data[5]), .Y(n193) );
  CLKINVX1 U138 ( .A(pi_data[6]), .Y(n192) );
  CLKINVX1 U139 ( .A(pi_data[7]), .Y(n191) );
  CLKINVX1 U140 ( .A(pi_data[9]), .Y(n189) );
  CLKINVX1 U141 ( .A(pi_data[10]), .Y(n188) );
  CLKINVX1 U142 ( .A(pi_data[11]), .Y(n187) );
  CLKINVX1 U143 ( .A(pi_data[12]), .Y(n186) );
  CLKINVX1 U144 ( .A(pi_data[13]), .Y(n185) );
  CLKINVX1 U145 ( .A(pi_data[14]), .Y(n184) );
  CLKINVX1 U146 ( .A(pi_data[15]), .Y(n183) );
  CLKINVX1 U147 ( .A(pi_data[8]), .Y(n190) );
  CLKINVX1 U148 ( .A(pi_data[0]), .Y(n198) );
  ADDHXL U149 ( .A(N19), .B(n172), .CO(\r389/carry[2] ), .S(N34) );
  ADDHXL U150 ( .A(N20), .B(\r389/carry[2] ), .CO(\r389/carry[3] ), .S(N35) );
  ADDHXL U151 ( .A(N21), .B(\r389/carry[3] ), .CO(\r389/carry[4] ), .S(N36) );
  NAND2X1 U152 ( .A(n13), .B(n29), .Y(n82) );
  OAI22XL U153 ( .A0(pi_data_reg[13]), .A1(n40), .B0(pi_data_reg[12]), .B1(n39), .Y(n11) );
  OAI22XL U154 ( .A0(pi_data_reg[15]), .A1(n42), .B0(pi_data_reg[14]), .B1(n41), .Y(n10) );
  OAI21XL U155 ( .A0(n11), .A1(n10), .B0(N20), .Y(n16) );
  OAI22XL U156 ( .A0(pi_data_reg[9]), .A1(n40), .B0(pi_data_reg[8]), .B1(n39), 
        .Y(n14) );
  OAI22XL U157 ( .A0(pi_data_reg[11]), .A1(n42), .B0(pi_data_reg[10]), .B1(n41), .Y(n12) );
  OAI21XL U158 ( .A0(n14), .A1(n12), .B0(n52), .Y(n15) );
  AOI21X1 U159 ( .A0(n16), .A1(n15), .B0(n51), .Y(n50) );
  OAI22XL U160 ( .A0(pi_data_reg[5]), .A1(n40), .B0(pi_data_reg[4]), .B1(n39), 
        .Y(n18) );
  OAI22XL U161 ( .A0(pi_data_reg[7]), .A1(n42), .B0(pi_data_reg[6]), .B1(n41), 
        .Y(n17) );
  OAI21XL U162 ( .A0(n18), .A1(n17), .B0(N20), .Y(n30) );
  OAI22XL U163 ( .A0(pi_data_reg[1]), .A1(n40), .B0(pi_data_reg[0]), .B1(n39), 
        .Y(n20) );
  OAI22XL U164 ( .A0(pi_data_reg[3]), .A1(n42), .B0(pi_data_reg[2]), .B1(n41), 
        .Y(n19) );
  OAI21XL U165 ( .A0(n20), .A1(n19), .B0(n52), .Y(n28) );
  AOI21X1 U166 ( .A0(n30), .A1(n28), .B0(N21), .Y(n49) );
  OAI22XL U167 ( .A0(pi_data_reg[21]), .A1(n40), .B0(pi_data_reg[20]), .B1(n39), .Y(n32) );
  OAI22XL U168 ( .A0(pi_data_reg[23]), .A1(n42), .B0(pi_data_reg[22]), .B1(n41), .Y(n31) );
  OAI21XL U169 ( .A0(n32), .A1(n31), .B0(N20), .Y(n36) );
  OAI22XL U170 ( .A0(pi_data_reg[17]), .A1(n40), .B0(pi_data_reg[16]), .B1(n39), .Y(n34) );
  OAI22XL U171 ( .A0(pi_data_reg[19]), .A1(n42), .B0(pi_data_reg[18]), .B1(n41), .Y(n33) );
  OAI21XL U172 ( .A0(n34), .A1(n33), .B0(n52), .Y(n35) );
  AOI21X1 U173 ( .A0(n36), .A1(n35), .B0(N21), .Y(n48) );
  OAI22XL U174 ( .A0(pi_data_reg[29]), .A1(n40), .B0(pi_data_reg[28]), .B1(n39), .Y(n38) );
  OAI22XL U175 ( .A0(pi_data_reg[31]), .A1(n42), .B0(pi_data_reg[30]), .B1(n41), .Y(n37) );
  OAI21XL U176 ( .A0(n38), .A1(n37), .B0(N20), .Y(n46) );
  OAI22XL U177 ( .A0(pi_data_reg[25]), .A1(n40), .B0(pi_data_reg[24]), .B1(n39), .Y(n44) );
  OAI22XL U178 ( .A0(pi_data_reg[27]), .A1(n42), .B0(pi_data_reg[26]), .B1(n41), .Y(n43) );
  OAI21XL U179 ( .A0(n44), .A1(n43), .B0(n52), .Y(n45) );
  AOI21X1 U180 ( .A0(n46), .A1(n45), .B0(n51), .Y(n47) );
  OAI33X1 U181 ( .A0(n50), .A1(N22), .A2(n49), .B0(n132), .B1(n48), .B2(n47), 
        .Y(N43) );
  OAI22XL U182 ( .A0(pi_data_reg[13]), .A1(n154), .B0(pi_data_reg[12]), .B1(
        n153), .Y(n134) );
  OAI22XL U183 ( .A0(pi_data_reg[15]), .A1(n156), .B0(pi_data_reg[14]), .B1(
        n155), .Y(n133) );
  OAI21XL U184 ( .A0(n134), .A1(n133), .B0(N25), .Y(n138) );
  OAI22XL U185 ( .A0(pi_data_reg[9]), .A1(n154), .B0(pi_data_reg[8]), .B1(n153), .Y(n136) );
  OAI22XL U186 ( .A0(pi_data_reg[11]), .A1(n156), .B0(pi_data_reg[10]), .B1(
        n155), .Y(n135) );
  OAI21XL U187 ( .A0(n136), .A1(n135), .B0(n168), .Y(n137) );
  AOI21X1 U188 ( .A0(n138), .A1(n137), .B0(n167), .Y(n164) );
  OAI22XL U189 ( .A0(pi_data_reg[5]), .A1(n154), .B0(pi_data_reg[4]), .B1(n153), .Y(n140) );
  OAI22XL U190 ( .A0(pi_data_reg[7]), .A1(n156), .B0(pi_data_reg[6]), .B1(n155), .Y(n139) );
  OAI21XL U191 ( .A0(n140), .A1(n139), .B0(N25), .Y(n144) );
  OAI22XL U192 ( .A0(pi_data_reg[1]), .A1(n154), .B0(pi_data_reg[0]), .B1(n153), .Y(n142) );
  OAI22XL U193 ( .A0(pi_data_reg[3]), .A1(n156), .B0(pi_data_reg[2]), .B1(n155), .Y(n141) );
  OAI21XL U194 ( .A0(n142), .A1(n141), .B0(n168), .Y(n143) );
  AOI21X1 U195 ( .A0(n144), .A1(n143), .B0(N26), .Y(n163) );
  OAI22XL U196 ( .A0(pi_data_reg[21]), .A1(n154), .B0(pi_data_reg[20]), .B1(
        n153), .Y(n146) );
  OAI22XL U197 ( .A0(pi_data_reg[23]), .A1(n156), .B0(pi_data_reg[22]), .B1(
        n155), .Y(n145) );
  OAI21XL U198 ( .A0(n146), .A1(n145), .B0(N25), .Y(n150) );
  OAI22XL U199 ( .A0(pi_data_reg[17]), .A1(n154), .B0(pi_data_reg[16]), .B1(
        n153), .Y(n148) );
  OAI22XL U200 ( .A0(pi_data_reg[19]), .A1(n156), .B0(pi_data_reg[18]), .B1(
        n155), .Y(n147) );
  OAI21XL U201 ( .A0(n148), .A1(n147), .B0(n168), .Y(n149) );
  AOI21X1 U202 ( .A0(n150), .A1(n149), .B0(N26), .Y(n162) );
  OAI22XL U203 ( .A0(pi_data_reg[31]), .A1(n156), .B0(pi_data_reg[30]), .B1(
        n155), .Y(n151) );
  OAI21XL U204 ( .A0(n152), .A1(n151), .B0(N25), .Y(n160) );
  OAI22XL U205 ( .A0(pi_data_reg[25]), .A1(n154), .B0(pi_data_reg[24]), .B1(
        n153), .Y(n158) );
  OAI22XL U206 ( .A0(pi_data_reg[27]), .A1(n156), .B0(pi_data_reg[26]), .B1(
        n155), .Y(n157) );
  OAI21XL U207 ( .A0(n158), .A1(n157), .B0(n168), .Y(n159) );
  AOI21X1 U208 ( .A0(n160), .A1(n159), .B0(n167), .Y(n161) );
  OAI33X1 U209 ( .A0(n164), .A1(N27), .A2(n163), .B0(n166), .B1(n162), .B2(
        n161), .Y(N44) );
  NOR2X1 U210 ( .A(N19), .B(n172), .Y(n174) );
  NAND2X1 U211 ( .A(n174), .B(n52), .Y(n175) );
  XNOR2X1 U212 ( .A(N21), .B(n175), .Y(N31) );
  NOR2X1 U213 ( .A(N21), .B(n175), .Y(n176) );
  XOR2X1 U214 ( .A(N22), .B(n176), .Y(N32) );
  XOR2X1 U215 ( .A(\r389/carry[4] ), .B(N22), .Y(N37) );
endmodule


module DAC ( clk, reset, pi_end, so_data, nxt_so_data, so_valid, oem_finish, 
        odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, 
        even4_wr, oem_addr, oem_dataout );
  output [4:0] oem_addr;
  output [7:0] oem_dataout;
  input clk, reset, pi_end, so_data, nxt_so_data, so_valid;
  output oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr,
         even3_wr, even4_wr;
  wire   n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         odd_mem_flag, pi_end_reg, N38, N39, N40, N44, N45, N46, N47, n1, n2,
         n3, n4, n8, n9, n10, n12, n13, n17, n19, n21, n23, n26, n27, n29, n34,
         n35, n37, n38, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, \add_295/carry[4] , \add_295/carry[3] , \add_295/carry[2] ,
         n5, n6, n16, n22, n31, n68, n89, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113;
  wire   [2:0] ptr;

  DFFRX1 \X_reg[2]  ( .D(n64), .CK(clk), .RN(n102), .Q(n100), .QN(n54) );
  DFFRX1 \X_reg[1]  ( .D(n65), .CK(clk), .RN(n102), .QN(n55) );
  DFFRX1 \X_reg[0]  ( .D(n66), .CK(clk), .RN(n102), .QN(n56) );
  DFFRX1 \Buffer_reg[4]  ( .D(n73), .CK(clk), .RN(n103), .Q(n96), .QN(n47) );
  DFFRX1 \Buffer_reg[6]  ( .D(n71), .CK(clk), .RN(n103), .Q(n95), .QN(n49) );
  DFFRX1 \Buffer_reg[2]  ( .D(n75), .CK(clk), .RN(n103), .Q(n94), .QN(n45) );
  DFFRX1 \Buffer_reg[5]  ( .D(n72), .CK(clk), .RN(n103), .Q(n93), .QN(n48) );
  DFFRX1 \Buffer_reg[1]  ( .D(n76), .CK(clk), .RN(n103), .Q(n92), .QN(n44) );
  DFFRX1 \Buffer_reg[7]  ( .D(n70), .CK(clk), .RN(n103), .Q(n97), .QN(n50) );
  DFFRX1 \Buffer_reg[3]  ( .D(n74), .CK(clk), .RN(n103), .Q(n91), .QN(n46) );
  DFFRX1 \Buffer_reg[0]  ( .D(n69), .CK(clk), .RN(n102), .QN(n57) );
  DFFRX1 even_mem_flag_reg ( .D(n60), .CK(clk), .RN(n103), .QN(n51) );
  DFFRX1 pi_end_reg_reg ( .D(n67), .CK(clk), .RN(n102), .Q(pi_end_reg), .QN(
        n98) );
  DFFRX1 \mem_count_reg[1]  ( .D(n62), .CK(clk), .RN(n102), .Q(n6), .QN(n52)
         );
  DFFRX1 \mem_count_reg[0]  ( .D(n63), .CK(clk), .RN(n102), .Q(n5), .QN(n53)
         );
  DFFRX1 \oem_addr_reg[0]  ( .D(n80), .CK(clk), .RN(n102), .Q(n127), .QN(n89)
         );
  DFFRX1 oem_finish_reg ( .D(n59), .CK(clk), .RN(n103), .Q(n114), .QN(n58) );
  DFFRX1 \oem_addr_reg[1]  ( .D(n77), .CK(clk), .RN(n102), .Q(n126), .QN(n68)
         );
  DFFRX1 \oem_addr_reg[4]  ( .D(n81), .CK(clk), .RN(n102), .Q(n123), .QN(n31)
         );
  DFFRX1 \oem_addr_reg[2]  ( .D(n78), .CK(clk), .RN(n102), .Q(n125), .QN(n22)
         );
  DFFRX1 \oem_addr_reg[3]  ( .D(n79), .CK(clk), .RN(n102), .Q(n124), .QN(n16)
         );
  DFFSX1 \ptr_reg[0]  ( .D(N38), .CK(clk), .SN(n113), .Q(ptr[0]), .QN(n108) );
  DFFSX1 \ptr_reg[1]  ( .D(N39), .CK(clk), .SN(n113), .Q(ptr[1]), .QN(n110) );
  DFFSX1 \ptr_reg[2]  ( .D(N40), .CK(clk), .SN(n113), .Q(ptr[2]), .QN(n109) );
  DFFSX1 odd_mem_flag_reg ( .D(n61), .CK(clk), .SN(n113), .Q(odd_mem_flag) );
  OR2X1 U3 ( .A(n101), .B(n50), .Y(n128) );
  INVX12 U4 ( .A(n128), .Y(oem_dataout[7]) );
  OR2X1 U5 ( .A(n101), .B(n49), .Y(n129) );
  INVX12 U6 ( .A(n129), .Y(oem_dataout[6]) );
  OR2X1 U7 ( .A(n101), .B(n48), .Y(n130) );
  INVX12 U8 ( .A(n130), .Y(oem_dataout[5]) );
  BUFX2 U9 ( .A(pi_end_reg), .Y(n101) );
  OR2X1 U10 ( .A(n101), .B(n47), .Y(n131) );
  INVX12 U11 ( .A(n131), .Y(oem_dataout[4]) );
  INVX12 U12 ( .A(n16), .Y(oem_addr[3]) );
  OR2X1 U13 ( .A(n101), .B(n46), .Y(n132) );
  INVX12 U14 ( .A(n132), .Y(oem_dataout[3]) );
  INVX12 U15 ( .A(n22), .Y(oem_addr[2]) );
  OR2X1 U16 ( .A(n4), .B(n41), .Y(n120) );
  INVX12 U17 ( .A(n120), .Y(even2_wr) );
  OR2X1 U18 ( .A(n3), .B(n41), .Y(n121) );
  INVX12 U19 ( .A(n121), .Y(even3_wr) );
  OR2X1 U20 ( .A(n51), .B(n10), .Y(n41) );
  OR2X1 U21 ( .A(n101), .B(n45), .Y(n133) );
  INVX12 U22 ( .A(n133), .Y(oem_dataout[2]) );
  INVX12 U23 ( .A(n31), .Y(oem_addr[4]) );
  XOR2XL U24 ( .A(\add_295/carry[4] ), .B(n123), .Y(N47) );
  OR2X1 U25 ( .A(n2), .B(n41), .Y(n122) );
  INVX12 U26 ( .A(n122), .Y(even4_wr) );
  OR2X1 U27 ( .A(n101), .B(n44), .Y(n134) );
  INVX12 U28 ( .A(n134), .Y(oem_dataout[1]) );
  BUFX12 U29 ( .A(n115), .Y(odd1_wr) );
  NOR3X1 U30 ( .A(n6), .B(n1), .C(n5), .Y(n115) );
  INVX12 U31 ( .A(n68), .Y(oem_addr[1]) );
  BUFX12 U32 ( .A(n114), .Y(oem_finish) );
  OR2X1 U33 ( .A(n1), .B(n4), .Y(n116) );
  INVX12 U34 ( .A(n116), .Y(odd2_wr) );
  NAND2X1 U35 ( .A(odd_mem_flag), .B(n104), .Y(n1) );
  OR2X1 U36 ( .A(n1), .B(n3), .Y(n117) );
  INVX12 U37 ( .A(n117), .Y(odd3_wr) );
  OR2X1 U38 ( .A(n1), .B(n2), .Y(n118) );
  INVX12 U39 ( .A(n118), .Y(odd4_wr) );
  OR2X1 U40 ( .A(n101), .B(n57), .Y(n135) );
  INVX12 U41 ( .A(n135), .Y(oem_dataout[0]) );
  BUFX12 U42 ( .A(n119), .Y(even1_wr) );
  NOR3X1 U43 ( .A(n41), .B(n5), .C(n6), .Y(n119) );
  INVX12 U44 ( .A(n89), .Y(oem_addr[0]) );
  CLKINVX1 U45 ( .A(n43), .Y(n107) );
  CLKINVX1 U46 ( .A(n10), .Y(n104) );
  INVX1 U47 ( .A(so_data), .Y(n111) );
  NAND2X1 U48 ( .A(n107), .B(n109), .Y(n10) );
  NAND2X1 U49 ( .A(n110), .B(n108), .Y(n43) );
  NAND2X1 U50 ( .A(n5), .B(n6), .Y(n2) );
  INVXL U51 ( .A(so_valid), .Y(n112) );
  NOR2X1 U52 ( .A(n109), .B(n112), .Y(n23) );
  NOR2BX1 U53 ( .AN(n23), .B(n110), .Y(n19) );
  NOR2BX1 U54 ( .AN(n38), .B(n110), .Y(n35) );
  OAI211X1 U55 ( .A0(n110), .A1(n108), .B0(n43), .C0(n42), .Y(N39) );
  OR2XL U56 ( .A(n101), .B(so_valid), .Y(n42) );
  OAI211X1 U57 ( .A0(n107), .A1(n109), .B0(n10), .C0(n42), .Y(N40) );
  CLKINVX1 U58 ( .A(n12), .Y(n105) );
  CLKBUFX3 U59 ( .A(n113), .Y(n103) );
  CLKBUFX3 U60 ( .A(n113), .Y(n102) );
  OAI2BB2XL U61 ( .B0(n111), .B1(n34), .A0N(n91), .A1N(n34), .Y(n74) );
  NAND2X1 U62 ( .A(n35), .B(ptr[0]), .Y(n34) );
  OAI2BB2XL U63 ( .B0(n111), .B1(n40), .A0N(n92), .A1N(n40), .Y(n76) );
  NAND2X1 U64 ( .A(n38), .B(n27), .Y(n40) );
  OAI2BB2XL U65 ( .B0(n111), .B1(n26), .A0N(n93), .A1N(n26), .Y(n72) );
  NAND2X1 U66 ( .A(n27), .B(n23), .Y(n26) );
  OAI2BB2XL U67 ( .B0(n111), .B1(n37), .A0N(n94), .A1N(n37), .Y(n75) );
  NAND2X1 U68 ( .A(n35), .B(n108), .Y(n37) );
  OAI2BB2XL U69 ( .B0(n111), .B1(n21), .A0N(n95), .A1N(n21), .Y(n71) );
  NAND2X1 U70 ( .A(n19), .B(n108), .Y(n21) );
  OAI2BB2XL U71 ( .B0(n111), .B1(n29), .A0N(n96), .A1N(n29), .Y(n73) );
  NAND2X1 U72 ( .A(n23), .B(n107), .Y(n29) );
  OAI2BB2XL U73 ( .B0(n17), .B1(n111), .A0N(n97), .A1N(n17), .Y(n70) );
  NAND2X1 U74 ( .A(ptr[0]), .B(n19), .Y(n17) );
  OAI2BB2XL U75 ( .B0(so_valid), .B1(n57), .A0N(so_valid), .A1N(nxt_so_data), 
        .Y(n69) );
  OAI2BB1X1 U76 ( .A0N(pi_end), .A1N(n12), .B0(n98), .Y(n67) );
  ADDHXL U77 ( .A(n126), .B(n127), .CO(\add_295/carry[2] ), .S(N44) );
  ADDHXL U78 ( .A(n125), .B(\add_295/carry[2] ), .CO(\add_295/carry[3] ), .S(
        N45) );
  AO22X1 U79 ( .A0(n105), .A1(n123), .B0(N47), .B1(n12), .Y(n81) );
  ADDHXL U80 ( .A(n124), .B(\add_295/carry[3] ), .CO(\add_295/carry[4] ), .S(
        N46) );
  NAND4X1 U81 ( .A(n127), .B(n12), .C(n126), .D(n13), .Y(n8) );
  AND3XL U82 ( .A(n123), .B(n125), .C(n124), .Y(n13) );
  OAI221XL U83 ( .A0(n4), .A1(n8), .B0(n52), .B1(n106), .C0(n3), .Y(n62) );
  CLKINVX1 U84 ( .A(n8), .Y(n106) );
  AO22X1 U85 ( .A0(n105), .A1(n124), .B0(N46), .B1(n12), .Y(n79) );
  XOR2X1 U86 ( .A(n8), .B(n53), .Y(n63) );
  OAI21XL U87 ( .A0(n2), .A1(n8), .B0(n58), .Y(n59) );
  NAND2X1 U88 ( .A(n52), .B(n5), .Y(n4) );
  NAND2X1 U89 ( .A(n53), .B(n6), .Y(n3) );
  AO22X1 U90 ( .A0(n105), .A1(n125), .B0(N45), .B1(n12), .Y(n78) );
  NOR2X1 U91 ( .A(n112), .B(ptr[2]), .Y(n38) );
  AO22X1 U92 ( .A0(n105), .A1(n126), .B0(N44), .B1(n12), .Y(n77) );
  AO22X1 U93 ( .A0(n105), .A1(n127), .B0(n89), .B1(n12), .Y(n80) );
  NAND2X1 U94 ( .A(ptr[0]), .B(n42), .Y(N38) );
  NOR2X2 U95 ( .A(n10), .B(n56), .Y(n12) );
  XOR2X1 U96 ( .A(n99), .B(n100), .Y(n64) );
  NOR2X1 U97 ( .A(n55), .B(n105), .Y(n99) );
  XOR2X1 U98 ( .A(n105), .B(n55), .Y(n65) );
  OAI31X1 U99 ( .A0(n56), .A1(n54), .A2(n55), .B0(n104), .Y(n9) );
  XOR2X1 U100 ( .A(n51), .B(n9), .Y(n60) );
  XNOR2X1 U101 ( .A(odd_mem_flag), .B(n9), .Y(n61) );
  XOR2X1 U102 ( .A(n10), .B(n56), .Y(n66) );
  NOR2X1 U103 ( .A(n108), .B(ptr[1]), .Y(n27) );
  CLKINVX1 U104 ( .A(reset), .Y(n113) );
endmodule


module STI_DAC ( clk, reset, load, pi_msb, pi_low, pi_end, pi_data, pi_length, 
        pi_fill, so_data, so_valid, oem_finish, odd1_wr, odd2_wr, odd3_wr, 
        odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr, oem_addr, oem_dataout
 );
  input [15:0] pi_data;
  input [1:0] pi_length;
  output [4:0] oem_addr;
  output [7:0] oem_dataout;
  input clk, reset, load, pi_msb, pi_low, pi_end, pi_fill;
  output so_data, so_valid, oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr,
         even1_wr, even2_wr, even3_wr, even4_wr;
  wire   nxt_so_data, n1;

  STI STI_inst ( .clk(clk), .reset(reset), .load(load), .pi_msb(n1), .pi_low(
        pi_low), .pi_data(pi_data), .pi_length(pi_length), .pi_fill(pi_fill), 
        .so_data(so_data), .nxt_so_data(nxt_so_data), .so_valid(so_valid) );
  DAC DAC_inst ( .clk(clk), .reset(reset), .pi_end(pi_end), .so_data(so_data), 
        .nxt_so_data(nxt_so_data), .so_valid(so_valid), .oem_finish(oem_finish), .odd1_wr(odd1_wr), .odd2_wr(odd2_wr), .odd3_wr(odd3_wr), .odd4_wr(odd4_wr), 
        .even1_wr(even1_wr), .even2_wr(even2_wr), .even3_wr(even3_wr), 
        .even4_wr(even4_wr), .oem_addr(oem_addr), .oem_dataout(oem_dataout) );
  CLKBUFX3 U1 ( .A(pi_msb), .Y(n1) );
endmodule

