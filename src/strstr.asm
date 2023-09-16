BITS 64

section .text
    global strstr

strstr:
    xor rcx, rcx
    xor rdx, rdx

.inc:
    xor rdx, rdx
    inc rdi

.loop:
    mov bl, BYTE [rdi + rdx]
    mov al, BYTE [rsi + rdx]
    cmp al, BYTE 0
    je .end_found
    cmp bl, BYTE 0
    je .end_not_found
    cmp bl, al
    jne .inc
    inc rdx
    jmp .loop

.end_found:
    xor rax, rax
    mov rax, rdi
    ret
.end_not_found:
    mov rax, 0
    ret