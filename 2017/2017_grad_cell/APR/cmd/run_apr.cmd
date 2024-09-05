# ========================================================
# Project:  iclab APR Flow
# File:     run_apr.cmd
# Author:   Lai Lin-Hung @ Si2 Lab
# Date:     2023.07.25
# ========================================================
############################################
############  Paremeter setting  ###########
############################################
set ProcessRoot "/home/cell_library/CBDK_IC_Contest_v2.5/SOCE/"
set NUM_OF_CPU 8
set mmmcFile "CHIP_mmmc.view"
set lefFile "/home/cell_library/CBDK_IC_Contest_v2.5/SOCE//lef/tsmc13fsg_8lm_cic.lef"
set topDesign "CHIP"
set verilogFile "./CHIP_SYN.v"
set ioFile "./CHIP.io"
set pwrNet "VCC"
set gndNet "GND"

############################################
############  APR UMC018 setting ###########
############################################
set init_design_uniquify 1
setDesignMode -process 180
suppressMessage TECHLIB 1318
suppressMessage ENCEXT-2799
############################################
############  Initial Design     ###########
############################################
set init_mmmc_file $mmmcFile
set init_lef_file $lefFile
set init_verilog $verilogFile
set init_top_cell $topDesign
set init_io_file $ioFile
set init_pwr_net $pwrNet
set init_gnd_net $gndNet
init_design -setup {av_func_mode_max} -hold {av_func_mode_max}

save_global CHIP.globals
win


source cmd/floorPlan.cmd
source cmd/powerRing.cmd
source cmd/powerStripe.cmd
# source cmd/addIOFiller.cmd
source cmd/place.cmd
source cmd/ccopt.cmd
source cmd/postCTSTiming.cmd
source cmd/nanoRoute.cmd
#source cmd/postRouteTiming.cmd
#source cmd/postRouteVerify.cmd
#source cmd/addFiller.cmd
#source cmd/signOff.cmd
#source cmd/streamOut.cmd


#set_db extract_rc_engine post_route
#set_db extract_rc_effort_level high
#set_db delaycal_enable_si true

#setDelayCalMode -siMode signoff
