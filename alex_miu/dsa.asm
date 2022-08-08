; Compile, link and execute:
; nasm -f elf64 hello_elf64.asm && ld -m elf_x86_64 hello_elf64.o && ./a.out

; Define constant variables:
; strings, magic numbers (codes), terminating strings, etc.
section .data


; Reserve space in memory for future data.
section .bss


; Progam instuctions
section .text
; Required label: _start (for ld) or main (for gcc).



