#RTL simulation
verdi -sverilog tb.sv Bicubic.v -v ImgROM.v -v ResultSRAM.v -ssf Bicubic.fsdb

#Gate-Level simuation
#verdi -sverilog tb.sv Bicubic_syn.v -v ImgROM.v -v ResultSRAM.v -v /cad/CBDK/CBDK_IC_Contest_v2.5/Verilog/tsmc13_neg.v -ssf Bicubic.fsdb
