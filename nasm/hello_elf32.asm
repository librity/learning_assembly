; Compile, link and execute:
; nasm -f elf32 hello_elf32.asm && ld -m elf_i386 hello_elf32.o && ./a.out

; Where we store the intructions
section .text

global _start

_start:
  ; Write "Hello World!\n" to STDOUT:
  ; ssize_t write(int fd, const void *buf, size_t count);
  ; Move 4 to eax 32-bit register: Use the write syscall (unistd_32.h).
  mov eax, 0x4
  ; Use STDOUT as the file descriptor.
  mov ebx, 0x1
  ; Use the message as the buffer.
  mov ecx, message
  ; Set the amount of bytes to write.
  mov edx, message_length
  ; Interrupt with code 128: Invoke the syscall.
  int 0x80

  ; Exit the program gracefully:
  ; Use the exit (1) syscall (unistd_32.h).
  mov eax, 0x1
  ; Set the progam return value ($?).
  mov ebx, 0x0
  int 0x80

section .data 
  message: db "Hello World!", 0xA
  ; Set message_length equal to the length of message (NASM syntax).
  message_length equ $-message
