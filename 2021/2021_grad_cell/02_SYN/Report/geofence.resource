 
****************************************
Report : resources
Design : geofence
Version: U-2022.12
Date   : Thu Jan 30 23:07:15 2025
****************************************


Resource Report for this hierarchy in file ./geofence.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| eq_x_10        | DW_cmp         | width=3    | eq_95 (geofence.v:95)      |
| sub_x_67       | DW01_dec       | width=3    | sub_183 (geofence.v:183)   |
| add_x_70       | DW01_inc       | width=3    | add_195 (geofence.v:195)   |
| add_x_74       | DW01_inc       | width=4    | add_207 (geofence.v:207)   |
| lt_x_84        | DW_cmp         | width=22   | lt_384 (geofence.v:384)    |
| DW_sqrt_inst   | DW_sqrt        | width=20   | DW_sqrt_inst (geofence.v:88) |
               |                | tc_mode=0  |                            |
| add_x_13       | DW01_inc       | width=4    | add_147 (geofence.v:147)   |
|                |                |            | add_148 (geofence.v:148)   |
|                |                |            | add_152 (geofence.v:152)   |
|                |                |            | add_162 (geofence.v:162)   |
|                |                |            | add_165 (geofence.v:165)   |
|                |                |            | add_168 (geofence.v:168)   |
|                |                |            | add_40 (geofence.v:40)     |
| add_x_14       | DW01_add       | width=4    | add_149 (geofence.v:149)   |
|                |                |            | add_150 (geofence.v:150)   |
|                |                |            | add_151 (geofence.v:151)   |
| DP_OP_460J1_122_876             |            |                            |
|                | DP_OP_460J1_122_876 |       |                            |
| DP_OP_461J1_123_1328            |            |                            |
|                | DP_OP_461J1_123_1328 |      |                            |
| DP_OP_462J1_124_3604            |            |                            |
|                | DP_OP_462J1_124_3604 |      |                            |
| DP_OP_449J1_126_4751            |            |                            |
|                | DP_OP_449J1_126_4751 |      |                            |
| DP_OP_450J1_127_4345            |            |                            |
|                | DP_OP_450J1_127_4345 |      |                            |
| DP_OP_460J1_128_6920            |            |                            |
|                | DP_OP_460J1_128_6920 |      |                            |
=============================================================================

Datapath Report for DP_OP_460J1_122_876
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_460J1_122_876  | add_75 (geofence.v:75) add_75_2 (geofence.v:75)     |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 11    |                                          |
| I3    | PI   | Unsigned | 11    |                                          |
| O1    | PO   | Unsigned | 12    | I1 + I2 + I3 (geofence.v:75)             |
==============================================================================

Datapath Report for DP_OP_461J1_123_1328
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_461J1_123_1328 | sub_80 (geofence.v:80) mult_82 (geofence.v:82)      |
|                      | sub_81 (geofence.v:81)                              |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 11    |                                          |
| I2    | PI   | Unsigned | 10    |                                          |
| I3    | PI   | Unsigned | 10    |                                          |
| T23   | IFO  | Signed   | 12    | I1 - I2 (geofence.v:80)                  |
| T24   | IFO  | Signed   | 12    | I1 - I3 (geofence.v:81)                  |
| O1    | PO   | Signed   | 24    | T23 * T24 (geofence.v:82)                |
==============================================================================

Datapath Report for DP_OP_462J1_124_3604
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_462J1_124_3604 | mult_86 (geofence.v:86) add_90 (geofence.v:90)      |
|                      | add_322 (geofence.v:322)                            |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 10    |                                          |
| I2    | PI   | Unsigned | 10    |                                          |
| I3    | PI   | Unsigned | 22    |                                          |
| I4    | PI   | Unsigned | 23    |                                          |
| T29   | IFO  | Unsigned | 20    | I1 * I2 (geofence.v:86)                  |
| O1    | PO   | Unsigned | 22    | I3 + T29 (geofence.v:90)                 |
| O2    | PO   | Unsigned | 23    | I4 + T29 (geofence.v:322)                |
==============================================================================

Datapath Report for DP_OP_449J1_126_4751
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_449J1_126_4751 | add_83 (geofence.v:83)                              |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 20    |                                          |
| O1    | PO   | Unsigned | 20    | I1 + $unsigned(1'b1) (geofence.v:83)     |
==============================================================================

Datapath Report for DP_OP_450J1_127_4345
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_450J1_127_4345 | sub_68 (geofence.v:68) mult_pow_68 (geofence.v:68)  |
|                      | add_68 (geofence.v:68)                              |
|                      | mult_pow_68_2 (geofence.v:68)                       |
|                      | sub_68_2 (geofence.v:68)                            |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 10    |                                          |
| I2    | PI   | Unsigned | 10    |                                          |
| I3    | PI   | Unsigned | 10    |                                          |
| I4    | PI   | Unsigned | 10    |                                          |
| T14   | IFO  | Signed   | 11    | I1 - I2 (geofence.v:68)                  |
| T15   | IFO  | Signed   | 20    | T14 * T14 (geofence.v:68)                |
| T16   | IFO  | Signed   | 11    | I3 - I4 (geofence.v:68)                  |
| T17   | IFO  | Signed   | 20    | T16 * T16 (geofence.v:68)                |
| O1    | PO   | Unsigned | 20    | T15 + T17 (geofence.v:68)                |
==============================================================================

Datapath Report for DP_OP_460J1_128_6920
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_460J1_128_6920 | sub_55 (geofence.v:55) C3088 (geofence.v:59)        |
|                      | mult_62 (geofence.v:62) C3089 (geofence.v:60)       |
|                      | sub_56 (geofence.v:56) sub_63 (geofence.v:63)       |
|                      | C3160 (geofence.v:337) C3162 (geofence.v:330)       |
|                      | add_337 (geofence.v:337) add_334 (geofence.v:334)   |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 10    |                                          |
| I2    | PI   | Unsigned | 10    |                                          |
| I3    | PI   | Unsigned | 1     |                                          |
| I4    | PI   | Signed   | 11    |                                          |
| I5    | PI   | Unsigned | 1     |                                          |
| I6    | PI   | Unsigned | 1     |                                          |
| I7    | PI   | Signed   | 11    |                                          |
| I8    | PI   | Unsigned | 1     |                                          |
| I9    | PI   | Unsigned | 10    |                                          |
| I10   | PI   | Unsigned | 10    |                                          |
| I11   | PI   | Signed   | 22    |                                          |
| I12   | PI   | Unsigned | 1     |                                          |
| I13   | PI   | Unsigned | 1     |                                          |
| I14   | PI   | Unsigned | 23    |                                          |
| T8    | IFO  | Signed   | 11    | I1 - I2 (geofence.v:55)                  |
| T10   | IFO  | Signed   | 11    | { I3, I5 } ? T8 : I4 (geofence.v:59)     |
| T9    | IFO  | Signed   | 11    | I9 - I10 (geofence.v:56)                 |
| T11   | IFO  | Signed   | 11    | { I6, I8 } ? T9 : I7 (geofence.v:60)     |
| T457  | IFO  | Unsigned | 23    | { I12, I13 } ? $unsigned(1'b1) : O2 ( geofence.v:330 geofence.v:337 ) |
| O1    | PO   | Signed   | 22    | T10 * T11 (geofence.v:62)                |
| O2    | PO   | Signed   | 23    | O1 - I11 (geofence.v:63)                 |
| O3    | PO   | Unsigned | 23    | I14 + T457 ( geofence.v:334 geofence.v:337 ) |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'sub_80 (geofence.v:80)' in design 'geofence' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'add_75 (geofence.v:75) add_75_2 (geofence.v:75)'.  (HDL-120)

Information: Operator associated with resources 'add_90 (geofence.v:90)' in design 'geofence' breaks the datapath extraction because there is leakage due to truncation on its fanout to operator of resources 'lt_384 (geofence.v:384)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| eq_x_10            | DW_cmp           | apparch (area)     |                |
| sub_x_67           | DW01_dec         | apparch (area)     |                |
| add_x_70           | DW01_inc         | apparch (area)     |                |
| add_x_74           | DW01_inc         | apparch (area)     |                |
| lt_x_84            | DW_cmp           | apparch (area)     |                |
| DW_sqrt_inst       | DW_sqrt          | rpl                |                |
| add_x_13           | DW01_inc         | apparch (area)     |                |
| add_x_14           | DW01_add         | apparch (area)     |                |
| DP_OP_460J1_122_876                   |                    |                |
|                    | DP_OP_460J1_122_876 | str (area)      |                |
| DP_OP_461J1_123_1328                  |                    |                |
|                    | DP_OP_461J1_123_1328 | str (area)     |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_462J1_124_3604                  |                    |                |
|                    | DP_OP_462J1_124_3604 | str (area)     |                |
|                    |                  | mult_arch: benc_radix4              |
| DP_OP_449J1_126_4751                  |                    |                |
|                    | DP_OP_449J1_126_4751 | str (area)     |                |
| DP_OP_450J1_127_4345                  |                    |                |
|                    | DP_OP_450J1_127_4345 | str (area)     |                |
|                    |                  | mult_arch: and     |                |
| DP_OP_460J1_128_6920                  |                    |                |
|                    | DP_OP_460J1_128_6920 | str (area)     |                |
|                    |                  | mult_arch: benc_radix4              |
===============================================================================

1
