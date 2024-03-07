module ALU(
	input logic [31:0] a_i, b_i,
	input logic [1:0] AluOp_i, // select operations: AluOp_i[0]=0->and, AluOp_i[0]=1->or, AluOp_i[0]=0->add, AluOp_i[0]=1->subtract, AluOp_i[1] select between 2 result before
	output logic [31:0] Result_o
	);
	
	logic [31:0] temp0, temp1, temp2, temp3, temp4, temp5;
	logic overflow0, overflow1; // currently this version have not process overflow
	
	and_32bit A0(a_i, b_i, temp0);
	or_32bit O0(a_i, b_i, temp1);
	mux2to1_32bit M0(temp0, temp1, AluOp_i[0], temp2);
	
	adder_32bit AD0(a_i, b_i, temp3, overflow0);
	subtractor_32bit S0(a_i, b_i, temp4, overflow1);
	mux2to1_32bit M1(temp3, temp4, AluOp_i[0], temp5);
	
	mux2to1_32bit M2(temp2, temp5, AluOp_i[1], Result_o);
	
	// AluOp_i = 00->and; 01->or; 10->add; 11->subtract
	
endmodule

	
	