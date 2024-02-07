// ====================================================================================================== //
// This module is designed for String Matching Engine(SME).
//
// The following is simulation result
// # ----------------------------------
// # -- Simulation stop, ALL PASS    --
// # -- cycle =1822 , Score =100     --
// # ----------------------------------
//
// Area : 17379.7
// Cycle: 1822
// ====================================================================================================== //

module SME (
	input				clk,
	input				reset,
	input		[7:0] 	chardata,
	input 				isstring,
	input 				ispattern,
	output 	reg 		match,
	output	reg	[4:0] 	match_index,
	output	reg 		valid
);


// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
// state
localparam IDLE 	= 3'd0;
localparam READ_STR	= 3'd1;
localparam READ_PAT	= 3'd2;
localparam COMPARE	= 3'd3;
localparam DONE		= 3'd4;
localparam DATA_OUT	= 3'd5;

// special sign to ASCII code
parameter START_SIGN	= 8'h5E;	// ^
parameter END_SIGN		= 8'h24;	// $
parameter SKIP_ONE_SIGN	= 8'h2E;	// .
parameter SKIP_ALL_SIGN	= 8'h2A;	// *
parameter SPACE 		= 8'h20;	// 	


// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [2:0]	state, next_state;
	
reg [7:0]	String [0:31];
reg [7:0]	Pattern[0:7];
	
reg [4:0]	str_addr;	// 0~31
reg [2:0]	pat_addr;	// 0~7
reg [4:0]	str_end_addr;
reg [2:0]	pat_end_addr;
reg	[2:0]	match_count;
reg	[2:0]	skip_start_match_count;
reg	[2:0]	skip_start_pat_addr;

reg 		current_match_idx_inc_reg;
reg			current_all_skip_reg;


// ====================================================================	//
// 						 			Wires  								//
// ====================================================================	//
// state wire
wire IDLE_wire		= state == IDLE;
wire READ_STR_wire	= state == READ_STR;
wire READ_PAT_wire	= state == READ_PAT;
wire COMPARE_wire	= state == COMPARE;
wire DONE_wire		= state == DONE;
wire DATA_OUT_wire	= state == DATA_OUT;

// pattern
wire [7:0] string_data 	= String[str_addr];
wire [7:0] pattern_data = Pattern[pat_addr + skip_start_pat_addr];

wire start_skip_one		= Pattern[0] == SKIP_ONE_SIGN;

wire current_start_match= ((string_data == SPACE) | (str_addr == 5'd0)) & (pattern_data == START_SIGN);
wire current_end_match	= ((string_data == SPACE) | (str_addr == str_end_addr + 5'd1)) & (pattern_data == END_SIGN);
wire current_one_skip	= (pattern_data == SKIP_ONE_SIGN);
wire current_all_skip	= (pattern_data == SKIP_ALL_SIGN);
wire current_match_in	= (string_data  == pattern_data);

wire current_match		= current_match_in | current_start_match | current_end_match | current_one_skip;

// index expect for strat sign
wire current_match_idx_inc = current_match_in | current_end_match | current_one_skip | ((str_addr == 5'd0) & (pattern_data == START_SIGN));	

wire current_match_pulse= current_match_idx_inc & (~current_match_idx_inc_reg);

wire match_flag 	= ((match_count + skip_start_match_count) == pat_end_addr) & current_match;

wire read_str_done 	= ~isstring;
wire read_pat_done 	= ~ispattern;
wire compare_done 	= str_addr == 5'd31 | match_flag;


// next state logic
always@(*) begin
	case(state)
		IDLE 		: next_state = isstring		 ? READ_STR	: ispattern ? READ_PAT : IDLE;
		READ_STR	: next_state = read_str_done ? READ_PAT : READ_STR;
		READ_PAT	: next_state = read_pat_done ? COMPARE 	: READ_PAT;
		COMPARE		: next_state = compare_done  ? DONE 	: COMPARE;
		DONE		: next_state = DATA_OUT;
		DATA_OUT	: next_state = IDLE;
		default		: next_state = IDLE;
	endcase
end

// FSM
always@(posedge clk) begin
	if(reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

// RF address 
always@(posedge clk) begin
	if(reset) begin
		str_addr <= 5'd0;
	end
	else if(isstring) begin
		str_addr <= str_addr + 5'd1;
	end
	else if(COMPARE_wire) begin
		str_addr <= (str_addr == 5'd0 & pattern_data == START_SIGN | current_all_skip) ? str_addr : (str_addr + 5'd1);
	end
	else begin
		str_addr <= 5'd0;
	end
end

always@(posedge clk) begin
	if(reset) begin
		pat_addr <= 3'd0;
	end
	else if(ispattern) begin
		pat_addr <= pat_addr + 3'd1;
	end
	else if(COMPARE_wire) begin
		pat_addr <= current_match ? (pat_addr + 3'd1) : 3'd0;
	end
	else begin
		pat_addr <= 3'd0;
	end
end

// record each lenght of pattern and string
always@(posedge clk) begin
	if(reset) begin
		str_end_addr <= 5'd0;
	end
	else if(READ_STR_wire & ~isstring) begin
		str_end_addr <= str_addr - 5'd1;
	end
end

always@(posedge clk) begin
	if(reset) begin
		pat_end_addr <= 3'd0;
	end
	else if(READ_PAT_wire & ~ispattern) begin
		pat_end_addr <= pat_addr - 3'd1;
	end
end

// RF write
integer i, j;
always@(posedge clk) begin
	if(reset) begin
		for(i=0; i<32; i=i+1) begin
			String[i] <= 8'd0;
		end
	end
	else if(isstring) begin
		String[str_addr] <= chardata;
	end
end

always@(posedge clk) begin
	if(reset) begin
		for(j=0; j<8; j=j+1) begin
			Pattern[j] <= 8'd0;
		end
	end
	else if(ispattern) begin
		Pattern[pat_addr] <= chardata;
	end
end

// For specific sign ( . and * ), record the new start address
always@(posedge clk) begin
	if(reset) begin
		skip_start_pat_addr <= 3'd0;
	end
	else if(current_all_skip | current_all_skip_reg) begin
		skip_start_pat_addr <= current_all_skip ? (skip_start_pat_addr + pat_addr + 3'd1) : skip_start_pat_addr;
	end
	else if(current_one_skip & pat_addr == 3'd0) begin
		skip_start_pat_addr <= pat_addr + 3'd1;
	end
	else if(~COMPARE_wire) begin
		skip_start_pat_addr <= 3'd0;
	end
end

always@(posedge clk) begin
	if(reset) begin
		skip_start_match_count <= 3'd0;
	end
	else if(current_one_skip & COMPARE_wire & pat_addr == 3'd0) begin
		skip_start_match_count <= match_count + 3'd1;
	end
	else if(current_all_skip & ~READ_PAT_wire) begin
		skip_start_match_count <= match_count + 3'd1;
	end
	else if(DATA_OUT_wire) begin
		skip_start_match_count <= 3'd0;
	end
end

always@(posedge clk) begin
	if(reset) begin
		match_count <= 3'd0;
	end
	else if(COMPARE_wire) begin
		match_count <= current_match ? (match_count + 3'd1) : 3'd0;
	end
	else if(DATA_OUT_wire) begin
		match_count <= 3'd0;
	end
end

always@(posedge clk) begin
	if(reset) begin
		current_match_idx_inc_reg <= 1'b0;
	end
	else begin
		current_match_idx_inc_reg <= current_match_idx_inc;
	end
end

always@(posedge clk) begin
	if(reset) begin
		current_all_skip_reg <= 1'b0;
	end
	else if(COMPARE_wire & current_all_skip) begin
		current_all_skip_reg <= 1'b1;
	end
	else if(DATA_OUT_wire) begin
		current_all_skip_reg <= 1'b0;
	end
end


always@(posedge clk) begin
	if(reset) begin
		match <= 1'b0;
	end
	else if(IDLE_wire) begin
		match <= 1'b0;
	end
	else if((COMPARE_wire | DONE_wire) & match_flag) begin
		match <= 1'b1;
	end
end

always@(posedge clk) begin
	if(reset) begin
		valid <= 1'b0;
	end
	else if(IDLE_wire) begin
		valid <= 1'b0;
	end
	else if(DATA_OUT_wire) begin
		valid <= 1'b1;
	end
end

always@(posedge clk) begin
	if(reset) begin
		match_index	<= 5'd0;
	end
	else if(IDLE_wire) begin
		match_index	<= 5'd0;
	end
	else if(COMPARE_wire & current_match_pulse & ~current_all_skip_reg) begin
		match_index	<= start_skip_one ? (str_addr - 5'd1) : str_addr;
	end
end


endmodule
