.MODEL SMALL
.STACK 100H
.DATA
MSG1  DB 'Enter 5 numbers: $'
MSG2 DB 0AH,0DH,'The numbers in ascending order: $' 
count DW 5
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
  MOV AH,2
  MOV DL,20H
  INT 21H
  PUSH AX
  LOOP INPUT
  
  MOV BP,80H
  MOV CX,5 
  MOV SI,5
  MOV BX,50H
  
  OUTER:
  POP DX
  MOV AX,DX
  XCHG BX,SP
  PUSH DX  ;SP->50H
  XCHG BX,SP
  DEC SI
  MOV CX,SI
  INNER:
  CMP AX,DX 
  JG K
  MOV AX,DX
  K:
  XCHG BX,SP
  PUSH DX  ;SP->50H
  XCHG BX,SP
  XCHG BP,SP
  PUSH AX  ;SP->80H 
  XCHG BP,SP
  XCHG BX,SP ;SP->50H
  LOOP INNER 
  JMP OUTER    
  EXIT:
  MOV AH,4CH
  INT 21H
  MAIN ENDP
END MAIN