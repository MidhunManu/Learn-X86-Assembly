.intel_syntax noprefix
.global _start
.text

_start:
  mov rax, 0
  mov rdi, 0
  lea rsi, buffer
  mov rdx, 16
  
  syscall
  
  mov rax, 60
  mov rdi, 0
  syscall
  
.bss
buffer:
.skip 16