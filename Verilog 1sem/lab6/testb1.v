`timescale 1ns/10ps 

module testb1;

parameter period = 20;

reg i_clk, i_rst;
reg X, Y;
wire Z1, Z2;

first testb1(.i_clk (i_clk),
		  	 .i_rst (i_rst),
		  	 .X (X),
		  	 .Y (Y),
		  	 .Z1 (Z1),
		  	 .Z2 (Z2));

initial begin
	i_clk = 1'b0;
		forever #(period/2) i_clk = ~i_clk;
end

initial begin
	i_rst = 0;
		#5 i_rst = 1;
end

initial begin
	X = 0;
	Y = 1;
	
	#50 X = 1;
	#30 X = 0;
	#50 X = 1;
	#20 X = 0;
	#40 X = 1;

end

initial #300 $finish;

endmodule 
