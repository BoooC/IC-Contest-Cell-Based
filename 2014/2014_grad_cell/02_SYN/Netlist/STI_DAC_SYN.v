/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : U-2022.12
// Date      : Sun Jan 26 14:35:05 2025
/////////////////////////////////////////////////////////////


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
  wire   n484, n485, n486, n487, n488, n489, n493, so_end, STI_inst_N245,
         STI_inst_count_done_reg, STI_inst_next_state_0_, STI_inst_state_0_,
         DAC_inst_N23, DAC_inst_so_end_toggle, DAC_inst_even_col_flag,
         DAC_inst_even_row_flag, DAC_inst_wr_flag, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n261, n263, n265, n279, n280, n282,
         n284, n286, n288, n289, n290, n291, n292, n293, n294, n295, n296,
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
         n473, n474, n475, n476, n477, n481, n482;
  wire   [31:0] STI_inst_data_buffer;
  wire   [4:3] STI_inst_pi_length_reg;
  wire   [4:0] STI_inst_count;
  wire   [1:0] DAC_inst_mem_idx;
  wire   [2:0] DAC_inst_count;

  DFFQX1 STI_inst_pi_length_reg_reg_3_ ( .D(n237), .CK(clk), .Q(
        STI_inst_pi_length_reg[3]) );
  DFFQX1 STI_inst_data_buffer_reg_0_ ( .D(n235), .CK(clk), .Q(
        STI_inst_data_buffer[0]) );
  DFFQX1 STI_inst_data_buffer_reg_1_ ( .D(n234), .CK(clk), .Q(
        STI_inst_data_buffer[1]) );
  DFFQX1 STI_inst_data_buffer_reg_2_ ( .D(n233), .CK(clk), .Q(
        STI_inst_data_buffer[2]) );
  DFFQX1 STI_inst_data_buffer_reg_3_ ( .D(n232), .CK(clk), .Q(
        STI_inst_data_buffer[3]) );
  DFFQX1 STI_inst_data_buffer_reg_4_ ( .D(n231), .CK(clk), .Q(
        STI_inst_data_buffer[4]) );
  DFFQX1 STI_inst_data_buffer_reg_5_ ( .D(n230), .CK(clk), .Q(
        STI_inst_data_buffer[5]) );
  DFFQX1 STI_inst_data_buffer_reg_6_ ( .D(n229), .CK(clk), .Q(
        STI_inst_data_buffer[6]) );
  DFFQX1 STI_inst_data_buffer_reg_7_ ( .D(n228), .CK(clk), .Q(
        STI_inst_data_buffer[7]) );
  DFFQX1 STI_inst_data_buffer_reg_8_ ( .D(n227), .CK(clk), .Q(
        STI_inst_data_buffer[8]) );
  DFFQX1 STI_inst_data_buffer_reg_9_ ( .D(n226), .CK(clk), .Q(
        STI_inst_data_buffer[9]) );
  DFFQX1 STI_inst_data_buffer_reg_10_ ( .D(n225), .CK(clk), .Q(
        STI_inst_data_buffer[10]) );
  DFFQX1 STI_inst_data_buffer_reg_11_ ( .D(n224), .CK(clk), .Q(
        STI_inst_data_buffer[11]) );
  DFFQX1 STI_inst_data_buffer_reg_12_ ( .D(n223), .CK(clk), .Q(
        STI_inst_data_buffer[12]) );
  DFFQX1 STI_inst_data_buffer_reg_13_ ( .D(n222), .CK(clk), .Q(
        STI_inst_data_buffer[13]) );
  DFFQX1 STI_inst_data_buffer_reg_14_ ( .D(n221), .CK(clk), .Q(
        STI_inst_data_buffer[14]) );
  DFFQX1 STI_inst_data_buffer_reg_15_ ( .D(n220), .CK(clk), .Q(
        STI_inst_data_buffer[15]) );
  DFFQX1 STI_inst_data_buffer_reg_16_ ( .D(n219), .CK(clk), .Q(
        STI_inst_data_buffer[16]) );
  DFFQX1 STI_inst_data_buffer_reg_17_ ( .D(n218), .CK(clk), .Q(
        STI_inst_data_buffer[17]) );
  DFFQX1 STI_inst_data_buffer_reg_18_ ( .D(n217), .CK(clk), .Q(
        STI_inst_data_buffer[18]) );
  DFFQX1 STI_inst_data_buffer_reg_19_ ( .D(n216), .CK(clk), .Q(
        STI_inst_data_buffer[19]) );
  DFFQX1 STI_inst_data_buffer_reg_20_ ( .D(n215), .CK(clk), .Q(
        STI_inst_data_buffer[20]) );
  DFFQX1 STI_inst_data_buffer_reg_21_ ( .D(n214), .CK(clk), .Q(
        STI_inst_data_buffer[21]) );
  DFFQX1 STI_inst_data_buffer_reg_22_ ( .D(n213), .CK(clk), .Q(
        STI_inst_data_buffer[22]) );
  DFFQX1 STI_inst_data_buffer_reg_23_ ( .D(n212), .CK(clk), .Q(
        STI_inst_data_buffer[23]) );
  DFFQX1 STI_inst_data_buffer_reg_24_ ( .D(n211), .CK(clk), .Q(
        STI_inst_data_buffer[24]) );
  DFFQX1 STI_inst_data_buffer_reg_25_ ( .D(n210), .CK(clk), .Q(
        STI_inst_data_buffer[25]) );
  DFFQX1 STI_inst_data_buffer_reg_26_ ( .D(n209), .CK(clk), .Q(
        STI_inst_data_buffer[26]) );
  DFFQX1 STI_inst_data_buffer_reg_27_ ( .D(n208), .CK(clk), .Q(
        STI_inst_data_buffer[27]) );
  DFFQX1 STI_inst_data_buffer_reg_28_ ( .D(n207), .CK(clk), .Q(
        STI_inst_data_buffer[28]) );
  DFFQX1 STI_inst_data_buffer_reg_29_ ( .D(n206), .CK(clk), .Q(
        STI_inst_data_buffer[29]) );
  DFFQX1 STI_inst_data_buffer_reg_30_ ( .D(n205), .CK(clk), .Q(
        STI_inst_data_buffer[30]) );
  DFFQX1 STI_inst_data_buffer_reg_31_ ( .D(n204), .CK(clk), .Q(
        STI_inst_data_buffer[31]) );
  DFFRX1 STI_inst_state_reg_0_ ( .D(STI_inst_next_state_0_), .CK(clk), .RN(
        n185), .Q(STI_inst_state_0_), .QN(n475) );
  DFFRX1 STI_inst_count_done_reg_reg ( .D(n466), .CK(clk), .RN(n185), .Q(
        STI_inst_count_done_reg) );
  DFFRX1 STI_inst_so_end_reg ( .D(n247), .CK(clk), .RN(n185), .Q(so_end), .QN(
        n477) );
  DFFRX1 STI_inst_count_reg_1_ ( .D(n203), .CK(clk), .RN(n185), .Q(
        STI_inst_count[1]), .QN(n467) );
  DFFRX1 STI_inst_count_reg_0_ ( .D(n202), .CK(clk), .RN(n185), .Q(
        STI_inst_count[0]), .QN(n472) );
  DFFRX1 STI_inst_count_reg_2_ ( .D(n201), .CK(clk), .RN(n185), .Q(
        STI_inst_count[2]), .QN(n473) );
  DFFRX1 STI_inst_count_reg_3_ ( .D(n200), .CK(clk), .RN(n185), .Q(
        STI_inst_count[3]), .QN(n470) );
  DFFRX1 STI_inst_count_reg_4_ ( .D(n199), .CK(clk), .RN(n185), .Q(
        STI_inst_count[4]), .QN(n474) );
  DFFRX1 DAC_inst_so_end_toggle_reg ( .D(n198), .CK(clk), .RN(n185), .Q(
        DAC_inst_so_end_toggle) );
  DFFRX1 DAC_inst_count_reg_0_ ( .D(n197), .CK(clk), .RN(n185), .Q(
        DAC_inst_count[0]) );
  DFFRX1 DAC_inst_count_reg_1_ ( .D(n196), .CK(clk), .RN(n185), .Q(
        DAC_inst_count[1]), .QN(n476) );
  DFFRX1 DAC_inst_count_reg_2_ ( .D(n195), .CK(clk), .RN(n185), .Q(
        DAC_inst_count[2]) );
  DFFRX1 DAC_inst_mem_idx_reg_0_ ( .D(n187), .CK(clk), .RN(n185), .Q(
        DAC_inst_mem_idx[0]), .QN(n468) );
  DFFRX1 DAC_inst_finish_reg_reg ( .D(n246), .CK(clk), .RN(n185), .Q(n485), 
        .QN(n284) );
  DFFRX1 DAC_inst_data_buffer_reg_7_ ( .D(n238), .CK(clk), .RN(n185), .QN(n249) );
  DFFRX1 STI_inst_so_data_reg ( .D(STI_inst_N245), .CK(clk), .RN(n185), .QN(
        n258) );
  DFFRX1 DAC_inst_data_buffer_reg_0_ ( .D(n244), .CK(clk), .RN(n185), .QN(n248) );
  DFFRX1 DAC_inst_data_buffer_reg_1_ ( .D(n243), .CK(clk), .RN(n185), .QN(n253) );
  DFFRX1 DAC_inst_data_buffer_reg_2_ ( .D(n242), .CK(clk), .RN(n185), .QN(n257) );
  DFFRX1 DAC_inst_data_buffer_reg_3_ ( .D(n241), .CK(clk), .RN(n185), .QN(n250) );
  DFFRX1 DAC_inst_data_buffer_reg_4_ ( .D(n240), .CK(clk), .RN(n185), .QN(n254) );
  DFFRX1 DAC_inst_data_buffer_reg_5_ ( .D(n239), .CK(clk), .RN(n185), .QN(n255) );
  DFFRX1 DAC_inst_data_buffer_reg_6_ ( .D(n245), .CK(clk), .RN(n185), .QN(n256) );
  DFFRX1 DAC_inst_mem_addr_reg_1_ ( .D(n189), .CK(clk), .RN(n185), .QN(n469)
         );
  DFFRX1 DAC_inst_mem_addr_reg_3_ ( .D(n191), .CK(clk), .RN(n185), .QN(n471)
         );
  DFFRX1 DAC_inst_mem_addr_reg_4_ ( .D(n192), .CK(clk), .RN(n185), .QN(n252)
         );
  DFFRX1 STI_inst_so_valid_reg ( .D(STI_inst_state_0_), .CK(clk), .RN(n185), 
        .Q(n484), .QN(n286) );
  DFFRX1 DAC_inst_wr_flag_reg ( .D(DAC_inst_N23), .CK(clk), .RN(n185), .Q(
        DAC_inst_wr_flag) );
  DFFRX1 DAC_inst_mem_idx_reg_1_ ( .D(n186), .CK(clk), .RN(n185), .Q(
        DAC_inst_mem_idx[1]), .QN(n481) );
  DFFRX1 DAC_inst_even_col_flag_reg ( .D(n194), .CK(clk), .RN(n185), .Q(
        DAC_inst_even_col_flag) );
  DFFRX1 DAC_inst_even_row_flag_reg ( .D(n188), .CK(clk), .RN(n185), .Q(
        DAC_inst_even_row_flag) );
  DFFX1 STI_inst_pi_length_reg_reg_4_ ( .D(n236), .CK(clk), .Q(
        STI_inst_pi_length_reg[4]), .QN(n482) );
  DFFRX1 DAC_inst_mem_addr_reg_0_ ( .D(n193), .CK(clk), .RN(n185), .Q(n493), 
        .QN(n282) );
  DFFRX1 DAC_inst_mem_addr_reg_2_ ( .D(n190), .CK(clk), .RN(n185), .QN(n251)
         );
  NAND3XL U260 ( .A(pi_msb), .B(n394), .C(n459), .Y(n395) );
  INVXL U261 ( .A(pi_length[1]), .Y(n431) );
  INVX2 U262 ( .A(n363), .Y(n259) );
  NAND3XL U263 ( .A(n481), .B(n329), .C(n328), .Y(n487) );
  AND2X1 U264 ( .A(n327), .B(n329), .Y(n280) );
  NAND2X2 U265 ( .A(n394), .B(n367), .Y(n366) );
  AND3X1 U266 ( .A(n332), .B(n365), .C(n396), .Y(n363) );
  NOR2X2 U267 ( .A(so_end), .B(n484), .Y(n417) );
  NOR2X2 U268 ( .A(n473), .B(n467), .Y(n288) );
  NOR2X4 U269 ( .A(n460), .B(pi_msb), .Y(n335) );
  NOR2X4 U270 ( .A(n365), .B(n460), .Y(n333) );
  NOR2X1 U271 ( .A(n334), .B(n460), .Y(n332) );
  NAND2X1 U272 ( .A(pi_length[1]), .B(pi_fill), .Y(n396) );
  INVX1 U273 ( .A(pi_data[4]), .Y(n434) );
  INVX1 U274 ( .A(pi_data[0]), .Y(n454) );
  INVX1 U275 ( .A(pi_data[7]), .Y(n452) );
  INVX1 U276 ( .A(pi_data[3]), .Y(n449) );
  INVX1 U277 ( .A(pi_data[15]), .Y(n456) );
  INVX1 U278 ( .A(pi_data[5]), .Y(n437) );
  INVX1 U279 ( .A(pi_data[6]), .Y(n440) );
  INVX1 U280 ( .A(pi_data[1]), .Y(n443) );
  INVX1 U281 ( .A(pi_data[2]), .Y(n446) );
  CLKINVX6 U282 ( .A(reset), .Y(n185) );
  INVX1 U283 ( .A(pi_length[0]), .Y(n367) );
  NOR2X1 U284 ( .A(n466), .B(n475), .Y(n331) );
  NOR2X1 U285 ( .A(n475), .B(n472), .Y(n430) );
  NOR2X2 U286 ( .A(so_end), .B(n417), .Y(n418) );
  NOR3BX2 U287 ( .AN(n332), .B(n394), .C(n365), .Y(n358) );
  OAI222XL U288 ( .A0(n434), .A1(n453), .B0(n433), .B1(load), .C0(n457), .C1(
        n432), .Y(n231) );
  OAI222XL U289 ( .A0(n437), .A1(n453), .B0(n436), .B1(load), .C0(n457), .C1(
        n435), .Y(n230) );
  OAI222XL U290 ( .A0(n446), .A1(n453), .B0(n445), .B1(load), .C0(n457), .C1(
        n444), .Y(n233) );
  OAI222XL U291 ( .A0(n440), .A1(n453), .B0(n439), .B1(load), .C0(n457), .C1(
        n438), .Y(n229) );
  OAI222XL U292 ( .A0(n443), .A1(n453), .B0(n442), .B1(load), .C0(n457), .C1(
        n441), .Y(n234) );
  CLKINVX1 U293 ( .A(pi_data[11]), .Y(n432) );
  CLKINVX1 U294 ( .A(pi_data[12]), .Y(n447) );
  CLKINVX1 U295 ( .A(pi_data[10]), .Y(n435) );
  CLKINVX1 U296 ( .A(pi_data[13]), .Y(n444) );
  CLKINVX1 U297 ( .A(pi_data[9]), .Y(n438) );
  CLKINVX1 U298 ( .A(pi_data[14]), .Y(n441) );
  NOR2X2 U299 ( .A(STI_inst_count[2]), .B(STI_inst_count[1]), .Y(n316) );
  NAND2BX2 U300 ( .AN(pi_low), .B(n334), .Y(n346) );
  NOR2BX2 U301 ( .AN(n333), .B(n366), .Y(n414) );
  NAND3X2 U302 ( .A(n459), .B(n365), .C(n396), .Y(n393) );
  NOR2X2 U303 ( .A(STI_inst_count[1]), .B(n473), .Y(n427) );
  BUFX12 U304 ( .A(n292), .Y(odd1_wr) );
  NOR3XL U305 ( .A(DAC_inst_mem_idx[1]), .B(n328), .C(n293), .Y(n292) );
  BUFX12 U306 ( .A(n294), .Y(even1_wr) );
  BUFX12 U307 ( .A(n295), .Y(odd2_wr) );
  NOR3XL U308 ( .A(DAC_inst_mem_idx[1]), .B(n328), .C(n326), .Y(n295) );
  INVX12 U309 ( .A(n487), .Y(even2_wr) );
  INVXL U310 ( .A(n486), .Y(n261) );
  INVX12 U311 ( .A(n261), .Y(odd3_wr) );
  NOR3BX1 U312 ( .AN(n327), .B(n481), .C(n293), .Y(n486) );
  INVXL U313 ( .A(n488), .Y(n263) );
  INVX12 U314 ( .A(n263), .Y(even3_wr) );
  INVXL U315 ( .A(n489), .Y(n265) );
  INVX12 U316 ( .A(n265), .Y(even4_wr) );
  INVX12 U317 ( .A(n258), .Y(so_data) );
  INVX12 U318 ( .A(n249), .Y(oem_dataout[7]) );
  INVX12 U319 ( .A(n471), .Y(oem_addr[3]) );
  INVX16 U320 ( .A(n251), .Y(oem_addr[2]) );
  INVX16 U321 ( .A(n256), .Y(oem_dataout[6]) );
  INVX16 U322 ( .A(n255), .Y(oem_dataout[5]) );
  INVX16 U323 ( .A(n254), .Y(oem_dataout[4]) );
  INVX16 U324 ( .A(n250), .Y(oem_dataout[3]) );
  INVX16 U325 ( .A(n257), .Y(oem_dataout[2]) );
  INVX16 U326 ( .A(n253), .Y(oem_dataout[1]) );
  INVX16 U327 ( .A(n248), .Y(oem_dataout[0]) );
  INVX16 U328 ( .A(n252), .Y(oem_addr[4]) );
  NAND2X1 U329 ( .A(STI_inst_count[0]), .B(n288), .Y(n424) );
  NAND2XL U330 ( .A(oem_addr[2]), .B(n463), .Y(n421) );
  NAND2X2 U331 ( .A(n334), .B(pi_low), .Y(n347) );
  NOR2X1 U332 ( .A(pi_length[1]), .B(pi_length[0]), .Y(n334) );
  INVX12 U333 ( .A(n279), .Y(odd4_wr) );
  NAND2XL U334 ( .A(DAC_inst_mem_idx[1]), .B(n280), .Y(n279) );
  INVX12 U335 ( .A(n469), .Y(oem_addr[1]) );
  INVX12 U336 ( .A(n282), .Y(oem_addr[0]) );
  OA21XL U337 ( .A0(n462), .A1(n493), .B0(n423), .Y(n193) );
  NAND2XL U338 ( .A(n462), .B(n493), .Y(n423) );
  NOR2BX2 U339 ( .AN(n335), .B(n398), .Y(n413) );
  NAND3X2 U340 ( .A(pi_fill), .B(pi_length[1]), .C(n367), .Y(n398) );
  NOR3X2 U341 ( .A(n394), .B(n365), .C(n364), .Y(n388) );
  INVX12 U342 ( .A(n284), .Y(oem_finish) );
  NAND2BX1 U343 ( .AN(n485), .B(n464), .Y(n246) );
  NOR2X2 U344 ( .A(STI_inst_count[2]), .B(n467), .Y(n428) );
  INVX12 U345 ( .A(n286), .Y(so_valid) );
  NAND2XL U346 ( .A(n484), .B(DAC_inst_count[0]), .Y(n422) );
  CLKINVX1 U347 ( .A(pi_data[8]), .Y(n450) );
  OAI222XL U348 ( .A0(STI_inst_count[4]), .A1(n482), .B0(n474), .B1(
        STI_inst_pi_length_reg[4]), .C0(STI_inst_pi_length_reg[3]), .C1(n470), 
        .Y(n289) );
  AOI211XL U349 ( .A0(STI_inst_pi_length_reg[3]), .A1(n470), .B0(n424), .C0(
        n289), .Y(n466) );
  AND2X1 U350 ( .A(DAC_inst_wr_flag), .B(DAC_inst_even_col_flag), .Y(n462) );
  NOR2X1 U351 ( .A(n423), .B(n469), .Y(n463) );
  NAND4XL U352 ( .A(n463), .B(oem_addr[2]), .C(oem_addr[4]), .D(oem_addr[3]), 
        .Y(n419) );
  NOR2X1 U353 ( .A(n419), .B(n468), .Y(n465) );
  NAND2XL U354 ( .A(n465), .B(DAC_inst_mem_idx[1]), .Y(n464) );
  AOI2BB2X1 U355 ( .B0(DAC_inst_even_col_flag), .B1(DAC_inst_even_row_flag), 
        .A0N(DAC_inst_even_col_flag), .A1N(DAC_inst_even_row_flag), .Y(n328)
         );
  INVXL U356 ( .A(n328), .Y(n327) );
  NAND2X1 U357 ( .A(DAC_inst_wr_flag), .B(n468), .Y(n293) );
  NAND2XL U358 ( .A(DAC_inst_mem_idx[1]), .B(n328), .Y(n290) );
  NOR2XL U359 ( .A(n290), .B(n293), .Y(n488) );
  NAND2XL U360 ( .A(DAC_inst_wr_flag), .B(DAC_inst_mem_idx[0]), .Y(n326) );
  NOR2XL U361 ( .A(n326), .B(n290), .Y(n489) );
  AOI31XL U362 ( .A0(DAC_inst_count[0]), .A1(DAC_inst_count[2]), .A2(
        DAC_inst_count[1]), .B0(DAC_inst_so_end_toggle), .Y(n291) );
  INVXL U363 ( .A(n291), .Y(DAC_inst_N23) );
  AOI21XL U364 ( .A0(n475), .A1(n472), .B0(n430), .Y(n202) );
  NOR3XL U365 ( .A(DAC_inst_mem_idx[1]), .B(n327), .C(n293), .Y(n294) );
  AO22X1 U366 ( .A0(n427), .A1(STI_inst_data_buffer[2]), .B0(n428), .B1(
        STI_inst_data_buffer[4]), .Y(n296) );
  AOI211XL U367 ( .A0(STI_inst_data_buffer[0]), .A1(n288), .B0(n472), .C0(n296), .Y(n297) );
  OAI2BB1XL U368 ( .A0N(STI_inst_data_buffer[6]), .A1N(n316), .B0(n297), .Y(
        n308) );
  AO22X1 U369 ( .A0(n427), .A1(STI_inst_data_buffer[3]), .B0(n316), .B1(
        STI_inst_data_buffer[7]), .Y(n298) );
  AOI211XL U370 ( .A0(n428), .A1(STI_inst_data_buffer[5]), .B0(
        STI_inst_count[0]), .C0(n298), .Y(n299) );
  OAI2BB1XL U371 ( .A0N(n288), .A1N(STI_inst_data_buffer[1]), .B0(n299), .Y(
        n307) );
  AO22X1 U372 ( .A0(n316), .A1(STI_inst_data_buffer[23]), .B0(n428), .B1(
        STI_inst_data_buffer[21]), .Y(n300) );
  AOI211XL U373 ( .A0(n288), .A1(STI_inst_data_buffer[17]), .B0(
        STI_inst_count[0]), .C0(n300), .Y(n305) );
  NAND2XL U374 ( .A(n427), .B(STI_inst_data_buffer[19]), .Y(n304) );
  AO22X1 U375 ( .A0(n316), .A1(STI_inst_data_buffer[22]), .B0(n288), .B1(
        STI_inst_data_buffer[16]), .Y(n301) );
  AOI211XL U376 ( .A0(n428), .A1(STI_inst_data_buffer[20]), .B0(n472), .C0(
        n301), .Y(n303) );
  NAND2XL U377 ( .A(n427), .B(STI_inst_data_buffer[18]), .Y(n302) );
  AOI22XL U378 ( .A0(n305), .A1(n304), .B0(n303), .B1(n302), .Y(n306) );
  AOI32XL U379 ( .A0(n308), .A1(STI_inst_count[4]), .A2(n307), .B0(n306), .B1(
        n474), .Y(n325) );
  AO22X1 U380 ( .A0(n316), .A1(STI_inst_data_buffer[15]), .B0(n288), .B1(
        STI_inst_data_buffer[9]), .Y(n309) );
  AOI211XL U381 ( .A0(n428), .A1(STI_inst_data_buffer[13]), .B0(
        STI_inst_count[0]), .C0(n309), .Y(n314) );
  NAND2XL U382 ( .A(n427), .B(STI_inst_data_buffer[11]), .Y(n313) );
  AO22X1 U383 ( .A0(n316), .A1(STI_inst_data_buffer[14]), .B0(n428), .B1(
        STI_inst_data_buffer[12]), .Y(n310) );
  AOI211XL U384 ( .A0(STI_inst_data_buffer[8]), .A1(n288), .B0(n472), .C0(n310), .Y(n312) );
  NAND2XL U385 ( .A(n427), .B(STI_inst_data_buffer[10]), .Y(n311) );
  AOI22XL U386 ( .A0(n314), .A1(n313), .B0(n312), .B1(n311), .Y(n323) );
  AO22X1 U387 ( .A0(n316), .A1(STI_inst_data_buffer[31]), .B0(n288), .B1(
        STI_inst_data_buffer[25]), .Y(n315) );
  AOI211XL U388 ( .A0(n428), .A1(STI_inst_data_buffer[29]), .B0(
        STI_inst_count[0]), .C0(n315), .Y(n321) );
  NAND2XL U389 ( .A(n427), .B(STI_inst_data_buffer[27]), .Y(n320) );
  AO22X1 U390 ( .A0(n316), .A1(STI_inst_data_buffer[30]), .B0(n428), .B1(
        STI_inst_data_buffer[28]), .Y(n317) );
  AOI211XL U391 ( .A0(STI_inst_data_buffer[24]), .A1(n288), .B0(n472), .C0(
        n317), .Y(n319) );
  NAND2XL U392 ( .A(n427), .B(STI_inst_data_buffer[26]), .Y(n318) );
  AOI22XL U393 ( .A0(n321), .A1(n320), .B0(n319), .B1(n318), .Y(n322) );
  AOI221XL U394 ( .A0(n323), .A1(STI_inst_count[4]), .B0(n322), .B1(n474), 
        .C0(STI_inst_count[3]), .Y(n324) );
  AOI211XL U395 ( .A0(STI_inst_count[3]), .A1(n325), .B0(n324), .C0(n475), .Y(
        STI_inst_N245) );
  INVXL U396 ( .A(n326), .Y(n329) );
  NAND2BX1 U397 ( .AN(n424), .B(n331), .Y(n426) );
  AOI211XL U398 ( .A0(n331), .A1(n470), .B0(n475), .C0(n424), .Y(n330) );
  OAI32XL U399 ( .A0(STI_inst_count[4]), .A1(n470), .A2(n426), .B0(n330), .B1(
        n474), .Y(n199) );
  INVXL U400 ( .A(n331), .Y(n458) );
  OAI32XL U401 ( .A0(STI_inst_count[1]), .A1(n472), .A2(n458), .B0(n430), .B1(
        n467), .Y(n203) );
  INVX6 U402 ( .A(load), .Y(n460) );
  CLKINVX1 U403 ( .A(pi_msb), .Y(n365) );
  NOR2X1 U404 ( .A(pi_fill), .B(n431), .Y(n394) );
  AOI22XL U405 ( .A0(STI_inst_data_buffer[27]), .A1(n460), .B0(pi_data[11]), 
        .B1(n358), .Y(n337) );
  OAI22XL U406 ( .A0(n432), .A1(n347), .B0(n449), .B1(n346), .Y(n354) );
  OAI22XL U407 ( .A0(n447), .A1(n347), .B0(n434), .B1(n346), .Y(n355) );
  AOI22XL U408 ( .A0(n333), .A1(n354), .B0(n335), .B1(n355), .Y(n336) );
  OAI211XL U409 ( .A0(n434), .A1(n259), .B0(n337), .C0(n336), .Y(n208) );
  AOI22XL U410 ( .A0(STI_inst_data_buffer[26]), .A1(n460), .B0(pi_data[10]), 
        .B1(n358), .Y(n339) );
  OAI22XL U411 ( .A0(n435), .A1(n347), .B0(n446), .B1(n346), .Y(n350) );
  OAI22XL U412 ( .A0(n444), .A1(n347), .B0(n437), .B1(n346), .Y(n351) );
  AOI22XL U413 ( .A0(n333), .A1(n350), .B0(n335), .B1(n351), .Y(n338) );
  OAI211XL U414 ( .A0(n437), .A1(n259), .B0(n339), .C0(n338), .Y(n209) );
  AOI22XL U415 ( .A0(STI_inst_data_buffer[24]), .A1(n460), .B0(pi_data[8]), 
        .B1(n358), .Y(n341) );
  OAI22XL U416 ( .A0(n450), .A1(n347), .B0(n454), .B1(n346), .Y(n342) );
  OAI22XL U417 ( .A0(n456), .A1(n347), .B0(n452), .B1(n346), .Y(n343) );
  AOI22XL U418 ( .A0(n333), .A1(n342), .B0(n335), .B1(n343), .Y(n340) );
  OAI211XL U419 ( .A0(n452), .A1(n259), .B0(n341), .C0(n340), .Y(n211) );
  AOI22XL U420 ( .A0(STI_inst_data_buffer[31]), .A1(n460), .B0(pi_data[15]), 
        .B1(n358), .Y(n345) );
  AOI22XL U421 ( .A0(n333), .A1(n343), .B0(n335), .B1(n342), .Y(n344) );
  OAI211XL U422 ( .A0(n454), .A1(n259), .B0(n345), .C0(n344), .Y(n204) );
  AOI22XL U423 ( .A0(STI_inst_data_buffer[25]), .A1(n460), .B0(pi_data[9]), 
        .B1(n358), .Y(n349) );
  OAI22XL U424 ( .A0(n438), .A1(n347), .B0(n443), .B1(n346), .Y(n359) );
  OAI22XL U425 ( .A0(n441), .A1(n347), .B0(n440), .B1(n346), .Y(n360) );
  AOI22XL U426 ( .A0(n333), .A1(n359), .B0(n335), .B1(n360), .Y(n348) );
  OAI211XL U427 ( .A0(n440), .A1(n259), .B0(n349), .C0(n348), .Y(n210) );
  AOI22XL U428 ( .A0(STI_inst_data_buffer[29]), .A1(n460), .B0(pi_data[13]), 
        .B1(n358), .Y(n353) );
  AOI22XL U429 ( .A0(n333), .A1(n351), .B0(n335), .B1(n350), .Y(n352) );
  OAI211XL U430 ( .A0(n446), .A1(n259), .B0(n353), .C0(n352), .Y(n206) );
  AOI22XL U431 ( .A0(STI_inst_data_buffer[28]), .A1(n460), .B0(pi_data[12]), 
        .B1(n358), .Y(n357) );
  AOI22XL U432 ( .A0(n333), .A1(n355), .B0(n335), .B1(n354), .Y(n356) );
  OAI211XL U433 ( .A0(n449), .A1(n259), .B0(n357), .C0(n356), .Y(n207) );
  AOI22XL U434 ( .A0(STI_inst_data_buffer[30]), .A1(n460), .B0(pi_data[14]), 
        .B1(n358), .Y(n362) );
  AOI22XL U435 ( .A0(n333), .A1(n360), .B0(n335), .B1(n359), .Y(n361) );
  OAI211XL U436 ( .A0(n443), .A1(n259), .B0(n362), .C0(n361), .Y(n205) );
  NOR2X1 U437 ( .A(n367), .B(n460), .Y(n459) );
  INVXL U438 ( .A(n459), .Y(n364) );
  AOI22XL U439 ( .A0(STI_inst_data_buffer[23]), .A1(n460), .B0(pi_data[7]), 
        .B1(n388), .Y(n369) );
  OAI22XL U440 ( .A0(n366), .A1(n456), .B0(n398), .B1(n452), .Y(n370) );
  OAI22XL U441 ( .A0(n450), .A1(n366), .B0(n454), .B1(n398), .Y(n371) );
  AOI22XL U442 ( .A0(n333), .A1(n370), .B0(n335), .B1(n371), .Y(n368) );
  OAI211XL U443 ( .A0(n450), .A1(n393), .B0(n369), .C0(n368), .Y(n212) );
  AOI22XL U444 ( .A0(STI_inst_data_buffer[16]), .A1(n460), .B0(pi_data[0]), 
        .B1(n388), .Y(n373) );
  AOI22XL U445 ( .A0(n333), .A1(n371), .B0(n335), .B1(n370), .Y(n372) );
  OAI211XL U446 ( .A0(n456), .A1(n393), .B0(n373), .C0(n372), .Y(n219) );
  AOI22XL U447 ( .A0(STI_inst_data_buffer[18]), .A1(n460), .B0(pi_data[2]), 
        .B1(n388), .Y(n375) );
  OAI22XL U448 ( .A0(n366), .A1(n435), .B0(n398), .B1(n446), .Y(n389) );
  OAI22XL U449 ( .A0(n366), .A1(n444), .B0(n398), .B1(n437), .Y(n390) );
  AOI22XL U450 ( .A0(n333), .A1(n389), .B0(n335), .B1(n390), .Y(n374) );
  OAI211XL U451 ( .A0(n444), .A1(n393), .B0(n375), .C0(n374), .Y(n217) );
  AOI22XL U452 ( .A0(STI_inst_data_buffer[17]), .A1(n460), .B0(pi_data[1]), 
        .B1(n388), .Y(n377) );
  OAI22XL U453 ( .A0(n366), .A1(n438), .B0(n398), .B1(n443), .Y(n384) );
  OAI22XL U454 ( .A0(n366), .A1(n441), .B0(n398), .B1(n440), .Y(n385) );
  AOI22XL U455 ( .A0(n333), .A1(n384), .B0(n335), .B1(n385), .Y(n376) );
  OAI211XL U456 ( .A0(n441), .A1(n393), .B0(n377), .C0(n376), .Y(n218) );
  AOI22XL U457 ( .A0(STI_inst_data_buffer[20]), .A1(n460), .B0(pi_data[4]), 
        .B1(n388), .Y(n379) );
  OAI22XL U458 ( .A0(n366), .A1(n447), .B0(n398), .B1(n434), .Y(n380) );
  OAI22XL U459 ( .A0(n366), .A1(n432), .B0(n398), .B1(n449), .Y(n381) );
  AOI22XL U460 ( .A0(n333), .A1(n380), .B0(n335), .B1(n381), .Y(n378) );
  OAI211XL U461 ( .A0(n432), .A1(n393), .B0(n379), .C0(n378), .Y(n215) );
  AOI22XL U462 ( .A0(STI_inst_data_buffer[19]), .A1(n460), .B0(pi_data[3]), 
        .B1(n388), .Y(n383) );
  AOI22XL U463 ( .A0(n333), .A1(n381), .B0(n335), .B1(n380), .Y(n382) );
  OAI211XL U464 ( .A0(n447), .A1(n393), .B0(n383), .C0(n382), .Y(n216) );
  AOI22XL U465 ( .A0(STI_inst_data_buffer[22]), .A1(n460), .B0(pi_data[6]), 
        .B1(n388), .Y(n387) );
  AOI22XL U466 ( .A0(n333), .A1(n385), .B0(n335), .B1(n384), .Y(n386) );
  OAI211XL U467 ( .A0(n438), .A1(n393), .B0(n387), .C0(n386), .Y(n213) );
  AOI22XL U468 ( .A0(STI_inst_data_buffer[21]), .A1(n460), .B0(pi_data[5]), 
        .B1(n388), .Y(n392) );
  AOI22XL U469 ( .A0(n333), .A1(n390), .B0(n335), .B1(n389), .Y(n391) );
  OAI211XL U470 ( .A0(n435), .A1(n393), .B0(n392), .C0(n391), .Y(n214) );
  CLKBUFX3 U471 ( .A(n395), .Y(n453) );
  NAND3BX1 U472 ( .AN(n396), .B(pi_length[0]), .C(n335), .Y(n397) );
  CLKBUFX3 U473 ( .A(n397), .Y(n457) );
  AOI2BB2X1 U474 ( .B0(STI_inst_data_buffer[8]), .B1(n460), .A0N(n452), .A1N(
        n457), .Y(n400) );
  AOI22XL U475 ( .A0(pi_data[0]), .A1(n414), .B0(pi_data[15]), .B1(n413), .Y(
        n399) );
  OAI211XL U476 ( .A0(n450), .A1(n453), .B0(n400), .C0(n399), .Y(n227) );
  AOI2BB2X1 U477 ( .B0(STI_inst_data_buffer[15]), .B1(n460), .A0N(n454), .A1N(
        n457), .Y(n402) );
  AOI22XL U478 ( .A0(pi_data[8]), .A1(n413), .B0(n414), .B1(pi_data[7]), .Y(
        n401) );
  OAI211XL U479 ( .A0(n453), .A1(n456), .B0(n402), .C0(n401), .Y(n220) );
  AOI2BB2X1 U480 ( .B0(STI_inst_data_buffer[11]), .B1(n460), .A0N(n457), .A1N(
        n434), .Y(n404) );
  AOI22XL U481 ( .A0(n414), .A1(pi_data[3]), .B0(n413), .B1(pi_data[12]), .Y(
        n403) );
  OAI211XL U482 ( .A0(n453), .A1(n432), .B0(n404), .C0(n403), .Y(n224) );
  AOI2BB2X1 U483 ( .B0(STI_inst_data_buffer[12]), .B1(n460), .A0N(n457), .A1N(
        n449), .Y(n406) );
  AOI22XL U484 ( .A0(n414), .A1(pi_data[4]), .B0(n413), .B1(pi_data[11]), .Y(
        n405) );
  OAI211XL U485 ( .A0(n453), .A1(n447), .B0(n406), .C0(n405), .Y(n223) );
  AOI2BB2X1 U486 ( .B0(STI_inst_data_buffer[10]), .B1(n460), .A0N(n457), .A1N(
        n437), .Y(n408) );
  AOI22XL U487 ( .A0(n414), .A1(pi_data[2]), .B0(n413), .B1(pi_data[13]), .Y(
        n407) );
  OAI211XL U488 ( .A0(n453), .A1(n435), .B0(n408), .C0(n407), .Y(n225) );
  AOI2BB2X1 U489 ( .B0(STI_inst_data_buffer[14]), .B1(n460), .A0N(n457), .A1N(
        n443), .Y(n410) );
  AOI22XL U490 ( .A0(n414), .A1(pi_data[6]), .B0(n413), .B1(pi_data[9]), .Y(
        n409) );
  OAI211XL U491 ( .A0(n453), .A1(n441), .B0(n410), .C0(n409), .Y(n221) );
  AOI2BB2X1 U492 ( .B0(STI_inst_data_buffer[13]), .B1(n460), .A0N(n457), .A1N(
        n446), .Y(n412) );
  AOI22XL U493 ( .A0(n414), .A1(pi_data[5]), .B0(n413), .B1(pi_data[10]), .Y(
        n411) );
  OAI211XL U494 ( .A0(n453), .A1(n444), .B0(n412), .C0(n411), .Y(n222) );
  AOI2BB2X1 U495 ( .B0(STI_inst_data_buffer[9]), .B1(n460), .A0N(n457), .A1N(
        n440), .Y(n416) );
  AOI22XL U496 ( .A0(n414), .A1(pi_data[1]), .B0(n413), .B1(pi_data[14]), .Y(
        n415) );
  OAI211XL U497 ( .A0(n453), .A1(n438), .B0(n416), .C0(n415), .Y(n226) );
  NOR2X1 U498 ( .A(n422), .B(n476), .Y(n461) );
  AOI21XL U499 ( .A0(n422), .A1(n476), .B0(n461), .Y(n196) );
  NOR2X1 U500 ( .A(n471), .B(n421), .Y(n420) );
  AOI2BB2X1 U501 ( .B0(oem_addr[4]), .B1(n420), .A0N(oem_addr[4]), .A1N(n420), 
        .Y(n192) );
  AO22X1 U502 ( .A0(n417), .A1(oem_dataout[7]), .B0(n418), .B1(oem_dataout[6]), 
        .Y(n238) );
  AO22X1 U503 ( .A0(n417), .A1(oem_dataout[1]), .B0(n418), .B1(oem_dataout[0]), 
        .Y(n243) );
  AO22X1 U504 ( .A0(n417), .A1(oem_dataout[0]), .B0(n418), .B1(so_data), .Y(
        n244) );
  AO22X1 U505 ( .A0(n417), .A1(oem_dataout[4]), .B0(n418), .B1(oem_dataout[3]), 
        .Y(n240) );
  AO22X1 U506 ( .A0(n417), .A1(oem_dataout[5]), .B0(n418), .B1(oem_dataout[4]), 
        .Y(n239) );
  AO22X1 U507 ( .A0(n417), .A1(oem_dataout[3]), .B0(n418), .B1(oem_dataout[2]), 
        .Y(n241) );
  AO22X1 U508 ( .A0(n417), .A1(oem_dataout[6]), .B0(n418), .B1(oem_dataout[5]), 
        .Y(n245) );
  AO22X1 U509 ( .A0(n417), .A1(oem_dataout[2]), .B0(n418), .B1(oem_dataout[1]), 
        .Y(n242) );
  AOI21XL U510 ( .A0(n419), .A1(n468), .B0(n465), .Y(n187) );
  OA21XL U511 ( .A0(n463), .A1(oem_addr[2]), .B0(n421), .Y(n190) );
  AOI21XL U512 ( .A0(n471), .A1(n421), .B0(n420), .Y(n191) );
  OA21XL U513 ( .A0(n484), .A1(DAC_inst_count[0]), .B0(n422), .Y(n197) );
  AOI21XL U514 ( .A0(n423), .A1(n469), .B0(n463), .Y(n189) );
  OAI2BB2XL U515 ( .B0(n477), .B1(DAC_inst_so_end_toggle), .A0N(n477), .A1N(
        DAC_inst_so_end_toggle), .Y(n198) );
  NOR2XL U516 ( .A(n475), .B(n424), .Y(n425) );
  OAI22XL U517 ( .A0(STI_inst_count[3]), .A1(n426), .B0(n470), .B1(n425), .Y(
        n200) );
  AOI21XL U518 ( .A0(n428), .A1(STI_inst_count[0]), .B0(n427), .Y(n429) );
  OAI22XL U519 ( .A0(n430), .A1(n473), .B0(n429), .B1(n458), .Y(n201) );
  OAI22XL U520 ( .A0(load), .A1(n482), .B0(n460), .B1(n431), .Y(n236) );
  INVXL U521 ( .A(STI_inst_data_buffer[4]), .Y(n433) );
  INVXL U522 ( .A(STI_inst_data_buffer[5]), .Y(n436) );
  INVXL U523 ( .A(STI_inst_data_buffer[6]), .Y(n439) );
  INVXL U524 ( .A(STI_inst_data_buffer[1]), .Y(n442) );
  INVXL U525 ( .A(STI_inst_data_buffer[2]), .Y(n445) );
  INVXL U526 ( .A(STI_inst_data_buffer[3]), .Y(n448) );
  OAI222XL U527 ( .A0(n449), .A1(n453), .B0(n448), .B1(load), .C0(n457), .C1(
        n447), .Y(n232) );
  INVXL U528 ( .A(STI_inst_data_buffer[7]), .Y(n451) );
  OAI222XL U529 ( .A0(n452), .A1(n453), .B0(n451), .B1(load), .C0(n450), .C1(
        n457), .Y(n228) );
  INVXL U530 ( .A(STI_inst_data_buffer[0]), .Y(n455) );
  OAI222XL U531 ( .A0(n457), .A1(n456), .B0(n455), .B1(load), .C0(n454), .C1(
        n453), .Y(n235) );
  OAI21XL U532 ( .A0(STI_inst_state_0_), .A1(n460), .B0(n458), .Y(
        STI_inst_next_state_0_) );
  AO21X1 U533 ( .A0(STI_inst_count_done_reg), .A1(pi_end), .B0(so_end), .Y(
        n247) );
  AO21X1 U534 ( .A0(n460), .A1(STI_inst_pi_length_reg[3]), .B0(n459), .Y(n237)
         );
  AOI2BB2X1 U535 ( .B0(DAC_inst_count[2]), .B1(n461), .A0N(DAC_inst_count[2]), 
        .A1N(n461), .Y(n195) );
  AOI2BB1X1 U536 ( .A0N(DAC_inst_wr_flag), .A1N(DAC_inst_even_col_flag), .B0(
        n462), .Y(n194) );
  AOI2BB2X1 U537 ( .B0(n463), .B1(DAC_inst_even_row_flag), .A0N(n463), .A1N(
        DAC_inst_even_row_flag), .Y(n188) );
  OA21XL U538 ( .A0(n465), .A1(DAC_inst_mem_idx[1]), .B0(n464), .Y(n186) );
endmodule

