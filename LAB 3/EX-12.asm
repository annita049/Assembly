.MODEL SMALL
.STACK 100H
.DATA
PROMPT DB 0AH,0DH,'Enter a string of capital letters: $'
MSG DB 0AH,0DH,'The longest consecutively inreasing string is: $'
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,PROMPT
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    MOV BH,AL
    MOV DH,AL
    MOV CL,1
    MOV DL,1
    
    INPUT:
    INT 21H
    CMP AL,0DH
    JE END_INPUT
    INC BL     ;incrementing previous character
    CMP BL,AL   ;checking if characters are consecutive
    JNE LENGTH
    INC CL     ;count++
    JMP INPUT
    
    LENGTH:
    CMP CL,DL
    JLE NEW_POSITION ;CL<=DL
    MOV DH,BH  ;bZn
    MOV DL,CL   ;CL>DL ;DL=CL;
    
    NEW_POSITION:
    MOV BH,AL   ;storing the letter
    MOV BL,AL  ;setting new position
    MOV CL,1  ;setting length=1
    JMP INPUT
    
    END_INPUT:
    CMP CL,DL
    JLE OUTPUT
    MOV DH,BH 
    MOV DL,CL
    
    OUTPUT:
    MOV BX,DX
    MOV AH,9
    LEA DX,MSG
    INT 21H
    MOV CX,0
    MOV CL,BL
    MOV DL,BH
    MOV AH,2
    
    PRINT:
    INT 21H
    INC DL
    LOOP PRINT 
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN