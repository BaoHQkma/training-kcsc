SECTION .data
    input1 db "Nhap vao so thu nhat: ", 0
    input2 db "Nhap vao so thu hai: ", 0
    result db "Tong cua 2 so la: "
SECTION .bss
    num1 resd 4
    num2 resd 4
    sum resd 4
SECTION .text
    global _start

_start:
    ; Nhap vao so 1
    mov eax, 4
    mov ebx, 1
    mov ecx, input1
    mov edx, 23
    int 0x80
    ; SYS_READ so 1
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 4
    int 0x80
    ; Nhap vao so 2
    mov eax, 4
    mov ebx, 1
    mov ecx, input2
    mov edx, 22
    int 0x80
    ; SYS_READ so 2
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80
    ; WRITE tong cua 2 so la:
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 19
    int 0x80
    ; Tinh sum cua 2 so
    mov eax, [num1]
    sub eax, '0' ; Chuyen ve he thap phan
    mov ebx, [num2]
    sub ebx, '0'
    add eax, ebx
    add eax, '0' ; Chuyen ve he ASCII
    mov [sum], eax
    ; In ra ket qua
    mov eax, 4
    mov ebx, 1
    mov ecx, sum
    mov edx, 4
    int 0x80
    ; Exit
    mov eax, 1
    int 0x80