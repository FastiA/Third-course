module main(i_clk, i_rst_n_pc);

parameter ADDR_WIDTH = 30;
parameter DATA_WIDTH = 32;
parameter ADDR_REGIST = 5;

input i_clk;
input i_rst_n_pc;

///////////////////////PC////////////////////////////////////
wire [ADDR_WIDTH-1:0] o_addr_instr;
wire [ADDR_WIDTH-1:0] o_addr_mux_PCorNextpc;

pc #(.DATA_WIDTH (ADDR_WIDTH)) pc(.i_clk (i_clk),
								  .i_rst_n (i_rst_n_pc),
								  .i_pc (o_addr_mux_PCorNextpc),
								  .o_pc (o_addr_instr)
								 );

////////////////////////////////////////////////////////////


///////////////////////PCADDER////////////////////////////////

wire [ADDR_WIDTH-1:0] o_addr_pcadder;

adder #(.DATA_WIDTH (ADDR_WIDTH)) adderpc(.i_op1 (o_addr_instr),
										  .i_op2 (30'd1),
										  .o_result (o_addr_pcadder)
										 );

////////////////////////////////////////////////////////////


///////////////////////INSTRUCTION MEMORY/////////////////////////

wire [DATA_WIDTH-1:0] o_data_instr;

rom instrmem(.i_addr (o_addr_instr),
		     .o_data (o_data_instr)
	   		);

//////////////////////////////////////////////////////////////////


///////////////////////CONTROL/////////////////////////////////

wire o_regDst, o_jump, o_memToReg, o_memWrite;
wire o_aluSrc, o_regWrite, o_extOP, o_beq, o_bne;
wire [1:0] o_control_aluOp;

control control(.i_instrCode (o_data_instr[31:26]), 
               .o_regDst (o_regDst),
               .o_jump (o_jump), 
               .o_memToReg (o_memToReg),
               .o_aluOp (o_control_aluOp),
               .o_memWrite (o_memWrite),
               .o_aluSrc (o_aluSrc),
               .o_regWrite (o_regWrite),
               .o_extOP (o_extOP),
               .o_beq (o_beq),
               .o_bne (o_bne)
               );

////////////////////////////////////////////////////////////////


///////////////////////MUX_Rt_Rd/////////////////////////////////

wire [ADDR_REGIST-1:0] o_addr_mux_RtRd;

mux2in1 #(.DATA_WIDTH (ADDR_REGIST)) muxregdst(.i_dat0 (o_data_instr[20:16]),
											   .i_dat1 (o_data_instr[15:11]),
											   .i_control (o_regDst),
											   .o_dat (o_addr_mux_RtRd)
											  );

////////////////////////////////////////////////////////////////


///////////////////////REGISTERS//////////////////////////////////

wire [DATA_WIDTH-1:0] o_rdata_Rs;
wire [DATA_WIDTH-1:0] o_rdata_Rt;
wire [DATA_WIDTH-1:0] o_data_mux_AluresDMEM;

regFile regFile(.i_clk (i_clk),
				.i_raddr1 (o_data_instr[25:21]),
				.i_raddr2 (o_data_instr[20:16]),
				.i_waddr (o_addr_mux_RtRd),
				.i_wdata (o_data_mux_AluresDMEM),
				.i_we(o_regWrite),
				.o_rdata1 (o_rdata_Rs),
				.o_rdata2 (o_rdata_Rt)
				);

//////////////////////////////////////////////////////////////////
 

///////////////////////EXTENDER//////////////////////////////////

wire [DATA_WIDTH-1:0] o_data_extender;

signExtend signExtend(.i_data (o_data_instr[15:0]),
					  .en (o_extOP),
					  .o_data (o_data_extender)
					  );

//////////////////////////////////////////////////////////////////


///////////////////////MUX_Rt_extImm/////////////////////////////////

wire [DATA_WIDTH-1:0] o_data_mux_RtImm;

mux2in1 muxalusrc(.i_dat0 (o_rdata_Rt),
				  .i_dat1 (o_data_extender),
				  .i_control (o_aluSrc),
				  .o_dat (o_data_mux_RtImm)
				 );

////////////////////////////////////////////////////////////////


///////////////////////ALUCON/////////////////////////////////////

wire [3:0] o_data_aluControl;
 
aluControl aluControl(.i_aluOp (o_control_aluOp),
					  .i_func (o_data_extender[5:0]),
				      .o_aluControl (o_data_aluControl)
					 );

//////////////////////////////////////////////////////////////////


///////////////////////ALU////////////////////////////////////////

wire o_zf;
wire [DATA_WIDTH-1:0] o_data_result_alu;

alu alu(.i_op1 (o_rdata_Rs),
		.i_op2 (o_data_mux_RtImm),
		.i_control (o_data_aluControl),
		.o_zf (o_zf),
		.o_result (o_data_result_alu)
		);

//////////////////////////////////////////////////////////////////


///////////////////////DATA_MEMORY///////////////////////////////////////

wire [DATA_WIDTH-1:0] o_data_mem;

ram datamem(.i_clk (i_clk),
		    .i_addr (o_data_result_alu),
		    .i_data (o_rdata_Rt),
		    .i_we (o_memWrite),
		    .o_data (o_data_mem)
		   );

//////////////////////////////////////////////////////////////////


///////////////////////MUX_ALURESULT_DATAMEM///////////////////////////

mux2in1 muxmemtoreg(.i_dat0 (o_data_result_alu),
				    .i_dat1 (o_data_mem),
				    .i_control (o_memToReg),
				    .o_dat (o_data_mux_AluresDMEM)
				   );

////////////////////////////////////////////////////////////////


///////////////////////NEXTPC/////////////////////////////////

wire o_PCSrc;
wire [ADDR_WIDTH-1:0] o_addr_nextpc;

nextPC nextPC(.i_incPC (o_addr_pcadder),
			  .i_imm26 (o_data_instr[25:0]),
			  .i_jump (o_jump),
			  .i_beq (o_beq),
			  .i_bne (o_bne),
			  .i_zf (o_zf),
			  .o_PCSrc(o_PCSrc),
			  .o_adrr (o_addr_nextpc)			  
			  );

////////////////////////////////////////////////////////////////


///////////////////////MUX_PC+1_NEXTPC//////////////////////////////

mux2in1 muxpcsrc(.i_dat0 (o_addr_pcadder),
				 .i_dat1 (o_addr_nextpc),
				 .i_control (o_PCSrc),
				 .o_dat (o_addr_mux_PCorNextpc)
				);

////////////////////////////////////////////////////////////////

endmodule

