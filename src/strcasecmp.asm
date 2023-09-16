BITS 64

section .text
    global strcasecmp

strcasecmp:
	xor rcx, rcx
    jmp .loop

.inc:
    cmp bl, BYTE 0
    je .end
    add rcx, 1

.loop:
    mov bl, BYTE [rdi + rcx]
    mov dl, BYTE [rsi + rcx]
    cmp bl, dl
    je .inc
    jl .check_upper_right
    jg .check_upper_left

.check_upper_left:
    cmp dl, 'A'
    jl .end_diff
    cmp dl, 'Z'
    jg .end_diff
    add dl, 32
    cmp dl, bl
    sub dl, 32
    jne .end_diff
    jmp .inc

.check_upper_right:
    cmp bl, 'A'
    jl .end_diff
    cmp bl, 'Z'
    jg .end_diff
    add bl, 32
    cmp bl, dl
    sub bl, 32
    jne .end_diff
    jmp .inc

.end_less:
    mov rax, -1
    ret

.end_great:
    mov rax, 1
    ret

.end_diff:
    xor rax, rax
    movsx eax, bl
    movsx ebx, dl
    sub eax, ebx
    ret

.end:
    mov rax, 0
    ret
