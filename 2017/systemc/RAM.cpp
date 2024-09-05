#include "RAM.h"

void RAM::read(){
	if(res_rd)
		res_dataout = res_M[res_addr.read()];
}

void RAM::write(){
	if(res_wr)
		res_M[res_addr.read()] = res_datain;
}