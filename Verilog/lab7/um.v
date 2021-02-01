module UM(i_a1, i_a2, i_b1, i_b2, u_r1, u_r2, mode);

parameter [1:0] sum = 0, sub = 1, mul = 2, div = 3;

input [15:0] i_a1,i_a2,i_b1,i_b2;
input [1:0] mode;
output reg[31:0] u_r1, u_r2;


always @(*) begin

    case(mode)
        sum: begin
                    u_r1 = i_a1 + i_b1;
                    u_r2 = i_a2 + i_b2;
        end
        
        sub: begin
                    u_r1 = i_a1 - i_b1;
                    u_r2 = i_a2 - i_b2;
        end  
        
        mul: begin
                    u_r1 = i_a1 * i_b1;
                    u_r2 = i_a2 * i_b2;
        end    
        
        div: begin
                    u_r1 = i_a1 / i_b1;
                    u_r2 = i_a2 / i_b2;
        end
        
    endcase     

end

endmodule