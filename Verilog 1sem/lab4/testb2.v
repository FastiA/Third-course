`timescale 1ns/10ps 

module testb2;

parameter period = 20;

reg i_clk, i_load, i_rst_n;
reg [3:0] i_data;
wire [3:0] o_counter;


counter testb2(.i_clk (i_clk),
			.i_load (i_load),
			.i_rst_n (i_rst_n),
			.i_data (i_data),
			.o_counter (o_counter));

initial begin
	i_clk = 1'b0;
		forever #(period/2) i_clk = ~i_clk;
end

initial begin
	#0 i_load <= 1'b0;
		#60 i_load <= 1'b1;
			#100 i_load <= 1'b0;
end

initial begin
	#0 i_rst_n <= 1'b0;
		#20 i_rst_n <= 1'b1;
end

initial i_data = 4'b1001;

initial #500 $finish;


endmodule

