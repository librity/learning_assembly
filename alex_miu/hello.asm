; Compile, link and execute:
; nasm -f elf64 hello.asm && ld -m elf_x86_64 hello.o && ./a.out

; Define constant variables:
; strings, magic numbers (codes), terminating strings, etc.
section .data
  SYS_EXIT equ 0x1
  SYS_WRITE equ 0x4

  STDOUT equ 0x1

  ENDLINE equ 0xA

  msg db "Hello Assembly!", ENDLINE
  msg_length equ $-msg


; Block Starting Symbol: reserve space in memory for future data.
section .bss


; Progam instuctions
section .text

; Required label: _start (for ld) or main (for gcc).
global _start

_start:
  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, msg
  mov edx, msg_length
  int 0x80

  mov eax, SYS_EXIT
  int 0x80

