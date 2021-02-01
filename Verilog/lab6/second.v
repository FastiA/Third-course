module second(
	input i_clk,  
	input i_rst,
	input X1, X2,
	output reg [3:0] o_result
);

reg [3:0] state;

parameter [3:0] Y0 = 0, Y1 = 1, Y2 = 2, Y3 = 3,
Y4 = 4, Y5 = 5, Y6 = 6, Y7 = 7, Y8 = 8, Y9 = 9;



always @(posedge i_clk or negedge i_rst) begin 

if(~i_rst) state = Y0;

else begin

		case (state)

				Y0 : state = Y1;

				Y1 : if (X1) begin 
					state = Y4;
						end else state = Y2;

				Y2 : state = Y3;

				Y3 : state = Y7;

				Y4 : state = Y5;

				Y5 : if (X2) begin 
					state = Y6;
						end else state = Y4;

				Y6 : state = Y8;	

				Y7 : state = Y8;

				Y8 : state = Y9;					

				default : state = Y0;
		endcase
	end
end 

always @(state) begin
	
	case(state)

		Y0 : begin o_result = Y0; end
		Y1 : begin o_result = Y1; end
		Y2 : begin o_result = Y2; end
		Y3 : begin o_result = Y3; end
		Y4 : begin o_result = Y4; end
		Y5 : begin o_result = Y5; end
		Y6 : begin o_result = Y6; end
		Y7 : begin o_result = Y7; end
		Y8 : begin o_result = Y8; end
		Y9 : begin o_result = Y9; end

	endcase
end

endmodule