module register(
	input i_clk, 
	input i_we, 
	input [15:0] i_data, 
	output reg [15:0] o_data
);

always @(posedge i_clk) begin
    if(i_we)
        o_data <= i_data;
end

endmodule