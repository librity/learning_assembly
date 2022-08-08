# [x86 NASM Assembly Crash Course](https://www.youtube.com/watch?v=DNPjBvZxE3E)

## 3 `sections`s

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

- `rax`: Sets the syscall instruction (see `unistd_64.h`).

## Instructions

### Move

- `mov dest, src`: Copy data from `src` to `dest`.
- `movzx dest, src`: Zero-Extend, zero out `dest` and copy data from `src` to `dest`.
  - `movzx eax, byte ptr [ebx]`: Zero out `eax`
    and copy the first byte of the address pointed at by `ebx` to it.
- `movsx dest, src`: Sign-Extend
  - if `src` is negative then `dest` is filled with `1`s before the copy.
  - if `src` is positive then `dest` is filled with `0`s before the copy.

### Bitwise

- `and ax, bx`: And `&` operate `bx` and `ax` bits and store result in `ax`.
- `or ax, bx`: Or `|` operate `bx` and `ax` bits and store result in `ax`.
- `xor ax, bx`: Exclusive Or `^` operate `bx` and `ax` bits and store result in `ax`.
- `test ax, bx`: Check whether `src` and `dest` are equal and store result in the flag register.

### Arithmetic

- `add ax, bx`: Add `ax` with `bx` and store result in `ax`.
- `sub ax, bx`: Subtract `ax` with `bx` and store result in `ax`.
- `mul bx`: Multiply `ax` and `bx` and store in `dx:ax`.
- `div bx`: Divide `dx:ax` by `bx` and store in `ax` and `Rdx` (the remainder).

## Resources

### `movsx`

- https://courses.ics.hawaii.edu/ReviewICS312/morea/DataSizeAndArithmetic/ics312_datasize.pdf
- https://www.felixcloutier.com/x86/movsx:movsxd
- https://stackoverflow.com/questions/47350568/yasm-movsx-movsxd-invalid-size-for-operand-2

### Markdown

- https://github.com/github/linguist/blob/master/lib/linguist/languages.yml
- https://github.com/github/linguist
- https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks
- https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
