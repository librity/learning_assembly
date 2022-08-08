# learning_assembly

- https://en.wikipedia.org/wiki/Assembly_language

## Assemblers

- https://en.m.wikipedia.org/wiki/Comparison_of_assemblers
- https://en.m.wikipedia.org/wiki/Netwide_Assembler
- https://github.com/yasm/yasm
- https://en.m.wikipedia.org/wiki/GNU_Assembler
- https://en.m.wikipedia.org/wiki/FASM

## Hello World!

```nasm
; nasm -f elf64 hello_world.asm && ld hello_world.o && ./a.out

section .data
  message db "Hello World", 10

section .text

global _start
_start:
  mov rax, 1
  mov rdi, 1
  mov rsi, message
  mov rdx, 12
  syscall
  mov rax, 60
  mov rdi, 0
  syscall
```

## C to Assembly

```bash
$ gcc -S hello.c
```

### Videos

- https://www.youtube.com/watch?v=iYRl50gtprA

## NASM, the Netwide Assembler

```bash
$ sudo apt install nasm
```

- https://github.com/netwide-assembler/nasm
- https://nasm.us/docs.php
- https://marketplace.visualstudio.com/items?itemName=doinkythederp.nasm-language-support
- https://www.nasm.us/xdoc/2.15.05/nasmdoc.pdf

### Videos

- https://www.youtube.com/watch?v=015dEE3NnZg
- https://www.youtube.com/watch?v=skRyVBM8yX0
- https://www.youtube.com/watch?v=HgEGAaYdABA

## Find `syscall` Codes

With locate:

```bash
$ sudo apt install plocate
$ locate unistd_32.h
```

With fd/find:

```bash
$ fd unistd_32.h /
```
