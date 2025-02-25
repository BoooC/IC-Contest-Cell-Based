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
// p(x) = a(x_num/x_den)^3 + b(x_num/x_den)^2 + c(x_num/x_den) + d
// p(x) = [a * x_num^3 + b * x_den * x_num^2 + c * x_den^2 * x_num + d * x_den^3] / (x_den^3)

reg [7:0] rom_reg [0:3];
reg signed [10:0] a, b, c, d;

reg [5:0] x_num;
reg [5:0] x_den;
reg [5:0] y_num;
reg [5:0] y_den;

reg signed [17:0] var_num3;
reg signed [17:0] var_num2_den1;
reg signed [17:0] var_num1_den2;
reg signed [17:0] var_den3;

reg signed [28:0] a_x_3;
reg signed [28:0] b_x_2;
reg signed [28:0] c_x_1;
reg signed [28:0] d_x_0;
reg signed [30:0] p_num;
reg signed [12:0] p_x;

reg [5:0] count;
reg [5:0] count_x, count_y;

reg signed [7:0] hor_result [0:3];

reg direct_wb_reg;

wire [9:0] hor_num = count_x * x_ratio_num;
wire [9:0] ver_num = count_y * y_ratio_num;

wire [4:0] x_int = hor_num / x_ratio_den;
wire [4:0] y_int = ver_num / y_ratio_den;
wire [5:0] x_mod = hor_num % x_ratio_den;
wire [5:0] y_mod = ver_num % y_ratio_den;

wire [7:0] P [0:3];

assign P[0] = (state == HOR) ? rom_reg[0] : hor_result[0];
assign P[1] = (state == HOR) ? rom_reg[1] : hor_result[1];
assign P[2] = (state == HOR) ? rom_reg[2] : hor_result[2];
assign P[3] = (state == HOR) ? rom_reg[3] : hor_result[3];

wire signed [10:0] a_wire =  -P[0] + 3*P[1] - 3*P[2] + P[3];
wire signed [10:0] b_wire = 2*P[0] - 5*P[1] + 4*P[2] - P[3];
wire signed [9:0] c_wire =  -P[0] + P[2];
wire signed [9:0] d_wire = 2*P[1];

wire [5:0] var_num = (state == HOR) ? x_num : y_num;
wire [5:0] var_den = (state == HOR) ? x_den : y_den;

wire signed [17:0] var_num3_wire      = var_num * var_num * var_num;
wire signed [17:0] var_num2_den1_wire = var_num * var_num * var_den;
wire signed [17:0] var_num1_den2_wire = var_num * var_den * var_den;
wire signed [17:0] var_den3_wire      = var_den * var_den * var_den;

wire signed [28:0] a_x_3_wire = a * var_num3;
wire signed [28:0] b_x_2_wire = b * var_num2_den1;
wire signed [28:0] c_x_1_wire = c * var_num1_den2;
wire signed [28:0] d_x_0_wire = d * var_den3;

wire signed [30:0] p_num_wire   = a_x_3 + b_x_2 + c_x_1 + d_x_0;
wire signed [12:0] p_x_wire     = p_num / var_den3;

wire [7:0] p_quan = p_x[12] ? 8'd0 : (p_x > 'd511) ? 8'd255 : ((p_x >> 1) + p_x[0]);

wire [7:0]  rom_data;
wire [13:0] rom_addr = rom_addr_x + rom_addr_y * 'd100;

reg         sram_wr;
reg [7:0]   sram_data;
reg [9:0]   sram_addr;

ImgROM  u_ImgROM  (.Q(rom_data),  .CLK(CLK),  .CEN(1'b0),  .A(rom_addr));
ResultSRAM  u_ResultSRAM  (.Q(),  .CLK(CLK),  .CEN(1'b0),  .WEN(!sram_wr),  .A({4'd0, sram_addr}),  .D(sram_data));

wire direct_wb_x = x_mod == 6'd0;
wire direct_wb_y = y_mod == 6'd0;

wire read_rom_flag = count <= 'd18;
wire one_hor_done  = count == 'd10 | count == 'd14 |  count == 'd18 |  count == 'd22 | (direct_wb_x & count >= 'd2);

wire count_x_done = (count_x + 'd1) == TW;
wire count_y_done = (count_y + 'd1) == TH;

wire direct_wb = direct_wb_x & direct_wb_y;
wire hor_done = (count == 'd22) | direct_wb | (direct_wb_x & count == 'd5);
wire ver_done = (count == 'd4) | direct_wb_y;
wire all_done = count_x_done & count_y_done;

assign DONE = state == FINISH;

always @(*) begin
    case(state)
        HOR     : next_state = hor_done ? VER   : HOR;
        VER     : next_state = ver_done ? DOUT  : VER;
        DOUT    : next_state = all_done ? FINISH: HOR;
        FINISH  : next_state = HOR;
        default : next_state = HOR;
    endcase
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        state <= HOR;    
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
    else begin
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
        else if (count == 'd0 | count == 'd4 | count == 'd8 | count == 'd12) begin
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
        if (count == 'd0) begin
            rom_addr_y <= V0 + y_int - 'd1;
        end
        else if (count == 'd4 | count == 'd8 | count == 'd12 | direct_wb_x) begin
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
always @(posedge CLK or posedge RST) begin
    if (RST) begin
        x_num <= 'd0;
        x_den <= 'd0;
    end
    else begin
        x_num <= x_mod;
        x_den <= x_ratio_den;
    end
end

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        y_num <= 'd0;
        y_den <= 'd0;
    end
    else begin
        y_num <= y_mod;
        y_den <= y_ratio_den;
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
        var_num3        <= 'd0;
        var_num2_den1   <= 'd0;
        var_num1_den2   <= 'd0;
        var_den3        <= 'd0;
    end
    else begin
        var_num3        <= var_num3_wire;
        var_num2_den1   <= var_num2_den1_wire;
        var_num1_den2   <= var_num1_den2_wire;
        var_den3        <= var_den3_wire;
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
        p_num   <= 'd0;
        p_x     <= 'd0;
    end
    else begin
        p_num   <= p_num_wire;
        p_x     <= p_x_wire;
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
