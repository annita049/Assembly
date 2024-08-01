.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC  
    
    MOV AH,1 
    
    REPEAT:
    INT 21H 
    
    CMP AL,' '
    JNE REPEAT 
    
    EXIT:     
    MOV AH,4CH
    INT 21H
MAIN ENDP   
    END MAIN