.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
     
    MOV CX,80
   
    MOV AH,2 
    MOV DL,'*' 
    
    TOP:
    INT 21H
    LOOP TOP
    
    EXIT:  
    MOV AH,4CH
    INT 21H
MAIN ENDP   
    END MAIN