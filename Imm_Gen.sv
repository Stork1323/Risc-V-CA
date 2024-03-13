module Imm_Gen(
	input logic [11:0] inst_i,
	input logic ImmSel_i,
	output logic [31:0] imm_o
	);
		
	assign imm_o = {{20{1'b0}}, inst_i};
	
endmodule

