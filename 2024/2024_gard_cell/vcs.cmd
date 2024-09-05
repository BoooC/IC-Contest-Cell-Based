#RTL simulation, single pattern
vcs -full64 -R -sverilog tb.sv Bicubic.v -v ImgROM.v -v ResultSRAM.v +define+P1 +access+r +vcs+fsdbon +fsdb+mda +fsdbfile+Bicubic.fsdb +notimingcheck

#RTL simulation, all pattern
#vcs -full64 -R -sverilog tb.sv Bicubic.v  -v ImgROM.v -v ResultSRAM.v +access+r +vcs+fsdbon +fsdb+mda +fsdbfile+Bicubic.fsdb +notimingcheck

#Gate-Level simuation
#vcs -full64 -R -sverilog tb.sv Bicubic_syn.v +define+SDF +access+r +vcs+fsdbon +fsdb+mda +fsdbfile+Bicubic.fsdb -v ImgROM.v -v ResultSRAM.v -v /home/cell_library/CBDK_IC_Contest_v2.5/Verilog/tsmc13_neg.v +maxdelays +neg_tchk
