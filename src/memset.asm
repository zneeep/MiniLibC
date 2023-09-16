BITS 64

section .text
    global memset

memset:
    mov rcx, 0
.loop:
    cmp rcx, rdx
    je .end
    mov al, BYTE [rsi + rcx]
    mov BYTE [rdi + rcx], al
    inc rcx
    jmp .loop

.end:
    mov rax, rdi
    ret
