module rom(
	input i_clk, 
	input [4:0]i_addr, 
	output reg [15:0] o_data
);

reg [15:0] memory[0:23];

initial begin
    $readmemb("m_data.txt", memory);
end

always @(posedge i_clk) begin
    o_data <= memory[i_addr];
end

endmodule