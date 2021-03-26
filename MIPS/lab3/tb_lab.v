`timescale 1ns / 1ps

module tb_lab;

parameter PERIOD = 20;

reg i_clk;
reg i_rst_n_pc;

main main(.i_clk (i_clk),
		  .i_rst_n_pc (i_rst_n_pc)
		 );

initial begin 
	i_rst_n_pc = 0;
		#2 i_rst_n_pc = 1;
end

initial begin
	i_clk = 1;
		forever #(PERIOD/2) i_clk = ~i_clk;
end

initial #220 $finish;

endmodule