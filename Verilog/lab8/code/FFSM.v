module FFSM(
    input i_clk, 
    input i_Run, 
    input i_Resetn, 
    input [15:0] i_Din, 
    output o_Done, 
    output [15:0]bus_w
);
  
wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, Ain, Gin;
wire R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, Gout, DINout;
wire AddSub;
reg [8:0] IR;
wire IRin;

wire [15:0] mul_in [8:0];
reg  [9:0]  mul_addr;
reg  [15:0] bus;


reg [15:0] alu;
wire [15:0] alu_w;
wire [15:0] bus_to_alu;


assign bus_w = bus;
assign bus_to_alu = bus;

register R0(clk, R0in, bus, mul_in[0]);
register R1(clk, R1in, bus, mul_in[1]);
register R2(clk, R2in, bus, mul_in[2]);
register R3(clk, R3in, bus, mul_in[3]);
register R4(clk, R4in, bus, mul_in[4]);
register R5(clk, R5in, bus, mul_in[5]);
register R6(clk, R6in, bus, mul_in[6]);
register R7(clk, R7in, bus, mul_in[7]);
register A (clk, Ain,  bus, alu_w);
register G (clk, Gin,  alu, mul_in[8]);


FSM control_unit(.i_clk(i_clk),
                .i_Run(i_Run),
                .i_Resetn(i_Resetn),
                .i_IR(IR), 
                .o_IRin(IRin),
                .o_R0in(R0in),
                .o_R1in(R1in),
                .o_R2in(R2in),
                .o_R3in(R3in),
                .o_R4in(R4in),
                .o_R5in(R5in),
                .o_R6in(R6in),
                .o_R7in(R7in),
                .o_Ain(Ain),
                .o_Gin(Gin),
                .o_R0out(R0out),
                .o_R1out(R1out),
                .o_R2out(R2out),
                .o_R3out(R3out),
                .o_R4out(R4out),
                .o_R5out(R5out),
                .o_R6out(R6out),
                .o_R7out(R7out),
                .o_Gout(Gout),
                .o_DINout(DINout),
                .o_AddSub(AddSub),
                .o_Done(o_Done)
                );
    


always @(posedge clk) begin
    
    if(~IRin != 0)
        IR <= i_Din[8:0];
end


always @(R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, Gout, DINout)
    mul_addr <= {DINout, Gout, R7out, R6out, R5out, R4out, R3out, R2out, R1out, R0out};

always @(*) begin        
        if(AddSub == 0)
           alu = (alu_w + bus_to_alu);
        else 
           alu = (alu_w - bus_to_alu);
end

always @(posedge clk, mul_addr) begin

    case (mul_addr)
        10'b00_0000_0001: bus <= mul_in[0];
        10'b00_0000_0010: bus <= mul_in[1];
        10'b00_0000_0100: bus <= mul_in[2];
        10'b00_0000_1000: bus <= mul_in[3];
        10'b00_0001_0000: bus <= mul_in[4];
        10'b00_0010_0000: bus <= mul_in[5];
        10'b00_0100_0000: bus <= mul_in[6];
        10'b00_1000_0000: bus <= mul_in[7];
        10'b01_0000_0000: bus <= mul_in[8];
        10'b10_0000_0000: bus <= i_Din;
        
    endcase
end

endmodule