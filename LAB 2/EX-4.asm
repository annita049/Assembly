.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
     
    MOV AX,3
    
    CMP AX,0   
    JL NEGATIVE  ;if AX<0 
    JE ZERO      ;if AX=0
    JG POSITIVE  ;if AX>0
    
    NEGATIVE:
        MOV BX,-1
        JMP END_CASE 
    ZERO: 
        MOV BX,0
        JMP END_CASE
    POSITIVE:
        MOV BX,1   
    
    END_CASE:
    MOV AH,2
    ADD BX,30H
    MOV DX,BX 
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP   
    END MAIN