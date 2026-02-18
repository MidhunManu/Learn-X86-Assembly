.intel_syntax noprefix
.global _start
.global strlen

.section .bss
buffer: .skip 16

.section .text
_start:
    mov rax, 0
    mov rdi, 0
    lea rsi, buffer
    mov rdx, 16
    syscall

    mov rsi, rax
    lea rdi, buffer
    call strlen

    mov rax, 60
    xor rdi, rdi
    syscall

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
