.MODEL SMALL
.STACK 100H
.DATA 
    CR EQU  0DH
    LF EQU  0AH
MSG1 DB 'Enter a hex digit (A-F): $'
MSG2 DB 0DH,0AH,'In decimal it is: 1'
DECI DB ?,'$'

.CODE
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    
    SUB AL,11H
    MOV DECI,AL
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    

    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN
