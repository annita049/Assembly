.MODEL SMALL
.STACK 100H
.CODE       
f
MAIN PROC   
    
    MOV AH,1  ;INPUT
    INT 21H
    
    MOV BL,AL
    INT 21H
    
    MOV BH,AL
    INT 21H
    
    MOV CL,AL
    INT 21H
    
    MOV CH,AL
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV DL,BH
    INT 21H
    
    MOV DL,CL
    INT 21H
    
    MOV DL,CH
    INT 21H
    
    EXIT:
    
        MOV AH,4CH
        INT 21H
        MAIN ENDP 

END MAIN