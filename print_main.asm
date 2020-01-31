[org 0x7c00] ; tell the assembler that our offset is bootsector code

; The main routine makes sure the parameters are ready and then calls the function
mov dx, 0x12fe
call print_hex

; that's it! we can hang now
jmp $

; remember to include subroutines below the hang
%include "print_hex.asm"
%include "print_string.asm"

; data
; padding and magic number
times 510-($-$$) db 0
dw 0xaa55
