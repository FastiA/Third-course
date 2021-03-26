	AREA	FUNCTION, CODE, READONLY
    EXPORT add_mul
        
add_mul PROC

    PUSH {r4, r5, r6}
	
	MOV r4, #0
	MOV r5, #0
	MOV r6, #0
	
	SUB r2, #2
	MOV r5, r0
	ADD r5, #4

loop
	LDR	r3, [r0]
	ADD r0, #8
	LDR r4, [r0]
	ADD r3, r3, r4
	STR r3, [r1]
	ADD	r1, #4
	ADD r6, #1
	
	LDR r3, [r5]
	ADD r5, #8
	LDR r4, [r5]
	MUL r3, r3, r4
	STR r3, [r1]
	ADD	r1, #4
	ADD r6, #1
	CMP r2, r6

	BNE	loop
	POP {r4, r5, r6}
	BX	lr
    
    ENDP

	END