module decoder(
    input [2:0] i_code,
    output reg [7:0] o_data
);

always @(*)
    case (i_code)
        000: o_data = 8'b0000_0001;
        001: o_data = 8'b0000_0010;
        010: o_data = 8'b0000_0100;
        011: o_data = 8'b0000_1000;
        100: o_data = 8'b0001_0000;
        101: o_data = 8'b0010_0000;
        110: o_data = 8'b0100_0000;
        111: o_data = 8'b1000_0000;
    endcase

endmodule