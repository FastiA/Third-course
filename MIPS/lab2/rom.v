module rom(i_addr, o_data);

parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 8;

input [ADDR_WIDTH-1:0] i_addr;
output [DATA_WIDTH-1:0] o_data;

reg [DATA_WIDTH-1:0] rom [(1<<ADDR_WIDTH)-1:0];

initial $readmemh("rom_init.hex", rom);

assign o_data = rom[i_addr];

endmodule

