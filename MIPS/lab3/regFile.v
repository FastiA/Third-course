module regFile(i_clk, 
               i_raddr1, 
               i_raddr2, 
               i_waddr, 
               i_wdata, 
               i_we,
               o_rdata1,
               o_rdata2 
               );
               
parameter DATA_WIDTH = 32;

input           i_clk, i_we;
input   [4:0]   i_raddr1, i_raddr2, i_waddr;
input   [DATA_WIDTH-1:0]  i_wdata;           
output  [DATA_WIDTH-1:0]  o_rdata1, o_rdata2;

reg [DATA_WIDTH-1:0] reg_file [DATA_WIDTH-1:0];

initial $readmemh("reg_init.hex", reg_file);

assign o_rdata1 = (i_raddr1 != 0) ? reg_file[i_raddr1] : 0;
assign o_rdata2 = (i_raddr2 != 0) ? reg_file[i_raddr2] : 0;


always @(posedge i_clk) begin 
	if(i_we) reg_file[i_waddr] <= i_wdata;
end

  
endmodule
