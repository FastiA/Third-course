`timescale 1ns/10ps 

module testb1;

parameter period = 20;

reg [7:0] i_data;
reg i_clk;
reg i_aclear;
reg i_load;
wire [7:0] o_counter;

counter testb1(.i_clk (i_clk),
		  	 .i_aclear (i_aclear),
		  	 .i_load (i_load),
		  	 .i_data (i_data),
		  	 .o_counter (o_counter));

initial begin
	i_clk = 1'b0;
		forever #(period/2) i_clk = ~i_clk;
end

initial begin
	i_aclear = 0;
		#5 i_aclear = 1;
			#535 i_aclear = 0;
				#10 i_aclear = 1;
end

initial begin
	i_data = 8'd20;
end

initial begin
	i_load = 0;
		#50 i_load = 1;
			#5 i_load = 0;
end

initial #1000 $finish;

endmodule 
