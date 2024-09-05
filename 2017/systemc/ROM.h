#include "systemc.h"
#include <iostream>
#include <fstream>
#include <string.h>
#define TB1
#ifdef TB1
	#define PAT		"./dat/Geometry_sti.dat"
#else
	#define PAT		"./dat/ICC17_sti.dat"
#endif
using namespace std;


SC_MODULE(sti_ROM){
	sc_in_clk clock;
	sc_in<bool> sti_rd;
	sc_in<sc_uint<10> >sti_addr;
	sc_out<sc_uint<16> >sti_data;
	
	sc_bv<16> sti_M[1024];
	void read_data();

	SC_CTOR(sti_ROM){
		ifstream pat_din;
		pat_din.open(PAT,ios::in);
		int data;
		for(int i=0;i<1024;i++){
			pat_din >> std::hex >> data;
			pat_din.ignore(256,'\n');
			sti_M[i] = data;
		}
		pat_din.close();
		
		SC_METHOD(read_data);
		sensitive<< clock.neg();
	}
	
	~sti_ROM(){};
	
};