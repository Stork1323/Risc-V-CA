/*
	This current module compute 10 R-type instructions
*/

module ALU(
	input logic [31:0]  rs1_i,  rs2_i,
	input logic [3:0] AluOp_i, // Alu_op[2:0] = funct3, Alu_op[3] = funct7[5]
	output logic [31:0] Result_o
	);
	
//	logic [31:0] temp0, temp1, temp2, temp3, temp4, temp5;
//	logic overflow0, overflow1; // currently this version have not process overflow
//	
//	and_32bit A0( rs1_i,  rs2_i, temp0);
//	or_32bit O0( rs1_i,  rs2_i, temp1);
//	mux2to1_32bit M0(temp0, temp1, AluOp_i[0], temp2);
//	
//	adder_32bit AD0( rs1_i,  rs2_i, temp3, overflow0);
//	subtractor_32bit S0( rs1_i,  rs2_i, temp4, overflow1);
//	mux2to1_32bit M1(temp3, temp4, AluOp_i[0], temp5);
//	
//	mux2to1_32bit M2(temp2, temp5, AluOp_i[1], Result_o);
//	
//	// AluOp_i = 00->and; 01->or; 10->add; 11->subtract

	logic [7:0] cond;
	logic [32:0] sum, sub;
	logic [31:0] shift_left_r, slt_r, sltu_r, xor_r, srl_r, sra_r, or_r, and_r;
	logic [31:0] temp_ans_r[8]; // contain temporary answer
	decode3to8 DE0(AluOp_i[2:0], cond);
	
	// funct3 = 000
	adder_32bit AD0( rs1_i,  rs2_i, sum[31:0], sum[32]);
	subtractor_32bit SB0( rs1_i,  rs2_i, sub[31:0], sub[32]);
	mux3to1_32bit MU0(sum[31:0], sub[31:0], 32'b0, {(~cond[0]), AluOp_i[3]}, temp_ans_r[0]);
	
	// funct3 = 001
	shift_left_logical SLL0( rs1_i,  rs2_i, shift_left_r);
	mux2to1_32bit MU1(temp_ans_r[0], shift_left_r, cond[1], temp_ans_r[1]);
	
	// funct3 = 010
	set_less_than SLT0(rs1_i, rs2_i, slt_r);
	mux2to1_32bit MU2(temp_ans_r[1], slt_r, cond[2], temp_ans_r[2]);
	
	// funct3 = 011
	set_less_than_unsign SLTU0(rs1_i, rs2_i, sltu_r);
	mux2to1_32bit MU3(temp_ans_r[2], sltu_r, cond[3], temp_ans_r[3]);
	
	// funct3 = 100
	xor_32bit XOR0(rs1_i, rs2_i, xor_r);
	mux2to1_32bit MU4(temp_ans_r[3], xor_r, cond[4], temp_ans_r[4]);
	
	// funct3 = 101
	shift_right_logical SRL0(rs1_i, rs2_i, srl_r);
	shift_right_arithmetic SRA0(rs1_i, rs2_i, sra_r);
	mux3to1_32bit MU5(srl_r, sra_r, temp_ans_r[4], {(~cond[5]), AluOp_i[3]}, temp_ans_r[5]);
	
	// funct3 = 110
	or_32bit OR0(rs1_i, rs2_i, or_r);
	mux2to1_32bit MU6(temp_ans_r[5], or_r, cond[6], temp_ans_r[6]);
	
	// funct3 = 111
	and_32bit AND0(rs1_i, rs2_i, and_r);
	mux2to1_32bit MU7(temp_ans_r[6], and_r, cond[7], temp_ans_r[7]);
	
	assign Result_o = temp_ans_r[7];
	
	
endmodule

	
	