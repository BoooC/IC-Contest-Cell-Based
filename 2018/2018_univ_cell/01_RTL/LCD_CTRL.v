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
	output				busy,
	output				done
);

parameter CMD_WRITE 	= 4'b0000;
parameter CMD_UP 		= 4'b0001;
parameter CMD_DOWN 		= 4'b0010;
parameter CMD_LEFT 		= 4'b0011;
parameter CMD_RIGHT 	= 4'b0100;
parameter CMD_MAX 		= 4'b0101;
parameter CMD_MIN 		= 4'b0110;
parameter CMD_AVG 		= 4'b0111;
parameter CMD_ROTATE_R	= 4'b1000;
parameter CMD_ROTATE	= 4'b1001;
parameter CMD_MIRROR_X	= 4'b1010;
parameter CMD_MIRROR_Y	= 4'b1011;


localparam IDLE 		= 'd0;
localparam READ_ROM 	= 'd1;
localparam READ_CMD 	= 'd2;
localparam OPERATION	= 'd4;
localparam WRITE_RAM	= 'd5;
localparam DONE			= 'd6;

reg [2:0] state, next_state;

reg [7:0] data_buffer [0:63];
reg [5:0] addr;
reg [3:0] cmd_reg;

reg [2:0] op_point_x, op_point_y;

wire [5:0] left_top_point 		= {op_point_y-3'd1	, op_point_x-3'd1};
wire [5:0] right_top_point 		= {op_point_y-3'd1	, op_point_x	 };
wire [5:0] left_bottom_point 	= {op_point_y		, op_point_x-3'd1};
wire [5:0] right_bottom_point 	= {op_point_y		, op_point_x	 };

wire [7:0] left_top_data		= data_buffer[left_top_point];
wire [7:0] right_top_data		= data_buffer[right_top_point];
wire [7:0] left_bottom_data		= data_buffer[left_bottom_point];
wire [7:0] right_bottom_data	= data_buffer[right_bottom_point];

// operation
wire [7:0] max_temp_1 = (left_top_data > right_top_data) ? left_top_data : right_top_data;
wire [7:0] max_temp_2 = (left_bottom_data > right_bottom_data) ? left_bottom_data : right_bottom_data;
wire [7:0] max_value  = (max_temp_1 > max_temp_2) ? max_temp_1 : max_temp_2;

wire [7:0] min_temp_1 = (left_top_data < right_top_data) ? left_top_data : right_top_data;
wire [7:0] min_temp_2 = (left_bottom_data < right_bottom_data) ? left_bottom_data : right_bottom_data;
wire [7:0] min_value  = (min_temp_1 < min_temp_2) ? min_temp_1 : min_temp_2;

wire [9:0] sum = left_top_data + right_top_data + left_bottom_data + right_bottom_data;
wire [7:0] avg = sum >> 2;

reg [7:0] new_left_top_data;
reg [7:0] new_right_top_data;
reg [7:0] new_left_bottom_data;
reg [7:0] new_right_bottom_data;

// control
wire addr_done	= addr == 'd63;

wire operation_done = 1'b1;
wire read_rom_done 	= addr_done;
wire write_ram_done	= addr_done;

// output
assign IROM_rd 		= 1'b1;
assign IROM_A		= addr;
assign IRAM_A		= addr;
assign IRAM_D 		= data_buffer[addr];
assign IRAM_valid 	= state == WRITE_RAM;
assign done			= state == DONE;
assign busy			= state != READ_CMD & state != OPERATION;

// FSM
always @(*) begin
	case(state)
		IDLE 		: next_state = READ_ROM;
		READ_ROM 	: next_state = read_rom_done	? READ_CMD 	: READ_ROM;
		READ_CMD 	: next_state = OPERATION;
		OPERATION	: next_state = cmd == CMD_WRITE ? WRITE_RAM : OPERATION;
		WRITE_RAM	: next_state = write_ram_done	? DONE		: WRITE_RAM;
		DONE		: next_state = IDLE;
		default		: next_state = IDLE;
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
always @(posedge clk) begin
	if (cmd_valid) begin
		cmd_reg <= cmd;
	end
end

integer i;
always @(posedge clk) begin
	if (state == READ_ROM) begin
		data_buffer[63] <= IROM_Q;
		for (i=0; i<63; i=i+1) begin
			data_buffer[i] <= data_buffer[i+1];
		end
	end
	else if (state == OPERATION) begin
		data_buffer[{op_point_y-3'd1, op_point_x-3'd1}] <= new_left_top_data;
		data_buffer[{op_point_y-3'd1, op_point_x	 }] <= new_right_top_data;
		data_buffer[{op_point_y		, op_point_x-3'd1}] <= new_left_bottom_data;
		data_buffer[{op_point_y		, op_point_x	 }] <= new_right_bottom_data;
	end
end

// counter
always @(posedge clk or posedge reset) begin
	if (reset) begin
		addr <= 'd0;
	end
	else if (state == READ_ROM | state == WRITE_RAM) begin
		addr <= addr_done ? 'd0 : (addr + 'd1);
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		op_point_x <= 'd4;
	end
	else if (state == OPERATION) begin
		case (cmd_reg)
			CMD_RIGHT 	: op_point_x <= (op_point_x == 'd7) ? 'd7 : (op_point_x + 'd1);
			CMD_LEFT  	: op_point_x <= (op_point_x == 'd1) ? 'd1 : (op_point_x - 'd1);
		endcase
	end
end

always @(posedge clk or posedge reset) begin
	if (reset) begin
		op_point_y <= 'd4;
	end
	else if (state == OPERATION) begin
		case (cmd_reg)
			CMD_UP 		: op_point_y <= (op_point_y == 'd1) ? 'd1 : (op_point_y - 'd1);
			CMD_DOWN 	: op_point_y <= (op_point_y == 'd7) ? 'd7 : (op_point_y + 'd1);
		endcase
	end
end

// operation mux
always @(*) begin
	case(cmd_reg)
		CMD_MAX : begin
			new_left_top_data		= max_value;
			new_right_top_data		= max_value;
			new_left_bottom_data	= max_value;
			new_right_bottom_data	= max_value;
		end
		CMD_MIN : begin
			new_left_top_data		= min_value;
			new_right_top_data		= min_value;
			new_left_bottom_data	= min_value;
			new_right_bottom_data	= min_value;
		end
		CMD_AVG : begin
			new_left_top_data		= avg;
			new_right_top_data		= avg;
			new_left_bottom_data	= avg;
			new_right_bottom_data	= avg;
		end
		CMD_ROTATE_R : begin
			new_left_top_data		= right_top_data;
			new_right_top_data		= right_bottom_data;
			new_left_bottom_data	= left_top_data;
			new_right_bottom_data	= left_bottom_data;
		end
		CMD_ROTATE : begin
			new_left_top_data		= left_bottom_data;
			new_right_top_data		= left_top_data;
			new_left_bottom_data	= right_bottom_data;
			new_right_bottom_data	= right_top_data;
		end
		CMD_MIRROR_X : begin
			new_left_top_data		= left_bottom_data;
			new_right_top_data		= right_bottom_data;
			new_left_bottom_data	= left_top_data;
			new_right_bottom_data	= right_top_data;
		end
		CMD_MIRROR_Y : begin
			new_left_top_data		= right_top_data;
			new_right_top_data		= left_top_data;
			new_left_bottom_data	= right_bottom_data;
			new_right_bottom_data	= left_bottom_data;
		end
		default : begin
			new_left_top_data		= left_top_data;
			new_right_top_data		= right_top_data;
			new_left_bottom_data	= left_bottom_data;
			new_right_bottom_data	= right_bottom_data;
		end
	endcase
end

endmodule
