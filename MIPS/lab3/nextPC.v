module nextPC(i_incPC, i_imm26, i_jump, i_beq, i_bne, i_zf, o_PCSrc, o_adrr);

parameter DATA_WIDTH = 30;

input	[DATA_WIDTH-1:0] i_incPC;
input	[25:0] i_imm26;
input	i_jump;
input	i_beq;
input	i_bne;
input	i_zf;
output	o_PCSrc;
output	[DATA_WIDTH-1:0]	o_adrr;

wire [DATA_WIDTH-1:0] o_data_sigex;
wire [DATA_WIDTH-1:0] o_data_adder;
wire [DATA_WIDTH-1:0] o_jump_addr;

assign o_PCSrc = i_jump | (i_beq & i_zf) | (i_bne & ~i_zf);
assign o_jump_addr = {i_incPC[29:26], i_imm26};

signExtend #(.DATA_WIDTH (DATA_WIDTH)) signExtend(.i_data (i_imm26[15:0]),
												  .en(1'b1),
												  .o_data (o_data_sigex)
												 );

adder #(.DATA_WIDTH (DATA_WIDTH)) adder(.i_op1 (i_incPC),
										.i_op2 (o_data_sigex),
										.o_result (o_data_adder)
										);


mux2in1 #(.DATA_WIDTH (DATA_WIDTH)) mux2in1(.i_dat0 (o_data_adder),
											.i_dat1 (o_jump_addr),
											.i_control (i_jump),
											.o_dat (o_adrr)
											);
   
endmodule


