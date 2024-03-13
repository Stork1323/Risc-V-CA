`include "define.sv"

module Control_Logic(
	input logic [31:0] inst_i,
	output logic RegWEn_o,
	output logic [3:0] AluSel_o, // same as AluOp
	output logic Bsel_o,
	output logic ImmSel_o
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
	assign AluSel_o = {funct7[5], funct3};
	
	assign Bsel_o = (opcode_r == `OP_Itype) ? 1'b1 : 1'b0;
	
	assign ImmSel_o = (opcode_r == `OP_Itype) ? 1'b1 : 1'b0;

	
endmodule
