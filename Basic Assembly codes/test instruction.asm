.model small
.stack 100h
.code
main proc
    ;mov bx,7
    mov bx,4
    
    ;checking if bx is even
    test bx,1
    jz even
    jmp exit
    
    even:
    mov ah,2
    mov dl,'E'
    int 21h
    
    
    exit:
    mov ah,4ch
    int 21h
main endp
    end main