;******************************************************************************;
;
; Compile, link and execute:
; nasm -f elf64 while.asm && gcc -no-pie while.o &&./a.out
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

  endline db ENDLINE

  i equ 0x0; edi
  cycles equ 0xA


segment .bss
  ; Reserve a byte called sum.
  sum resb 2

section .text
global main
main:
  ; Exclusive Or is faster than move. XOR register with itselt to zero it out.
  xor edi, edi

while:
  ; Exit if edi is greater or equal to cycles.
  cmp edi, cycles
  jge exit

  ; Move the char representation of edi to sum and restore its value.
  add edi, '0'
  mov [sum], edi
  sub edi, '0'

  ; Write sum to STDOUT.
  mov eax, 0x4
  mov ebx, 0x1
  mov ecx, sum
  mov edx, 1
  int 0x80

  ; Write endline to STDOUT.
  mov eax, 0x4
  mov ebx, 0x1
  mov ecx, endline
  mov edx, 1
  int 0x80

  ; Increment edi by one and continue loop.
  inc edi
  jmp while

exit:
  xor eax, eax
  ret
