// ====================================================================================================== //
// This module is designed for parallel processing.
// To increase the level of parallelism, in addition to adjusting the 'PARALLEL' parameter, 
// you should also modify the 'is_inside[0:PARALLEL-1]' array accordingly and the bit width of parallel_ptr.
//
// For a scenario with 6 patterns and 8 parallel processes, the simulation results are as follows:
// # *******************************
// # **   Finish Simulation       **
// # **   RUN CYCLE =      56574  **
// # **   Cover total = 170/170   **
// # *******************************
// Area : 23614.2
// 
// For a scenario with 6 patterns and 4 parallel processes, the simulation results are as follows:
// # *******************************
// # **   Finish Simulation       **
// # **   RUN CYCLE =     112894  **
// # **   Cover total = 170/170   **
// # *******************************
// Area : 28246.4
// 
// ====================================================================================================== //

module LASER (
	input				CLK,
	input				RST,
	input 		[3:0] 	X,
	input 		[3:0] 	Y,
	output	reg [3:0] 	C1X,
	output	reg [3:0] 	C1Y,
	output	reg [3:0] 	C2X,
	output	reg [3:0] 	C2Y,
	output	reg 		DONE
);

// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
parameter ITEM_NUM 			= 40;
parameter PARALLEL			= 8;	// 1, 2, 4, 8, 10, ..., 40

parameter SUB_ITEM_NUM		= ITEM_NUM/PARALLEL;

parameter RADIUS 			= 4;
parameter PATTERN_HEIGHT 	= 16;
parameter PATTERN_WIDTH 	= 16;

parameter START_POINT_X 	= 0;
parameter START_POINT_Y 	= 0;

parameter END_POINT_X 		= PATTERN_HEIGHT-1-START_POINT_X;
parameter END_POINT_Y 		= PATTERN_WIDTH-1-START_POINT_Y;

parameter CONVERGE_TIMES	= 4;

// state
localparam IDLE 	= 3'd0;
localparam DATA_IN 	= 3'd1;
localparam FIND_C1 	= 3'd2;
localparam FIND_C2 	= 3'd3;
localparam SYS_DONE = 3'd4;


// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [2:0]	state, next_state;
			
reg [3:0]	item_X [0:PARALLEL-1][0:SUB_ITEM_NUM-1];
reg [3:0]	item_Y [0:PARALLEL-1][0:SUB_ITEM_NUM-1];

// data in addr & iter addr
reg [3:0] 	C_addr_X;
reg [3:0] 	C_addr_Y;

reg [3:0] 	item_addr [0:PARALLEL-1];
	
reg [3:0] 	C1_opt_addr_X;
reg [3:0] 	C1_opt_addr_Y;
	
reg [3:0] 	C2_opt_addr_X;
reg [3:0] 	C2_opt_addr_Y;

reg [2:0] 	parallel_ptr;	// 8

reg 		find_c1_done_reg;

reg	[4:0] 	opt_num;
reg	[4:0] 	opt_num_temp;
reg	[4:0] 	opt_num_pre;
	
reg [1:0] 	converge_times;
reg			iterate_reg;


// ====================================================================	//
// 						 		 Wires  								//
// ====================================================================	//
// state wire
wire IDLE_wire 			= state == IDLE;
wire DATA_IN_wire 		= state == DATA_IN;
wire FIND_C1_wire 		= state == FIND_C1;
wire FIND_C2_wire 		= state == FIND_C2;
wire DONE_wire 			= state == SYS_DONE;

// determine the point is inside circles
wire [3:0] C1_X_in = FIND_C1_wire ? C_addr_X : C1_opt_addr_X;
wire [3:0] C1_Y_in = FIND_C1_wire ? C_addr_Y : C1_opt_addr_Y;
wire [3:0] C2_X_in = FIND_C2_wire ? C_addr_X : C2_opt_addr_X;
wire [3:0] C2_Y_in = FIND_C2_wire ? C_addr_Y : C2_opt_addr_Y;

wire is_inside [0:PARALLEL-1];


// parallel processing
genvar p;
generate
    for (p=0; p<PARALLEL; p=p+1) begin : gen_determine_inside
        determine_inside #(
            .RADIUS(RADIUS)
        ) 
		determine_inside_inst (
            .C1_X_in	(C1_X_in				),
            .C1_Y_in	(C1_Y_in				),
            .C2_X_in	(C2_X_in				),
            .C2_Y_in	(C2_Y_in				),
            .item_X_in	(item_X[p][item_addr[p]]),
            .item_Y_in	(item_Y[p][item_addr[p]]),
            .is_inside	(is_inside[p]			)
        );
    end
endgenerate


wire [4:0]	next_opt_num_temp = opt_num_temp + is_inside[0] + is_inside[1] + is_inside[2] + is_inside[3]
											 + is_inside[4] + is_inside[5] + is_inside[6] + is_inside[7];

wire iterate 			= next_opt_num_temp >= opt_num;

wire converge 			= converge_times == CONVERGE_TIMES-1;

wire item_addr_done 	= item_addr[0] == SUB_ITEM_NUM-1;
wire parallel_ptr_done	= parallel_ptr == PARALLEL-1;

wire C_addr_X_done 		= C_addr_X == END_POINT_X;
wire C_addr_Y_done 		= C_addr_Y == END_POINT_Y;

wire data_in_done 		= parallel_ptr_done & item_addr_done;
wire find_c1_done 		= C_addr_X_done & C_addr_Y_done & item_addr_done & FIND_C1_wire;
wire find_c2_done 		= C_addr_X_done & C_addr_Y_done & item_addr_done & FIND_C2_wire;
wire iteration_done 	= converge;


// output
always@(*) begin
	C1X = C1_opt_addr_X;
	C1Y = C1_opt_addr_Y;
	C2X = C2_opt_addr_X;
	C2Y = C2_opt_addr_Y;
	DONE= iteration_done;
end

// next state logic
always@(*) begin
	case(state)
		IDLE 	: next_state = DATA_IN;
		DATA_IN : next_state = data_in_done 	? FIND_C1 	: DATA_IN;
		FIND_C1 : next_state = iteration_done	? SYS_DONE 	: find_c1_done ? FIND_C2 : FIND_C1;
		FIND_C2 : next_state = iteration_done	? SYS_DONE 	: find_c2_done ? FIND_C1 : FIND_C2;
		SYS_DONE: next_state = IDLE;
		default	: next_state = IDLE;
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

// read data
integer i, j, k;
always@(posedge CLK) begin
	if(RST) begin
		for(i=0; i<ITEM_NUM; i=i+1) begin
			for(j=0; j<PARALLEL; j=j+1) begin
				item_X[j][i] <= 4'd0;
				item_Y[j][i] <= 4'd0;
			end
		end
	end
	else if(IDLE_wire | DATA_IN_wire) begin
		item_X[parallel_ptr][item_addr[parallel_ptr]] <= X;
		item_Y[parallel_ptr][item_addr[parallel_ptr]] <= Y;
	end
end

always@(posedge CLK) begin
	if(RST) begin
		parallel_ptr <= 3'd0;
	end
	else if(item_addr_done) begin
		parallel_ptr <= parallel_ptr_done ? 3'd0 : parallel_ptr + 3'd1;
	end
end

// item address
always@(posedge CLK) begin
	if(RST) begin
		for(k=0; k<PARALLEL; k=k+1) begin
			item_addr[k] <= 4'd0;
			item_addr[k] <= 4'd0;
		end
	end
	else if(IDLE_wire | DATA_IN_wire | FIND_C1_wire | FIND_C2_wire) begin
		for(k=0; k<PARALLEL; k=k+1) begin
			item_addr[k] <= item_addr_done ? 4'd0 : (item_addr[k] + 4'd1);
			item_addr[k] <= item_addr_done ? 4'd0 : (item_addr[k] + 4'd1);
		end
	end
	else if(DONE_wire) begin
		for(k=0; k<PARALLEL; k=k+1) begin
			item_addr[k] <= 4'd0;
			item_addr[k] <= 4'd0;
		end
	end
end


// circle address
always@(posedge CLK) begin
	if(RST) begin
		C_addr_X <= START_POINT_X;
		C_addr_Y <= START_POINT_Y;
	end
	else if(item_addr_done & (FIND_C1_wire | FIND_C2_wire)) begin
		C_addr_X <= C_addr_X_done ? START_POINT_X : (C_addr_X + 4'd1);
		C_addr_Y <= C_addr_X_done ? C_addr_Y_done ? START_POINT_Y : (C_addr_Y + 4'd1) : C_addr_Y;
	end
	else if(DONE_wire) begin
		C_addr_X <= START_POINT_X;
		C_addr_Y <= START_POINT_Y;
	end
end


always@(posedge CLK) begin
	if(RST) begin
		opt_num <= 5'd0;
	end
	else if(item_addr_done & iterate) begin	
		opt_num <= next_opt_num_temp;
	end
	else if(DONE) begin	
		opt_num <= 5'd0;
	end
end

always@(posedge CLK) begin
	if(RST) begin
		opt_num_temp <= 5'd0;
	end
	else if(item_addr_done | DONE) begin	
		opt_num_temp <= 5'd0;
	end
	else if(FIND_C1_wire | FIND_C2_wire) begin	
		opt_num_temp <= next_opt_num_temp;
	end
end

always@(posedge CLK) begin
	if(RST) begin
		opt_num_pre <= 5'd0;
	end
	else if(find_c1_done | find_c2_done) begin	
		opt_num_pre <= opt_num;
	end
	else if(DONE) begin	
		opt_num_pre <= 5'd0;
	end
end

always@(posedge CLK) begin
	if(RST) begin
		converge_times <= 2'd0;
	end
	else if(find_c1_done | find_c2_done) begin	
		converge_times <= (opt_num_pre == opt_num) ? converge_times + 2'd1 : 2'd0;
	end
	else if(DONE_wire) begin	
		converge_times <= 2'd0;
	end
end

always@(posedge CLK) begin
	if(RST) begin
		C1_opt_addr_X <= 4'd0;
		C1_opt_addr_Y <= 4'd0;
	end
	else if(FIND_C1_wire & iterate) begin	
		C1_opt_addr_X <= C1_X_in;
		C1_opt_addr_Y <= C1_Y_in;
	end
	else if(DONE) begin	
		C1_opt_addr_X <= 4'd0;
		C1_opt_addr_Y <= 4'd0;
	end
end


always@(posedge CLK) begin
	if(RST) begin
		C2_opt_addr_X <= 4'd0;
		C2_opt_addr_Y <= 4'd0;
	end
	else if(FIND_C2_wire & iterate) begin	
		C2_opt_addr_X <= C2_X_in;
		C2_opt_addr_Y <= C2_Y_in;
	end
	else if(DONE) begin	
		C2_opt_addr_X <= 4'd0;
		C2_opt_addr_Y <= 4'd0;
	end
end

always@(posedge CLK) begin
	if(RST) begin
		find_c1_done_reg <= 1'b0;
	end
	else if(find_c1_done) begin	
		find_c1_done_reg <= 1'b1;
	end
	else if(DONE) begin	
		find_c1_done_reg <= 1'b0;
	end
end

always@(posedge CLK) begin
	if(RST) begin
		iterate_reg <= 1'b0;
	end
	else if(find_c1_done | find_c2_done) begin	
		iterate_reg <= 1'b0;
	end
	else if(item_addr_done & iterate) begin	
		iterate_reg <= 1'b1;
	end
	else if(DONE) begin	
		iterate_reg <= 1'b0;
	end
end

endmodule



module determine_inside #(
	parameter RADIUS = 4
)
(
	input [3:0]	C1_X_in,
	input [3:0]	C1_Y_in,
	input [3:0]	C2_X_in,
	input [3:0]	C2_Y_in,
	
	input [3:0]	item_X_in,
	input [3:0]	item_Y_in,
	
	output		is_inside
);


wire signed [4:0] C1_X_dist = C1_X_in - item_X_in;
wire signed [4:0] C1_Y_dist = C1_Y_in - item_Y_in;
wire signed [4:0] C2_X_dist = C2_X_in - item_X_in;
wire signed [4:0] C2_Y_dist = C2_Y_in - item_Y_in;

wire [3:0] C1_X_dist_abs = C1_X_dist[4] ? ~C1_X_dist + 5'b1 : C1_X_dist;
wire [3:0] C1_Y_dist_abs = C1_Y_dist[4] ? ~C1_Y_dist + 5'b1 : C1_Y_dist;
wire [3:0] C2_X_dist_abs = C2_X_dist[4] ? ~C2_X_dist + 5'b1 : C2_X_dist;
wire [3:0] C2_Y_dist_abs = C2_Y_dist[4] ? ~C2_Y_dist + 5'b1 : C2_Y_dist;


wire is_inside_C1 = ((C1_X_dist_abs == RADIUS) & (C1_Y_dist_abs == 4'd0)) | 	// (4,0)
					((C1_X_dist_abs == 4'd0) & (C1_Y_dist_abs == RADIUS)) | 	// (0,4)
					(((C1_X_dist_abs <= RADIUS-1) & (C1_Y_dist_abs <= RADIUS-1)) & ~((C1_X_dist_abs == RADIUS-1) & (C1_Y_dist_abs == RADIUS-1)));
					

wire is_inside_C2 = ((C2_X_dist_abs == RADIUS) & (C2_Y_dist_abs == 4'd0)) | 	// (4,0)
					((C2_X_dist_abs == 4'd0) & (C2_Y_dist_abs == RADIUS)) | 	// (0,4)
					(((C2_X_dist_abs <= RADIUS-1) & (C2_Y_dist_abs <= RADIUS-1)) & ~((C2_X_dist_abs == RADIUS-1) & (C2_Y_dist_abs == RADIUS-1)));

assign is_inside 	= is_inside_C1 | is_inside_C2;	// find_c1_done_reg ? (is_inside_C1 | is_inside_C2) : is_inside_C1;


endmodule

