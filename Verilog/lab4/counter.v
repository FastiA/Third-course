`timescale 1ns/10ps 

module counter(
	input i_clk,
	input i_rst_n,
	input i_load,
	input [3:0] i_data,
	output reg [3:0] o_counter
);

always @( posedge i_clk, negedge i_rst_n) begin

	if (~i_rst_n) begin
		o_counter <= 0;
	end else begin
		if (i_load)
			o_counter <= i_data;

		else begin
			if(o_counter == 4'b1001) 
				o_counter <= 0;
			else
				o_counter <= o_counter + 1'b1;
		end
	end
end
endmodule
