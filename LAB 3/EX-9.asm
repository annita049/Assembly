.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
    
    MOV CX,128
    MOV BL,128
    MOV BH,0 
    
    MOV AH,2
    
    ASCII:
    MOV DL,BL 
    INC BL
    INT 21H
    MOV DL,20H
    INT 21H
    INC BH
    CMP BH,10
    JE NEWLINE
    JMP K 
    
    NEWLINE:
    MOV BH,0
    MOV DL,0AH
    INT 21H
    MOV DL,0DH 
    INT 21H 
    
    K: LOOP ASCII
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN