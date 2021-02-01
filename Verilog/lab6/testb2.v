`timescale 1ns/10ps 

module testb2;

parameter period = 20;

reg i_clk, i_rst;
reg X1, X2;
wire [3:0] o_result;

second testb2(.i_clk (i_clk),
		  	  .i_rst (i_rst),
		  	  .X1 (X1),
		  	  .X2 (X2),
		  	  .o_result (o_result));

initial begin
	i_clk = 1'b0;
		forever #(period/2) i_clk = ~i_clk;
end

initial begin
	i_rst = 0;
		#5 i_rst = 1;
end

initial begin
	X1 = 0;
	X2 = 1;
	#140 X1 = 1;
	#130 X2 = 0;
	#120  X2 = 1;

end

initial #450 $finish;

endmodule 
