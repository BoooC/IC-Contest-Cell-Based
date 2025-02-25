 
****************************************
Report : resources
Design : geofence
Version: U-2022.12
Date   : Wed Jan 29 21:38:43 2025
****************************************


Resource Report for this hierarchy in file ./geofence.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| eq_x_14        | DW_cmp         | width=3    | eq_54 (geofence.v:54)      |
| sub_x_55       | DW01_dec       | width=3    | sub_141 (geofence.v:141)   |
| add_x_16       | DW01_inc       | width=4    | add_110 (geofence.v:110)   |
|                |                |            | add_111 (geofence.v:111)   |
|                |                |            | add_123 (geofence.v:123)   |
|                |                |            | add_126 (geofence.v:126)   |
|                |                |            | add_129 (geofence.v:129)   |
|                |                |            | add_30 (geofence.v:30)     |
| add_x_17       | DW01_add       | width=4    | add_112 (geofence.v:112)   |
|                |                |            | add_113 (geofence.v:113)   |
| DP_OP_280J1_122_6163            |            |                            |
|                | DP_OP_280J1_122_6163 |      |                            |
=============================================================================

Datapath Report for DP_OP_280J1_122_6163
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_280J1_122_6163 | sub_45 (geofence.v:45) mult_47 (geofence.v:47)      |
|                      | sub_46 (geofence.v:46) sub_48 (geofence.v:48)       |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 10    |                                          |
| I2    | PI   | Unsigned | 10    |                                          |
| I3    | PI   | Unsigned | 10    |                                          |
| I4    | PI   | Unsigned | 10    |                                          |
| I5    | PI   | Signed   | 22    |                                          |
| T14   | IFO  | Signed   | 11    | I1 - I2 (geofence.v:45)                  |
| T15   | IFO  | Signed   | 11    | I3 - I4 (geofence.v:46)                  |
| O1    | PO   | Signed   | 22    | T14 * T15 (geofence.v:47)                |
| O2    | PO   | Signed   | 23    | O1 - I5 (geofence.v:48)                  |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| eq_x_14            | DW_cmp           | apparch (area)     |                |
| sub_x_55           | DW01_dec         | apparch (area)     |                |
| add_x_16           | DW01_inc         | apparch (area)     |                |
| add_x_17           | DW01_add         | apparch (area)     |                |
| DP_OP_280J1_122_6163                  |                    |                |
|                    | DP_OP_280J1_122_6163 | str (area)     |                |
|                    |                  | mult_arch: benc_radix4              |
===============================================================================

1
