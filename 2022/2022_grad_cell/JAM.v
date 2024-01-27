// ====================================================================================================== //
// This module is designed for the Job Assignment Machine.
// It implements the Lexicographic Permutation Algorithm to determine the minimum workload.
// The implementation utilizes combination logic to generate the next permutation, as
// it is required that the total cycles do not exceed 430000.
// 
// The following is simulation result
//
// For a scenario with Pattern 1.
// # ----------------------------------------------------------------------
// # Get Valid at cycle:    362877
// # receive MinCost/MatchCount=  119/ 3 , golden MinCost/MatchCount= 119/ 3
// # ----------------------------------------------------------------------
//
// # ----------------------------------------------------------------------
// # Get Valid at cycle:    362877
// # receive MinCost/MatchCount=  250/ 6 , golden MinCost/MatchCount= 250/ 6
// # ---------------------------------------------------------------------- 
//
// # ----------------------------------------------------------------------
// # Get Valid at cycle:    362877
// # receive MinCost/MatchCount=  485/ 9 , golden MinCost/MatchCount= 485/ 9
// # ----------------------------------------------------------------------
// 
// # *************************
// # **  FUNCTION  CORRECT  **
// # *************************
//
// Area : 8166.2
// Cycle: 362877
// ====================================================================================================== //

module JAM (
	input				CLK,
	input				RST,
	output 	reg [2:0]	W,
	output 		[2:0]	J,
	input 		[6:0]	Cost,
	output 	reg [3:0]	MatchCount,
	output	reg	[9:0]	MinCost,
	output  			Valid 
);


// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
parameter 	WORKERS 		= 8;

localparam	IDLE 			= 2'd0;
localparam	FIND_NEXT_SET	= 2'd1;
localparam	CAL_COST		= 2'd2; 
localparam	DONE 			= 2'd3;

// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [1:0] state, next_state;

// permutation
reg [2:0] perm [0:7];	// 8! = 40320
reg [9:0] cost_temp;

// ====================================================================	//
// 						 			Wires  								//
// ====================================================================	//
reg  [2:0] next_perm [0:7];
wire [3:0] temp_perm [0:7];

wire IDLE_wire 			= state == IDLE;
wire FIND_NEXT_SET_wire = state == FIND_NEXT_SET;
wire CAL_COST_wire 		= state == CAL_COST;
wire DONE_wire 			= state == DONE;

// flag
wire cal_cost_done	= W == 3'd7;
wire iteration_done = (next_perm[0] == 3'd7) & (next_perm[1] == 3'd6) & (next_perm[2] == 3'd5) & (next_perm[3] == 3'd4) & 
					  (next_perm[4] == 3'd3) & (next_perm[5] == 3'd2) & (next_perm[6] == 3'd1) & (next_perm[7] == 3'd0);

wire [2:0] exchange_point = perm[7] > perm[6] ? 3'd6 : 
							perm[6] > perm[5] ? 3'd5 : 
							perm[5] > perm[4] ? 3'd4 : 
							perm[4] > perm[3] ? 3'd3 : 
							perm[3] > perm[2] ? 3'd2 : 
							perm[2] > perm[1] ? 3'd1 : 3'd0;
                                           
wire [2:0] exchange_num	= perm [exchange_point];

// The min_point signal represents the position of the smallest value among points 
// to the right of exchange_point that are greater than exchange_num
wire [2:0] min_point = 	(temp_perm[6] > temp_perm[7]) ? 3'd7 :
						(temp_perm[5] > temp_perm[6]) ? 3'd6 :
						(temp_perm[4] > temp_perm[5]) ? 3'd5 :
						(temp_perm[3] > temp_perm[4]) ? 3'd4 :
						(temp_perm[2] > temp_perm[3]) ? 3'd3 :
						(temp_perm[1] > temp_perm[2]) ? 3'd2 :
						(temp_perm[0] > temp_perm[1]) ? 3'd1 : 3'd0;

// exchange and reverse
wire [2:0] distance = min_point - exchange_point;

// Set the values of points on the left of the exchange points, 
// and those points with values less than exchange_num, to the maximum value (4'd15).
assign temp_perm[0] = (exchange_point > 3'd0 | perm[0] <= exchange_num) ? 4'd15 : {1'b0, perm[0]};
assign temp_perm[1] = (exchange_point > 3'd1 | perm[1] <= exchange_num) ? 4'd15 : {1'b0, perm[1]};
assign temp_perm[2] = (exchange_point > 3'd2 | perm[2] <= exchange_num) ? 4'd15 : {1'b0, perm[2]};
assign temp_perm[3] = (exchange_point > 3'd3 | perm[3] <= exchange_num) ? 4'd15 : {1'b0, perm[3]};
assign temp_perm[4] = (exchange_point > 3'd4 | perm[4] <= exchange_num) ? 4'd15 : {1'b0, perm[4]};
assign temp_perm[5] = (exchange_point > 3'd5 | perm[5] <= exchange_num) ? 4'd15 : {1'b0, perm[5]};
assign temp_perm[6] = (exchange_point > 3'd6 | perm[6] <= exchange_num) ? 4'd15 : {1'b0, perm[6]};
assign temp_perm[7] = (exchange_point > 3'd7 | perm[7] <= exchange_num) ? 4'd15 : {1'b0, perm[7]};

// output
assign J = perm[W];
assign Valid = DONE_wire;

// Lexicographic Permutation Algorithm
integer i;
always@(*) begin
	for(i=0; i<8; i=i+1) begin
		if(exchange_point == i) begin		
			next_perm[i] = perm[min_point];
		end
		else if(exchange_point > i) begin
			next_perm[i] = perm[i];
		end
		else if(distance == 8-i) begin 	
			next_perm[i] = perm[exchange_point];
		end
		else begin
			next_perm[i] = perm[8-i + exchange_point];
		end
	end
end

// next state logic
always@(*) begin
	case(state)
		IDLE 			: next_state = FIND_NEXT_SET;
		FIND_NEXT_SET 	: next_state = CAL_COST;
		CAL_COST 		: next_state = cal_cost_done ? iteration_done ? DONE : FIND_NEXT_SET : CAL_COST;
		DONE 			: next_state = DONE;
		default			: next_state = IDLE;
	endcase
end

// FSM
always@(posedge CLK) begin
	if(RST) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end

integer j;
always@(posedge CLK) begin
	if(RST) begin
		for(j=0; j<WORKERS; j=j+1) begin
			perm[j] <= j;
		end
	end
	else if(cal_cost_done) begin
		for(j=0; j<WORKERS; j=j+1) begin
			perm[j] <= next_perm[j];
		end
	end
end

always@(posedge CLK) begin
	if(RST) begin
		W <= 3'd0;
	end
	else if(CAL_COST_wire) begin
		W <= W + 3'd1;
	end
end

always@(posedge CLK) begin
	if(RST) begin
		cost_temp <= 10'd0;
	end
	else if(CAL_COST_wire) begin
		cost_temp <= cal_cost_done ? 10'd0 : (cost_temp + Cost);
	end
end

always@(posedge CLK) begin
	if(RST) begin
		MinCost <= 10'b11_1111_1111;
	end
	else if(cal_cost_done) begin
		MinCost <= (cost_temp + Cost) < MinCost ? (cost_temp + Cost) : MinCost;
	end
end

always@(posedge CLK) begin
	if(RST) begin
		MatchCount <= 4'd0;
	end
	else if(cal_cost_done) begin
		MatchCount <= (cost_temp + Cost) < MinCost 	? 4'd1 : 
					  (cost_temp + Cost) == MinCost 	? MatchCount + 4'd1 : MatchCount;
	end
end


endmodule

