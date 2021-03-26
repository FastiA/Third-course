module main(
input i_clk,
input [15:0] i_a1, i_b1, i_a2, i_b2,
input [1:0] mode,
input main_mode,
output reg [31:0] o_r1, o_r2
);

wire [31:0] u_r1, u_r2, c_r1, c_r2;

UM UM1(.i_a1(i_a1), .i_a2(i_a2), .i_b1(i_b1), .i_b2(i_b2), .u_r1(u_r1), .u_r2(u_r2), .mode(mode));
CM CM1(.i_re_a(i_a1), .i_im_a(i_a2), .i_re_b(i_b1), .i_im_b(i_b2), .re_r(c_r1), .im_r(c_r2), .mode(mode));

always @(posedge i_clk) begin
    if(main_mode)begin
            o_r1 = c_r1;
                o_r2 = c_r2;
    end else begin
            o_r1 = u_r1;
                o_r2 = u_r2;
    end
end
endmodule