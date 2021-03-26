`timescale 1ns/10ps 

module mux2in1_tb;

parameter WIDTH = 32;

reg i_control; 
reg [WIDTH-1:0] i_dat0, i_dat1;
wire [WIDTH-1:0] o_dat;

mux2in1 mux2in1_tb(.i_control (i_control),
			.i_dat0 (i_dat0),
			.i_dat1 (i_dat1),
			.o_dat (o_dat));

initial begin
	i_control = 0;
		#40 i_control = 1;
end

initial begin
	i_dat0 = 0;
		forever #10 i_dat0 = $urandom % 20;
end

initial begin
	i_dat1 = 0;
		forever #10 i_dat1 = $urandom % 20;
end

initial #200 $finish;

endmodule