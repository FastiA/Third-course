`timescale 1ns/10ps 

module shiftLeftBy2_tb;

parameter WIDTH = 32;

reg [WIDTH-1:0] i_data;
wire [WIDTH-1:0] o_data;

shiftLeftBy2 shiftLeftBy2_tb(.i_data (i_data),
			.o_data (o_data));

initial begin
	i_data = 0;
		forever #10 i_data = $urandom % 20;
end


initial #100 $finish;

endmodule