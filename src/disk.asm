PROGRAM_SPACE equ 0x7e00
DiskRead:
  mov ah, 0x02
  mov al, 2
  mov ch, 0x00
  mov cl, 0x02
  mov dh, 0x00
  mov dl, [BOOT_DISK]
  mov bx, PROGRAM_SPACE
  int 0x13
  jc DiskError
  ret
BOOT_DISK:
  db 0
DiskErrorString:
  db "Failed to read disk"
DiskError:
  mov ah, 0x0e
  mov bx, DiskErrorString
  call printtxt
  jmp $
