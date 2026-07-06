# Logical Instructions Assembly Lab

## Objective

The objective of this lab is to learn how to perform logical instructions in Assembly language using NASM on a Linux operating system.

## Program Description

This program demonstrates two logical operations:

1. **XOR Instruction**

   * The program shows that XORing a register with itself changes its value to **0**.
   * The value from `var1` is loaded into the `EAX` register.
   * The instruction `xor eax, eax` clears the register.
   * The result is stored in the `result` variable.

2. **TEST Instruction**

   * The program demonstrates a practical use of the `TEST` instruction.
   * It checks whether the value in `var2` is even or odd.
   * The instruction `test eax, 1` examines the least significant bit without changing the value in the register.
   * If the Zero Flag is set, the number is even and `isEven` is set to `1`.
   * Otherwise, the number is odd and `isEven` is set to `0`.

## Flowchart

```text
Start
  |
  v
Load var1 into EAX
  |
  v
XOR EAX, EAX
  |
  v
Store 0 in result
  |
  v
Load var2 into EAX
  |
  v
TEST EAX, 1
  |
  +---- Is Zero Flag set? ----+
  |                           |
 Yes                         No
  |                           |
Store 1 in isEven       Store 0 in isEven
  |                           |
  +------------+--------------+
               |
               v
          Exit Program
```

## Challenges

The biggest challenge was understanding how the `TEST` instruction works. Unlike the `AND` instruction, `TEST` does not store a result. Instead, it updates the processor flags, which are then used by conditional jump instructions such as `JZ`. Another challenge was learning how to debug the program using GDB and watch variables change as each instruction executes.

## How to Compile

```bash
nasm -f elf32 logical.asm -o logical.o
ld -m elf_i386 logical.o -o logical
```

## How to Run

```bash
./logical
```

## Debugging

Run GDB:

```bash
gdb ./logical
```

Then enter the following commands:

```gdb
layout asm
layout regs
watch (int) result
watch (int) isEven
break _start
run
stepi
```

## Files Included

* `logical.asm` – Assembly source code
* `README.md` – Lab documentation

## Expected Results

* The XOR instruction changes the value in `EAX` to **0**.
* The variable `result` becomes **0**.
* The TEST instruction checks whether `var2` is even or odd.
* Since `var2` is initialized to **10**, the variable `isEven` is set to **1**, indicating that the number is even.
