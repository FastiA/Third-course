module logic_element1(SW, LEDR);

input   [7:0]   SW;
output          LEDR;

wire    			 y;
wire    [7:0]   x;

assign LEDR = y;
assign x = SW;

assign y = ~((x[0] ^ x[4]) | (x[1] ^ x[5]) |(x[2] ^ x[6]) | (x[3] ^ x[7]));


endmodule
