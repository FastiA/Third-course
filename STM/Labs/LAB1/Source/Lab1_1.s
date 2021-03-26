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
; X = 20h,	Y = 05h,	Z= 04h|
X		EQU 0x20
Y		EQU 0x05
Z		EQU	0x04

; Define Constant Data in Code Area
X__		DCD 0x20
Y__		DCD 0x05
Z__		DCD	0x04

__main      	PROC
; place you initialization code here
; load immediate data							
							mov	r0, #0x20
							mov	r1, #0x05
							mov	r2, #0x04
							mov	r4, #'A'
; load immediate (synonym Constant)
							mov r5, #X
							mov r6, #Y
							mov	r7,	#Z
; load Constant of code memory
							ldr r4,  =X__
							ldr	r0,[r4]			; r0 = X
							ldr r4,  =Y__
							ldr	r1,[r4]         ; r1 = Y
							ldr r4, =Z__
							ldr	r2,[r4]         ; r2 = Z
__mainloop
            
				; place you application code here
			
		B __mainloop
		ENDP
		align			
		END
