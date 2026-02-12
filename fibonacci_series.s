.intel_syntax noprefix
.global _start
.text

_start:
    mov r8, 1
    mov r9, 0
    mov rcx, 10

fibo:
    add r8, r9
    xchg r8, r9
    dec rcx
    jnz fibo

    mov rax, 60
    xor rdi, rdi
    syscall
