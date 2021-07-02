
# Day 2

## ABI
```
  Registers and memory
	64-bit registers (XLEN=64), little-endian memory
		x0 zero | x1 return addr | x2 sp | x3 global pointer | x4 thread pointer | x8 s0/frame ptr
		x5-x7/t0-t2 temporaries
		x8/s0 - saved / frame ptr
		x9/s1 - saved
		x10-17/a0-a7 argument registers
		x18-27/s2-11 saved reigsters
		x28-31/t3-6 temporaries
	Load, Add, Store
	instruction, destination register, offset/immediate, source register
		three forms of instructions ; all registers represented w/in 5 bits (1<<5 = 32)
		I-type - operates on registers and/or immediate
			i.e., ld immediate[31:20] | rs1[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0] 
		R-type - operates on registers
			i.e., add funct7[31:25] | rs2[24:20] | rs1[19:15] | funct3[14:12] | rd[11:7] | opcode[6:0]
		S-type - operates for storage
			i.e., sd immediate[31:25] | rs2[24:20] | rs1[19:15] | funct3[14:12] | immediate[4:0] | opcode[6:0]
	Memory allocation + stack
```

## Lab

```
% riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o 1to9_custom.o 1to9_custom.c load.S

‌$ spike pk 1to9_custom.o
bbl loader
z  0000000000000000 ra 00000000000100c4 sp 0000003ffffffb40 gp 0000000000022a08
tp 0000000000000000 t0 0000000000010338 t1 000000000000000f t2 0000000000000000
s0 0000000000000000 s1 0000000000000000 a0 0000000000000000 a1 000000000000000a
a2 0000000000000000 a3 0000000000000010 a4 0000000000000001 a5 0000000000000000
a6 000000000000001f a7 0000000000000000 s2 0000000000000000 s3 0000000000000000
s4 0000000000000000 s5 0000000000000000 s6 0000000000000000 s7 0000000000000000
s8 0000000000000000 s9 0000000000000000 sA 0000000000000000 sB 0000000000000000
t3 0000000000000000 t4 0000000000000000 t5 0000000000000000 t6 0000000000000000
pc 0000000000000000 va/inst 0000000000000000 sr 8000000200006020
User fetch segfault @ 0x0000000000000000

whoops: 
Disassembly of section text (should be .text)

Basic Verification using iVerilog (TLVerilog)
% git clone https://github.com/kunalg123/riscv_workshop_collaterals.git
labs/picorv32.v
labs/rv32im.sh - build hex firmware image and simulate 
```
