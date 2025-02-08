section .data
  optval dd 0x1
  sockfd dd 0x0
  client_sockfd dd 0x0
  backlog dw 0xa
  sockaddr:
    dw 2
    dw 0x901f
    dd 0
    dq 0

  client_buf db 1024 dup(0)
  client_buf_len equ $-client_buf

section .text
  global _start

  _start:
    ;; socket(AF_INET, SOCK_STREAM, 0)
    mov rax, 0x29
    mov rdi, 0x02
    mov rsi, 0x01
    mov rdx, 0x00
    syscall
    cmp rax, -0x1
    je exit_error
    mov dword [sockfd], eax

    ;; setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, 1, 4)
    mov rax, 0x36
    mov edi, dword [sockfd]
    mov rsi, 0x1
    mov rdx, 0x2
    mov r10, optval
    mov r8, 0x4
    syscall
    cmp rax, -0x1
    je exit_error


    ;; bind(sockfd, (struct sockaddr *)&addr, sizeof(addr))
    mov rax, 0x31
    mov edi, dword [sockfd]
    mov rsi, sockaddr
    mov rdx, 0x10
    syscall

    ;; listen(sockfd, 10)
    mov rax, 0x32
    mov edi, dword [sockfd]
    mov esi, dword [backlog]
    syscall

    ;; accept(sockfd, NULL, 0)
    mov rax, 0x2b
    mov rsi, 0x0
    mov rdx, 0x0
    syscall
    cmp rax, -0x1
    je exit_error
    mov dword [client_sockfd], eax

    ;; read(client_sockfd, buf, sizeof(buf))
    xor rax, rax
    mov edi, dword [client_sockfd]
    mov rsi, client_buf
    mov rdx, 1024
    syscall

    ;; write read content to stdout
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, client_buf
    mov rdx, 1024
    syscall

    jmp exit_success

  exit_error:
    mov rax, 0x3c
    mov rdi, 0x01
    syscall

  exit_success:
    mov rax, 0x3c
    mov rdi, 0x00
    syscall
