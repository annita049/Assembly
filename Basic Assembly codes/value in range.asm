.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    
    LOOP:
      MOV CX,6  
      MOV AH,2 
      MOV DL,'*'
    
      TOP:
      INT 21H
      LOOP TOP
    
      EXIT:
      MOV AH,4CH
      INT 21H
MAIN ENDP
    END MAIN
    
    
    