`timescale 1ns/10ps 

module signExtend_tb;

parameter WIDTH = 32;
localparam HWIDTH = WIDTH/2;
 
reg [HWIDTH-1:0] i_data;
reg en;
wire [WIDTH-1:0] o_data;

signExtend signExtend_tb (.i_data (i_data),
			  .en (en),
			  .o_data (o_data));
initial begin
	en = 0;
		#60 en = 1;
end

initial begin
	i_data = 0;
		forever #10 i_data = $urandom % 70000 ;
end

initial #200 $finish;

endmodule