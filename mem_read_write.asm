;; This program will store a value in a memory location then read it later.

section .data
  var db 0x00 ;; reserve a byte and initialize it with zero

section .text
  global _start

  _start:
    mov [var], byte 69
    mov rax, 60
    movzx rdi, byte [var] ;; movzx zeros the upper bytes
    syscall
