// ====================================================================================================== //
// This module is designed for Geofence.
// The first step involves implementing a sorting algorithm. 
// For this design, bubble sort is used due to its hardware-friendly nature.
// The second step involves performing consecutive vector cross operations to determine whether an item is within the geofence.
// Although this module utilizes registers to store vector products, 
// it only requires 3 subtractors and 1 multiplier for the vector cross operations, resulting in a smaller area footprint.
// 
// The following is simulation result
// # -------------------------------------------------
// # --    Simulation stop,  ALL PASS             --
// # -------------------------------------------------
//
// Area : 16503.8
// Cycle: 2505
// ====================================================================================================== //

module geofence (
	input 			clk,
	input			reset,
	input	[9:0] 	X,
	input	[9:0] 	Y,
	output 			valid,
	output 	reg		is_inside
);

// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
localparam IDLE 		= 3'd0;
localparam READ_DATA 	= 3'd1;
localparam CROSS_A 		= 3'd2;
localparam CROSS_B 		= 3'd3;
localparam EXCHANGE 	= 3'd4;
localparam IS_INSIDE_A	= 3'd5;
localparam IS_INSIDE_B	= 3'd6;
localparam DONE			= 3'd7;


// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [2:0] state, next_state;

// 2-cycle cross
reg signed [20:0] vector_product_reg;

// read data
reg [2:0] addr;
reg [1:0] sort_count;	// Bubble sort

// index:0 for item, index:1 for sort root
reg [9:0] Buffer_X [0:6];
reg [9:0] Buffer_Y [0:6];


// ====================================================================	//
// 						 			Wires  								//
// ====================================================================	//
// state 
wire IDLE_wire			= state == IDLE;
wire READ_DATA_wire	    = state == READ_DATA;
wire CROSS_A_wire	    = state == CROSS_A;
wire CROSS_B_wire	    = state == CROSS_B;
wire EXCHANGE_wire	    = state == EXCHANGE;
wire IS_INSIDE_A_wire	= state == IS_INSIDE_A;
wire IS_INSIDE_B_wire	= state == IS_INSIDE_B;
wire DONE_wire	        = state == DONE;

wire CROSS_wire 		= CROSS_A_wire 		| CROSS_B_wire | EXCHANGE_wire;
wire IS_INSIDE_wire 	= IS_INSIDE_A_wire 	| IS_INSIDE_B_wire;

wire [2:0] next_addr = (addr == 3'd6) ? 3'd1 : (addr + 3'd1);

// Use 2 cycles to do cross
// first cycle compute Ax*By, and second cycle compute Bx*Ay to reduce multiplier and subtractor
wire [2:0] root_index = IS_INSIDE_wire ? 3'd0 : 3'd1;
wire [9:0] point_o_X = Buffer_X[root_index];
wire [9:0] point_o_Y = Buffer_Y[root_index];
wire [9:0] point_a_X = Buffer_X[addr];
wire [9:0] point_a_Y = Buffer_Y[addr];
wire [9:0] point_b_X = Buffer_X[next_addr];
wire [9:0] point_b_Y = Buffer_Y[next_addr];

// use mux before multiplier and subtractor to determine data path
wire [9:0] point_ox  = CROSS_wire ? point_o_X : IS_INSIDE_A_wire ? point_o_X : point_a_X;
wire [9:0] point_oy  = CROSS_wire ? point_o_Y : IS_INSIDE_A_wire ? point_a_Y : point_o_Y;
wire [9:0] point_ax  = (CROSS_A_wire | IS_INSIDE_A_wire) ? point_a_X : point_b_X;
wire [9:0] point_by  = (CROSS_A_wire | IS_INSIDE_A_wire) ? point_b_Y : point_a_Y;

wire signed [10:0] vector_A = point_ax - point_ox;
wire signed [10:0] vector_B = point_by - point_oy;

wire signed [20:0] vector_product = vector_A * vector_B;

wire signed [20:0] cross_result = vector_product_reg - vector_product;

wire cross_negative = cross_result[20];

wire addr_done = addr 		== 3'd6;
wire sort_done = sort_count == 2'd3;	// (2,3,4,5), (2,3,4), (2,3), (2)
wire sort_one_iter_done = addr == (3'd5-{1'b0, sort_count});

//  output
assign valid = DONE_wire;

// next state logic
always@(*) begin
	case(state)
		IDLE 		: next_state = READ_DATA;
		READ_DATA 	: next_state = addr_done 	? CROSS_A 	: READ_DATA;
		CROSS_A 	: next_state = CROSS_B;
		CROSS_B 	: next_state = EXCHANGE;
		EXCHANGE 	: next_state = sort_done 	? IS_INSIDE_A : CROSS_A;
		IS_INSIDE_A	: next_state = IS_INSIDE_B;
		IS_INSIDE_B	: next_state = addr_done 	? DONE 		: IS_INSIDE_A;
		DONE		: next_state = IDLE;
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

// read data
integer i;
always@(posedge clk) begin
	if(reset) begin
		for(i=0; i<7; i=i+1) begin
			Buffer_X[i] <= 10'd0; 
			Buffer_Y[i] <= 10'd0; 
		end
	end
	else if(IDLE_wire | READ_DATA_wire) begin
		Buffer_X[addr] <= X; 
		Buffer_Y[addr] <= Y; 
	end
	else if(EXCHANGE_wire & ~cross_negative) begin
		Buffer_X[addr]		<= Buffer_X[next_addr]; 
		Buffer_Y[addr]		<= Buffer_Y[next_addr]; 
		Buffer_X[next_addr] <= Buffer_X[addr]; 
		Buffer_Y[next_addr] <= Buffer_Y[addr]; 
	end
end

always@(posedge clk) begin
	if(reset) begin
		addr <= 3'd0;
	end
	else if(IDLE_wire | READ_DATA_wire) begin
		addr <= addr_done ? 3'd2 : next_addr;
	end
	else if(EXCHANGE_wire) begin
		addr <= sort_done ? 3'd1 : sort_one_iter_done ? 3'd2 : (addr + 3'd1);
	end
	else if(IS_INSIDE_B_wire) begin
		addr <= addr_done ? 3'd0 : next_addr;
	end
end

always@(posedge clk) begin
	if(reset) begin
		sort_count <= 2'd0;
	end
	else if(EXCHANGE_wire & sort_one_iter_done) begin
		sort_count <= sort_count + 2'd1;
	end
	else if(DONE_wire) begin
		sort_count <= 2'd0;
	end
end

// store Ax*By
always@(posedge clk) begin
	if(reset) begin
		vector_product_reg <= 21'sd0;
	end
	else if(CROSS_A_wire | IS_INSIDE_A_wire) begin
		vector_product_reg <= vector_product;
	end
end

// output
always@(posedge clk) begin
	if(reset) begin
		is_inside <= 1'b1;
	end
	else if(IS_INSIDE_B_wire) begin
		is_inside <= cross_negative ? (1'b1 & is_inside) : (1'b0 & is_inside);
	end
	else if(DONE_wire) begin
		is_inside <= 1'b1;
	end
end


endmodule

