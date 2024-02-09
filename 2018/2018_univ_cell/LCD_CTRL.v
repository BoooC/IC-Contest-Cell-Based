module LCD_CTRL (
	input 				clk,
	input 				reset,
	input 		[3:0] 	cmd,
	input 				cmd_valid,
	input 		[7:0] 	IROM_Q,
	output 		 		IROM_rd,
	output		[5:0]	IROM_A,
	output				IRAM_valid,
	output		[7:0] 	IRAM_D,
	output		[5:0] 	IRAM_A,
	output	reg			busy,
	output				done
);


// ====================================================================	//
// 						 		Parameters  							//
// ====================================================================	//
parameter IMAGE_SIZE = 8;

// CMD to intructions
parameter WRITE			= 4'b0000;
parameter SHIFT_UP		= 4'b0001;
parameter SHIFT_DOWN	= 4'b0010;
parameter SHIFT_LEFT	= 4'b0011;
parameter SHIFT_RIGHT	= 4'b0100;
parameter MAX			= 4'b0101;
parameter MIN			= 4'b0110;
parameter AVERAGE		= 4'b0111;
parameter CNT_ROTATION	= 4'b1000;	// counterclockwise rotation
parameter ROTATION		= 4'b1001;	// clockwise rotation
parameter MIRROR_X		= 4'b1010;
parameter MIRROR_Y		= 4'b1011;

// state
localparam IDLE 		= 3'd0;
localparam READ_ROM		= 3'd1;
localparam OPERATION	= 3'd2;
localparam WRITE_RAM	= 3'd3;
localparam DONE 		= 3'd4;


// ====================================================================	//
// 						 		Registers  								//
// ====================================================================	//
reg [2:0] state, next_state;

reg [7:0] Buffer [0:IMAGE_SIZE*IMAGE_SIZE-1];
reg [5:0] addr;	

// operation point
reg [2:0] op_point_X;	// 1~7
reg [2:0] op_point_Y;	// 1~7


// ====================================================================	//
// 							Combination (Wires)  						//
// ====================================================================	//
// point address
wire [5:0] top_left_point_X 	= op_point_X - 6'd1;
wire [5:0] top_left_point_Y		= op_point_Y - 6'd1;

wire [5:0] top_right_point_X	= op_point_X;
wire [5:0] top_right_point_Y	= op_point_Y - 6'd1;

wire [5:0] bottom_left_point_X 	= op_point_X - 6'd1;
wire [5:0] bottom_left_point_Y 	= op_point_Y;

wire [5:0] bottom_right_point_X	= op_point_X;
wire [5:0] bottom_right_point_Y	= op_point_Y;

// point value
wire [5:0] top_left_addr	= top_left_point_X 		+ top_left_point_Y 		* 8;
wire [5:0] top_right_addr	= top_right_point_X		+ top_right_point_Y		* 8;
wire [5:0] bottom_left_addr	= bottom_left_point_X	+ bottom_left_point_Y 	* 8;
wire [5:0] bottom_right_addr= bottom_right_point_X	+ bottom_right_point_Y	* 8;

wire [7:0] top_left		= Buffer[top_left_addr];
wire [7:0] top_right	= Buffer[top_right_addr];
wire [7:0] bottom_left	= Buffer[bottom_left_addr];
wire [7:0] bottom_right	= Buffer[bottom_right_addr];

// find max
wire [7:0] max_value_0	= (top_left    > top_right)    ? top_left 	 : top_right;
wire [7:0] max_value_1	= (bottom_left > bottom_right) ? bottom_left : bottom_right;
wire [7:0] max_value	= (max_value_0 > max_value_1)  ? max_value_0 : max_value_1;

// find min
wire [7:0] min_value_0	= (top_left    < top_right)    ? top_left 	 : top_right;
wire [7:0] min_value_1	= (bottom_left < bottom_right) ? bottom_left : bottom_right;
wire [7:0] min_value	= (min_value_0 < min_value_1)  ? min_value_0 : min_value_1;

// find average
wire [9:0] sum_value	= (top_left + top_right + bottom_left + bottom_right);
wire [7:0] average_value= sum_value >> 2; // devided by 4

// state wire
wire IDLE_wire		= state == IDLE;
wire READ_ROM_wire  = state == READ_ROM;
wire OPERATION_wire = state == OPERATION;
wire WRITE_RAM_wire = state == WRITE_RAM;
wire DONE_wire      = state == DONE;

wire addr_done 		= addr == 6'd63;
wire read_rom_done 	= addr_done;
wire write_ram_done = addr_done;
wire operation_done	= cmd  == WRITE;	

// output
assign IROM_rd 		= READ_ROM_wire;
assign IROM_A		= addr;

assign IRAM_valid	= WRITE_RAM_wire;
assign IRAM_A		= addr;
assign IRAM_D		= Buffer[addr];

assign done			= DONE_wire;

// next state logic
always@(*) begin
	case(state)
		IDLE 		: next_state = READ_ROM;
		READ_ROM	: next_state = read_rom_done 	? OPERATION : READ_ROM;
		OPERATION	: next_state = operation_done	? WRITE_RAM : OPERATION;
		WRITE_RAM	: next_state = write_ram_done	? DONE		: WRITE_RAM;
		DONE 		: next_state = IDLE;
		default		: next_state = IDLE;
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
		addr <= 6'd0;
	end
	else if(READ_ROM_wire | WRITE_RAM_wire) begin
		addr <= addr + 6'd1;
	end
end

// operation point X control
always@(posedge clk) begin
	if(reset) begin
		op_point_X <= 3'd4;
	end
	else if(cmd_valid) begin
		case(cmd)
			SHIFT_LEFT	: op_point_X <= (op_point_X == 3'd1) ? op_point_X : (op_point_X - 3'd1);
			SHIFT_RIGHT	: op_point_X <= (op_point_X == 3'd7) ? op_point_X : (op_point_X + 3'd1);
			default		: op_point_X <= op_point_X;
		endcase
	end
end

// operation point Y control
always@(posedge clk) begin
	if(reset) begin
		op_point_Y <= 3'd4;
	end
	else if(cmd_valid) begin
		case(cmd)
			SHIFT_UP 	: op_point_Y <= (op_point_Y == 3'd1) ? op_point_Y : (op_point_Y - 3'd1);
			SHIFT_DOWN	: op_point_Y <= (op_point_Y == 3'd7) ? op_point_Y : (op_point_Y + 3'd1);
			default		: op_point_Y <= op_point_Y;
		endcase
	end
end

// Buffer processing for each cmd
integer i;
always@(posedge clk) begin
	if(reset) begin
		for(i=0; i<IMAGE_SIZE*IMAGE_SIZE; i=i+1) begin
			Buffer[i] <= 8'd0;
		end
	end
	else if(READ_ROM_wire) begin
		Buffer[addr] <= IROM_Q;
	end
	else if(cmd_valid) begin
		case(cmd)
			MAX : begin
				Buffer[top_left_addr]		<= max_value;
				Buffer[top_right_addr]		<= max_value;
				Buffer[bottom_right_addr]	<= max_value;
				Buffer[bottom_left_addr]	<= max_value;
			end
			MIN	: begin
				Buffer[top_left_addr]		<= min_value;
				Buffer[top_right_addr]		<= min_value;
				Buffer[bottom_right_addr]	<= min_value;
				Buffer[bottom_left_addr]	<= min_value;
			end
			AVERAGE	: begin
				Buffer[top_left_addr]		<= average_value;
				Buffer[top_right_addr]		<= average_value;
				Buffer[bottom_right_addr]	<= average_value;
				Buffer[bottom_left_addr]	<= average_value;
			end
			CNT_ROTATION : begin
				Buffer[top_left_addr]		<= Buffer[top_right_addr];
				Buffer[top_right_addr]		<= Buffer[bottom_right_addr];
				Buffer[bottom_right_addr]	<= Buffer[bottom_left_addr];
				Buffer[bottom_left_addr]	<= Buffer[top_left_addr];
			end
			ROTATION : begin
				Buffer[top_left_addr]		<= Buffer[bottom_left_addr];
				Buffer[top_right_addr]		<= Buffer[top_left_addr];
				Buffer[bottom_right_addr]	<= Buffer[top_right_addr];
				Buffer[bottom_left_addr]	<= Buffer[bottom_right_addr];
			end
			MIRROR_X : begin
				Buffer[top_left_addr]		<= Buffer[bottom_left_addr];
				Buffer[top_right_addr]		<= Buffer[bottom_right_addr];
				Buffer[bottom_left_addr]	<= Buffer[top_left_addr];
				Buffer[bottom_right_addr]	<= Buffer[top_right_addr];
			end
			MIRROR_Y : begin
				Buffer[top_left_addr]		<= Buffer[top_right_addr];
				Buffer[top_right_addr]		<= Buffer[top_left_addr];
				Buffer[bottom_right_addr]	<= Buffer[bottom_left_addr];
				Buffer[bottom_left_addr]	<= Buffer[bottom_right_addr];
			end
			default	: begin
				Buffer[top_left_addr]		<= Buffer[top_left_addr];
				Buffer[top_right_addr]		<= Buffer[top_right_addr];
				Buffer[bottom_right_addr]	<= Buffer[bottom_right_addr];
				Buffer[bottom_left_addr]	<= Buffer[bottom_left_addr];
			end
		endcase
	end
end

// output
always@(posedge clk) begin
	if(reset) begin
		busy <= 1'b1;
	end
	else if(cmd_valid) begin
		busy <= 1'b1;
	end
	else if(addr_done | OPERATION_wire) begin
		busy <= 1'b0;
	end
end


endmodule
