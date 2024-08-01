.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
     
    MOV CL,0 
    
    MOV AH,1
    INT 21H
    
    WHILE_LOOP:
        CMP AL,0DH
        JE END_WHILE 
        INC CL
        INT 21H 
        JMP WHILE_LOOP
    
    END_WHILE: 
    
    MOV AH,2 
    MOV DL,0AH
    INT 21H
    ADD CL,30H
    MOV DL,CL
    INT 21H
         
    MOV AH,4CH
    INT 21H
MAIN ENDP   
    END MAIN