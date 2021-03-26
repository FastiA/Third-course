
__asm int my_counter(const char *src, int i)
{
load_loop
	LDRB	r2, [r0]
	ADD		r0, #1
	CMP		r2, #0
	BNE		add_i
	SUB		r1, #1
	MOV		r0, r1
	BX		lr			
add_i
	ADD		r1, #1
	B		load_loop
}

__asm void my_replace(const char *src, char *dst, int i)
{
	MOV		r3, r0
	SUB		r3, #1
	ADD 	r0, r2
replace_loop
	LDRB	r2, [r0]
	STRB	r2, [r1]
	ADD		r1, #1
	SUB		r0, #1
	CMP		r0,	r3
	BNE		replace_loop
	BX		lr
}

int main(void)
{
	const char a[] = "Good day";
	char b[20];
	int i = 0; 
		i = my_counter(a, i);
		my_replace(a, b, i);
	
		while (1);
}
