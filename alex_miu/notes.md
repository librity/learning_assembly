# [x86 NASM Assembly Crash Course](https://www.youtube.com/watch?v=DNPjBvZxE3E)

## Three `section`s

### `section .data`

Define constant variables:
strings, magic numbers (codes), terminating strings, etc.

### `section .bss`

Reserve space in memory for future data.

### `section .text`

The program's instructions.

Required label:

- `_start`: for linking with `ld`.
- `main`: for linking with `gcc`.

## Registers

Hardware-implemented variables.

### 32 Bit

<p align="center">
  <img src="./registers.png" />
</p>

#### General Purpose Registers

Can be used for anything even though they have an intended use.

- `eax`: Accumulator register, where the result of arithmetic operations is stored.
  Can also store the syscall instruction (see `unistd_32.h`).
- `ecx`: Counter, for incrementing, decrementing and controlling loops.
- `esi` and `edi`: Source and Destination Indexes, for copying large pieces of data.
- `esp`: Stack Pointer, points to the top of the data stack.
- `ebp`: Base Pointer, points to the bottom of the data stack.

#### Flags Register

Each bit means something.

- `CF`: Carry Flag, is the result of the last operation in a carry-over?
- `OF`: Overflow Flag
- `ZF`: Zero Flag, is the result of the last operation end in a zero?
- `SF`: Sign Flag, is the result of the last operation negative?
- `PF`: Parity Flag, is the result of the last operation even?

### 64 Bit

Can also use 32-bit registers.

- `rax`: 64-bit `eax` (see `unistd_64.h`).

## Instructions

### Move

```nasm
; Copy data from src to dest.
mov dest, src

; Zero-Extended Move, zero out dest and copy data from src to dest.
movzx dest, src
; Zero out eax and copy the first byte of the address pointed at by ebx to it.
movzx eax, byte ptr [ebx]

; Sign-Extended Move,
; if src is negative then dest is filled with 1s before the copy.
; if src is positive then dest is filled with 0s before the copy.
movsx dest, src
```

### Bitwise

```nasm
; And (&), operate bx and ax bits and store result in ax.
and ax, bx

; Or (|), operate bx and ax bits and store result in ax.
or ax, bx

; Exclusive Or (^), operate bx and ax bits and store result in ax.
xor ax, bx

; Check whether src and dest are equal and store result in the flag register.
test ax, bx
```

### Arithmetic

```nasm
; Add ax with bx and store result in ax.
add ax, bx

; Subtract ax with bx and store result in ax.
sub ax, bx

; Multiply ax and bx and store in dx:ax.
mul bx

; Divide dx:ax by bx and store in ax and Rdx (the remainder).
div bx
```

### Jump

```nasm
; Jump to label1.
jmp label1

; If Zero Flag equals 1 jump to label1.
je label1
; If Zero Flag equals 0 jump to label1.
jne label1

; Jump Zero.
jz label1

; Jump Carry.
jc label1

; Jump Overflow.
jo label1

; Jump Sign Flag.
js label1

; Jump Greater.
jg label1
; Jump Greater Than Or Equal To.
jge label1

; Jump Less.
jl label1
; Jump Less Than Or Equal To.
jle label1

; Jump Above.
ja label1
; Jump Above Equal.
jae label1

; Jump Below.
jb label1
; Jump Below Equal.
jbe label1
```

### Call

```nasm
call label1
```

## Resources

### `movsx`

- https://courses.ics.hawaii.edu/ReviewICS312/morea/DataSizeAndArithmetic/ics312_datasize.pdf
- https://www.felixcloutier.com/x86/movsx:movsxd
- https://stackoverflow.com/questions/47350568/yasm-movsx-movsxd-invalid-size-for-operand-2

### Parity

- https://en.wikipedia.org/wiki/Parity_bit

### Markdown

- https://github.com/github/linguist/blob/master/lib/linguist/languages.yml
- https://github.com/github/linguist
- https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks
- https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
