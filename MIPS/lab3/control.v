module control(i_instrCode, 
               o_regDst,
               o_jump, 
               o_memToReg,
               o_aluOp,
               o_memWrite,
               o_aluSrc,
               o_regWrite,
               o_extOP,
               o_beq,
               o_bne
               );

localparam BEQ = 6'b000100, JUMP = 6'b000010, SW = 6'b101011, LW = 6'b100011;
localparam ADDIU = 6'b001001;
localparam RTYPE = 6'b0; 
  
input     [5:0]  i_instrCode;
output reg            o_regDst;
output reg            o_regWrite;
output reg			  o_extOP;
output reg            o_aluSrc;
output reg			  o_beq;
output reg			  o_bne;
output reg            o_jump; 
output reg            o_memWrite;
output reg            o_memToReg;
output reg    [1:0]   o_aluOp;


 
always @(*)begin
	case (i_instrCode)

			RTYPE : begin ///OK///
				o_regDst = 1'b1;
				o_regWrite = 1'b1;
				o_extOP = 1'bx;
				o_aluSrc = 1'b0;
				o_beq = 1'b0;
				o_bne = 1'b0;
				o_jump = 1'b0;
				o_memWrite = 1'b0;
				o_memToReg = 1'b0;
				o_aluOp = 2'b10;
			end

			JUMP : begin ///OK///
				o_regDst = 1'bx;
				o_regWrite = 1'b0;
				o_extOP = 1'bx;
				o_aluSrc = 1'bx;
				o_beq = 1'b0;
				o_bne = 1'b0;
				o_jump = 1'b1;
				o_memWrite = 1'b0;
				o_memToReg = 1'bx;
				o_aluOp = 2'b11;
			end

			SW : begin ///OK///
				o_regDst = 1'bx;
				o_regWrite = 1'b0;
				o_extOP = 1'b1;
				o_aluSrc = 1'b1;
				o_beq = 1'b0;
				o_bne = 1'b0;
				o_jump = 1'b0;
				o_memWrite = 1'b1;
				o_memToReg = 1'bx;
				o_aluOp = 2'b00;
			end

			LW : begin ///OK///
				o_regDst = 1'b0;
				o_regWrite = 1'b1;
				o_extOP = 1'b1;
				o_aluSrc = 1'b1;
				o_beq = 1'b0;
				o_bne = 1'b0;
				o_jump = 1'b0;
				o_memWrite = 1'b0;
				o_memToReg = 1'b1;
				o_aluOp = 2'b00;
			end

			BEQ : begin ///OK///
				o_regDst = 1'bx;
				o_regWrite = 1'b0;
				o_extOP = 1'bx;
				o_aluSrc = 1'b0;
				o_beq = 1'b1;
				o_bne = 1'b0;
				o_jump = 1'b0;
				o_memWrite = 1'b0;
				o_memToReg = 1'bx;
				o_aluOp = 2'b01;
			end

			ADDIU : begin ///OK///
				o_regDst = 1'b0;
				o_regWrite = 1'b1;
				o_extOP = 1'b1;
				o_aluSrc = 1'b1;
				o_beq = 1'b0;
				o_bne = 1'b0;
				o_jump = 1'b0;
				o_memWrite = 1'b0;
				o_memToReg = 1'b0;
				o_aluOp = 2'b00;
			end

	endcase
end

endmodule