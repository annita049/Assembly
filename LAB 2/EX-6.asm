.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
     
    MOV AH,1
    INT 21H
    
    CMP AL,'A'
    JL EXIT
    CMP AL,'Z'
    JG EXIT

    MOV AH,2 
    MOV DL,AL  
    INT 21H  
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP   
    END MAIN