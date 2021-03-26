; Initialize Stack Size
; Equ 400 hex (1024) bytes
Stack_Size      EQU     0x00000400

; Area STACK (NOINIT and READ/WRITE)
                AREA    STACK, NOINIT, READWRITE, ALIGN=4
; Initialize memory equals Stack_Size
Stack_Mem       SPACE   Stack_Size
__initial_sp

; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  Reset_Handler             [WEAK]
__Vectors
                DCD     __initial_sp             ; Top of Stack
                DCD     Reset_Handler            ; Reset Handler
__Vectors_End


				AREA    MYDATA, DATA, READONLY
			 ALIGN  4
X			 EQU		0x053	
Y			 EQU		0x034
Z			 EQU		0x005

A__			 DCD 		0x055
B__			 DCD		0x030
C__			 DCD		0x021
D__			 DCD		0x0E0
	
	
                AREA    MYRESULT, DATA, READWRITE
			 ALIGN  4
QA   		 DCD    0
QL			 DCD    0


			    AREA    MYCODE, CODE, READONLY

Reset_Handler   PROC
		LDR R0, =_main
		BX  R0
		ENDP

_main   PROC

             MOV	R1, #X
			 MOV 	R2, #Y
			 MOV 	R3, #Z
			 
			 LDR		R0, =A__
			 LDR 	R6, [R0]
			 LDR		R0, =B__
			 LDR 	R7, [R0]
			 LDR		R0, =C__
			 LDR 	R8, [R0]
			 LDR		R0, =D__
			 LDR 	R9, [R0]
			 
; Arithmetical calculations (X + Z – Y) + X – Y + Z = Q  

			 add r4, r1, r3		; r4 = r1+r3 = X + Z
			 sub r4, r4, r2    	; r4 = r4-r2 = (X + Z) - Y
		     sub r5, r1, r2    	; r5 = r1-r2 = X - Y
		     add r5, r5, r3    	; r5 = r5+r3 = (X - Y) + Z  
			 add r5, r4, r5    	; r5 = r4+r5 = (X + Z – Y) + X – Y + Z

; Logical calculations  Q = ((A and C) or (B and D) xor 0x13) and !(A xor B)

			 and r10, r6, r8		; r10 = r6 and r8 = A and C 
			 and r11, r7, r9    	; r11 = r7 and r9 = B and D
			 orr r12, r10, r11    	; r12 = r10 or r11 = (A and C) or (B and D)
			 eor r12, r12, #0x13  	; r12 = r12 xor #0x13 = ((A and C) or (B and D) xor 0x13)
			 eor r10, r6, r7   		; r10 = r6 xor r7 = A xor B
			 mvn r10, r10	    	; r10 = !r10 = !(A xor B)
			 and r12, r12, r10		; r12 = r12 and r10 = ((A and C) or (B and D) xor 0x13) and !(A xor B)
			
;Save results
			 LDR		R0, =QA
			 STR		R5, [R0]
			 LDR		R0, =QL
			 STR		R12, [R0]
__inf_cycle
			 B  __inf_cycle
			 ENDP
END
