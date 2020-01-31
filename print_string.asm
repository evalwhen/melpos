print_string:                   ;字符串打印函数
  pusha                         ;将寄存器压栈
  mov ah, 0x0e                  ;tele-mode
loop:
  mov al, [bx]                  ;取得 bx 指向的内存数据
  cmp al, 0                     ;检查是否是字符串结尾
  je end                        ;如果是则结束循环
  int 0x10                      ;发起中断，打印 al 中的值
  add bx, 1                     ;继续打印下一个字符
  jmp loop
end:
  popa
  ret
