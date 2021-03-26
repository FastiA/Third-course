`timescale 1ns/10ps 

module testb;

reg [7:0] i_a;
reg [7:0] i_b;
reg [1:0] i_addr;
wire [15:0] o_result;


alu testb(.i_a (i_a),
		  .i_b (i_b),
		  .i_addr (i_addr),
		  .o_result (o_result));

initial begin 
	i_a = 255;
	forever #15 i_a = $urandom%255;
end

initial begin
	i_b = 255;
	forever #15 i_b = $urandom%255;
end

initial begin
	i_addr = 1;

	forever begin
		#5 i_addr = 0;
		#5 i_addr = 1;
		#5 i_addr = 2;
		#5 i_addr = 3;
	end
end

initial #200 $finish;

endmodule 
