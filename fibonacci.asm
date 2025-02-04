section .rodata
  fmt db "%d", 0xA, 0x0

section .text
  global _start
  extern printf

  _start:
    mov rdi, 0x0
    mov rsi, 0x1
    call fib

    mov rax, 0x3c
    xor rdi, rdi
    syscall

  fib:
    push rbp
    mov rbp, rsp
    sub rsp, 0x10
    mov [rbp-0x8], rdi
    mov [rbp-0x10], rsi

    loop:
      cmp qword [rbp-0x10], 500
      jg return
      mov rax, qword [rbp-0x8]
      mov rbx, qword [rbp-0x10]
      add [rbp-0x10], rax
      mov [rbp-0x8], rbx
      mov rdi, fmt
      mov rsi, qword [rbp-0x10]
      xor rax, rax
      call printf
      jmp loop

    return:
      add rsp, 0x10
      mov rsp, rbp
      pop rbp
      ret
