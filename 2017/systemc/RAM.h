#include "systemc.h"
#include "iostream"
#include <fstream>


SC_MODULE(RAM){
	sc_in_clk clock;
	sc_in<bool> res_rd,res_wr;
	sc_in<sc_uint<14> >res_addr;
	sc_out<sc_uint<8> >res_dataout;
	sc_in<sc_uint<8> >res_datain;
	
	sc_uint<8> res_M[16384];

	void read();
	void write();
	
	SC_CTOR(RAM){
		
		SC_METHOD(read);
		sensitive<< clock.neg();
		SC_METHOD(write);
		sensitive<< clock.pos();
	}
	
	~RAM(){};
	
};