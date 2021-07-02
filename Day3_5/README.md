# RISC-V_MYTH_Workshop

For students of "Microprocessor for You in Thirty Hours" Workshop, offered by for VLSI System Design (VSD) and Redwood EDA, find here accompanying live info and links.

Refer to README at [stevehoover/RISC-V_MYTH_Workshop](https://github.com/stevehoover/RISC-V_MYTH_Workshop) for lab instructions.

Add your codes in the [calculator_solutions.tlv](calculator_solutions.tlv) and [risc-v_solutions.tlv](risc-v_solutions.tlv) files and **keep committing** to your repository after every lab.

# Day 3

## Combinatorial Logic
* Logic Gates
   * ```NOT (~ !) AND (& &&) OR (| ||) XOR (^) NAND (!(&)) NOR (!(|)) NXOR (!(^))```

* Multiplexer (MUX) - 6+ ways to code a mux in Verilog
   * ```assign f = s ? x1 : x2``` (just like C; f passes x1 when s is 1, x2 otherwise)
   * can combine ternary operators to reflect more complex cases

* Vector
   * When declaring a vector for the first time, need to be explicit about the range if they differ.
   * ```$out[4:0] = $in1[3:0] + $in2[3:0];```
   * Representing a vector ```2'b00```

* Makerchip NAV-TLV highlights matching components in both diagram and code

### Combinatorial Logic / Calculator Labs
![a](Screenshot%202021-06-10%20221021.png)
![b](Screenshot%202021-06-10%20224729.png)

## Sequential Logic
* Sequenced by a clock signal
* D-Flip Flop: next state becomes current state on rising clock edge
* Reset puts the system (all flip flops) into a known initial state
* ```>>1``` previous value ```>>2``` previous previous value
* "ahead by 1" operator: use the value from the previous transaction in the pipeline

### Verilog Syntax for Constants
* ```16'hF0``` (16-bit width, hexidecimal, value) 
* ```'0``` : all 0's
* ```'X``` : All don't care
* ```16'd5```: decimal 5
* ```5'b00XX1``` : 5w/2 don't care bits
* ```1```: 32-bit signed 1 

* Constraints: zero-extend or truncate on width mismatch, no X's (verilator)

## Pipelines
* Awkward to code in legacy Verilog ; 1/3-1/4 size in TL-Verilog ; stages enforced by convention
* Enables clock to run at a higher frequency ; higher throughput
* Calculate Pythagorean Theorem over 3 stages; extend comb. calculator to sequential
* Reasonable to get 20 layers deep of logic, with more logic can be too complex to match clock cycle
* Timing abstract representation for |pipeline with multiple stages : flip flops implied by use of stages
   * Separate the function from implementation
   * Timing changes - overall behavior doesn't change
   * Spread across multiple stages to accomodate timing behaviors like propagation
   * Pitfall: Could attempt to consume values not yet produced
* All TL-Verilog is pipelined; but it is not explicit by default

## TL Verilog Syntax Identifiers and Types
* symbol prefix (dd) , delimiter (\_) , signal
* must start w/2 alpha chars
* $low_case : pipe signal
* $CamelCase : state signal
* $UP_CASE : keyword signal
* numbers cannot be by themselves

![a](Screenshot%202021-06-10%20225959.png)
![b](Screenshot%202021-06-11%20001211.png)

# Day 4

## Decoding Instruction Type

![a](Screenshot%202021-06-11%20220155.png)

## Decoding Instructions

![c](Screenshot%202021-06-11%20230912.png)

# Day 5

## Three-stage pipeline

![a](Screenshot%202021-06-12%20112415.png)

![b](Screenshot%202021-06-12%20123532.png)

## Implementing branching instructions

![a](Screenshot%202021-06-12%20135818.png)

## Implementing remaining RV32I instructions

![a](Screenshot%202021-06-12%20142609.png)

## Implementing load and store instructions

![a](Screenshot%202021-06-12%20172553.png)

## Final RISC-V Core after implementing jump instructions

![a](Screenshot%202021-06-12%20172716.png)
![b](Screenshot%202021-06-12%20181633.png)
