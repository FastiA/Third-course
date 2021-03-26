	AREA	FUNCTION, CODE, READONLY
    EXPORT u_add
        
u_add PROC
	
    PUSH {r4, r5, r6}
	
	MOV r4, #0
	MOV r5, #0
	MOV r6, #0
	
add_loop
	LDR r3, [r0]
	ADDS r4, r3
	ADC r5, #0
	ADD r0, #4
	ADD r6, #1
	CMP r6, r1
	BNE add_loop

	MOV r0, r4
	MOV r1, r5
	
    POP {r4, r5, r6}
	BX	lr
    
    ENDP

	END