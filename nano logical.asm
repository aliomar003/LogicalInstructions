section .text
    global _start

_start:
    mov eax, [var1]
    xor eax, eax
    mov [result], eax

    mov eax, [var2]
    test eax, 1
    jz even_number

odd_number:
    mov dword [isEven], 0
    jmp done

even_number:
    mov dword [isEven], 1

done:
    mov eax, 1
    int 0x80

section .bss
    result resd 1
    isEven resd 1

section .data
    var1 dd 25
    var2 dd 10