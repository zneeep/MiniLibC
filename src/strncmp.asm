BITS 64

section .text
    global strncmp

strncmp:
    
    xor rcx, rcx

.loop:
    
    mov bl, [rdi + rcx]
    cmp bl, [rsi + rcx]
    jl .less_ret
    jg .great_ret
    add rcx, 1
    cmp rcx, rdx
    je .equal_ret
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
