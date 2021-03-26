`timescale 1ns / 1ps

module regFile_tb;

parameter PERIOD = 20;

reg i_clk, i_we;
reg [31:0] i_wdata;
reg [4:0] i_raddr1, i_raddr2, i_waddr;
wire [31:0] o_rdata1, o_rdata2;
integer i, j;

regFile regFile_tb(.i_clk   (i_clk),
			  .i_raddr1(i_raddr1),
			  .i_raddr2(i_raddr2),
			  .i_waddr (i_waddr),
			  .i_wdata (i_wdata),
			  .i_we    (i_we),
			  .o_rdata1(o_rdata1),
			  .o_rdata2(o_rdata2)
			  );

initial begin
	i_clk = 0;
		forever #(PERIOD/2) i_clk = ~i_clk;
end


initial begin
	i_raddr1 = 0;
	for (i = 0; i < 17; i = i + 1) begin
		#10 i_raddr1 = i;
	end
		#30 i_raddr1 = 12;
			#20 i_raddr1 = 6;
end

initial begin
	i_raddr2 = 0;
	for (j = 4; j < 32; j = j + 1) begin
		#10 i_raddr2 = j;
	end
end


initial begin
	i_we        = 0;
		i_wdata     = 0;
			#200 i_we   = 1;
			#5 i_wdata  = 32'h48;
			#20 i_wdata = 32'h6c;
			#30 i_wdata = 32'h2d8;
end

initial begin
	i_waddr = 0;
		#200 i_waddr = 12;
		#10 i_waddr  = 6;
		#30 i_waddr  = 3;
end

initial #600 $finish;

endmodule