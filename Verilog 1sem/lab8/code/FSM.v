module FSM(
    input i_clk, 
    input i_Run, 
    input i_Resetn, 
    input [8:0] i_IR, 
    output o_R0in, o_R1in, o_R2in, o_R3in, o_R4in, o_R5in, o_R6in, o_R7in, 
    output o_R0out, o_R1out, o_R2out, o_R3out, o_R4out, o_R5out, o_R6out, o_R7out,
    output o_AddSub,
    output reg o_IRin, o_Ain, o_Gin, o_Gout, o_DINout, o_Done
);

parameter [2:0]  clean = 0, load_command = 1, move = 2, movei = 3, load_to_a = 4, load_to_g = 5, done = 6; 
parameter [2:0]  mv = 0, mvi = 1, add = 2, sub = 3; 


reg [7:0] mul_pick; 
reg [7:0] reg_pick;

reg  [2:0] c_state;
reg  [2:0] n_state;

reg [2:0] command;
reg [2:0] operant1, operant2;

wire [7:0] op1_dec_out;    
wire [7:0] op2_dec_out;
decoder op1_dec(operant1, op1_dec_out);
decoder op2_dec(operant2, op2_dec_out);


assign o_R0in   =  reg_pick[0];
assign o_R1in   =  reg_pick[1];
assign o_R2in   =  reg_pick[2];
assign o_R3in   =  reg_pick[3];
assign o_R4in   =  reg_pick[4];
assign o_R5in   =  reg_pick[5];
assign o_R6in   =  reg_pick[6];
assign o_R7in   =  reg_pick[7];

assign o_R0out  =  mul_pick[0];
assign o_R1out  =  mul_pick[1];
assign o_R2out  =  mul_pick[2];
assign o_R3out  =  mul_pick[3];
assign o_R4out  =  mul_pick[4];
assign o_R5out  =  mul_pick[5];
assign o_R6out  =  mul_pick[6];
assign o_R7out  =  mul_pick[7];

assign o_AddSub = command[1] & command[0];   

always @(posedge i_clk, negedge i_Resetn) begin

    if(~i_Resetn) begin
        c_state <= clean;
        n_state <= clean;
        o_Done <= 1'b0;
        o_IRin <= 1'b0;

    end else
        c_state <= n_state;
end



always @(*) begin
     case (c_state)

        clean : begin
                o_Done <= 1'b0;
                o_DINout <= 1'b0;
                o_Gout <= 1'b0;
                o_Gin <= 1'b0;
                o_Ain <= 1'b0;
                mul_pick <= 8'b0000_0000;
                reg_pick <= 8'b0000_0000;  
            
            if(i_Run)
                n_state <= load_command;
        end
        
        load_command : begin
            command = i_IR[8:6];
            operant1 = i_IR[5:3];
            operant2 = i_IR[2:0];
            o_IRin  = 1'b0;

            case (command)
                mv:  n_state <= move;
                mvi: n_state <= movei;
                add: n_state <= load_to_a;
                sub: n_state <= load_to_a;
                default: n_state <= clean;
            endcase
        end

        move: begin
                reg_pick <= op1_dec_out;     
                mul_pick <= op2_dec_out;     
                o_Done <= 1'b1;
                n_state <= clean;
        end

        movei: begin
                o_DINout <= 1'b1;
                reg_pick <= op1_dec_out;    
                o_Done <= 1'b1;
                n_state <= clean;
        end

        load_to_a: begin
                o_Ain <= 1'b1;
                mul_pick <= op1_dec_out;     
                n_state <= load_to_g;
        end

        
        load_to_g: begin
                o_Ain <= 1'b0;
                mul_pick <= op2_dec_out;    
                o_Gin <= 1'b1;                     
                n_state <= done;
        end

        done: begin
                o_Gin <= 1'b0;
                o_Gout <= 1'b1;
                mul_pick <= 8'b0000_0000;
                reg_pick <= op1_dec_out;
                o_Done <= 1'b1;
                n_state <= clean;
        end

    endcase
end


endmodule