#include "systemc.h"


SC_MODULE(MON){
	sc_in_clk clock;
	sc_in<bool> fwpass_finish,done;
	sc_out<int> cycle;
	bool p_fwpass,p_done;
	
	void run()
	{
		cycle=cycle+1;
		if(fwpass_finish!=p_fwpass)sc_pause();
		if(done!=p_done)sc_pause();
		p_fwpass=fwpass_finish;
		p_done=done;
	}
	
	SC_CTOR(MON){
		
		SC_METHOD(run);
		sensitive<< clock.neg();
	}
	
	~MON(){};
	
};