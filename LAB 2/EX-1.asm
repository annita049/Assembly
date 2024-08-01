.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
     
    MOV AH,1
    INT 21H
    
    MOV BX,AX
    INT 21H
    
    MOV CX,AX
    
    CMP BX,CX   
    JLE PRINT  ;if BX<=CX
    
    ;if BX>CX
    MOV CX,BX
    
    PRINT: 
    MOV AH,2
    MOV DX,CX 
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP   
    END MAIN