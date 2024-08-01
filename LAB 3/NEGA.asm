.MODEL SMALL
.STACK 100H  
.DATA
PROMPT1 DB 'Enter a hex digit: $'
MSG1 DB 'In decimal it is: $'
MSG2 DB 'Illegal Character (Enter 0-9 or A-F): $'
PROMPT2 DB 'Do you want to do it again? $'
NEWL DB 0AH,0DH,'$'
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    START:
    MOV AH,9 
    LEA DX,NEWL
    INT 21H
    LEA DX,PROMPT1
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL 
    
    CMP BL,'0'
    JB ILLEGAL
    CMP BL,'9'
    JBE ELSE
    
    NEXT:
    CMP BL,'A'
    JB ILLEGAL
    CMP BL,'F'
    JBE ELSE
    
    ILLEGAL:
    MOV AH,9
    LEA DX,NEWL
    INT 21H 
    LEA DX,MSG2
    INT 21H
    JMP PRINT
    
    ELSE:
    MOV AH,9
    LEA DX,NEWL
    INT 21H
    LEA DX,MSG1
    INT 21H
    
    MOV AH,2
    CMP BL,'9'
    JBE PRINT 
    MOV DL,'1'
    INT 21H
    SUB BL,11H 
    
    PRINT:
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    AGAIN:
    MOV AH,9
    LEA DX,NEWL
    INT 21H
    LEA DX,PROMPT2
    INT 21H
    
    MOV AH,1  
    INT 21H   ;character input: Y/N
    
    CMP AL,'y'
    JE STOP
    CMP AL,'Y'
    JE STOP
    JMP EXIT
    
    STOP: LOOP START
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN