`timescale 1ns/10ps 

module testb1;

parameter period = 20;
parameter change = 9;

reg i_clk, i_rst_n, i_we, i_prn;
wire [7:0] o_data;
reg [7:0] i_data;

reg8 testb1(.i_clk (i_clk),
			.i_we (i_we),
			.i_rst_n (i_rst_n),
			.i_data (i_data),
			.i_prn (i_prn),
			.o_data (o_data));

initial begin
	 i_data = 8'b0;
		forever #(change) i_data[7:0] = i_data[7:0] + ($random % 128);
end

initial begin
	i_clk = 1'b0;
		forever #(period/2) i_clk = ~i_clk;
end

initial begin
	i_rst_n = 1'b0;
		#50 i_rst_n = 1'b1;
end

initial begin
	i_prn = 1'b1;
		#370 i_prn = 1'b0;
			#30 i_prn = 1'b1;
end

initial begin
	i_we = 1'b1;
		#150 i_we = 1'b0;
			#50 i_we = 1'b1;
end

initial #600 $finish;

endmodule