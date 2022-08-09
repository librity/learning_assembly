;
; sudo apt-get install gcc-multilib g++-multilib
; nasm -f elf32 -l abc_printf_32.lst  abc_printf_32.asm && gcc -m32 -no-pie abc_printf_32.o &&./a.out
;

extern  printf

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
  ; Set up stack frame: save the value of ebp and set it to the top of the stack.
  push ebp
  mov ebp, esp

  ; Push printf parameters to the top of the data stack.
  push dword [c]
  push dword [b]
  push dword [a]
  push dword pf_fmt
  call printf
  ; Printf will pop the stack 4 times:
  ; recede the top of the stack pointer esp by 4 bytes * number of parameters = 16.
  add  esp, 16

  ; Takedown stack frame: set esp to the new stack top and restore ebp.
  mov esp, ebp
  pop ebp

  ; Return 0.
  xor eax, eax 
  ret   
