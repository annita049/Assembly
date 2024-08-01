.MODEL SMALL
.STACK 100H
.DATA
    CR EQU  0DH
    LF EQU  0AH
MSG1 DB 'Enter an uppercase letter: $'
CHAR1 DB ?
MSG2 DB CR,LF,'In lower case it is: '
CHAR2 DB ?,'$'

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CHAR1,AL
    
    ADD AL,20H 
    MOV CHAR2,AL
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN