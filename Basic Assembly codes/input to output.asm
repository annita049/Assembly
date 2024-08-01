.MODEL SMALL
.STACK 100H
.DATA
.CODE
 MAIN PROC
    MOV AH,1 
    INT 21H     ;OUTPUT
    MOV BL,AL
    
    MOV AH,2
    MOV DL,BL   ;INPUT
    INT 21H
    
    EXIT:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
 END MAIN