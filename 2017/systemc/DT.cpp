#include "DT.h"

void DT::fsm() {
    if (reset.read() == 0) {
        state.write(READ_ROM);
        read_rom_done = 0;
        forward_pass_done = 0;
        backward_pass_done = 0;
        init_RAM_count = 0;
        ROM_count = 0;
        res_wr.write(0);
        res_addr.write(0);
        res_do.write(0);
        done.write(0);
        backward_pass_write_back_count = 0;
        backward_pass_write_back_done = 0;
        fwpass_finish.write(0);
    } else {
        switch (state.read()) {
            case READ_ROM:
                if (!read_rom_done) {
                    read_rom();
                } else {
                    state.write(FORWARD_PASS);
                }
                break;
            case FORWARD_PASS:
                if (!forward_pass_done) {
                    forward_pass();
                    forward_pass_done = 1;
                } else {
                    state.write(FORWARD_PASS_WRITE_BACK);
                }
                break;
            case FORWARD_PASS_WRITE_BACK:
                if (!forward_pass_write_back_done) {
                    forward_pass_write_back();
                } else {
                    state.write(BACKWARD_PASS);
                }
                break;
            case BACKWARD_PASS:
                if (!backward_pass_done) {
                    backward_pass();
                    backward_pass_done = 1;
                } else {
                    state.write(BACKWARD_PASS_WRITE_BACK);
                }
                break;
            case BACKWARD_PASS_WRITE_BACK:
                if (!backward_pass_write_back_done) {
                    backward_pass_write_back();
                } else {
                    state.write(DONE);
                }
                break;
            case DONE:
                done.write(1);
                break;
            default:
                state.write(READ_ROM);
                break;
        }
    }
}

void DT::read_rom() {
    sti_rd.write(1);
    if (ROM_count == 0) {
        sti_addr.write(ROM_count);
        ROM_count = 1;
        init_RAM_count = 0;
    } else {
        for (int i = 0; i < 16; i++) {
            mem[init_RAM_count + i] = sti_di.read()[15 - i];
        }

        sti_addr.write(ROM_count);
        ROM_count = ROM_count + 1;
        init_RAM_count = init_RAM_count + 16;
        if (ROM_count == 1023) {
            sti_rd.write(0);
            cout << "initial done, show the content copy from ROM:" << endl;
            read_rom_done = 1;
            for (int j = 0; j < 128 * 128; j++) {
                cout << mem[j];
                if ((j - 127) % 128 == 0)
                    cout << endl;
            }
        }
    }
}

void DT::forward_pass() {
    int i = 129;
    while (i < 128 * 127) {
        if (mem[i] != 0) { // do when input != 0
            sc_uint<8> NW, N, NE, W, NW_N_cmp, NE_W_cmp, final_cmp;
            NW = mem[i - 129];
            N = mem[i - 128];
            NE = mem[i - 127];
            W = mem[i - 1];
            NW_N_cmp = (NW < N) ? NW : N;
            NE_W_cmp = (NE < W) ? NE : W;
            final_cmp = (NW_N_cmp < NE_W_cmp) ? NW_N_cmp : NE_W_cmp;
            mem[i] = final_cmp + 1;
        }
        if ((i - 126) % 128 == 0)
            i += 3;
        else
            i++;
    }
    forward_pass_done = 1;
}

void DT::forward_pass_write_back() {
    res_wr.write(1);
    res_addr.write(forward_pass_write_back_count);
    res_do.write(mem[forward_pass_write_back_count]);
    forward_pass_write_back_count++;
    if (forward_pass_write_back_count == 128 * 128 - 1) {
        fwpass_finish.write(1);
        forward_pass_write_back_done = 1;
        res_wr.write(0);
    }
}

void DT::backward_pass() {
    int i = 126 + 128 * 126;
    while (i > 128) {
        if (mem[i] != 0) { // do when input != 0
            sc_uint<8> E, SW, S, SE, E_SW_cmp, S_SE_cmp, final_cmp;
            E = mem[i + 1];
            SW = mem[i + 127];
            S = mem[i + 128];
            SE = mem[i + 129];
            E_SW_cmp = (E < SW) ? E : SW;
            S_SE_cmp = (S < SE) ? S : SE;
            final_cmp = (E_SW_cmp < S_SE_cmp) ? E_SW_cmp : S_SE_cmp;
            final_cmp++;
            mem[i] = (mem[i] < final_cmp) ? mem[i] : final_cmp;
        }
        if ((i - 1) % 128 == 0)
            i -= 3;
        else
            i -= 1;
    }
    backward_pass_done = 1;
}

void DT::backward_pass_write_back() {
    res_wr.write(1);
    res_addr.write(backward_pass_write_back_count);
    res_do.write(mem[backward_pass_write_back_count]);
    backward_pass_write_back_count++;
    if (backward_pass_write_back_count == 128 * 128 - 1) {
        done.write(1);
        backward_pass_write_back_done = 1;
        res_wr.write(0);
    }
}
