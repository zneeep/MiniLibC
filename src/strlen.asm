BITS 64

section .text
    global strlen
    global strrchr

strlen:
    mov rax, 0

.loop_strlen:
    cmp [rdi], byte 0
    je .end_strlen
    inc rdi
    inc rax
    jmp .loop_strlen

.end_strlen:
    ret

strrchr:
    mov rbx, rdi
    call strlen
    mov rcx, rax
    xor rax, rax
    xor rdi, rdi
    mov rdi, rbx
    xor rbx, rbx

.loop_strrchr:
    movsx rdx, BYTE [rdi + rcx]
    cmp rcx, -1
    je .end_strrchr_null
    cmp rdx, rsi
    je .end_strrchr
    sub rcx, 1
    jmp .loop_strrchr

.end_strrchr:
    mov rax, rdi
    add rax, rcx
    ret

.end_strrchr_null:
    mov rax, 0
    ret
