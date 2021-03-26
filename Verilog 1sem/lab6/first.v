module first(
	input i_clk,  
	input i_rst,
	input X,
	input Y,
	output reg Z1, Z2
);

reg [2:0] state;

parameter [2:0] state_A = 0, state_B = 1, state_C = 2, state_D = 3,
state_E = 4, state_F = 5, state_G = 6, state_H  = 7;



always @(posedge i_clk or negedge i_rst) begin 

if(~i_rst) state = state_A;

else begin

		case (state)

				state_A : if (X) begin
					state = state_B;
						end else if (Y) begin
							state = state_E;
								end else state = state_A;

				state_B : if (X) begin 
					state = state_D;
						end else state = state_B;

				state_C : if (X) begin
					state = state_A;
						end else if (Y) begin
							state = state_G;
								end else state = state_C;

				state_D : if (X) begin 
					state = state_C;
						end else state = state_D; 

				state_E : state = state_F;

				state_F : state = state_B;

				state_G : state = state_H;

				state_H : state = state_B;

				default : state = state_A;
		endcase
	end
end 

always @(state) begin
	
	case(state)

		state_A : begin Z1 = 1; Z2 = 0; end
		state_B : begin Z1 = 1; Z2 = 0; end
		state_C : begin Z1 = 1; Z2 = 0; end
		state_D : begin Z1 = 0; Z2 = 0; end
		state_E : begin Z1 = 1; Z2 = 1; end
		state_F : begin Z1 = 1; Z2 = 0; end
		state_G : begin Z1 = 1; Z2 = 1; end
		state_H : begin Z1 = 1; Z2 = 1; end

	endcase
end

endmodule