module ram(i_clk, i_addr, i_data, i_we, o_data);

parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 5;

input                     i_clk, i_we;
input   [ADDR_WIDTH-1:0]  i_addr;
input   [DATA_WIDTH-1:0]  i_data;
output  [DATA_WIDTH-1:0]  o_data;

reg [DATA_WIDTH-1:0] mem [(1<<ADDR_WIDTH)-1:0];

initial $readmemh("ram_init.hex", mem);

assign o_data = mem[i_addr];

always @(posedge i_clk)begin
	if(i_we) mem[i_addr] <= i_data;
end
  
endmodule