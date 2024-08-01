.MODEL SMALL
.STACK 100H
.DATA
PROMPT DB 'Enter 5 numbers (0-9): $'
MSG DB 0AH,0DH,'Numbers in ascending order: $'
NEWL DB 0AH,0DH,'$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,PROMPT
    INT 21H
    
    MOV CX,5
    
    INPUT:
    MOV AH,1
    INT 21H
    PUSH AX
    MOV AH,2
    MOV DL,20H
    INT 21H
    LOOP INPUT
    
    MOV BX,50H
    MOV CX,5
    ;XCHG SP,BX
    
    POP DX
    MOV AX,DX
    PUSH DX
    SORT:
    POP DX
    ;MOV AX,DX
    ;CMP AX,DX
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN   
    
; 2 6 9 1 2
; 1 2 2 6 9 
    