#include "systemc.h"
#include <iostream>
#include <iomanip>
#include <string>

using namespace std;

SC_MODULE(DT) {
    sc_in_clk clk;
    sc_in<bool> reset;
    sc_out<bool> sti_rd;
    sc_out<sc_uint<10>> sti_addr;
    sc_in<sc_uint<16>> sti_di;
    sc_out<bool> res_wr;
    sc_out<bool> res_rd;
    sc_out<sc_uint<14>> res_addr;
    sc_out<sc_uint<8>> res_do;
    sc_in<sc_uint<8>> res_di;
    sc_out<bool> done;
    sc_out<bool> fwpass_finish;

    // State encoding
    enum States {
        READ_ROM,
        FORWARD_PASS,
        FORWARD_PASS_WRITE_BACK,
        BACKWARD_PASS,
        BACKWARD_PASS_WRITE_BACK,
        DONE
    };

    sc_signal<States> state, next_state;
    sc_uint<8> mem[16384]; // 128*128
    sc_uint<10> ROM_count;
    sc_uint<14> init_RAM_count, forward_pass_write_back_count, backward_pass_write_back_count;

    sc_bit read_rom_done, forward_pass_done, forward_pass_write_back_done, backward_pass_done, backward_pass_write_back_done;

    void fsm();
    void read_rom();
    void forward_pass();
    void forward_pass_write_back();
    void backward_pass();
    void backward_pass_write_back();

    SC_CTOR(DT) {
        SC_METHOD(fsm);
        sensitive << reset;
        sensitive << clk.pos();
    }

    ~DT() {}
};
