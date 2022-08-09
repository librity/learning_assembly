;******************************************************************************;
;
; Compile, link and execute:
; nasm -f elf64 if.asm && gcc -no-pie if.o &&./a.out
;
;******************************************************************************;
; C CODE:
;
; int x = 3;
; int a = 4;
; int b = 5;
; int c = 0;
;
; if (x == a)
;   c = c + a;
; else if (x == b)
;   c = c + b;
; else
;   c = 1;
;
; printf("%d\n", c);
;******************************************************************************;

default rel
extern printf

section .rodata
  SYS_EXIT equ 0x1
  SYS_WRITE equ 0x4

  STDOUT equ 0x1

  ENDLINE equ 0xA
  ENDSTR equ 0x0

  x equ 0x3; eax
  a equ 0x4; ebx
  b equ 0x5; ecx
  c equ 0x0; edx

  pf_format db "%d", ENDLINE, ENDSTR

section .text

global main

main:
  ; Move initial variables to their registers.
  mov eax, x
  mov ebx, a
  mov ecx, b
  mov edx, c

  ; Handle first if
  cmp eax, ebx
  jne elseif
  ; c = c + a
  add edx, ebx
  jmp print_exit

  ; Handle else if
elseif:
  cmp eax, ecx
  jne else
  ; c = c + b
  add edx, ecx
  jmp print_exit

  ; Handle else.
else:
  ; c = c + 1
  mov edx, 0x1

print_exit:
  sub   rsp, 8
  mov   esi, edx
  lea   rdi, [rel pf_format]
  xor   eax, eax
  call  printf

  xor   eax, eax
  add   rsp, 8
  ret
