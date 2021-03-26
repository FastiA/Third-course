module pc(i_clk, i_rst_n, i_pc, o_pc);

parameter DATA_WIDTH = 32;

input               i_clk, i_rst_n;
input       [DATA_WIDTH-1:0]  i_pc;
output  reg [DATA_WIDTH-1:0]  o_pc;


always @(posedge i_clk or negedge i_rst_n)begin
	if(~i_rst_n) o_pc <= 0;
	else o_pc <= i_pc;
end	
   
endmodule


