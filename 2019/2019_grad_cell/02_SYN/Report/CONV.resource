 
****************************************
Report : resources
Design : CONV
Version: U-2022.12
Date   : Tue Jan 28 16:58:04 2025
****************************************

Resource Sharing Report for design CONV in file ./CONV.v

===============================================================================
|          |              |            | Contained     |                      |
| Resource | Module       | Parameters | Resources     | Contained Operations |
===============================================================================
| r447     | DW01_inc     | width=6    |               | add_106 add_241      |
|          |              |            |               | add_244 add_247_2    |
|          |              |            |               | add_313_2 add_315_2  |
| r449     | DW01_inc     | width=6    |               | add_118 add_245      |
|          |              |            |               | add_246 add_247      |
|          |              |            |               | add_314 add_315      |
| r454     | DW01_dec     | width=6    |               | sub_239 sub_240      |
|          |              |            |               | sub_241              |
| r455     | DW01_dec     | width=6    |               | sub_239_2 sub_242_2  |
|          |              |            |               | sub_245              |
| r471     | DW01_add     | width=41   |               | add_53               |
| r473     | DW01_inc     | width=20   |               | add_55               |
| r475     | DW01_add     | width=6    |               | add_109              |
| r477     | DW01_add     | width=6    |               | add_121              |
| r479     | DW01_inc     | width=4    |               | add_133              |
| r483     | DW_cmp       | width=20   |               | gt_228               |
| r485     | DW01_inc     | width=12   |               | add_290              |
| r1203    | DW_mult_uns  | a_width=40 |               | mult_add_210_aco     |
|          |              | b_width=1  |               |                      |
| r1923    | DW_mult_tc   | a_width=20 |               | mult_51              |
|          |              | b_width=20 |               |                      |
| r1925    | DW01_add     | width=40   |               | add_210_aco          |
===============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| add_210_aco        | DW01_add         | pparch (area,speed)                 |
| mult_51            | DW_mult_tc       | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix4              |
| add_55             | DW01_inc         | pparch (area,speed)                 |
| add_53             | DW01_add         | pparch (area,speed)                 |
| mult_add_210_aco   | DW_mult_uns      | apparch (area)     |                |
|                    |                  | mult_arch: and     |                |
| gt_228             | DW_cmp           | apparch (area)     |                |
| add_290            | DW01_inc         | rpl                |                |
===============================================================================

1
