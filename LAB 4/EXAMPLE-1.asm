.MODEL SMALL
.STACK 100H
.DATA
AUTHOR DB 'Maeesha Fairooz Ahmad (IT20016)$'
PROMPT DB 0AH,0DH,'Enter a string: $'
MSG DB 0AH,0DH,'The string in reverse order: $'
NEWL DB 0AH,0DH,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,AUTHOR
    INT 21H
    LEA DX,PROMPT
    INT 21H
    
    
    MOV CX,0
    
    INPUT:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE OUTPUT  
    PUSH AX ;pushes a charcter onto the stack from AX 
    INC CX
    JMP INPUT    
    
    OUTPUT:
    MOV AH,9
    LEA DX,MSG
    INT 21H
    JCXZ EXIT ;in case of null input
    
    PRINT:
    MOV AH,2
    POP DX  ;pops a character into DX
    INT 21H
    ;decrementing CX
    LOOP PRINT
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN
    
    