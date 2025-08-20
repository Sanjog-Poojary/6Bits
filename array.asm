.model small
.stack 100h

.data
array db 61h, 05h, 42h, 05h, 12h, 15h, 09h, 14h, 56h, 38h
small db 0
.code
start: mov ax, data
    mov ds, ax

    lea bx, array
    mov cl, 10
    mov al, [bx]
    mov di, 1

back:
    cmp cl, 1
    jz done

    cmp al, [bx+di]
    jc skip
    mov al, [bx+di]

skip:
    inc di
    dec cl
    jmp back

done:
    mov small, al
    mov ah, 4ch
    int 21h

end start
