BITS 64

section .text
    global strcspn

strcspn:
    xor rcx, rcx
    xor rdx, rdx
    jmp .loop

.inc_value:
    inc rdx
    mov rcx, 0

.loop:
    mov bl, BYTE [rdi + rdx]
    cmp bl , BYTE 0
    je .return

.check_carac:
    mov al, BYTE [rsi + rcx]
    cmp al, BYTE 0
    je .inc_value
    cmp al, bl
    je .return
    inc rcx
    jmp .check_carac

.return:
    mov rax, rdx
    ret