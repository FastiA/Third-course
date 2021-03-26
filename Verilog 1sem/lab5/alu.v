module alu ( 
	input [7:0] i_a,
	input [7:0] i_b,
	input [1:0] i_addr,
	output reg [15:0] o_result

);

always @(i_addr) begin
	case ({i_addr[1], i_addr[0]})
		2'b00 : begin
			$display("Add operation, input values a:%d, b:%d", i_a, i_b); 
				o_result = sum (i_a, i_b);
					$display("Result: %d", o_result);
					$display("----------------------------------"); 
		end
		2'b01 : begin
			$display("Multiplication operation, input values a:%d, b:%d", i_a, i_b); 
				o_result = mul (i_a, i_b);
					$display("Result: %d", o_result);
					$display("----------------------------------"); 
		end
		2'b10 : begin 
			$display("Lowering operation, input value a:%d", i_a); 
				o_result = red (i_a);
					$display("Result: %d", o_result);
					$display("----------------------------------"); 
		end
		2'b11 : begin
			$display("Input value b:%d", i_b);
				o_result = viev (i_b);
					$display("Result: %d", o_result);
					$display("----------------------------------");
		end
		default : $display("Wrong value");

	endcase
end

function [8:0] sum;
	input [7:0] i_a, i_b;

		begin
			sum = i_a + i_b;
		end

endfunction

function [15:0] mul;
	input [7:0] i_a, i_b;

		begin
			mul = i_a * i_b;
		end
		
endfunction

function [7:0] red;
	input [7:0] i_a;

		begin
			red = i_a - 1;
		end
		
endfunction


function [8:0] viev;
	input [7:0] i_b;

		begin
			viev = i_b;
		end
		
endfunction
	

endmodule
