 
****************************************
Report : resources
Design : LCD_CTRL
Version: U-2022.12
Date   : Sun Jan 26 15:07:14 2025
****************************************


Resource Report for this hierarchy in file ./LCD_CTRL.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| gt_x_3         | DW_cmp         | width=8    | gt_56 (LCD_CTRL.v:56)      |
| gt_x_5         | DW_cmp         | width=8    | gt_57 (LCD_CTRL.v:57)      |
| gt_x_7         | DW_cmp         | width=8    | gt_58 (LCD_CTRL.v:58)      |
| lt_x_9         | DW_cmp         | width=8    | lt_60 (LCD_CTRL.v:60)      |
| lt_x_11        | DW_cmp         | width=8    | lt_61 (LCD_CTRL.v:61)      |
| lt_x_13        | DW_cmp         | width=8    | lt_62 (LCD_CTRL.v:62)      |
| add_x_415      | DW01_inc       | width=6    | add_139 (LCD_CTRL.v:139)   |
| add_x_417      | DW01_inc       | width=3    | add_149 (LCD_CTRL.v:149)   |
| add_x_424      | DW01_inc       | width=3    | add_162 (LCD_CTRL.v:162)   |
| sub_x_1        | DW01_dec       | width=3    | sub_126 (LCD_CTRL.v:126)   |
|                |                |            | sub_127 (LCD_CTRL.v:127)   |
|                |                |            | sub_161 (LCD_CTRL.v:161)   |
|                |                |            | sub_45 (LCD_CTRL.v:45)     |
|                |                |            | sub_46 (LCD_CTRL.v:46)     |
| sub_x_2        | DW01_dec       | width=3    | sub_126_2 (LCD_CTRL.v:126) |
|                |                |            | sub_128 (LCD_CTRL.v:128)   |
|                |                |            | sub_150 (LCD_CTRL.v:150)   |
|                |                |            | sub_45_2 (LCD_CTRL.v:45)   |
|                |                |            | sub_47 (LCD_CTRL.v:47)     |
| DP_OP_518J1_122_9848            |            |                            |
|                | DP_OP_518J1_122_9848 |      |                            |
=============================================================================

Datapath Report for DP_OP_518J1_122_9848
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_518J1_122_9848 | add_64 (LCD_CTRL.v:64) add_64_2 (LCD_CTRL.v:64)     |
|                      | add_64_3 (LCD_CTRL.v:64)                            |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 8     |                                          |
| I2    | PI   | Unsigned | 8     |                                          |
| I3    | PI   | Unsigned | 8     |                                          |
| I4    | PI   | Unsigned | 8     |                                          |
| O1    | PO   | Unsigned | 10    | I1 + I2 + I3 + I4 (LCD_CTRL.v:64)        |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| gt_x_3             | DW_cmp           | apparch (area)     |                |
| gt_x_5             | DW_cmp           | apparch (area)     |                |
| gt_x_7             | DW_cmp           | apparch (area)     |                |
| lt_x_9             | DW_cmp           | apparch (area)     |                |
| lt_x_11            | DW_cmp           | apparch (area)     |                |
| lt_x_13            | DW_cmp           | apparch (area)     |                |
| add_x_415          | DW01_inc         | apparch (area)     |                |
| add_x_417          | DW01_inc         | apparch (area)     |                |
| add_x_424          | DW01_inc         | apparch (area)     |                |
| sub_x_1            | DW01_dec         | apparch (area)     |                |
| sub_x_2            | DW01_dec         | apparch (area)     |                |
| DP_OP_518J1_122_9848                  |                    |                |
|                    | DP_OP_518J1_122_9848 | str (area)     |                |
===============================================================================

1
