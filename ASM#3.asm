SECTION .data
    input db "Nhap vao doan van ban: ", 0
SECTION .bss
    buffer resb 32
SECTION .text
    global _start
_start:
    ; SYS_WRITE input
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, 24
    int 0x80
    ; SYS_READ input
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 32
    int 0x80
    ; Bat dau chuyen tu chu~ thuong thanh in hoa
    mov esi, buffer
    mov ecx, 32
    ; Thuc hien loop kiem tra tung` chu~ 1 de chuyen thanh chu~ hoa
    loop_start:
        cmp byte [esi], 0 ; Kiem tra xem van ban da~ end chua
        je loop_end
        cmp byte [esi], 'a' ; Kiem tra chu co thuong` khong
        jb next_char
        cmp byte [esi], 'z' ; Kiem tra chu co in hoa khong
        ja next_char
        sub byte [esi], 32 ; Chuyen tu chu thuong thanh in hoa
        next_char:
            inc esi
            loop loop_start ; Neu chua den doan cuoi cua van ban, lap lai vong loop
    loop_end:
    ; SYS_WRITE output
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 32
    int 0x80
    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80