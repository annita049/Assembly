.MODEL SMALL
.STACK 100H
.DATA 
    CR EQU  0DH
    LF EQU  0AH
ASTERISKS DB CR,LF,'***********','$' 
MID DB CR,LF,'*** '
C1 DB ?
C2 DB ?
C3 DB ?,' ***','$'
BEEP DB 7

.CODE
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV C1,AL
    INT 21H
    MOV C2,AL
    INT 21H
    MOV C3,AL 
    
    MOV AH,9
    LEA DX,ASTERISKS
    INT 21H 
    INT 21H
    INT 21H
    INT 21H
    INT 21H 
    
    LEA DX,MID
    INT 21H 
    
    LEA DX,ASTERISKS
    INT 21H 
    INT 21H
    INT 21H
    INT 21H
    INT 21H 
    
    ;TO BEEP THE COMPUTER
    MOV AH,2
    MOV DL,BEEP
    INT 21H

    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN
