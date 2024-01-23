.model small
.data
    msg_base    db 'Masukkan panjang alas: $', 0
    msg_height  db 'Masukkan tinggi: $', 0
    msg_result  db 'Luas jajar genjang adalah: $', 0

    base    dw 0
    height  dw 0
    result  dw 0

.code
_start:
    ; Input: Masukkan panjang alas
    mov ah, 09h
    lea dx, msg_base
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov ax, al
    mov [base], ax

    ; Input: Masukkan tinggi
    mov ah, 09h
    lea dx, msg_height
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov ax, al
    mov [height], ax

    ; Hitung luas: Luas = panjang alas * tinggi
    mov ax, [base]
    mov [result], ax

    ; Convert result to ASCII for output
    add [result], '0'

    ; Output: Cetak hasil
    mov ah, 09h
    lea dx, msg_result
    int 21h

    mov ah, 09h
    lea dx, [result]
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
