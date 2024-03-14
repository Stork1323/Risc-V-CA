`ifndef DEFINE_sv
`define DEFINE_sv

// Opcode of all types in RISC-V
`define OP_Rtype 		 0110011
`define OP_Itype 		 0010011
`define OP_Itype_load 0000011
`define OP_Stype 		 0100011
`define OP_Btype 		 1100011
`define OP_JAL 		 1101111
`define OP_LUI 		 0110111
`define OP_AUIPC 		 0010111
`define OP_JALR 		 1100111

// ALU function decode from funct3 and bit 5 of funct7
`define ADD  0000
`define SUB  1000
`define SLL  0001
`define SLT  0010
`define SLTU 0011
`define XOR  0100
`define SRL  0101
`define SRA  1101
`define OR   0110
`define AND  0111
`define B	 1111 // in case of grab only immediate value in LUI instruction

// Immediate generation type 
`define I_TYPE 000
`define S_TYPE 001
`define B_TYPE 010
`define J_TYPE 011
`define U_TYPE 100

// Control signal (funct3) for Branch Comparator
`define BEQ  000
`define BNE  001
`define BLT  100
`define BGE  101
`define BLTU 110
`define BGEU 111

`endif
