`timescale 1ns/10ps 

module pc_tb;

parameter WIDTH = 32;
parameter PERIOD = 20;

reg i_clk, i_rst_n; 
reg [WIDTH-1:0] i_pc;
wire [WIDTH-1:0] o_pc;

pc pc_tb(.i_clk (i_clk),
	.i_rst_n (i_rst_n),
	.i_pc (i_pc),
	.o_pc (o_pc));

initial begin
	i_clk = 0;
		forever #(PERIOD/2) i_clk = ~i_clk;
end

initial begin
	i_rst_n = 0;
		#30 i_rst_n = 1;
end

initial begin
	i_pc = 0;
		forever #10 i_pc = $urandom % 20;
end

initial #200 $finish;

endmodule