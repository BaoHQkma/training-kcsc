SECTION .data
    msg     db      'Hello World', 0Ah ; Gan bien msg cho dong` string
SECTION .text
    global  _start
_start:
    mov     edx, 12 ; So byte can viet, 11 cua Hello World + 1 cua 0Ah
    mov     ecx, msg ; Chuyen dia chi bo nho cua msg vao trong ecx
    mov     ebx, 1 ; Viet ra dang file STDOUT
    mov     eax, 4 ; Thuc hien SYS_WRITE
    int     80h
    ; Exit
    mov     ebx, 0
    mov     eax, 1
    int     80h