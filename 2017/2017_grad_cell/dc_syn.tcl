#Read All Files
read_file -format verilog  DT.v
#read_file -format sverilog  DT.v
current_design DT
link

#Setting Clock Constraints
source -echo -verbose DT.sdc
check_design
set high_fanout_net_threshold 0
uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]

#Synthesis all design
#compile -map_effort high -area_effort high
#compile -map_effort high -area_effort high -inc
#compile_ultra
compile

write -format ddc     -hierarchy -output "DT_syn.ddc"
write_sdf -version 1.0  DT_syn.sdf
write -format verilog -hierarchy -output DT_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  DT_syn.qor
