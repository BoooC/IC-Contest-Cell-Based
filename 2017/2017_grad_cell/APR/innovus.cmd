#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed Jul 31 21:09:13 2024                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.17-s075_1 (64bit) 03/15/2023 11:17 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.17-s075_1 NR230308-2354/21_17-UB (database version 18.20.604) {superthreading v2.17}
#@(#)CDS: AAE 21.17-s026 (64bit) 03/15/2023 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.17-s025_1 () Mar 14 2023 11:00:06 ( )
#@(#)CDS: SYNTECH 21.17-s007_1 () Feb 20 2023 06:56:35 ( )
#@(#)CDS: CPE v21.17-s068
#@(#)CDS: IQuantus/TQuantus 21.1.1-s939 (64bit) Wed Nov 9 09:34:24 PST 2022 (Linux 3.10.0-693.el7.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_design_uniquify 1
setDesignMode -process 180
suppressMessage TECHLIB 1318
suppressMessage ENCEXT-2799
save_global CHIP.globals
set init_gnd_net GND
set init_lef_file ../../../../../../../cell_library/CBDK_IC_Contest_v2.5/SOCE/lef/tsmc13fsg_8lm_cic.lef
set init_verilog CHIP_SYN.v
set init_mmmc_file CHIP_mmmc.view
set init_top_cell CHIP
set init_pwr_net VCC
init_design
fit
zoomBox -7.91350 -1.15550 18.63600 11.54700
zoomBox -1.68900 -0.29750 4.46150 2.64500
zoomBox -0.74950 -0.14200 1.98000 1.16400
fit
set init_io_file ./CHIP.io
getIoFlowFlag
saveIoFile -byOrder -temp CHIP.io
save_global CHIP.globals
set init_io_file CHIP.io
init_design
