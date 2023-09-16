BITS 64

section .text
    global strchr

strchr:
    mov rcx, 0
    jmp .loop

.increment:
    inc rcx

.loop:
    movsx rdx, BYTE [rdi + rcx]
	cmp rdx, rsi
	je .end
	cmp rdx, 0
	je .endnull
	jne .increment

.endnull:
    mov rax, 0

.end:
    mov rax, rdi
    add rax, rcx
    ret