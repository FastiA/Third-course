module signExtend(i_data, en, o_data);

parameter DATA_WIDTH = 32;

input   [15:0]  i_data;
input	en;
output  [DATA_WIDTH-1:0]  o_data;

assign o_data = en ? {{16{i_data[15]}}, i_data} : {16'b0, i_data};

endmodule