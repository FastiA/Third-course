`timescale 1ns/10ps 

module test;

parameter delay = 5;

reg i_clk;
reg [7:0] data_a;
reg [7:0] data_b;
reg i_rst;

initial begin
	i_clk = 1'b1;	
end

always begin
	#9 i_clk = 1'b0;
	#1 i_clk = 1'b1;
end

initial begin 
	data_a = 8'd1;
	data_b = 8'd200;
end

always begin
	#10 data_a = data_a + 8'd33;
end

always begin
	#20 data_b = data_b >> 1;
end

initial begin 
	i_rst = 1'b1;
	#10 i_rst = 1'b0;
end

initial #100 $finish;

endmodule 
