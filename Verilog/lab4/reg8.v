module reg8 (
	input 		     i_clk,    
	input 		     i_we,
	input 		     i_rst_n,
	input			 i_prn,
	input      [7:0] i_data,
	output reg [7:0] o_data  
	
);

always @(posedge i_clk) begin 
	
	if(~i_rst_n) o_data <= 8'b0;

 	else if(~i_prn) begin
		 	o_data <= 8'b11111111;

	end else begin
		if(i_we)
			o_data <= i_data;
		end
end

endmodule