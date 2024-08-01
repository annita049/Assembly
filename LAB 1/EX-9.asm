.MODEL SMALL
.STACK 100H
.DATA 
    CR EQU  0DH
    LF EQU  0AH
MSG DB 'Enter the three initials: $'
K DB CR,LF
X DB ?,CR,LF
Y DB ?,CR,LF
Z DB ?,'$'

.CODE
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV X,AL
    
    INT 21H
    MOV Y,AL
    
    INT 21H
    MOV Z,AL
    
    MOV AH,9
    LEA DX,K
    INT 21H
     

    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN
