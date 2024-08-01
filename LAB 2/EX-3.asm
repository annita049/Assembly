.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
     
    MOV AH,1
    INT 21H
    MOV BL,AL
    INT 21H
            
    MOV AH,2  ;prepare to display
    
    CMP AL,BL   
    JNBE ELSE_  ;if AL>BL
           
    MOV DL,AL
    JMP PRINT   ;jump to print
    
    ELSE_:
    MOV DL,BL
    
    PRINT:
    INT 21H   ;execute display
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP   
    END MAIN