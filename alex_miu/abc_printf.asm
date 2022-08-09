;
; nasm -f elf64 abc_printf.asm && gcc -no-pie abc_printf.o &&./a.out
;

extern printf

section .data
  ENDLINE equ 0xA
  ENDSTR equ 0x0

pf_fmt db "This is a test: a=%d, b=%d, c=%d.", ENDLINE, ENDSTR
a dq 3
b dq 4
c dq 5


section .text   

global main
main:
  push rbp

  mov rdi, pf_fmt
  mov rsi, [a] 
  mov rdx, [b] 
  mov rcx, [c]
  mov rax, 0
  call printf

  pop rbp
  xor rax, rax
  ret
