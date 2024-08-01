.model small
.stack 100h
.code
main proc
    mov cx,0
    
    or cx,cx
    jz zero
    jmp exit
    
    zero:
    mov ah,2
    mov dl,'Z'
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
main endp
    end main