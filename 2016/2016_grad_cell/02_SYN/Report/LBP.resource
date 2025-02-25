 
****************************************
Report : resources
Design : LBP
Version: U-2022.12
Date   : Sun Jan 26 14:49:07 2025
****************************************


Resource Report for this hierarchy in file ./LBP.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gte_x_1        | DW_cmp         | width=8    | gte_27 (LBP.v:27)          |
| gte_x_2        | DW_cmp         | width=8    | gte_28 (LBP.v:28)          |
| gte_x_3        | DW_cmp         | width=8    | gte_29 (LBP.v:29)          |
| gte_x_4        | DW_cmp         | width=8    | gte_31 (LBP.v:31)          |
| gte_x_5        | DW_cmp         | width=8    | gte_32 (LBP.v:32)          |
| gte_x_6        | DW_cmp         | width=8    | gte_34 (LBP.v:34)          |
| gte_x_7        | DW_cmp         | width=8    | gte_35 (LBP.v:35)          |
| gte_x_8        | DW_cmp         | width=8    | gte_36 (LBP.v:36)          |
| sub_x_20       | DW01_dec       | width=7    | sub_140 (LBP.v:140)        |
|                |                |            | sub_143 (LBP.v:143)        |
|                |                |            | sub_151 (LBP.v:151)        |
| sub_x_21       | DW01_dec       | width=7    | sub_140_2 (LBP.v:140)      |
|                |                |            | sub_141 (LBP.v:141)        |
|                |                |            | sub_142 (LBP.v:142)        |
| add_x_22       | DW01_inc       | width=7    | add_142 (LBP.v:142)        |
|                |                |            | add_145 (LBP.v:145)        |
|                |                |            | add_153 (LBP.v:153)        |
| add_x_23       | DW01_inc       | width=7    | add_151 (LBP.v:151)        |
|                |                |            | add_152 (LBP.v:152)        |
|                |                |            | add_153_2 (LBP.v:153)      |
| add_x_12       | DW01_inc       | width=3    | add_73 (LBP.v:73)          |
|                |                |            | add_76 (LBP.v:76)          |
| DP_OP_74J1_122_504              |            |                            |
|                | DP_OP_74J1_122_504 |        |                            |
| DP_OP_75J1_123_504              |            |                            |
|                | DP_OP_75J1_123_504 |        |                            |
=============================================================================

Datapath Report for DP_OP_74J1_122_504
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_74J1_122_504   | mult_add_97_aco (LBP.v:97) add_97_aco (LBP.v:97)    |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 7     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| T37   | IFO  | Unsigned | 7     | I1 * I2 (LBP.v:97)                       |
| O1    | PO   | Unsigned | 7     | T37 + $unsigned(1'b1) (LBP.v:97)         |
==============================================================================

Datapath Report for DP_OP_75J1_123_504
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_75J1_123_504   | mult_add_109_aco (LBP.v:109)                        |
|                      | add_109_aco (LBP.v:109)                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 7     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| T38   | IFO  | Unsigned | 7     | I1 * I2 (LBP.v:109)                      |
| O1    | PO   | Unsigned | 7     | T38 + $unsigned(1'b1) (LBP.v:109)        |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gte_x_1            | DW_cmp           | apparch (area)     |                |
| gte_x_2            | DW_cmp           | apparch (area)     |                |
| gte_x_3            | DW_cmp           | apparch (area)     |                |
| gte_x_4            | DW_cmp           | apparch (area)     |                |
| gte_x_5            | DW_cmp           | apparch (area)     |                |
| gte_x_6            | DW_cmp           | apparch (area)     |                |
| gte_x_7            | DW_cmp           | apparch (area)     |                |
| gte_x_8            | DW_cmp           | apparch (area)     |                |
| sub_x_20           | DW01_dec         | apparch (area)     |                |
| sub_x_21           | DW01_dec         | apparch (area)     |                |
| add_x_22           | DW01_inc         | pparch (area,speed)                 |
| add_x_23           | DW01_inc         | apparch (area)     |                |
| add_x_12           | DW01_inc         | apparch (area)     |                |
| DP_OP_74J1_122_504 | DP_OP_74J1_122_504 | str (area,speed) |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_75J1_123_504 | DP_OP_75J1_123_504 | str (area,speed) |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
