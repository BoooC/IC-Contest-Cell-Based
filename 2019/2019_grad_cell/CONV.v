module  CONV(
	input				clk, 
	input				reset, 
	output	reg			busy,	
	input				ready,				
	output 	reg	[11:0]	iaddr,
	input signed[19:0]	idata,	
	output 		 	 	cwr,
	output 	reg	[11:0] 	caddr_wr,
	output 		[19:0] 	cdata_wr,	
	output 	reg	 		crd,
	output 	reg	[11:0]	caddr_rd,
	input		[19:0]	cdata_rd,
	output 	reg	[2:0] 	csel
);

// csel signal encoder
parameter NO_MEM 	= 3'b000;
parameter MEM_L0_C0 = 3'b001;	// layer0 kernel0
parameter MEM_L0_C1 = 3'b010;	// layer0 kernel1
parameter MEM_L1_C0 = 3'b011;	// layer1 kernel0
parameter MEM_L1_C1 = 3'b100;   // layer1 kernel1
parameter MEM_L2	= 3'b101;   // layer1 kernel1

// Kernel (4-bit integer(MSB) + 16-bit fraction(LSB))
parameter signed	KERNEL0_00 = 20'h0A89E, KERNEL0_01 = 20'h0925D, KERNEL0_02 = 20'h06D43,
					KERNEL0_10 = 20'h01004, KERNEL0_11 = 20'hF8F71, KERNEL0_12 = 20'hF6E54,
					KERNEL0_20 = 20'hFA6D7, KERNEL0_21 = 20'hFC834, KERNEL0_22 = 20'hFAC19,
					KERNEL0_BIAS = 20'h01310;


parameter signed	KERNEL1_00 = 20'hFDB55, KERNEL1_01 = 20'h02992, KERNEL1_02 = 20'hFC994,
					KERNEL1_10 = 20'h050FD, KERNEL1_11 = 20'h02F20, KERNEL1_12 = 20'h0202D,
					KERNEL1_20 = 20'h03BD7, KERNEL1_21 = 20'hFD369, KERNEL1_22 = 20'h05E68,
					KERNEL1_BIAS = 20'hF7295;


localparam IDLE 		= 3'd0;
localparam READ_PAT		= 3'd1;
localparam CALCULATE	= 3'd2;
localparam ReLU			= 3'd3;
localparam WRITE_BACK	= 3'd4;
localparam MAX_POOLING	= 3'd5;
localparam FLATTEN		= 3'd6;
localparam DONE			= 3'd7;



reg [2:0] state, next_state;

reg [11:0] addr; 	// global address
reg [3:0] count; 

reg kerner0_done;
reg kerner1_done;

reg signed [39:0] psum_reg;

reg signed [19:0] max_temp;

// state wire
wire IDLE_wire			= state == IDLE;
wire READ_PAT_wire      = state == READ_PAT;
wire CALCULATE_wire     = state == CALCULATE;
wire ReLU_wire          = state == ReLU;
wire WRITE_BACK_wire    = state == WRITE_BACK;
wire MAX_POOLING_wire   = state == MAX_POOLING;
wire FLATTEN_wire       = state == FLATTEN;
wire DONE_wire       	= state == DONE;

wire layer_0_flag 		= IDLE_wire | READ_PAT_wire | CALCULATE_wire | ReLU_wire | WRITE_BACK_wire;
wire layer_1_flag		= MAX_POOLING_wire;
wire layer_2_flag		= FLATTEN_wire;

wire one_stride_done 	= (layer_0_flag & (count == 4'd8)) | (layer_1_flag & (count == 4'd3));

wire pooling_done		= (addr == 12'd2047) & one_stride_done;
wire flatten_done		= (addr == 12'd2047) & one_stride_done;

// ifmap address encoding for 3x3 kernel
wire [11:0] Top_Left_addr		= addr - 12'd65;
wire [11:0] Top_Mid_addr		= addr - 12'd64;
wire [11:0] Top_Right_addr		= addr - 12'd63;
wire [11:0] Mid_Left_addr		= addr - 12'd1;
wire [11:0] Mid_addr			= addr;
wire [11:0] Mid_Right_addr		= addr + 12'd1;
wire [11:0] Bottom_Left_addr	= addr + 12'd63;
wire [11:0] Bottom_addr			= addr + 12'd64;
wire [11:0] Bottom_Right_addr	= addr + 12'd65;

wire first_row = (addr < 12'd64) 	& (count == 4'd0 | count == 4'd1 | count == 4'd2);
wire final_row = (addr > 12'd4031) 	& (count == 4'd6 | count == 4'd7 | count == 4'd8);
wire first_col = (addr % 64 == 0)	& (count == 4'd0 | count == 4'd3 | count == 4'd6);
wire final_col = (addr % 64 == 63)	& (count == 4'd2 | count == 4'd5 | count == 4'd8);
wire padding_flag = first_row | final_row | first_col | final_col;

reg  signed [19:0] weight;
wire signed [19:0] ifmap 	= padding_flag ? 20'sd0 : idata;
wire signed [39:0] product 	= ifmap * weight;
wire signed [39:0] psum 	= product + psum_reg;
wire signed [39:0] psum_bias= kerner0_done ? (psum_reg + KERNEL1_BIAS) : (psum_reg + KERNEL0_BIAS);
wire signed [19:0] result	= psum_bias[17] ? {psum_bias[36:33], (psum_bias[32:17] + 16'sd1)} : {psum_bias[36:33], psum_bias[32:17]};
wire signed [19:0] ReLU_out	= result[19] ? 20'sd0 : result;

assign cdata_wr = ReLU_out;
assign cwr		= WRITE_BACK_wire;


// next state logic
always@(*) begin
	case(state)
		IDLE 		: next_state = ready 			? READ_PAT	: IDLE;
		READ_PAT	: next_state = CALCULATE;
		CALCULATE	: next_state = one_stride_done 	? ReLU		: READ_PAT;
		ReLU		: next_state = WRITE_BACK;
		WRITE_BACK	: next_state = kerner1_done 	? MAX_POOLING : READ_PAT;
		MAX_POOLING	: next_state = pooling_done 	? FLATTEN	: MAX_POOLING;
		FLATTEN		: next_state = flatten_done		? DONE		: FLATTEN;
		DONE		: next_state = IDLE;
		default		: next_state = IDLE;
	endcase
end

always@(*) begin
	if(~kerner0_done) begin
		case(count)
			4'd0 : weight = KERNEL0_00;
			4'd1 : weight = KERNEL0_01;
			4'd2 : weight = KERNEL0_02;
			4'd3 : weight = KERNEL0_10;
			4'd4 : weight = KERNEL0_11;
			4'd5 : weight = KERNEL0_12;
			4'd6 : weight = KERNEL0_20;
			4'd7 : weight = KERNEL0_21;
			4'd8 : weight = KERNEL0_22;
			default : weight = 20'sd0;
		endcase
	end
	else begin
		case(count)
			4'd0 : weight = KERNEL1_00;
			4'd1 : weight = KERNEL1_01;
			4'd2 : weight = KERNEL1_02;
			4'd3 : weight = KERNEL1_10;
			4'd4 : weight = KERNEL1_11;
			4'd5 : weight = KERNEL1_12;
			4'd6 : weight = KERNEL1_20;
			4'd7 : weight = KERNEL1_21;
			4'd8 : weight = KERNEL1_22;
			default : weight = 20'sd0;
		endcase
	end
end


always@(*) begin
	case(count)
		4'd0 : iaddr = Top_Left_addr;
		4'd1 : iaddr = Top_Mid_addr;
		4'd2 : iaddr = Top_Right_addr;
		4'd3 : iaddr = Mid_Left_addr;
		4'd4 : iaddr = Mid_addr;
		4'd5 : iaddr = Mid_Right_addr;
		4'd6 : iaddr = Bottom_Left_addr;
		4'd7 : iaddr = Bottom_addr;
		4'd8 : iaddr = Bottom_Right_addr;
		default : iaddr = 12'd0;
	endcase
end

always@(*) begin
	if(layer_0_flag) begin
		if(~kerner0_done) begin
			csel = MEM_L0_C0;
		end
		else begin
			csel = MEM_L0_C1;
		end
	end
	else if(layer_1_flag) begin
		if(~kerner0_done) begin
			csel = MEM_L1_C0;
		end
		else begin
			csel = MEM_L1_C1;
		end
	end
	else begin
		csel = MEM_L2;
	end
end



// FSM
always@(posedge clk or posedge reset) begin
	if(reset) begin
		state <= IDLE;
	end
	else begin
		state <= next_state;
	end
end


always@(posedge clk or posedge reset) begin
	if(reset) begin
		addr <= 12'd0;
	end
	else if(CALCULATE_wire & one_stride_done) begin
		addr <= addr + 12'd1;
	end
end

always@(posedge clk) begin
	if(reset) begin
		count <= 4'd0;
	end
	else if(CALCULATE_wire) begin
		count <= (count == 4'd8) ? 4'd0 : (count + 4'd1);
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		caddr_wr <= 12'd0;
	end
	else if(WRITE_BACK_wire) begin
		caddr_wr <= caddr_wr + 12'd1;
	end
end


always@(posedge clk or posedge reset) begin
	if(reset) begin
		psum_reg <= 40'sd0;
	end
	else if(WRITE_BACK_wire) begin
		psum_reg <= 40'sd0;
	end
	else if(layer_0_flag & CALCULATE_wire) begin
		psum_reg <= psum;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		kerner0_done <= 1'b0;
	end
	else if((addr == 12'd4095) & one_stride_done) begin
		kerner0_done <= 1'b1;
	end
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		kerner1_done <= 1'b0;
	end
	else if((addr == 12'd4095) & one_stride_done & kerner0_done) begin
		kerner1_done <= 1'b1;
	end
end


always@(posedge clk or posedge reset) begin
	if(reset) begin
		busy <= 1'b0;
	end
	else if(ready) begin
		busy <= 1'b1;
	end
	else if(ReLU_wire & kerner1_done) begin
		busy <= 1'b0;
	end
end










endmodule
