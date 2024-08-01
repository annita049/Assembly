.MODEL SMALL
.STACK 100H
.DATA
MSG1  DB 'Enter 5 numbers (0-9): $'
MSG2 DB 0AH,0DH,'The numbers in ascending order: $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
  
    MOV AH,9
    LEA DX,MSG1
    INT 21H
   
    MOV CX,5
  
    INPUT:
    MOV AH,1
    INT 21H
    XOR AH,AH
    PUSH AX
    MOV AH,2
    MOV DL,20H
    INT 21H
    LOOP INPUT
    OK:
    MOV BX,50H
    MOV BP,80H
    MOV SI,5
  
    OUTER:
    POP AX 
    DEC SI
    CMP SI,0
    JE PUSHING
    MOV CX,SI
    
    INNER: 
    POP DX
    CMP AX,DX 
    JL K
    XCHG BX,SP ;if AX>=DX
    PUSH DX
    XCHG BX,SP
    JMP NEXT
    K:
    ;if AX<DX 
    XCHG BX,SP
    PUSH AX
    XCHG BX,SP
    MOV AX,DX
    NEXT:
    LOOP INNER   
    
    PUSHING:
    XCHG BP,SP
    PUSH AX  ;SP->80H--
    XCHG BP,SP
    
    ;alternating SP between 50H-- and 100H-- 
    XCHG BX,SP 
    
    CMP SI,0
    JG OUTER 
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    MOV CX,5
    XCHG BP,SP  ;SP->80H--
    MOV AH,2 
    
    PRINT:
    POP DX
    INT 21H
    MOV DL,20H 
    INT 21H
    LOOP PRINT
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN