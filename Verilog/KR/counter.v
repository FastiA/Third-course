module counter(
	input [7:0] i_data,
	input i_clk,
	input i_aclear,
	input i_load,
	output reg [7:0] o_counter
);

always @(posedge i_clk, negedge i_aclear) begin
	if(~i_aclear) begin
		o_counter <= 0;
	end 
	else begin if(i_load)
			o_counter <= i_data;
		else
			o_counter <= o_counter - 1'b1;
	end
end

endmodule
