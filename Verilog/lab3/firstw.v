module firstw(
		input [2:0] A, 
		input EN, 
		input D, 
		output reg[7:0] Q);

always @(EN or A[2:0]) begin  

if(~EN) begin

	case({A[2], A[1], A[0]})
		3'b000 :  begin 
		Q[0] <= D; Q[7:1] = 1'b0;
		end
		3'b001 :  begin
		Q[1] <= D; {Q[7:2],Q[0]} = 1'b0;
	    end
		3'b010 :  begin
		Q[2] <= D; {Q[7:3],Q[1:0]} = 1'b0;
		end
		3'b011 :  begin
		Q[3] <= D; {Q[7:4],Q[2:0]} = 1'b0;
	    	end
		3'b100 :  begin
		Q[4] <= D; {Q[7:5],Q[3:0]} = 1'b0;
	    end
		3'b101 :  begin
		Q[5] <= D; {Q[7:6],Q[4:0]} = 1'b0;
		end
		3'b110 :  begin
		Q[6] <= D; {Q[7],Q[5:0]} = 1'b0;
		end
		3'b111 :  begin
		Q[7] <= D; Q[6:0] = 1'b0;
		end
	
	endcase
end
	else begin
		Q[7:0] = 8'bz;
	end

end
endmodule
