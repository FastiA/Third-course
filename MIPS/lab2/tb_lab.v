`timescale 1ns / 1ps

module tb_lab;

parameter PERIOD = 20;
parameter DATA_WIDTH = 32;

reg i_clk;

///////////////////////ADDER////////////////////////

reg [DATA_WIDTH-1:0] i_op1, i_op2;
wire [DATA_WIDTH-1:0] o_result;

adder adder(.i_op1 (i_op1),
			 .i_op2 (i_op2),
			 .o_result (o_result)
			);

////////////////////////////////////////////////////


///////////////////////ROM/////////////////////////

reg [7:0] i_addr_rom;
wire [DATA_WIDTH-1:0] o_data_rom;

rom rom(.i_addr (i_addr_rom),
		   .o_data (o_data_rom)
		  );

////////////////////////////////////////////////////


///////////////////////ALUCON/////////////////////////

wire [3:0] o_aluControl;
 
aluControl aluControl(.i_aluOp (o_data_rom[31:30]),
				  .i_func (o_data_rom[5:0]),
				  .o_aluControl (o_aluControl)
				  );

////////////////////////////////////////////////////


///////////////////////ALU///////////////////////////

wire o_zf;
wire [DATA_WIDTH-1:0] o_result_alu;

alu alu(.i_op1 (i_op1),
		   .i_op2 (i_op2),
		   .i_control (o_aluControl),
		   .o_zf (o_zf),
		   .o_result (o_result_alu)
		   );

////////////////////////////////////////////////////


///////////////////////RAM/////////////////////////

reg [4:0] i_addr_ram;
reg i_we_ram;
wire [DATA_WIDTH-1:0] o_data_ram;

ram ram(.i_clk (i_clk),
		   .i_addr (i_addr_ram),
		   .i_data (o_result_alu),
		   .i_we (i_we_ram),
		   .o_data (o_data_ram)
		  );

////////////////////////////////////////////////////


initial begin
	i_addr_rom = 8'b0;
	i_addr_ram = 5'b0;
end

always @(posedge i_clk) begin	
		i_addr_rom = i_addr_rom + 1;
		i_addr_ram = i_addr_ram + 1;
end

initial begin
	i_we_ram = 1;
	#100 i_we_ram = 0;
end

initial begin
	i_op1 = 4;
		#150 i_op1 = 3;
end

initial begin
	i_op2 = 6;
		#150 i_op2 = 1;
end

initial begin
	i_clk = 0;
		forever #(PERIOD/2) i_clk = ~i_clk;
end

initial #230 $finish;

endmodule