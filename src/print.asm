mov ah, 0x0e
mov bx, txt
printtxt:
  mov al, [bx]
  cmp al, 0
  je end
  int 0x10
  inc bx
  jmp printtxt
txt:
  db "This is a basicOS"
end:
