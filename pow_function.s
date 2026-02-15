.intel_syntax noprefix
.global _start
.global pow

.section .text

pow:
  mov rax, 1
  test rsi, rsi
  jz .done
  
  .pow_loop:
    imul rax, rdi
    dec rsi
    jnz .pow_loop

.done:
  ret

_start:
  mov rdi, 3
  mov rsi, 4
  call pow
  
  mov r8, rax
  
  mov rax, 60
  mov rdi, 0
  syscall
