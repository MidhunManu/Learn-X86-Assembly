.intel_syntax noprefix
.global _start

.section .text
_start:
  mov rax, 1
  mov rcx, 4
  mov rbx, 3
  
  print_loop:
    imul rax, rbx
    loop print_loop
  
  mov r8, rax

  mov rax, 60
  mov rdi, 0
  syscall