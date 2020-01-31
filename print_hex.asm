print_hex:
  pusha
  mov cx, 0                     ;计数器，四个十六进制数字

hex_loop:
  cmp cx, 4
  je end_print_hex

  mov ax, dx                    ;ax, 作为临时变量
  and ax, 0x000f                ;取得 ax 最后四位
  add al, '0'
  cmp al, '9'
  jle le_nine
  add al, 7                     ;参照 ascii 表

le_nine:
  mov bx, HEX_TEMPLATE + 5      ;模板最后一个数字地址
  sub bx, cx
  mov [bx], al

  ror dx, 4
  add cx, 1
  jmp hex_loop

end_print_hex:
  mov bx, HEX_TEMPLATE
  call print_string
  popa
  ret

HEX_TEMPLATE:
  db '0x0000', 0
