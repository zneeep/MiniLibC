BITS 64

section .text
    global strpbrk

strpbrk:
    xor rdx, rdx
    jmp .loop

.inc:
    inc rdi

.loop:
    mov rdx, 0
    mov bl, BYTE [rdi]
    cmp bl, BYTE 0
    je .end_not_found

.sub_loop:
    mov al, BYTE [rsi + rdx]
    cmp al, BYTE 0
    je .inc
    cmp bl, al
    je .end_found
    inc rdx
    jmp .sub_loop

.end_found:
    xor rax, rax
    mov rax, rdi
    ret

.end_not_found:
    mov rax, 0
    ret