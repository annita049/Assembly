.MODEL SMALL
.STACK 100H
.DATA 
    CR EQU  0DH
    LF EQU  0AH
ASTERISKS DB '**********',CR,LF,'$'

.CODE
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9
    LEA DX,ASTERISKS
    INT 21H 
    INT 21H
    INT 21H
    INT 21H
    INT 21H 
    INT 21H
    INT 21H
    INT 21H
    INT 21H 
    INT 21H

    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN
