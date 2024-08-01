.MODEL SMALL
.STACK 100H
.DATA 
    CR EQU  0DH
    LF EQU  0AH
msg DB CR,LF,'The sum of '
X DB ?,' and '
Y DB ?,' is '
SUM DB ?,'$'
.CODE
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,2 
    MOV DL,'?'
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV X,AL
    INT 21H
    MOV Y,AL
    
    ADD AL,X
    SUB AL,30H
    MOV SUM,AL
     
    MOV AH,9
    LEA DX,msg
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
