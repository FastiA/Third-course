`timescale 1ns/10ps 

module testb;

parameter period = 20;

reg i_clk;
reg [15:0] i_a1, i_b1, i_a2, i_b2;
reg [1:0] mode;
reg main_mode;
wire [31:0] o_r1, o_r2;

main testb  (.i_clk (i_clk),
		  	 .i_a1 (i_a1),
		  	 .i_a2 (i_a2),
		  	 .i_b1 (i_b1),
		  	 .i_b2 (i_b2),
		  	 .mode (mode),
		  	 .main_mode(main_mode),
		  	 .o_r1(o_r1), 
		  	 .o_r2(o_r2));

initial begin
	i_clk = 1'b0;
		forever #(period/2) i_clk = ~i_clk;
end


initial begin
	main_mode = 0;
	#100 main_mode = 1;
end 

initial begin
	mode = 0;
	#35 mode = 2;
	#20 mode = 1; 
	#20 mode = 3;
	#30 mode = 0;
	#20 mode = 1;
	#20 mode = 2;
	#20 mode = 3;
end

initial begin 
	i_a1 = 16'd 25;
	i_a2 = 16'd 10;
	i_b1 = 16'd 4;
	i_b2 = 16'd 3;
end

initial #200 $finish;

endmodule 
