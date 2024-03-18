module LBP(
	input   		  	clk,
	input   		 	reset,
	output reg 	[13:0] 	gray_addr,
	output 	        	gray_req,
	input   	 	  	gray_ready,
	input   	[7:0] 	gray_data,
	output  	[13:0] 	lbp_addr,
	output  	  	  	lbp_valid,
	output  	[7:0]  	lbp_data,
	output  	  	  	finish
);

// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
localparam IDLE 		= 2'd0;
localparam INITIAL_COL	= 2'd1;	// wait 6 cycles for the first 6 data;
localparam READ_GRAY	= 2'd2;	// pipeline processing
localparam DATA_OUT		= 2'd3;


// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [1:0] state, next_state;

// use line buffer, use only 3 cycles to compute one output pixel data
reg [7:0] line_buffer [0:8];
reg [6:0] X, Y;
reg [3:0] pix_idx;


// ====================================================================	//
// 							Combination (Wires)  						//
// ====================================================================	//
// state wire
wire IDLE_wire 			= state == IDLE;
wire INITIAL_COL_wire	= state == INITIAL_COL;
wire READ_GRAY_wire		= state == READ_GRAY;
wire DATA_OUT_wire		= state == DATA_OUT;

// line buffer encoding
wire [7:0] MID_MID_pix 	= line_buffer[4];
wire LEFT_TOP_pix 		= line_buffer[0] >= MID_MID_pix;
wire LEFT_MID_pix 		= line_buffer[1] >= MID_MID_pix;
wire LEFT_BOTTOM_pix	= line_buffer[2] >= MID_MID_pix;
wire MID_TOP_pix		= line_buffer[3] >= MID_MID_pix;
wire MID_BOTTOM_pix		= line_buffer[5] >= MID_MID_pix;
wire RIGHT_TOP_pix		= line_buffer[6] >= MID_MID_pix;
wire RIGHT_MID_pix		= line_buffer[7] >= MID_MID_pix;
wire RIGHT_BOTTOM_pix	= line_buffer[8] >= MID_MID_pix;

// control wire
wire X_done = X == 7'd126;
wire Y_done = Y == 7'd126;

wire initial_col_done 	= pix_idx == 4'd5;
wire one_pix_done		= pix_idx == 4'd8;

wire system_done		= X_done & Y_done;
wire one_row_done		= X_done;

// output
wire [7:0] LBP_value	= {RIGHT_BOTTOM_pix, MID_BOTTOM_pix, LEFT_BOTTOM_pix, RIGHT_MID_pix, LEFT_MID_pix, RIGHT_TOP_pix, MID_TOP_pix, LEFT_TOP_pix};

assign gray_req = INITIAL_COL_wire | READ_GRAY_wire;

assign lbp_data  = LBP_value;
assign lbp_valid = DATA_OUT_wire;
assign lbp_addr	 = {Y, X};

assign finish = DATA_OUT_wire & system_done;

// next state logic
always@(*) begin
	case(state)
		IDLE 		: next_state = gray_ready 		? INITIAL_COL 	: IDLE;
		INITIAL_COL	: next_state = initial_col_done ? READ_GRAY 	: INITIAL_COL;
		READ_GRAY	: next_state = one_pix_done		? DATA_OUT		: READ_GRAY;
		DATA_OUT    : next_state = system_done		? IDLE			: one_row_done ? INITIAL_COL : READ_GRAY;
		default		: next_state = IDLE;
	endcase
end

always@(*) begin
	case(pix_idx)
		4'd0 	: gray_addr = {Y - 7'd1	, X - 7'd1};
		4'd1 	: gray_addr = {Y		, X - 7'd1};
		4'd2 	: gray_addr = {Y + 7'd1	, X - 7'd1};
		4'd3 	: gray_addr = {Y - 7'd1	, X};
		4'd4 	: gray_addr = {Y		, X};
		4'd5 	: gray_addr = {Y + 7'd1	, X};
		4'd6 	: gray_addr = {Y - 7'd1	, X + 7'd1};
		4'd7 	: gray_addr = {Y		, X + 7'd1};
		4'd8 	: gray_addr = {Y + 7'd1	, X + 7'd1};
		default : gray_addr = {Y		, X};
	endcase
end


// ====================================================================	//
// 						 		Sequential  							//
// ====================================================================	//
// FSM
always@(posedge clk) begin
	if(reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

always@(posedge clk) begin
	if(reset) begin
		X <= 7'd1;
	end
	else if(DATA_OUT_wire) begin
		X <= X_done ? 7'd1 : (X + 7'd1);
	end
end

always@(posedge clk) begin
	if(reset) begin
		Y <= 7'd1;
	end
	else if(DATA_OUT_wire & X_done) begin
		Y <= Y_done ? 7'd1 : (Y + 7'd1);
	end
end

always@(posedge clk) begin
	if(reset) begin
		pix_idx <= 4'd0;
	end
	else if(INITIAL_COL_wire) begin
		pix_idx <= pix_idx + 4'd1;
	end
	else if(READ_GRAY_wire) begin
		pix_idx <= (pix_idx == 4'd8) ? 4'd6 : (pix_idx + 4'd1);
	end
	else if(DATA_OUT_wire & one_row_done) begin
		pix_idx <= 4'd0;
	end
end

integer i;
always@(posedge clk) begin
	if(reset) begin
		for(i=0; i<9; i=i+1) begin
			line_buffer[i] <= 7'd0;
		end
	end
	else if(INITIAL_COL_wire) begin
		line_buffer[pix_idx] <= gray_data;
	end
	else if(READ_GRAY_wire) begin
		line_buffer[pix_idx] <= gray_data;
	end
	else if(DATA_OUT_wire) begin
		line_buffer[0] <= line_buffer[3];
		line_buffer[1] <= line_buffer[4];
		line_buffer[2] <= line_buffer[5];
		line_buffer[3] <= line_buffer[6];
		line_buffer[4] <= line_buffer[7];
		line_buffer[5] <= line_buffer[8];
	end
end


endmodule
