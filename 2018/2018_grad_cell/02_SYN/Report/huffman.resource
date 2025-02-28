 
****************************************
Report : resources
Design : huffman
Version: U-2022.12
Date   : Fri Feb 28 21:11:16 2025
****************************************


Resource Report for this hierarchy in file ./huffman.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_1        | DW01_inc       | width=3    | add_70 (huffman.v:70)      |
| eq_x_2         | DW_cmp         | width=3    | eq_71 (huffman.v:71)       |
| lt_x_3         | DW_cmp         | width=8    | lt_72 (huffman.v:72)       |
| sub_x_5        | DW01_sub       | width=3    | sub_82_aco (huffman.v:82)  |
| sub_x_6        | DW01_sub       | width=8    | sub_86 (huffman.v:86)      |
| sub_x_8        | DW01_sub       | width=8    | sub_87 (huffman.v:87)      |
| sub_x_10       | DW01_sub       | width=5    | sub_91 (huffman.v:91)      |
| sub_x_12       | DW01_sub       | width=5    | sub_92 (huffman.v:92)      |
| sub_x_14       | DW01_sub       | width=3    | sub_95 (huffman.v:95)      |
| eq_x_15        | DW_cmp         | width=3    | eq_95 (huffman.v:95)       |
| add_x_18       | DW01_add       | width=5    | add_180 (huffman.v:180)    |
| add_x_72       | DW01_inc       | width=3    | add_215 (huffman.v:215)    |
| add_x_74       | DW01_inc       | width=3    | add_224 (huffman.v:224)    |
| add_x_75       | DW01_inc       | width=2    | add_233 (huffman.v:233)    |
| DP_OP_450J1_122_5799            |            |                            |
|                | DP_OP_450J1_122_5799 |      |                            |
| DP_OP_451J1_123_5799            |            |                            |
|                | DP_OP_451J1_123_5799 |      |                            |
| sub_x_265      | DW01_sub       | width=3    | sub_200 (huffman.v:200)    |
|                |                |            | sub_200_2 (huffman.v:200)  |
|                |                |            | sub_71 (huffman.v:71)      |
|                |                |            | sub_71_2 (huffman.v:71)    |
| sub_x_266      | DW01_sub       | width=3    | sub_200 (huffman.v:200)    |
|                |                |            | sub_200_2 (huffman.v:200)  |
|                |                |            | sub_71 (huffman.v:71)      |
|                |                |            | sub_71_2 (huffman.v:71)    |
| DP_OP_448_128_6386              |            |                            |
|                | DP_OP_448_128_6386 |        |                            |
| DP_OP_449_129_9191              |            |                            |
|                | DP_OP_449_129_9191 |        |                            |
=============================================================================

Datapath Report for DP_OP_450J1_122_5799
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_450J1_122_5799 | mult_add_197_aco (huffman.v:197)                    |
|                      | add_197_aco (huffman.v:197)                         |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 3     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| T107  | IFO  | Unsigned | 3     | I1 * I2 (huffman.v:197)                  |
| O1    | PO   | Unsigned | 3     | T107 + $unsigned(1'b1) (huffman.v:197)   |
==============================================================================

Datapath Report for DP_OP_451J1_123_5799
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_451J1_123_5799 | mult_add_206_aco (huffman.v:206)                    |
|                      | add_206_aco (huffman.v:206)                         |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 3     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| T108  | IFO  | Unsigned | 3     | I1 * I2 (huffman.v:206)                  |
| O1    | PO   | Unsigned | 3     | T108 + $unsigned(1'b1) (huffman.v:206)   |
==============================================================================

Datapath Report for DP_OP_448_128_6386
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_448_128_6386   | add_169 (huffman.v:169)                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| O1    | PO   | Unsigned | 8     | I1 + $unsigned(1'b1) (huffman.v:169)     |
==============================================================================

Datapath Report for DP_OP_449_129_9191
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_449_129_9191   | add_179 (huffman.v:179)                             |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| O1    | PO   | Unsigned | 8     | I1 + I2 (huffman.v:179)                  |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_1            | DW01_inc         | apparch (area)     |                |
| eq_x_2             | DW_cmp           | apparch (area)     |                |
| lt_x_3             | DW_cmp           | apparch (area)     |                |
| sub_x_5            | DW01_sub         | apparch (area)     |                |
| sub_x_6            | DW01_sub         | pparch (area,speed)                 |
| sub_x_8            | DW01_sub         | pparch (area,speed)                 |
| sub_x_10           | DW01_sub         | apparch (area)     |                |
| sub_x_12           | DW01_sub         | apparch (area)     |                |
| sub_x_14           | DW01_sub         | apparch (area)     |                |
| eq_x_15            | DW_cmp           | apparch (area)     |                |
| add_x_18           | DW01_add         | pparch (area,speed)                 |
| add_x_72           | DW01_inc         | apparch (area)     |                |
| add_x_74           | DW01_inc         | apparch (area)     |                |
| add_x_75           | DW01_inc         | apparch (area)     |                |
| sub_x_265          | DW01_sub         | apparch (area)     |                |
| sub_x_266          | DW01_sub         | apparch (area)     |                |
| DP_OP_450J1_122_5799                  |                    |                |
|                    | DP_OP_450J1_122_5799 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_451J1_123_5799                  |                    |                |
|                    | DP_OP_451J1_123_5799 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_448_128_6386 | DP_OP_448_128_6386 | str (area,speed) |                |
| DP_OP_449_129_9191 | DP_OP_449_129_9191 | str (area,speed) |                |
===============================================================================

1
