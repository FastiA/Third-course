module shiftLeftBy2(i_data, o_data);

parameter DATA_WIDTH = 32;

input   [DATA_WIDTH-1:0]   i_data;
output  [DATA_WIDTH-1:0]   o_data;
  
assign o_data = i_data << 2;

endmodule