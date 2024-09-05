#PrimeTime Script
#  pt_shell  -f  ./pt_script.tcl
set power_enable_analysis TRUE
set power_analysis_mode time_based

read_file -format verilog  ./Bicubic_syn.v
current_design Bicubic
link

source ./Bicubic.sdc
read_parasitics -format SPEF -verbose  ./Bicubic_syn.spef


## Measure  power
#report_switching_activity -list_not_annotated -show_pin

read_vcd  -strip_path testfixture/u_Bicubic  ./Bicubic.vcd
update_power
report_power 
