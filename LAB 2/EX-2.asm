.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
    
    MOV AX,-6
    
    CMP AX,0
    JGE PRINT
    
    NEG AX
    
    PRINT:
    MOV AH,2
    ADD AX,30H
    MOV DX,AX
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP   
    END MAIN