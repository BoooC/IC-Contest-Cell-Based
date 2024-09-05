#RTL simulation, single pattern
xrun tb.sv Bicubic.v +define+P1 -v ImgROM.v -v ResultSRAM.v +access+r -clean -createdebugdb -input xrun.tcl -notimingchecks

#RTL simulation, all pattern
#xrun tb.sv Bicubic.v -v ImgROM.v -v ResultSRAM.v +access+r  -clean -createdebugdb -input xrun.tcl -notimingchecks

#Gate-Level simuation
#xrun tb.sv Bicubic_syn.v +define+SDF  +access+r  -clean -createdebugdb -input xrun.tcl -v ImgROM.v -v ResultSRAM.v -v /cad/CBDK/CBDK_IC_Contest_v2.5/Verilog/tsmc13_neg.v -maxdelays
