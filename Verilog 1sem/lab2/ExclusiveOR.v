module ExclusiveOR (
input i_clk,
input i_rst,
input x2,
input x1,
output reg f);


always @(posedge i_clk or negedge i_rst) begin
f = (x1 & ~ x2) | (~ x1 & x2);
end

endmodule
