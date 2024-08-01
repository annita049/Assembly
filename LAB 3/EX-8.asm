.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH,2
    MOV DL,'?'
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    INT 21H
    MOV CL,AL 
    
    MOV AH,2 
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    CMP CL,BL
    JG PRINT  ;CL>BL
    XCHG CL,BL 
    
    PRINT:
    MOV DL,BL
    INT 21H
    MOV DL,CL
    INT 21H 
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN