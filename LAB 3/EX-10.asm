.MODEL SMALL
.STACK 100H  
.DATA
PROMPT1 DB 0AH,0DH,'Enter a hex digit: $'
MSG1 DB 0AH,0DH,'In decimal it is: $'
MSG2 DB 0AH,0DH,'Illegal Character (Enter 0-9 or A-F): $'
PROMPT2 DB 0AH,0DH,'Do you want to do it again? $'
NEWL DB 0AH,0DH,'$'
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    START:
    MOV BH,0
    MOV AH,9
    LEA DX,PROMPT1
    INT 21H
    
    INPUT:
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
    JA ILLEGAL
    
    ELSE:
    MOV BH,0
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,2
    CMP BL,'9'
    JBE PRINT 
    MOV DL,'1'
    INT 21H
    SUB BL,11H
    JMP PRINT
    
    ILLEGAL:
    INC BH
    MOV AH,9 
    LEA DX,MSG2
    INT 21H
    JMP STOP 
    
    PRINT:
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    AGAIN:
    MOV AH,9
    LEA DX,PROMPT2
    INT 21H
    
    MOV AH,1  
    INT 21H   ;character input: Y/N
    
    CMP AL,'y'
    JE STOP
    CMP AL,'Y'
    JE STOP
    JMP EXIT
    
    STOP:
    CMP BH,0
    JG INPUT
    JMP START   
    
    EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN