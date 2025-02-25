 
****************************************
Report : resources
Design : JAM
Version: U-2022.12
Date   : Fri Jan 31 01:27:32 2025
****************************************


Resource Report for this hierarchy in file ./JAM.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| add_x_1        | DW01_inc       | width=3    | add_15 (JAM.v:15)          |
| add_x_3        | DW01_inc       | width=4    | add_94 (JAM.v:94)          |
| gt_x_5         | DW_cmp         | width=3    | find_next_perm_inst/gt_150 (JAM.v:150) |
| gt_x_6         | DW_cmp         | width=3    | find_next_perm_inst/gt_150_2 (JAM.v:150) |
| gt_x_7         | DW_cmp         | width=3    | find_next_perm_inst/gt_150_3 (JAM.v:150) |
| gt_x_8         | DW_cmp         | width=3    | find_next_perm_inst/gt_150_4 (JAM.v:150) |
| gt_x_9         | DW_cmp         | width=3    | find_next_perm_inst/gt_150_5 (JAM.v:150) |
| gt_x_10        | DW_cmp         | width=3    | find_next_perm_inst/gt_150_6 (JAM.v:150) |
| lte_x_13       | DW_cmp         | width=3    | find_next_perm_inst/lte_159 (JAM.v:159) |
| lte_x_15       | DW_cmp         | width=3    | find_next_perm_inst/lte_160 (JAM.v:160) |
| lte_x_17       | DW_cmp         | width=3    | find_next_perm_inst/lte_161 (JAM.v:161) |
| lt_x_19        | DW_cmp         | width=3    | find_next_perm_inst/lt_162 (JAM.v:162) |
| lte_x_20       | DW_cmp         | width=3    | find_next_perm_inst/lte_162 (JAM.v:162) |
| lte_x_22       | DW_cmp         | width=3    | find_next_perm_inst/lte_163 (JAM.v:163) |
| lt_x_24        | DW_cmp         | width=3    | find_next_perm_inst/lt_164 (JAM.v:164) |
| lte_x_25       | DW_cmp         | width=3    | find_next_perm_inst/lte_164 (JAM.v:164) |
| lt_x_27        | DW_cmp         | width=3    | find_next_perm_inst/lt_165 (JAM.v:165) |
| lte_x_28       | DW_cmp         | width=3    | find_next_perm_inst/lte_165 (JAM.v:165) |
| lt_x_30        | DW_cmp         | width=3    | find_next_perm_inst/lt_166 (JAM.v:166) |
| lte_x_31       | DW_cmp         | width=3    | find_next_perm_inst/lte_166 (JAM.v:166) |
| gt_x_33        | DW_cmp         | width=4    | find_next_perm_inst/gt_168 (JAM.v:168) |
| gt_x_34        | DW_cmp         | width=4    | find_next_perm_inst/gt_168_2 (JAM.v:168) |
| gt_x_35        | DW_cmp         | width=4    | find_next_perm_inst/gt_168_3 (JAM.v:168) |
| gt_x_36        | DW_cmp         | width=4    | find_next_perm_inst/gt_168_4 (JAM.v:168) |
| gt_x_37        | DW_cmp         | width=4    | find_next_perm_inst/gt_168_5 (JAM.v:168) |
| gt_x_38        | DW_cmp         | width=4    | find_next_perm_inst/gt_168_6 (JAM.v:168) |
| gt_x_39        | DW_cmp         | width=4    | find_next_perm_inst/gt_168_7 (JAM.v:168) |
| gte_x_49       | DW_cmp         | width=3    | find_next_perm_inst/gte_195 (JAM.v:195) |
| gte_x_50       | DW_cmp         | width=3    | find_next_perm_inst/gte_195_I2 (JAM.v:195) |
| gte_x_51       | DW_cmp         | width=3    | find_next_perm_inst/gte_195_I3 (JAM.v:195) |
| gte_x_52       | DW_cmp         | width=3    | find_next_perm_inst/gte_195_I4 (JAM.v:195) |
| gte_x_53       | DW_cmp         | width=3    | find_next_perm_inst/gte_195_I5 (JAM.v:195) |
| gte_x_54       | DW_cmp         | width=3    | find_next_perm_inst/gte_195_I6 (JAM.v:195) |
| gte_x_55       | DW_cmp         | width=3    | find_next_perm_inst/gte_195_I7 (JAM.v:195) |
| lt_x_69        | DW_cmp         | width=10   | lt_104 (JAM.v:104)         |
|                |                |            | lt_94 (JAM.v:94)           |
| DP_OP_93J1_122_8482             |            |                            |
|                | DP_OP_93J1_122_8482 |       |                            |
=============================================================================

Datapath Report for DP_OP_93J1_122_8482
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_93J1_122_8482  | add_16 (JAM.v:16) eq_94 (JAM.v:94)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Unsigned | 10    |                                          |
| I2    | PI   | Unsigned | 7     |                                          |
| I3    | PI   | Unsigned | 10    |                                          |
| O1    | PO   | Unsigned | 10    | I1 + I2 (JAM.v:16)                       |
| O2    | PO   | Unsigned | 1     | O1 == I3 (JAM.v:94)                      |
==============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'lt_94 (JAM.v:94) lt_104 (JAM.v:104)' in design 'JAM' breaks the datapath extraction because there is leakage due to truncation on the fanout of its driver 'add_16 (JAM.v:16)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_x_1            | DW01_inc         | apparch (area)     |                |
| add_x_3            | DW01_inc         | apparch (area)     |                |
| gt_x_5             | DW_cmp           | apparch (area)     |                |
| gt_x_6             | DW_cmp           | apparch (area)     |                |
| gt_x_7             | DW_cmp           | apparch (area)     |                |
| gt_x_8             | DW_cmp           | apparch (area)     |                |
| gt_x_9             | DW_cmp           | apparch (area)     |                |
| gt_x_10            | DW_cmp           | apparch (area)     |                |
| lte_x_13           | DW_cmp           | apparch (area)     |                |
| lte_x_15           | DW_cmp           | apparch (area)     |                |
| lte_x_17           | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| lte_x_20           | DW_cmp           | apparch (area)     |                |
| lte_x_22           | DW_cmp           | apparch (area)     |                |
| lt_x_24            | DW_cmp           | apparch (area)     |                |
| lte_x_25           | DW_cmp           | apparch (area)     |                |
| lt_x_27            | DW_cmp           | apparch (area)     |                |
| lte_x_28           | DW_cmp           | apparch (area)     |                |
| lt_x_30            | DW_cmp           | apparch (area)     |                |
| lte_x_31           | DW_cmp           | apparch (area)     |                |
| gt_x_33            | DW_cmp           | apparch (area)     |                |
| gt_x_34            | DW_cmp           | apparch (area)     |                |
| gt_x_35            | DW_cmp           | apparch (area)     |                |
| gt_x_36            | DW_cmp           | apparch (area)     |                |
| gt_x_37            | DW_cmp           | apparch (area)     |                |
| gt_x_38            | DW_cmp           | apparch (area)     |                |
| gt_x_39            | DW_cmp           | apparch (area)     |                |
| gte_x_49           | DW_cmp           | apparch (area)     |                |
| gte_x_50           | DW_cmp           | apparch (area)     |                |
| gte_x_51           | DW_cmp           | apparch (area)     |                |
| gte_x_52           | DW_cmp           | apparch (area)     |                |
| gte_x_53           | DW_cmp           | apparch (area)     |                |
| gte_x_54           | DW_cmp           | apparch (area)     |                |
| gte_x_55           | DW_cmp           | apparch (area)     |                |
| lt_x_69            | DW_cmp           | apparch (area)     |                |
| DP_OP_93J1_122_8482                   |                    |                |
|                    | DP_OP_93J1_122_8482 | str (area,speed)                 |
===============================================================================

1
