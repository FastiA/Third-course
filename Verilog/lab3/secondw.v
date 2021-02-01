module secondw(
		input [3:0] Q, 
		output reg [15:0]X,
		output reg a, b, c, d, e, f, g);
 
always @(Q[3:0]) begin

X[0] = ~Q[3] & ~Q[2] & ~Q[1] & ~Q[0];//0
X[1] = ~Q[3] & ~Q[2] & ~Q[1] & Q[0];//1
X[2] = ~Q[3] & ~Q[2] & Q[1] & ~Q[0];//2
X[3] = ~Q[3] & ~Q[2] & Q[1] & Q[0];//3
X[4] = ~Q[3] & Q[2] & ~Q[1] & ~Q[0];//4
X[5] = ~Q[3] & Q[2] & ~Q[1] & Q[0];//5
X[6] = ~Q[3] & Q[2] & Q[1] & ~Q[0];//6
X[7] = ~Q[3] & Q[2] & Q[1] & Q[0];//7
X[8] = Q[3] & ~Q[2] & ~Q[1] & ~Q[0];//8
X[9] = Q[3] & ~Q[2] & ~Q[1] & Q[0];//9
X[10] = Q[3] & ~Q[2] & Q[1] & ~Q[0];//A
X[11] = Q[3] & ~Q[2] & Q[1] & Q[0];//B
X[12] = Q[3] & Q[2] & ~Q[1] & ~Q[0];//C
X[13] = Q[3] & Q[2] & ~Q[1] & Q[0];//D
X[14] = Q[3] & Q[2] & Q[1] & ~Q[0];//E
X[15] = Q[3] & Q[2] & Q[1] & Q[0];//F

{a, b, c, d, e, f, g} <= 7'b1111111;

	if(X[0])begin
		{a, b, c, d, e, f} <=6'b0;
	end

	if(X[1])begin
		{a, b} <=2'b0;
	end

	if(X[2])begin
		{a, b, d, e, g} <=5'b0;
	end

	if(X[3])begin
		{a, b, c, d, g} <=5'b0;
	end

	if(X[4])begin
		{b, c, f, g} <=4'b0;
	end

	if(X[5])begin
		{a, c, d, f, g} <=5'b0;
	end

	if(X[6])begin
		{a, c, d, e, f, g} <=6'b0;
	end

	if(X[7])begin
		{a, b, c} <=3'b0;
	end

	if(X[8])begin
		{a, b, c, d, e, f, g} <=7'b0;
	end

	if(X[9])begin
		{a, b, c, d, f, g} <=6'b0;
	end

	if(X[10])begin
		{a, b, c, e, f, g} <=6'b0;
	end

	if(X[11])begin
		{c, d, e, f, g} <=5'b0;
	end	

	if(X[12])begin
		{a, d, e, f} <=4'b0;
	end

	if(X[13])begin
		{b, c, d, e, g} <=5'b0;
	end

	if(X[14])begin
		{a, d, e, f, g} <=5'b0;
	end

	if(X[15])begin
		{a, e, f, g} <=4'b0;
	end
end

endmodule

