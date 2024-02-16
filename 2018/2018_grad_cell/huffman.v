module huffman(
	input 				clk,
	input 				reset,
	input 				gray_valid,
	input 		[7:0] 	gray_data,
	output 				CNT_valid,
	output 		[7:0] 	CNT1, CNT2, CNT3, CNT4, CNT5, CNT6,
	output 				code_valid,
	output 	reg	[7:0] 	HC1, HC2, HC3, HC4, HC5, HC6,
	output	reg	[7:0] 	M1, M2, M3, M4, M5, M6
);


// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
parameter Symbol_A1	= 3'd1;
parameter Symbol_A2	= 3'd2;
parameter Symbol_A3	= 3'd3;
parameter Symbol_A4	= 3'd4;
parameter Symbol_A5	= 3'd5;
parameter Symbol_A6	= 3'd6;

localparam IDLE 			= 3'd0;
localparam STATISTIC		= 3'd1;
localparam SORT				= 3'd2;
localparam INITIALIZATION 	= 3'd3;	// sort
localparam COMBINATION 		= 3'd4;	// sort
localparam SPLIT 			= 3'd5;	// encoding
localparam DONE	 			= 3'd6; // write data


// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [2:0] state, next_state;

reg [7:0] prob 		[1:6];	// for A1~A6 numbers
reg [4:0] symbol 	[1:6];	// for A1~A6 symbols, 1+2+3+4+5+6=21

reg [2:0] addr;
reg [2:0] count;
reg [2:0] conbination_times;
reg [1:0] exchange_times;

reg exchange_reg;
reg exchange_2_reg;	// exchange 2 times or more than 2 times

reg [6:1] encoding_reverse_flag;
reg [6:1] mult_set_comb_flag;

reg [6:0] encoding_temp;
reg	[6:0] M_temp;

reg statistic_done_reg, statistic_done_reg_dly1;
reg encoding_2_sets_reg;

// ====================================================================	//
// 							Combination (Wires)  						//
// ====================================================================	//
// state wire
wire IDLE_wire				= state == IDLE;
wire STATISTIC_wire    		= state == STATISTIC;
wire SORT_wire				= state == SORT;
wire INITIALIZATION_wire    = state == INITIALIZATION;
wire COMBINATION_wire       = state == COMBINATION;
wire SPLIT_wire             = state == SPLIT;
wire DONE_wire              = state == DONE;

wire [2:0] next_addr		= addr + 3'd1;
wire addr_done				= addr == 3'd5 - count - conbination_times;
wire exchange_flag			= prob[addr] < prob[next_addr];
wire exchange_2_times_flag	= exchange_times == 2'd2;

// huffman encoding logic
wire encoding_num			= encoding_reverse_flag[addr] | encoding_2_sets_reg;
wire encoding_num_temp		= mult_set_comb_flag[addr] ? ~encoding_reverse_flag[addr] : encoding_reverse_flag[addr];
wire encoding_2_sets		= mult_set_comb_flag[addr];
wire encoding_idle			= (~mult_set_comb_flag[addr]) & mult_set_comb_flag[next_addr];

// split logic
wire [2:0] split_addr		= SPLIT_wire & encoding_2_sets_reg ? (addr - 3'd2) : addr;

wire [7:0] current_prob		= prob[split_addr];
wire [7:0] next_prob		= prob[next_addr];
wire [7:0] pure_prob		= encoding_reverse_flag[split_addr]  ? prob[next_addr] : (prob[split_addr] - prob[next_addr]);
wire [7:0] mixed_prob 		= ~encoding_reverse_flag[split_addr] ? prob[next_addr] : (prob[split_addr] - prob[next_addr]);

wire [4:0] current_symbol	= symbol[split_addr];
wire [4:0] next_symbol		= symbol[next_addr];
wire [4:0] pure_symbol		= encoding_reverse_flag[split_addr]  ? symbol[next_addr] : (symbol[split_addr] - symbol[next_addr]);
wire [4:0] mixed_symbol 	= ~encoding_reverse_flag[split_addr] ? symbol[next_addr] : (symbol[split_addr] - symbol[next_addr]);

// FSM control signals
wire count_done 			= count == 3'd4 - conbination_times;
wire statistic_done 		= ~gray_valid;
wire sort_done 				= count_done & addr_done;
wire combination_done 		= conbination_times == 3'd4;
wire split_done 			= addr == 3'd5;

// output logic
wire encoding_2_sets_pulse	= encoding_2_sets & encoding_2_sets_reg;
wire [7:0] M_common 		= encoding_2_sets_pulse ? M_temp : {M_temp, 1'b1};
wire [7:0] encoding_pure	= {encoding_temp, encoding_num};
wire [7:0] encoding_mixed	= {encoding_temp, !encoding_2_sets};

wire encoding_mixed_1 		= SPLIT_wire & mixed_symbol == 3'd1 & (split_done | encoding_2_sets) & ~encoding_idle;
wire encoding_mixed_2 		= SPLIT_wire & mixed_symbol == 3'd2 & (split_done | encoding_2_sets) & ~encoding_idle;
wire encoding_mixed_3 		= SPLIT_wire & mixed_symbol == 3'd3 & (split_done | encoding_2_sets) & ~encoding_idle;
wire encoding_mixed_4 		= SPLIT_wire & mixed_symbol == 3'd4 & (split_done | encoding_2_sets) & ~encoding_idle;
wire encoding_mixed_5 		= SPLIT_wire & mixed_symbol == 3'd5 & (split_done | encoding_2_sets) & ~encoding_idle;
wire encoding_mixed_6 		= SPLIT_wire & mixed_symbol == 3'd6 & (split_done | encoding_2_sets) & ~encoding_idle;

wire encoding_pure_1		= SPLIT_wire & pure_symbol == 3'd1 & ~encoding_idle;
wire encoding_pure_2		= SPLIT_wire & pure_symbol == 3'd2 & ~encoding_idle;
wire encoding_pure_3		= SPLIT_wire & pure_symbol == 3'd3 & ~encoding_idle;
wire encoding_pure_4		= SPLIT_wire & pure_symbol == 3'd4 & ~encoding_idle;
wire encoding_pure_5		= SPLIT_wire & pure_symbol == 3'd5 & ~encoding_idle;
wire encoding_pure_6		= SPLIT_wire & pure_symbol == 3'd6 & ~encoding_idle;

// output
assign CNT1	= prob[1];
assign CNT2	= prob[2];
assign CNT3	= prob[3];
assign CNT4	= prob[4];
assign CNT5	= prob[5];
assign CNT6	= prob[6];

assign CNT_valid	= statistic_done_reg & !IDLE_wire & !statistic_done_reg_dly1;
assign code_valid	= DONE_wire;

// next state logic
always@(*) begin
	case(state)
		IDLE 			: next_state = gray_valid 			? STATISTIC		: IDLE;
		STATISTIC		: next_state = statistic_done 		? SORT			: STATISTIC;
		SORT			: next_state = sort_done			? INITIALIZATION: SORT;
		INITIALIZATION 	: next_state = COMBINATION;
		COMBINATION 	: next_state = combination_done 	? SPLIT 		: SORT;
		SPLIT 			: next_state = split_done 			? DONE 			: SPLIT;
		DONE	 		: next_state = IDLE;
		default			: next_state = IDLE;
	endcase
end

// ====================================================================	//
// 						 		Sequential  							//
// ====================================================================	//
// FSM
always@(posedge clk or posedge reset) begin
	if(reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

// Buffer
integer i;
always@(posedge clk or posedge reset) begin
	if(reset) begin
		for(i=1; i<7; i=i+1) begin
			prob  [i] <= 8'd0;
			symbol[i] <= i;
		end
	end
	else if(gray_valid) begin
		prob[gray_data] <= prob[gray_data] + 8'd1;
	end
	else if(SORT_wire & exchange_flag) begin
		prob[addr] 			<= prob[next_addr];
		prob[next_addr] 	<= prob[addr];
		
		symbol[addr] 		<= symbol[next_addr];
		symbol[next_addr] 	<= symbol[addr];
	end
	else if(COMBINATION_wire) begin
		prob[addr] 			<= prob[addr] 	+ prob[next_addr];
		symbol[addr] 		<= symbol[addr] + symbol[next_addr];
	end
	else if(SPLIT_wire) begin
		prob[split_addr] 	<= pure_prob;
		prob[next_addr] 	<= mixed_prob;
		
		symbol[split_addr] 	<= pure_symbol;
		symbol[next_addr] 	<= mixed_symbol;
	end
end

// counters
always@(posedge clk or posedge reset) begin
	if(reset) begin
		addr <= 3'd1;
	end             
	else if(SORT_wire) begin
		addr <= addr_done ? 3'd1 : (addr + 3'd1);
	end
	else if(INITIALIZATION_wire) begin
		addr <= 3'd5 - count - conbination_times;
	end
	else if(COMBINATION_wire) begin
		addr <= 3'd1;
	end
	else if(SPLIT_wire) begin
		addr <= (addr == 3'd5) ? 3'd1 : (addr + 3'd1);
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		count <= 3'd0;
	end             
	else if(SORT_wire & addr_done) begin
		count <= count_done ? 3'd0 : (count + 3'd1);
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		conbination_times <= 3'd0;
	end             
	else if(COMBINATION_wire) begin
		conbination_times <= conbination_times + 3'd1;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		exchange_times <= 2'd0;
	end
	else if(SORT_wire & exchange_flag) begin
		exchange_times <= exchange_times + 2'd1;
	end
	else if(COMBINATION_wire) begin
		exchange_times <= 2'd0;
	end
end


always@(posedge clk or posedge reset) begin
	if(reset) begin
		exchange_reg <= 1'b0;
	end
	else if(SORT_wire & exchange_flag) begin
		exchange_reg <= 1'b1;
	end
	else if(COMBINATION_wire) begin
		exchange_reg <= 1'b0;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		exchange_2_reg <= 1'b0;
	end
	else if(SORT_wire & exchange_2_times_flag) begin
		exchange_2_reg <= 1'b1;
	end
	else if(COMBINATION_wire) begin
		exchange_2_reg <= 1'b0;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		encoding_2_sets_reg <= 1'b0;
	end
	else begin
		encoding_2_sets_reg <= encoding_2_sets;
	end
end

// record each sub set combined position
always@(posedge clk or posedge reset) begin
	if(reset) begin
		mult_set_comb_flag <= 6'd0;
	end             
	else if(COMBINATION_wire & (conbination_times != 3'd0)) begin
		mult_set_comb_flag[1] <= exchange_2_reg;
		mult_set_comb_flag[2] <= exchange_2_reg ? 1'b1 : mult_set_comb_flag[1];
		mult_set_comb_flag[3] <= mult_set_comb_flag[2];
		mult_set_comb_flag[4] <= mult_set_comb_flag[3];
		mult_set_comb_flag[5] <= mult_set_comb_flag[4];
		mult_set_comb_flag[6] <= mult_set_comb_flag[5];
	end
end

// record each mixed set lager than pure symbol
always@(posedge clk or posedge reset) begin
	if(reset) begin
		encoding_reverse_flag <= 6'd0;
	end             
	else if(COMBINATION_wire & (conbination_times != 3'd0)) begin
		encoding_reverse_flag[1] <= exchange_reg;
		encoding_reverse_flag[2] <= encoding_reverse_flag[1];
		encoding_reverse_flag[3] <= encoding_reverse_flag[2];
		encoding_reverse_flag[4] <= encoding_reverse_flag[3];
		encoding_reverse_flag[5] <= encoding_reverse_flag[4];
		encoding_reverse_flag[6] <= encoding_reverse_flag[5];
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		encoding_temp <= 8'd0;
	end             
	else if(SPLIT_wire) begin
		encoding_temp[0] <= ~encoding_num_temp;
		encoding_temp[1] <= encoding_temp[0];
		encoding_temp[2] <= encoding_temp[1];
		encoding_temp[3] <= encoding_temp[2];
		encoding_temp[4] <= encoding_temp[3];
		encoding_temp[5] <= encoding_temp[4];
		encoding_temp[6] <= encoding_temp[5];
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		M_temp <= 7'd0;
	end             
	else if(SPLIT_wire) begin
		M_temp[0] <= 1'b1;
		M_temp[1] <= M_temp[0];
		M_temp[2] <= M_temp[1];
		M_temp[3] <= M_temp[2];
		M_temp[4] <= M_temp[3];
		M_temp[5] <= M_temp[4];
		M_temp[6] <= M_temp[5];
	end
end

// output
always@(posedge clk or posedge reset) begin
	if(reset) begin
		HC1 <= 8'd0;
		M1	<= 8'd0;
	end
	else if(encoding_pure_1) begin
		HC1 <= encoding_pure;
		M1	<= M_common;
	end
	else if(encoding_mixed_1) begin
		HC1 <= encoding_mixed;
		M1	<= M_common;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		HC2 <= 8'd0;
		M2	<= 8'd0;
	end             
	else if(encoding_pure_2) begin
		HC2 <= encoding_pure;
		M2	<= M_common;
	end
	else if(encoding_mixed_2) begin
		HC2 <= encoding_mixed;
		M2	<= M_common;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		HC3 <= 8'd0;
		M3	<= 8'd0;
	end             
	else if(encoding_pure_3) begin
		HC3 <= encoding_pure;
		M3	<= M_common;
	end
	else if(encoding_mixed_3) begin
		HC3 <= encoding_mixed;
		M3	<= M_common;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		HC4 <= 8'd0;
		M4	<= 8'd0;
	end             
	else if(encoding_pure_4) begin
		HC4 <= encoding_pure;
		M4	<= M_common;
	end
	else if(encoding_mixed_4) begin
		HC4 <= encoding_mixed;
		M4	<= M_common;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		HC5 <= 8'd0;
		M5	<= 8'd0;
	end             
	else if(encoding_pure_5) begin
		HC5 <= encoding_pure;
		M5	<= M_common;
	end
	else if(encoding_mixed_5) begin
		HC5 <= encoding_mixed;
		M5	<= M_common;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		HC6 <= 8'd0;
		M6	<= 8'd0;
	end             
	else if(encoding_pure_6) begin
		HC6 <= encoding_pure;
		M6	<= M_common;
	end
	else if(encoding_mixed_6) begin
		HC6 <= encoding_mixed;
		M6	<= M_common;
	end
end

// statistic CNT output control
always@(posedge clk or posedge reset) begin
	if(reset) begin
		statistic_done_reg <= 1'b0;
	end       
	else if(statistic_done & STATISTIC_wire) begin
		statistic_done_reg <= 1'b1;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		statistic_done_reg_dly1 <= 1'b0;
	end       
	else begin
		statistic_done_reg_dly1 <= statistic_done_reg;
	end
end

endmodule
