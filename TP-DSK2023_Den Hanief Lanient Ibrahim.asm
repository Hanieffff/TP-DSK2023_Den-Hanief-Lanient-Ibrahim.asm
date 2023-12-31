section .data
    base   dd  0        ; panjang alas
    height dd  0        ; tinggi

section .text
global _start

_start:
    ; Input: Masukkan panjang alas dan tinggi
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_base
    mov edx, msg_len
    int 0x80

    mov eax, 3          ; system call untuk membaca input dari stdin
    mov ebx, 0          ; file descriptor untuk stdin
    mov ecx, base       ; alamat untuk menyimpan panjang alas
    mov edx, 4          ; panjang input
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_height
    mov edx, msg_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, height
    mov edx, 4
    int 0x80

    ; Hitung luas: Luas = panjang alas * tinggi
    fild dword [base]   ; masukkan panjang alas ke dalam stack FPU
    fild dword [height] ; masukkan tinggi ke dalam stack FPU
    fmul               ; kali panjang alas dengan tinggi
    fistp dword [result] ; simpan hasil dalam result

    ; Output: Cetak hasil
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_result
    mov edx, msg_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 4
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
msg_base    db 'Masukkan panjang alas: ', 0
msg_height  db 'Masukkan tinggi: ', 0
msg_result  db 'Luas jajar genjang adalah: ', 0
msg_len     equ $ - msg_base

section .bss
base    resd 1
height  resd 1
result  resd 1
