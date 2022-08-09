;******************************************************************************;
;
; Compile, link and execute:
; nasm -f elf64 while_pf.asm && gcc -no-pie while_pf.o &&./a.out
;
;******************************************************************************;
; C CODE:
;
; int cycles = 10;
; int i = 0;
; while (i < cycles)
; {
;   printf("%d\n", i);
;   i++;
; }
;******************************************************************************;

default rel
extern printf

section .rodata
  SYS_EXIT equ 0x1
  SYS_WRITE equ 0x4

  STDOUT equ 0x1

  ENDLINE equ 0xA
  ENDSTR equ 0x0

  pf_format db "%d", ENDLINE, ENDSTR

  i equ 0x0; ebx
  cycles equ 0xA
  increment equ 0x1


section .text

global main

main:
  ; Exclusive Or is faster than move. XOR register with itselt to zero it out.
  xor ebx, ebx
  ; It was hard to find a register that printf didn't use.

while:
  cmp ebx, cycles
  jge exit

  sub   rsp, 8
  mov   esi, ebx
  lea   rdi, [rel pf_format]
  xor   eax, eax
  call  printf
  add   rsp, 8

  add ebx, increment
  jmp while


exit:
  xor   eax, eax
  ret
