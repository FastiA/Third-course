; Initialize Stack Size
; Equ 400 hex (1024) bytes
Stack_Size      EQU     0x00000400

; Area STACK (NOINIT and READ/WRITE)
                AREA    STACK, NOINIT, READWRITE, ALIGN=3
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

                AREA    |.text| , CODE, READONLY

Reset_Handler   PROC

                LDR     R0, =__main
                BX      R0
                ENDP

__main      	PROC

; MOVE  immediate (constant)							
							mov		r0, #0x11
							mov		r1, #2560
							mvn		r2, #4
							movw	r3, #0xCODE
							movt	r3, #0xfeed
							mov		r4,	r1
							mov	r5, #'A'

; Eguval 
X		EQU 0x11
Y		EQU 2560
LowW	EQU	0xc0de
Higt	EQU	0xFEED
				
; Move immediate 
							mov 	r6, #X
							mov 	r7, #Y
							movW	r8,	#LowW
							movT	r9, #Higt
							

__mainloop
            
				; place you application code here
			
		B __mainloop
		ENDP
					
		END
