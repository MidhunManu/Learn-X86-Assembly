.intel_syntax noprefix
.global strlen

.section .text
strlen:
    mov rcx, rdi
    xor r8, r8
strlen_loop:
    cmp r8, rsi
    je strlen_done
    mov al, byte ptr [rcx]
    cmp al, 10
    je strlen_done
    inc r8
    inc rcx
    jmp strlen_loop
strlen_done:
    ret
