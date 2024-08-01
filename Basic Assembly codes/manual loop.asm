;IMPLEMENTING A LOOP MANUALLY
.MODEL SMALL 
.STACK 100H
.DATA  
MSG1 DB 'Printing 10 hashes: $'
CHAR DB ?
.CODE   
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV CX,10
    MOV AH,2
    MOV DL,'#'
    
    REPEAT:
    INT 21H
    DEC CX
    CMP CX,0
    JG REPEAT
    ;JMP EXIT
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN
