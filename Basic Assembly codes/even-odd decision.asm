.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'Enter a number: $'
MEVEN DB 0AH,0DH,'Input number is even.$'
MODD DB 0AH,0DH,'Input number is odd.$'
.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG 
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    MOV AH,9
    
    CMP BL,'1'
    JE ODD
    
    CMP BL,'3'
    JE ODD
    
    CMP BL,'5'
    JE ODD
    
    CMP BL,'7'
    JE ODD
    
    CMP BL,'9'
    JE ODD
    
    EVEN:
    LEA DX,MEVEN
    INT 21H
    JMP EXIT
    
    ODD:
    LEA DX,MODD
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN

