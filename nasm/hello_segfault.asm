; Compile, link and execute:
; nasm -f elf64 hello_segfault.asm && ld hello_segfault.o && ./a.out
; Should segfault

; Where we store runtime data (RAM data)
section .data 
  message db "Hello World", 10
; db: data bytes
; 10: endline, '\n'

; Where we store the intructions
section .text

global _start
_start:
  ; Move 1 to rax register: tells the OS we're gonna write something.
  mov rax, 1
  ; Move 1 to rdi register: tells the OS we're gonna write to the console.
  mov rdi, 1
  ; Move message to rsi register: from RAM memory to the CPU.
  mov rsi, message
  ; Move 12 to rdx register: the length of message variable, the bytes to print.
  mov rdx, 12
  ; After confuguring instuctions, call the OS to perform them.
  syscall
