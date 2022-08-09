; SOURCE: https://stackoverflow.com/questions/8194141/how-to-print-a-number-in-assembly-nasm
;
; nasm -f elf64 printf.asm && gcc -no-pie printf.o &&./a.out
;

; make [rel format] the default, you always want this.
default rel
; NASM requires declarations of external symbols, unlike GAS
extern printf

section .rodata
  ; C 0-terminated string: "%#x\n" 
  format db "%#x", 10, 0


section .text
global main
main:
  ; re-align the stack to 16 before calling another function
  sub   rsp, 8

  ; Call printf.
  ; "%x" takes a 32-bit unsigned int
  mov   esi, 0x12345678
  lea   rdi, [rel format]
  ; AL=0  no FP args in XMM regs
  xor   eax, eax
  call  printf

  ; Return from main.
  xor   eax, eax
  add   rsp, 8
  ret
