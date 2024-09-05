#include <systemc.h>
#include <ROM.h>
#include <RAM.h>
#include <DT.h>
#include <MON.h>
#include <iostream>
#include <fstream>
#define End_CYCLE 10000000 //Modify cycle times once your design need more cycle times!
#define PERIOD 1
#define N_PAT 16384
#define TB1
#ifdef TB1
	#define BCEXP		"./dat/Geometry_bcexp.dat"
	#define FWEXP       "./dat/Geometry_fwexp.dat"
#else
	#define BCEXP		"./dat/ICC17_bcexp.dat"
	#define FWEXP       "./dat/ICC17_fwexp.dat"
#endif



int sc_main(int arg_num, char *arg_vet[]){
	
	sc_clock clock("clock", 1, SC_NS);
	sc_signal <bool> reset;
	sc_signal<bool> fwpass_finish, done;
	sc_signal<bool> sti_rd;
	sc_signal<sc_uint<10> > sti_addr;
	sc_signal<sc_uint<16> > sti_data;
	sc_signal<bool> res_wr;
	sc_signal<bool> res_rd;
	sc_signal<sc_uint<14> > res_addr;
	sc_signal<sc_uint<8> > res_do;
	sc_signal<sc_uint<8> > res_di;
	sc_signal<int> cycle;
	
	sc_uint<8> exp_fwpass[N_PAT];
	sc_uint<8> exp_bcpass[N_PAT];
	sc_uint<8> exp_pat, rel_pat;
	sc_uint<8> fwexp_pat, bcexp_pat;
	
	/**Module Declaration**/
	sti_ROM *rom = new sti_ROM("ROM");
	RAM *ram = new RAM("res_RAM");
	DT *dt = new DT("dt");
	MON *mon = new MON("mon");
	
	(*rom) (clock,sti_rd,sti_addr,sti_data);
	(*ram) (clock,res_rd,res_wr,res_addr,res_di,res_do);
	(*dt) (clock,reset,sti_rd,sti_addr,sti_data,res_wr,res_rd,res_addr,res_do,res_di,done,fwpass_finish);
	(*mon) (clock,fwpass_finish,done,cycle);

	/********************/
	reset.write(0);//reset
	cout << "-----------------------------------" << endl;
	cout << "START!!! Simulation Start ....." << endl;
	cout << "-----------------------------------" << endl;
	sc_start(PERIOD*3,SC_NS);
	reset.write(1);
	sc_start(PERIOD*End_CYCLE, SC_NS);
	
	//** Load Answer **//
	
	ifstream bc_din,fw_din;
	bc_din.open(BCEXP,ios::in);
	fw_din.open(FWEXP,ios::in);
	int data;
	
	for(int i=0;i<N_PAT;i++){
		bc_din >> std::hex >> data;
		bc_din.ignore(256,'\n');
		exp_bcpass[i] = data;
	}
	for(int i=0;i<N_PAT;i++){
		fw_din >> std::hex >> data;
		fw_din.ignore(256,'\n');
		exp_fwpass[i] = data;
	}
	
	//**Check Answer**//
	int fw_err = 0;
	int bc_err = 0;
	
	//wish to check forward
	if(fwpass_finish)
	{
		cout<<"\n\nFWPASS : finish at "<<cycle<<" cycle\n\n";
		//forward check
		for(int i=0;i<N_PAT;i++){
			exp_pat = exp_fwpass[i];
			rel_pat = ram->res_M[i];
			if (exp_pat == rel_pat)
				fw_err = fw_err;
			else{
				fw_err = fw_err+1;
				if (fw_err <= 30) cout<< "FWPASS : Output pixel " << setw(5) << i << " are wrong! the real output is " << rel_pat << " , but expected result is " << exp_pat << endl;
				if (fw_err == 31) cout<< "FWPASS : Find the wrong pixel reached a total of more than 30 !, Please check the code ..... " << endl;
			}
			if( ((i%1000) == 0) || (i == N_PAT-1)){  
				if ( fw_err == 0)
					cout<< "FWPASS : Output pixel: 0 ~ " << setw(5) << i << " are correct!" << endl;
			}					
		}
		cout<<endl;
		//forward checked but failed
		if(fw_err>0)
		{
			cout<< "-----------------------------------------------------" << endl;
			cout<< "FAIL! There are " << setw(5) << fw_err << " errors at Forward-Pass functional simulation " << endl;
			cout<< "---------- The test result is .....FAIL -------------" << endl;
		}
	}
	//continue if forward succeed or not wish to check
	if(fw_err==0)
	{
		sc_start(PERIOD*(End_CYCLE-cycle), SC_NS);
		
		//receive done signal
		if(done)
		{
			cout<<"\n\nFinish at "<<cycle<<" cycle\n\n";
			//backward check
			for(int i=0;i<N_PAT;i++){
				exp_pat = exp_bcpass[i];
				rel_pat = ram->res_M[i];
				if (exp_pat == rel_pat)
					bc_err = bc_err;
				else{
					bc_err = bc_err + 1;
					if(bc_err <= 30) cout<< "Output pixel " << setw(5) << i << " are wrong!the real output is " << rel_pat << ",  but expected result is " << exp_pat << endl;
					if(bc_err == 31) cout<< "Find the wrong pixel reached a total of more than 30 !, Please check the code ....." << endl;
				}
				if( ((i%1000) == 0) || (i == N_PAT-1)){
					if(bc_err == 0)
						cout<< " Output pixel: 0 ~ " << setw(5) << i << " are correct!" << endl;
				}
			}
			cout<<endl;
			//correct
			if(bc_err==0)
			{
				cout<< "-------------------------------------------------------------" << endl;
				cout<< "Congratulations!!! All data have been generated successfully!" << endl;
				cout<< "---------- The test result is ..... PASS --------------------" << endl;
			}
		}
		//no done signal received
		else
		{
			//forward succeed
			if(fwpass_finish)
			{
				cout<< "----------------------------------------------------------------" << endl;
				cout<< "Forward-Pass PASS! but there is something wrong with your code !" << endl;
				cout<< "----------------- The test result is .....FAIL -----------------" << endl;
			}
			
			//not wish to check forward
			else
			{
				cout<< "-----------------------------------------------------" << endl;
				cout<< "Error!!! There is something wrong with your code ...!" << endl;
				cout<< "-----------------------------------------------------" << endl;
			}
		}
		//backward checked but failed
		if(bc_err>0)
		{
			//forward succeed
			if(fwpass_finish)
			{
				cout<< "----------------------------------------------------------------" << endl;
				cout<< "Forward-Pass PASS! but there are " << setw(5) << bc_err << " errors at Backward-Pass functional simulation" << endl;
				cout<<"--------------- The test result is .....FAIL --------------------" << endl;
			}
			//not wish to check forward
			else
			{
				cout<< "-----------------------------------------------------" << endl;
				cout<< "FAIL! There are " << setw(5) << bc_err << " errors at functional simulation " << endl;
				cout<< "---------- The test result is .....FAIL -------------" << endl;
			}
		}
	}
	cout<<endl;
	
	bc_din.close();
	fw_din.close();
	
	return 0;
}