module work1(F, D, A, B, C);

	input A, B, C;
	output F, D;
	
	assign F = (A|~A)&B|B&A&~C|C&(A|~B)&(~A|B);
	assign D = ~A&C|B;

endmodule
