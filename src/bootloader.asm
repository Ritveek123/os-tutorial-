[org 0x7c00]
%include "src/print.asm"
%include "src/disk.asm"
mov [BOOT_DISK], dl
call DiskRead
mov ah, 0x0e
mov al, 'A'
print:
  cmp al, 'Z' + 1
  je endf
  int 0x10
  inc al
  jmp print
endf:
jmp PROGRAM_SPACE
times 510-($-$$) db 0
db 0x55, 0xaa
