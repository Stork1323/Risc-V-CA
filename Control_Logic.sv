module Control_Logic(
	input logic [31:0] inst_i,
	output logic RegWEn_o,
	output logic [1:0] AluSel_o // same as AluOp
	);
	
`define Op_Rtype = 7'b0110011;

	
	logic [6:0] type_v; // value for what type of instruction
	assign type_v = inst_i[6:0];
	
	

	
endmodule
