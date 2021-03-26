module MFFSM(
	input i_Mclk, 
	input i_Pclk, 
	input i_Resetn, 
	input i_Run, 
	output o_Done, 
	output [15:0] o_Bus, 
	output reg [4:0] o_counter
);

reg Run_R;
wire [15:0] Din;

rom  memory(i_Mclk, o_counter, Din);
FFSM ffsm(i_Pclk, Run_R, i_Resetn ,Din ,o_Done, o_Bus);

always @(posedge i_Mclk, negedge i_Resetn) begin
    if(~i_Resetn)
        o_counter <= 4'b0000;
end

always @(negedge Run_R, negedge o_Done) begin
        o_counter <= o_counter + 1'b1;
end


always @(posedge i_Pclk) begin

    if(~Run_R)
        Run_R <= i_Run | o_Done;
    else
        Run_R <= 0;
end

endmodule