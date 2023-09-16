BITS 64

section .text
    global strcmp

strcmp:
    xor rcx, rcx

.loop:
    mov bl, [rdi + rcx]
    cmp bl, [rsi + rcx]
    jl .less_ret
    jg .great_ret
    cmp bl, BYTE 0 
    je .equal_ret
    inc rcx
    jmp .loop

.less_ret:
    xor rax, rax
    mov rax, -1
    ret

.great_ret:
    xor rax, rax
    mov rax, 1
    ret

.equal_ret:
    xor rax, rax
    mov rax, 0
    ret
