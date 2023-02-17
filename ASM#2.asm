SECTION .data
    input db 'Nhap van ban: ', 0 ; khai bao input
SECTION .bss
    buffer resb 32  ; khai bao bo nho tam thoi chua 32 byte van ban
SECTION .text
    global _start
_start:
    ; In ra cau hoi input
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, 15
    int 0x80
    ; SYS_READ doan van ban vua nhap
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 32
    int 0x80
    ; SYS_WRITE doan van ban da~ nhap
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    int 0x80
    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80