.intel_syntax noprefix
.global _start

.section .bss
buffer: .skip 8

.section .data
multiple_of_3: .asciz "is multiple of 3"
multiple_of_5: .asciz "is multiple of 5"
multiple_of_none: .asciz "none"

.section .text
_start:
  mov rax, 0
  mov rdi, 0
  lea rsi, buffer 
  mov rdx, 8
  syscall
  
  test rax, rax
  jz exit
  
  xor rbx, rbx
  mov rcx, rsi
  
atoi_loop:
  mov al, byte ptr [rcx]
  
  cmp al, '0'
  jb atoi_done
  cmp al, '9'
  ja atoi_done
  
  sub al, '0'
  movzx r8, al
  
  imul rbx, rbx, 10
  add rbx, r8
  
  inc rcx
  jmp atoi_loop

atoi_done:
  mov r8, rbx

fizz_buzz:
  mov rax, r8
  xor rdx, rdx
  mov rcx, 3
  div rcx
  test rdx, rdx
  jz is_3_multiple
  
  mov rax, r8
  xor rdx, rdx
  mov rcx, 5
  div rcx
  test rdx, rdx
  jz is_5_multiple
  
  jmp is_none

is_3_multiple:
  mov rax, 1
  mov rdi, 1
  lea rsi, multiple_of_3
  mov rdx, 17
  syscall
  
  jmp exit

is_5_multiple:
  mov rax, 1
  mov rdi, 1
  lea rsi, multiple_of_5
  mov rdx, 17
  syscall
  
  jmp exit

is_none:
  mov rax, 1
  mov rdi, 1
  lea rsi, multiple_of_none
  mov rdx, 5
  syscall
  
  jmp exit
  
exit:
  mov rax, 60
  xor rdi, rdi
  syscall

