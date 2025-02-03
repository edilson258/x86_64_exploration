section .text
  global _start

sum:
  push rbp
  mov rbp, rsp
  mov rax, qword [rbp+16]
  add rax, qword [rbp+24]
  mov rsp, rbp
  pop rbp
  ret

_start:
  push qword 34
  push qword 35
  call sum
  mov rdi, rax
  mov rax, 60
  syscall
