# learning_assembly

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

### Videos

- https://github.com/netwide-assembler/nasm
- https://nasm.us/docs.php
- https://marketplace.visualstudio.com/items?itemName=doinkythederp.nasm-language-support
- https://www.nasm.us/xdoc/2.15.05/nasmdoc.pdf

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
