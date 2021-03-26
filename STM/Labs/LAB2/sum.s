	AREA  FUNC, CODE, READONLY
    EXPORT sum
        
sum PROC
  
    push {LR, r4, r5}
  
  CMP r1, #20
  
  mov r4, #0
  mov r5, #0
  mov r6, #0
  
loop
  LDR r3, [r0]
  ADDS r4, r4, r3
  ADCS r5, #0
  ADD r0, r0, #4
  ADD r6, r6, #1
  CMP r6, r1
  BNE loop

  mov r0, r4
  mov r1, r5
    
    pop {PC, r4, r5}
    
    ENDP

    END