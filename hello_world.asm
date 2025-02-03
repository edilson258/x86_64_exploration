;; Prints "Hello, world" to the stdout

section .rodata
  msg db "Hello, world!", 0xA
  msg_len equ $-msg

section .text
  global _start

_start:
  mov rax, 1        ;; 1 write syscall
  mov rdi, 1        ;; 1 is the stdout fd
  mov rsi, msg
  mov rdx, msg_len
  syscall

  mov rax, 60       ;; 60 exit syscall
  xor rdi, rdi      ;; set 0 as exit code
  syscall
