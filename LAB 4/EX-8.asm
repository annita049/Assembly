.MODEL SMALL
.STACK 100H
.DATA
AUTHOR DB 'Maeesha Fairooz Ahmad (IT20016)$'
MSG1  DB 0AH,0DH,'Type some text: $'
MSG2 DB 0AH,0DH,'Letters in each word Reversed: $'
.CODE
MAIN PROC
  MOV AX,@DATA
  MOV DS,AX
  
  MOV AH,9
  LEA DX,AUTHOR
  INT 21H
  LEA DX,MSG1
  INT 21H
   
  MOV CX,0
  
  INPUT:
  MOV AH,1
  INT 21H
  MOV AH,0
  CMP AL,0DH
  JE END_INPUT 
  
  PUSH AX
  INC CX
  JMP INPUT 
    
  END_INPUT: 
  ;if input is null
  JCXZ EXIT
  
  ;moving elements to the half of the stack address
  MOV BX,50H 
  
  ;reversing the stack to the address 50H
  STACK_REVERSE:
  POP DX
  XCHG BX,SP
  ;pushing elements to the new stack address
  PUSH DX
  XCHG BX,SP
  LOOP STACK_REVERSE  ;decrement of CX 
  
  OUTPUT:
  MOV AH,9
  LEA DX,MSG2
  INT 21H
  ;recall SP where elements accommodate
  XCHG BX,SP   ;BX->100H, SP->50H--
 
  NEXT:
  MOV CX,0
  MOV AH,2
  
  WORD_REVERSE:  
  CMP SP,50H
  JE STOP
  POP DX  ;SP->50H--
  CMP DX,20H
  JE STOP
  XCHG BX,SP
  PUSH DX  ;SP->100H--
  XCHG BX,SP ;SP->50H--
  INC CX
  JMP WORD_REVERSE
   
  STOP:
  XCHG BX,SP  ;SP->100H--
  PRINT_WORD: 
  POP DX   
  INT 21H
  LOOP PRINT_WORD
  XCHG BX,SP   ;SP-> 50H--
  
  ;if SP indicates the start of the new stack address(50H) terminate PRINT
  CMP SP,50H
  JE EXIT
  MOV DL,20H
  INT 21H
  JMP NEXT
    
  EXIT:
  MOV AH,4CH
  INT 21H
  MAIN ENDP
END MAIN