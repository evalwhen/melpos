[org 0x7c00]
mov bx, HELLO_MSG
call print_string               ; 将当前指令 pc 压栈，并且设置 pc 地址为函数 print_string 开始地址

mov bx, GOODBYE_MSG
call print_string

jmp $                           ; 无限循环

%include "print_string.asm"

HELLO_MSG:
  db 'Hello, World!', 0

GOODBYE_MSG:
  db 'Goodbye!', 0

times 510-($-$$) db 0
dw 0xaa55
