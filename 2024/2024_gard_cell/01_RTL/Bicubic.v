module Bicubic (
    input CLK,
    input RST,
    input [6:0] V0,
    input [6:0] H0,
    input [4:0] SW,
    input [4:0] SH,
    input [5:0] TW,
    input [5:0] TH,
    output  DONE
);

localparam IDLE     = 'd0;
localparam HOR      = 'd1;
localparam VER      = 'd2;
localparam DOUT     = 'd3;
localparam FINISH   = 'd4;

reg [2:0] state, next_state;

reg [6:0] rom_addr_x, rom_addr_y;
reg [4:0] x_ratio_num;
reg [5:0] x_ratio_den;
reg [4:0] y_ratio_num;
reg [5:0] y_ratio_den;

// p(x) = ax^3 + bx^2 + cx + d
// p(x) = a(x_frac/x_den)^3 + b(x_frac/x_den)^2 + c(x_frac/x_den) + d
// p(x) = [a * x_frac^3 + b * x_den * x_frac^2 + c * x_den^2 * x_frac + d * x_den^3] / (x_den^3)

reg [7:0] rom_reg [0:3];
reg signed [10:0] a, b, c, d;

reg [20:0] x_frac;

reg signed [47:0] var3;
reg signed [31:0] var2;
reg signed [15:0] var1;

reg signed [58:0] a_x_3;
reg signed [42:0] b_x_2;
reg signed [26:0] c_x_1;
reg signed [10:0] d_x_0;
reg [11:0] p_int_reg;
reg p_frac_msb_reg;

reg [5:0] count;
reg [5:0] count_x, count_y;

reg signed [7:0] hor_result [0:3];

reg direct_wb_reg;

reg [9:0] hor_num;
reg [9:0] ver_num;

reg [4:0] x_int;
reg [4:0] y_int;
reg [5:0] x_mod;
reg [5:0] y_mod;
always @(posedge CLK or posedge RST) begin
    if (RST) begin
        hor_num <= 'd0;
        ver_num <= 'd0;
    end
    else begin
        hor_num <= count_x * x_ratio_num;
        ver_num <= count_y * y_ratio_num;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        x_int <= 'd0;
        y_int <= 'd0;
        x_mod <= 'd0;
        y_mod <= 'd0;
    end
    else begin
        x_int <= hor_num / x_ratio_den;
        y_int <= ver_num / y_ratio_den;
        x_mod <= hor_num % x_ratio_den;
        y_mod <= ver_num % y_ratio_den;
    end
end


wire [7:0] P [0:3];

assign P[0] = (state == HOR) ? rom_reg[0] : hor_result[0];
assign P[1] = (state == HOR) ? rom_reg[1] : hor_result[1];
assign P[2] = (state == HOR) ? rom_reg[2] : hor_result[2];
assign P[3] = (state == HOR) ? rom_reg[3] : hor_result[3];

wire signed [10:0] a_wire =  -P[0] + 3*P[1] - 3*P[2] + P[3];
wire signed [10:0] b_wire = 2*P[0] - 5*P[1] + 4*P[2] - P[3];
wire signed [9:0] c_wire =  -P[0] + P[2];
wire signed [9:0] d_wire = 2*P[1];

// data gating
wire signed [15:0] cubic_in = (count == 'd4) ? x_frac : 'sd0;

wire signed [10:0] a_in     = a;
wire signed [10:0] b_in     = b;
wire signed [10:0] c_in     = c;
wire signed [10:0] d_in     = d;
wire signed [47:0] var1_in  = var1;
wire signed [47:0] var2_in  = var2;
wire signed [47:0] var3_in  = var3;
// wire signed [10:0] a_in     = (count == 'd3 | count == 'd7 | count == 'd11 | count == 'd15 | count == 'd19) ? a    : 'd0;
// wire signed [10:0] b_in     = (count == 'd3 | count == 'd7 | count == 'd11 | count == 'd15 | count == 'd19) ? b    : 'd0;
// wire signed [10:0] c_in     = (count == 'd3 | count == 'd7 | count == 'd11 | count == 'd15 | count == 'd19) ? c    : 'd0;
// wire signed [10:0] d_in     = (count == 'd3 | count == 'd7 | count == 'd11 | count == 'd15 | count == 'd19) ? d    : 'd0;
// wire signed [47:0] var1_in  = (count == 'd3 | count == 'd7 | count == 'd11 | count == 'd15 | count == 'd19) ? var1 : 'd0;
// wire signed [47:0] var2_in  = (count == 'd3 | count == 'd7 | count == 'd11 | count == 'd15 | count == 'd19) ? var2 : 'd0;
// wire signed [47:0] var3_in  = (count == 'd3 | count == 'd7 | count == 'd11 | count == 'd15 | count == 'd19) ? var3 : 'd0;

wire signed [47:0] var3_wire = cubic_in * cubic_in * cubic_in;
wire signed [31:0] var2_wire = cubic_in * cubic_in;
wire signed [15:0] var1_wire = cubic_in;

wire signed [58:0] a_x_3_wire = a_in * var3_in;
wire signed [42:0] b_x_2_wire = b_in * var2_in;
wire signed [26:0] c_x_1_wire = c_in * var1_in;
wire signed [10:0] d_x_0_wire = d_in;

wire signed [58:0] p_num_wire = a_x_3 + (b_x_2 <<< 15) + (c_x_1 <<< (15*2)) + (d_x_0 <<< (15*3)); // int : 12-bit, fraction : 48-bit 
wire [11:0] p_int 	= p_num_wire[58:46];
wire [45:0] p_frac	= p_num_wire[45:0];
wire [7:0]  p_quan 	= p_int_reg[11] ? 8'd0 : ((p_int_reg > 'd255) ? 8'd255 : (p_int_reg[7:0] + p_frac_msb_reg));

wire [7:0]  rom_data;
wire [13:0] rom_addr = rom_addr_x + rom_addr_y * 'd100;

reg         sram_wr;
reg [7:0]   sram_data;
reg [9:0]   sram_addr;

ImgROM  u_ImgROM  (.Q(rom_data),  .CLK(CLK),  .CEN(1'b0),  .A(rom_addr));
ResultSRAM  u_ResultSRAM  (.Q(),  .CLK(CLK),  .CEN(1'b0),  .WEN(!sram_wr),  .A({4'd0, sram_addr}),  .D(sram_data));

wire direct_wb_x = x_mod == 6'd0;
wire direct_wb_y = y_mod == 6'd0;

wire read_rom_flag = count <= 'd20;
wire one_hor_done  = count == 'd11 | count == 'd15 |  count == 'd19 |  count == 'd23 | (direct_wb_x & count >= 'd4);

wire count_x_done = (count_x + 'd1) == TW;
wire count_y_done = (count_y + 'd1) == TH;

wire direct_wb = direct_wb_x & direct_wb_y;
wire hor_done = ((count == 'd23) | direct_wb | (direct_wb_x & count == 'd7)) & (count != 'd0 & count != 'd1);
wire ver_done = (count == 'd6) | direct_wb_y;
wire all_done = count_x_done & count_y_done;

assign DONE = state == FINISH;

always @(*) begin
    case(state)
        IDLE    : next_state = HOR;
        HOR     : next_state = hor_done ? VER   : HOR;
        VER     : next_state = ver_done ? DOUT  : VER;
        DOUT    : next_state = all_done ? FINISH: HOR;
        FINISH  : next_state = IDLE;
        default : next_state = IDLE;
    endcase
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        state <= IDLE;    
    end
    else begin
        state <= next_state;
    end
end

// input regs
always @(posedge CLK or posedge RST) begin
    if (RST) begin
        rom_reg[0] <= 'd0;
        rom_reg[1] <= 'd0;
        rom_reg[2] <= 'd0;
        rom_reg[3] <= 'd0;
    end
    else if (read_rom_flag) begin
        rom_reg[3] <= rom_data;
        rom_reg[2] <= rom_reg[3];
        rom_reg[1] <= rom_reg[2];
        rom_reg[0] <= rom_reg[1];
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        x_ratio_num <= 'd0;
        x_ratio_den <= 'd0;
        y_ratio_num <= 'd0;
        y_ratio_den <= 'd0;
    end
    else if (state == IDLE) begin
        x_ratio_num <= SW - 'd1;
		x_ratio_den <= TW - 'd1;
		y_ratio_num <= SH - 'd1;
		y_ratio_den <= TH - 'd1;
    end
end

// counter
always @(posedge CLK or posedge RST) begin
    if (RST) begin
        rom_addr_x <= 'd0;
    end
    else if (direct_wb) begin
        rom_addr_x <= H0 + x_int;
    end
    else if (state == HOR & read_rom_flag) begin
        if (direct_wb_x) begin
            rom_addr_x <= H0 + x_int;
        end
        else if (count == 'd2 | count == 'd6 | count == 'd10 | count == 'd14) begin
            rom_addr_x <= H0 + x_int - 'd1;
        end
        else begin
            rom_addr_x <= rom_addr_x + 'd1;
        end
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        rom_addr_y <= 'd0;
    end
    else if (direct_wb) begin
        rom_addr_y <= V0 + y_int;
    end
    else if (state == HOR & read_rom_flag) begin
        if (count == 'd2) begin
            rom_addr_y <= V0 + y_int - 'd1;
        end
        else if (count == 'd6 | count == 'd10 | count == 'd14 | direct_wb_x) begin
            rom_addr_y <= rom_addr_y + 'd1;
        end
    end
end


always @(posedge CLK or posedge RST) begin
    if (RST) begin
        count <= 'd0;
    end
    else if (state == HOR) begin
        count <= hor_done ? 'd0 : (count + 'd1);
    end
    else if (state == VER) begin
        count <= ver_done ? 'd0 : (count + 'd1);
    end
    else if (state == DOUT) begin
        count <= 'd0;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        count_x <= 'd0;
    end
    else if (state == DOUT) begin
        count_x <= count_x_done ? 'd0 : (count_x + 'd1);
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        count_y <= 'd0;
    end
    else if (state == DOUT & count_x_done) begin
        count_y <= count_y_done ? 'd0 : (count_y + 'd1);
    end
end

// pipeline regs
wire [20:0] div_num = (state == HOR) ? (x_mod << 15) : (y_mod << 15);
wire [5:0] div_den = (state == HOR) ? x_ratio_den : y_ratio_den;
reg [20:0] div_num_reg;
reg [5:0] div_den_reg;

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        div_num_reg <= 'd0;
        div_den_reg <= 'd0;
    end
    else if (count == 'd2) begin
        div_num_reg <= div_num;
        div_den_reg <= div_den;
    end
    else begin
        div_num_reg <= 'd0;
        div_den_reg <= 'd0;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        x_frac <= 'd0;
    end
    else if (count == 'd3) begin
        x_frac <= div_num_reg / div_den_reg;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        a <= 'd0;
        b <= 'd0;
        c <= 'd0;
        d <= 'd0;
    end
    else begin
        a <= a_wire;
        b <= b_wire;
        c <= c_wire;
        d <= d_wire;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        var3 <= 'd0;
        var2 <= 'd0;
        var1 <= 'd0;
    end
    else if (count == 'd4) begin
        var3 <= var3_wire;
        var2 <= var2_wire;
        var1 <= var1_wire;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        a_x_3 <= 'd0;
        b_x_2 <= 'd0;
        c_x_1 <= 'd0;
        d_x_0 <= 'd0;
    end
    else begin
        a_x_3 <= a_x_3_wire;
        b_x_2 <= b_x_2_wire;
        c_x_1 <= c_x_1_wire;
        d_x_0 <= d_x_0_wire;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        p_int_reg <= 'd0;
        p_frac_msb_reg <= 1'b1;
    end
    else begin
        p_int_reg <= p_int;
        p_frac_msb_reg <= p_frac[45];
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        hor_result[0] <= 'd0;
        hor_result[1] <= 'd0;
        hor_result[2] <= 'd0;
        hor_result[3] <= 'd0;
    end
    else if (one_hor_done) begin
        hor_result[3] <= direct_wb_x ? rom_data : p_quan;
        hor_result[2] <= hor_result[3];
        hor_result[1] <= hor_result[2];
        hor_result[0] <= hor_result[1];
    end
end

// SRAM
always @(*) begin
    if (state == DOUT) begin
        sram_wr = 1'b1;
    end
    else begin
        sram_wr = 1'b0;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        sram_addr <= 'd0;
    end
    else if (state == FINISH) begin
        sram_addr <= 'd0;
    end
    else if (state == DOUT) begin
        sram_addr <= sram_addr + 'd1;
    end
end

always @(*) begin
    if (state == DOUT) begin
        sram_data = direct_wb   ? rom_data : 
                    direct_wb_y ? hor_result[1] : p_quan;
    end
    else begin
        sram_data = 'd0;
    end
end

endmodule
