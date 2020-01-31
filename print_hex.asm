print_hex:
  pusha
  mov cx, 0

hex_loop:
  cmp cx, 4
  je end_print_hex

  mov ax, dx
  and ax, 0x000f
  add al, '0'
  cmp al, '9'
  jle le_nine
  add al, 7

le_nine:
  mov bx, HEX_TEMPLATE + 5
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
