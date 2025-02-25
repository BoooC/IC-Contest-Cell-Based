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

// special sign to ASCII code
parameter START_SIGN	= 8'h5E;	// ^
parameter END_SIGN		= 8'h24;	// $
parameter SKIP_ONE_SIGN	= 8'h2E;	// .
parameter SKIP_ALL_SIGN	= 8'h2A;	// *
parameter SPACE 		= 8'h20;	// 	

localparam IDLE 	= 'd0;
localparam READ_PAT	= 'd1;
localparam MATCHING	= 'd2;
localparam DOUT		= 'd3;


reg [2:0] state, next_state;

reg [7:0] STRING 	[0:33];
reg [7:0] PATTERN 	[0:7];
reg [5:0] str_count;
reg [3:0] pat_count;
reg isstring_reg;

reg [5:0] str_start_idx;
reg [3:0] pat_match_count;
reg [3:0] check_point_idx;
reg star_exit;
reg [5:0] star_exit_start_idx;
reg is_check_point_match;

wire isstring_pulse = isstring & ~isstring_reg;

wire is_check_point = PATTERN[pat_match_count] == SKIP_ALL_SIGN;

wire [5:0] current_str_idx = str_start_idx + pat_match_count;
wire [7:0] cur_str = STRING[current_str_idx];
wire [7:0] cur_pat = is_check_point ? PATTERN[pat_match_count+1] : PATTERN[pat_match_count];
wire char_match = cur_str == cur_pat;
wire skip_one 	= cur_pat == SKIP_ONE_SIGN;
wire start_match= (cur_pat == START_SIGN) & (cur_str == SPACE);
wire end_match	= (cur_pat == END_SIGN)   & (cur_str == SPACE);
wire is_match = char_match | skip_one | start_match | end_match;

wire match_done = (str_start_idx + pat_match_count == str_count) | ((is_check_point ? pat_match_count == pat_count - 'd3 : pat_match_count == pat_count - 'd1) & is_match);

// FSM
always @(*) begin
	case(state)
		IDLE 	 : next_state = ispattern	? READ_PAT 	: IDLE;
		READ_PAT : next_state = ~ispattern	? MATCHING	: READ_PAT;
		MATCHING : next_state = match_done	? DOUT		: MATCHING;
		DOUT	 : next_state = IDLE;
		default  : next_state = IDLE;
	endcase
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

// input regs
integer i;
always @(posedge clk or posedge reset) begin
	if (reset) begin
		STRING[0] <= SPACE;
		for (i=1; i<34; i=i+1) begin
			STRING[i] <= 'd0;
		end
	end
	else if (isstring_pulse) begin
		STRING[1] <= chardata;
	end
	else if (isstring) begin
		STRING[str_count+'d1] <= chardata;
	end
	else if (isstring_reg) begin
		STRING[str_count+'d1] <= SPACE;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		for (i=0; i<8; i=i+1) begin
			PATTERN[i] <= 'd0;
		end
	end
	else if (ispattern) begin
		PATTERN[pat_count] <= chardata;
	end
end

// counter
always @(posedge clk or posedge reset) begin
	if (reset) begin
		str_count <= 'd0;
	end
	else if (isstring_pulse) begin
		str_count <= 'd1;
	end
	else if (isstring | isstring_reg) begin
		str_count <= str_count + 'd1;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		pat_count <= 'd0;
	end
	else if (state == DOUT) begin
		pat_count <= 'd0;
	end
	else if (ispattern) begin
		pat_count <= pat_count + 'd1;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		isstring_reg <= 1'b0;
		is_check_point_match <= 1'b0;
	end
	else begin
		isstring_reg <= isstring;
		is_check_point_match <= is_check_point & is_match;
	end
end

// matching
always @(posedge clk or posedge reset) begin
	if (reset) begin
		str_start_idx <= 'd0;
	end
	else if (state == DOUT) begin
		str_start_idx <= 'd0;
	end
	else if (state == MATCHING & ~is_match & ~is_check_point) begin
		str_start_idx <= str_start_idx + 'd1;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		pat_match_count <= 'd0;
	end
	else if (state == DOUT) begin
		pat_match_count <= 'd0;
	end
	else if (state == MATCHING & (is_match | is_check_point)) begin
		pat_match_count <= pat_match_count + 'd1;
	end
	else begin
		pat_match_count <= check_point_idx;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		check_point_idx <= 'd0;
	end
	else if (state == DOUT) begin
		check_point_idx <= 'd0;
	end
	else if (state == MATCHING & is_check_point) begin
		check_point_idx <= pat_match_count + 'd1;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		star_exit <= 1'b0;
	end
	else if (state == DOUT) begin
		star_exit <= 1'b0;
	end
	else if (is_check_point) begin
		star_exit <= 1'b1;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		star_exit_start_idx <= 'd0;
	end
	else if (state == DOUT) begin
		star_exit_start_idx <= 'd0;
	end
	else if (is_check_point) begin
		star_exit_start_idx <= str_start_idx;
	end
end

// output
always @(posedge clk or posedge reset) begin
	if (reset) begin
		match <= 1'b0;
	end
	else if (state == DOUT) begin
		match <= is_check_point_match ? (pat_match_count == pat_count - 'd2) : (pat_match_count == pat_count);
	end
	else begin
		match <= 1'b0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		match_index <= 'd0;
	end
	else if (state == DOUT) begin
		match_index <= 	star_exit ? (star_exit_start_idx - 'd1) : 
						(STRING[str_start_idx] == SPACE) ? (str_start_idx + 'd1 - 'd1) : (str_start_idx - 'd1);
	end
	else begin
		match_index <= 'd0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		valid <= 1'b0;
	end
	else if (state == DOUT) begin
		valid <= 1'b1;
	end
	else begin
		valid <= 1'b0;
	end
end

endmodule
