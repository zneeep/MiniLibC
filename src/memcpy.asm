BITS 64

section .text
    global memcpy

memcpy:
    mov rcx, 0

.loop:
    cmp rcx, rdx
    je .end
    mov bl, BYTE [rsi + rcx]
    mov [rdi + rcx], bl
    inc rcx
    jmp .loop
    

.end:
    mov rax, rdi
    ret