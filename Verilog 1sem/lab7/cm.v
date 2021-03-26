module CM(i_re_a, i_im_a, i_re_b, i_im_b, re_r, im_r, mode);

parameter [1:0] sum = 0, sub = 1, mul = 2, div = 3;

input [15:0] i_re_a,i_im_a,i_re_b,i_im_b;
input [1:0] mode;
output reg[31:0] re_r, im_r;


always @(*) begin

    case(mode)
        sum: begin
                    re_r = i_re_a + i_re_b;
                    im_r = i_im_a + i_im_b;
        end
        
        sub: begin 
                    re_r = i_re_a - i_re_b;
                    im_r = i_im_a - i_im_b;
        end  
        
        mul: begin 
                    re_r = (i_re_a * i_re_b) - (i_im_a * i_im_b);
                    im_r = (i_re_b * i_im_a) + (i_re_a * i_im_b);
        end    
        
        div: begin
                    re_r = ((i_re_a * i_re_b) + (i_im_a * i_im_b)) / ((i_re_b * i_re_b) + (i_im_b * i_im_b));
                    im_r = ((i_im_a * i_re_b) - (i_im_b * i_re_a)) / ((i_re_b * i_re_b) + (i_im_b * i_im_b));
        end
        
    endcase     

end

endmodule