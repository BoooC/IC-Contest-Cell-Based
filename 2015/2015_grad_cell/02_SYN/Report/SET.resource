 
****************************************
Report : resources
Design : SET
Version: U-2022.12
Date   : Sun Jan 26 14:43:24 2025
****************************************


Resource Report for this hierarchy in file ./SET.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_4        | DW01_inc       | width=6    | add_111 (SET.v:111)        |
| sub_x_12       | DW01_sub       | width=5    | det_inside_A/sub_179 (SET.v:179) |
| sub_x_13       | DW01_sub       | width=5    | det_inside_A/sub_180 (SET.v:180) |
| add_x_14       | DW01_inc       | width=4    | det_inside_A/add_182 (SET.v:182) |
| add_x_16       | DW01_inc       | width=4    | det_inside_A/add_183 (SET.v:183) |
| sub_x_18       | DW01_sub       | width=5    | det_inside_C/sub_179 (SET.v:179) |
| sub_x_19       | DW01_sub       | width=5    | det_inside_C/sub_180 (SET.v:180) |
| add_x_20       | DW01_inc       | width=4    | det_inside_C/add_182 (SET.v:182) |
| add_x_22       | DW01_inc       | width=4    | det_inside_C/add_183 (SET.v:183) |
| sub_x_24       | DW01_sub       | width=5    | det_inside_B/sub_179 (SET.v:179) |
| sub_x_25       | DW01_sub       | width=5    | det_inside_B/sub_180 (SET.v:180) |
| add_x_26       | DW01_inc       | width=4    | det_inside_B/add_182 (SET.v:182) |
| add_x_28       | DW01_inc       | width=4    | det_inside_B/add_183 (SET.v:183) |
| DP_OP_66J1_122_9058             |            |                            |
|                | DP_OP_66J1_122_9058 |       |                            |
| DP_OP_67J1_123_9058             |            |                            |
|                | DP_OP_67J1_123_9058 |       |                            |
| DP_OP_68J1_124_2494             |            |                            |
|                | DP_OP_68J1_124_2494 |       |                            |
| DP_OP_69J1_125_2494             |            |                            |
|                | DP_OP_69J1_125_2494 |       |                            |
| DP_OP_70J1_126_2494             |            |                            |
|                | DP_OP_70J1_126_2494 |       |                            |
=============================================================================

Datapath Report for DP_OP_66J1_122_9058
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_66J1_122_9058  | mult_add_87_aco (SET.v:87) add_87_aco (SET.v:87)    |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| T11   | IFO  | Unsigned | 4     | I1 * I2 (SET.v:87)                       |
| O1    | PO   | Unsigned | 4     | T11 + $unsigned(1'b1) (SET.v:87)         |
==============================================================================

Datapath Report for DP_OP_67J1_123_9058
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_67J1_123_9058  | mult_add_99_aco (SET.v:99) add_99_aco (SET.v:99)    |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 1     |                                          |
| T12   | IFO  | Unsigned | 4     | I1 * I2 (SET.v:99)                       |
| O1    | PO   | Unsigned | 4     | T12 + $unsigned(1'b1) (SET.v:99)         |
==============================================================================

Datapath Report for DP_OP_68J1_124_2494
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_68J1_124_2494  | det_inside_A/mult_185 (SET.v:185)                   |
|                      | det_inside_A/add_188 (SET.v:188)                    |
|                      | det_inside_A/mult_186 (SET.v:186)                   |
|                      | det_inside_A/lte_191 (SET.v:191)                    |
|                      | det_inside_A/mult_189 (SET.v:189)                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 4     |                                          |
| I3    | PI   | Unsigned | 4     |                                          |
| T19   | IFO  | Unsigned | 8     | I1 * I1 (SET.v:185)                      |
| T20   | IFO  | Unsigned | 8     | I2 * I2 (SET.v:186)                      |
| T21   | IFO  | Unsigned | 9     | T19 + T20 (SET.v:188)                    |
| T22   | IFO  | Unsigned | 8     | I3 * I3 (SET.v:189)                      |
| O1    | PO   | Unsigned | 1     | T21 <= T22 (SET.v:191)                   |
==============================================================================

Datapath Report for DP_OP_69J1_125_2494
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_69J1_125_2494  | det_inside_C/mult_185 (SET.v:185)                   |
|                      | det_inside_C/add_188 (SET.v:188)                    |
|                      | det_inside_C/mult_186 (SET.v:186)                   |
|                      | det_inside_C/lte_191 (SET.v:191)                    |
|                      | det_inside_C/mult_189 (SET.v:189)                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 4     |                                          |
| I3    | PI   | Unsigned | 4     |                                          |
| T30   | IFO  | Unsigned | 8     | I1 * I1 (SET.v:185)                      |
| T31   | IFO  | Unsigned | 8     | I2 * I2 (SET.v:186)                      |
| T32   | IFO  | Unsigned | 9     | T30 + T31 (SET.v:188)                    |
| T33   | IFO  | Unsigned | 8     | I3 * I3 (SET.v:189)                      |
| O1    | PO   | Unsigned | 1     | T32 <= T33 (SET.v:191)                   |
==============================================================================

Datapath Report for DP_OP_70J1_126_2494
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_70J1_126_2494  | det_inside_B/mult_185 (SET.v:185)                   |
|                      | det_inside_B/add_188 (SET.v:188)                    |
|                      | det_inside_B/mult_186 (SET.v:186)                   |
|                      | det_inside_B/lte_191 (SET.v:191)                    |
|                      | det_inside_B/mult_189 (SET.v:189)                   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 4     |                                          |
| I2    | PI   | Unsigned | 4     |                                          |
| I3    | PI   | Unsigned | 4     |                                          |
| T41   | IFO  | Unsigned | 8     | I1 * I1 (SET.v:185)                      |
| T42   | IFO  | Unsigned | 8     | I2 * I2 (SET.v:186)                      |
| T43   | IFO  | Unsigned | 9     | T41 + T42 (SET.v:188)                    |
| T44   | IFO  | Unsigned | 8     | I3 * I3 (SET.v:189)                      |
| O1    | PO   | Unsigned | 1     | T43 <= T44 (SET.v:191)                   |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'det_inside_A/add_182 (SET.v:182)' in design 'SET' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'det_inside_A/C33 (SET.v:182)'.  (HDL-120)

Information: Operator associated with resources 'det_inside_A/add_183 (SET.v:183)' in design 'SET' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'det_inside_A/C34 (SET.v:183)'.  (HDL-120)

Information: Operator associated with resources 'det_inside_C/add_182 (SET.v:182)' in design 'SET' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'det_inside_C/C33 (SET.v:182)'.  (HDL-120)

Information: Operator associated with resources 'det_inside_C/add_183 (SET.v:183)' in design 'SET' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'det_inside_C/C34 (SET.v:183)'.  (HDL-120)

Information: Operator associated with resources 'det_inside_B/add_182 (SET.v:182)' in design 'SET' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'det_inside_B/C33 (SET.v:182)'.  (HDL-120)

Information: Operator associated with resources 'det_inside_B/add_183 (SET.v:183)' in design 'SET' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'det_inside_B/C34 (SET.v:183)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_4            | DW01_inc         | apparch (area)     |                |
| sub_x_12           | DW01_sub         | apparch (area)     |                |
| sub_x_13           | DW01_sub         | apparch (area)     |                |
| add_x_14           | DW01_inc         | apparch (area)     |                |
| add_x_16           | DW01_inc         | apparch (area)     |                |
| sub_x_18           | DW01_sub         | apparch (area)     |                |
| sub_x_19           | DW01_sub         | apparch (area)     |                |
| add_x_20           | DW01_inc         | apparch (area)     |                |
| add_x_22           | DW01_inc         | apparch (area)     |                |
| sub_x_24           | DW01_sub         | apparch (area)     |                |
| sub_x_25           | DW01_sub         | apparch (area)     |                |
| add_x_26           | DW01_inc         | apparch (area)     |                |
| add_x_28           | DW01_inc         | apparch (area)     |                |
| DP_OP_66J1_122_9058                   |                    |                |
|                    | DP_OP_66J1_122_9058 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_67J1_123_9058                   |                    |                |
|                    | DP_OP_67J1_123_9058 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_68J1_124_2494                   |                    |                |
|                    | DP_OP_68J1_124_2494 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_69J1_125_2494                   |                    |                |
|                    | DP_OP_69J1_125_2494 | str (area,speed)                 |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_70J1_126_2494                   |                    |                |
|                    | DP_OP_70J1_126_2494 | str (area)      |                |
|                    |                  | mult_arch: and     |                |
|                    |                  | mult_arch: and     |                |
===============================================================================

1
