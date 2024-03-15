`include "define.sv"

module Control_Logic(
	input logic [31:0] inst_i,
	input logic BrEq_i, BrLt_i,
	output logic RegWEn_o,
	output logic [3:0] AluSel_o, // same as AluOp
	output logic Bsel_o,
	output logic [2:0] ImmSel_o,
	output logic MemRW_o,
	output logic [1:0] WBSel_o,
	output logic BrUn_o,
	output logic PCSel_o,
	output logic Asel_o
	);

	logic [6:0] opcode_r;
	logic [2:0] funct3;
	logic [6:0] funct7;
	
	assign opcode_r = inst_i[6:0];
	assign funct3 = inst_i[14:12];
	assign funct7 = inst_i[31:25];
	
	assign RegWEn_o = (opcode_r == `OP_Stype) | // S type & B type
							(opcode_r == `OP_Btype) ? (1'b0) : (1'b1);
	
	// 10 instructions R type
	assign AluSel_o = ((opcode_r == `OP_Btype) | (opcode_r == `OP_JAL) | (opcode_r == `OP_Itype_load) |
							(opcode_r == `OP_Stype) | (opcode_r == `OP_AUIPC) | (opcode_r == `OP_JALR)) ? `ADD :
							(opcode_r == `OP_LUI) ? `B : {funct7[5], funct3};
	
	assign Bsel_o = (opcode_r == `OP_Rtype) ? 1'b0 : 1'b1;
	
	assign ImmSel_o = ((opcode_r == `OP_Itype) | (opcode_r == `OP_JALR) | (opcode_r == `OP_Itype_load)) ? `I_TYPE : 
							(opcode_r == `OP_Stype) 																			 ? `S_TYPE : 
							(opcode_r == `OP_Btype)																				 ? `B_TYPE : 
							(opcode_r == `OP_JAL)   																			 ? `J_TYPE : 
							((opcode_r == `OP_LUI) | (opcode_r == `OP_AUIPC))											 ? `U_TYPE : 3'bxxx;
	
	assign MemRW_o = (opcode_r == `OP_Stype) ? 1'b1 : 1'b0;
	
	assign WBSel_o = (opcode_r == `OP_Itype_load) 							? 2'b00 : 
						  ((opcode_r == `OP_JAL) | (opcode_r == `OP_JALR)) ? 2'b10 : 2'b01;
	
	assign BrUn_o = ((funct3 == `BLTU) | (funct3 == `BGEU)) ? 1'b1 : 1'b0;
	
	assign PCSel_o = (((funct3 == `BEQ) & (BrEq_i))  | 
						  ((funct3 == `BNE) & (~BrEq_i))  | 
						  ((funct3 == `BLT) & (BrLt_i))   | 
						  ((funct3 == `BGE) & (~BrLt_i))  |
						  ((opcode_r == `OP_JAL) | (opcode_r == `OP_JALR))) ? 1'b1 : 1'b0;
	
	assign Asel_o = ((opcode_r == `OP_Btype) |
						 (opcode_r == `OP_JAL)    | 
						 (opcode_r == `OP_AUIPC)) ? 1'b1 : 1'b0;
	
endmodule
