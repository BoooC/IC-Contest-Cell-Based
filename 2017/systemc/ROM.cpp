#include "ROM.h"

void sti_ROM::read_data(){
	if(sti_rd)
		sti_data = sti_M[sti_addr.read()];
}