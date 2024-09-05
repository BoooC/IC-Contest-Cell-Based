LIB_DIR=/usr/local/systemc-2.3.4/lib-linux64
INC_DIR=/usr/local/systemc-2.3.4/include
LIB=-lsystemc -lm -DSC_INCLUDE_FX
#RPATH=-Wl,-rpath=/usr/local/systemc-2.3.1a/lib-linux64

O = DT
C = *.cpp 

all:
	g++ -I . -I  $(INC_DIR) -L . -L $(LIB_DIR) -o $(O) $(C) $(LIB) $(RPATH)

clean:
	rm -rf $(O)
