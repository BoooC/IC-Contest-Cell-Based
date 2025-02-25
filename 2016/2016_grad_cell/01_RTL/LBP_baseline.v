module LBP(
	input   		  	clk,
	input   		 	reset,
	output reg 	[13:0] 	gray_addr,
	output 	        	gray_req,
	input   	 	  	gray_ready,
	input   	[7:0] 	gray_data,
	output reg 	[13:0] 	lbp_addr,
	output reg 	  	  	lbp_valid,
	output reg 	[7:0]  	lbp_data,
	output reg 	  	  	finish
);

localparam IDLE = 'd0;
localparam INIT	= 'd1;
localparam EXE	= 'd2;
localparam DONE	= 'd3;

reg [1:0] state, next_state;

reg [2:0] init_count;
reg [6:0] addr_x, addr_y;

reg [7:0] gray_buffer [0:8];

wire left_top 		= gray_buffer[7] >= gray_buffer[3];
wire mid_top  		= gray_buffer[4] >= gray_buffer[3];
wire right_top 		= gray_buffer[1] >= gray_buffer[3];

wire left_mid 		= gray_buffer[6] >= gray_buffer[3];
wire right_mid 		= gray_buffer[0] >= gray_buffer[3];

wire left_bottom 	= gray_buffer[5] >= gray_buffer[3];
wire mid_bottom  	= gray_buffer[2] >= gray_buffer[3];
wire right_bottom 	= gray_data 	 >= gray_buffer[3];

wire addr_x_done = addr_x == 'd126;
wire addr_y_done = addr_y == 'd126;

wire init_done 	= state == INIT & init_count == 'd5;
wire exe_done	= state == EXE  & init_count == 'd2;

wire row_done 	= addr_x_done & exe_done;
wire all_done	= addr_x_done & addr_y_done & exe_done;

assign gray_req	= 1'b1;

// FSM
always @(*) begin
	case(state)
		IDLE 	: next_state = gray_ready 	? INIT 	: IDLE;
		INIT	: next_state = init_done	? EXE	: INIT;
		EXE		: next_state = row_done		? (all_done ? DONE : INIT) : EXE;
		DONE	: next_state = IDLE;
		default	: next_state = IDLE;
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

// counter
always @(posedge clk or posedge reset) begin
	if (reset) begin
		init_count <= 'd0;
	end
	else if(state == INIT) begin
		init_count <= init_done ? 'd0 : (init_count + 'd1);
	end
	else if(state == EXE) begin
		init_count <= exe_done ? 'd0 : (init_count + 'd1);
	end
	else if(state == DONE) begin
		init_count <= 'd0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		addr_x <= 'd1;
	end
	else if(exe_done) begin
		addr_x <= addr_x_done ? 'd1 : (addr_x + 'd1);
	end
	else if(state == DONE) begin
		addr_x <= 'd1;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		addr_y <= 'd1;
	end
	else if(row_done) begin
		addr_y <= addr_y_done ? 'd1 : (addr_y + 'd1);
	end
	else if(state == DONE) begin
		addr_y <= 'd1;
	end
end

always @(*) begin
	if (state == INIT) begin
		case(init_count)
			'd0 : gray_addr = {addr_y - 7'd1, addr_x - 7'd1};
			'd1 : gray_addr = {addr_y		, addr_x - 7'd1};
			'd2 : gray_addr = {addr_y + 7'd1, addr_x - 7'd1};
			'd3 : gray_addr = {addr_y - 7'd1, addr_x};
			'd4 : gray_addr = {addr_y		, addr_x};
			'd5 : gray_addr = {addr_y + 7'd1, addr_x};
			default : gray_addr = 'd0;
		endcase
	end
	else begin
		case(init_count)
			'd0 : gray_addr = {addr_y - 7'd1, addr_x + 7'd1};
			'd1 : gray_addr = {addr_y		, addr_x + 7'd1};
			'd2 : gray_addr = {addr_y + 7'd1, addr_x + 7'd1};
			default : gray_addr = 'd0;
		endcase
	end
end


integer i;
always @(posedge clk or posedge reset) begin
	if (reset) begin
		for(i=0; i<9; i=i+1) begin
			gray_buffer[i] <= 'd0;
		end
	end
	else if(state == INIT | state == EXE) begin
		gray_buffer[0] <= gray_data;
		for(i=0; i<8; i=i+1) begin
			gray_buffer[i+1] <= gray_buffer[i];
		end
	end
	else if(state == DONE) begin
		for(i=0; i<9; i=i+1) begin
			gray_buffer[i] <= 'd0;
		end
	end
end


// output
always @(posedge clk or posedge reset) begin
	if (reset) begin
		lbp_addr <= 'd0;
	end
	else if(exe_done) begin
		lbp_addr <= {addr_y, addr_x};
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		lbp_data <= 'd0;
	end
	else if(exe_done) begin
		lbp_data <= {right_bottom, mid_bottom, left_bottom, right_mid, left_mid, right_top, mid_top, left_top};
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		lbp_valid <= 1'b0;
	end
	else if(exe_done) begin
		lbp_valid <= 1'b1;
	end
	else begin
		lbp_valid <= 1'b0;
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		finish <= 1'b0;
	end
	else if(state == DONE) begin
		finish <= 1'b1;
	end
	else begin
		finish <= 1'b0;
	end
end


endmodule
