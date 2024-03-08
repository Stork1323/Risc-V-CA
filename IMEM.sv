module IMEM( // A read-only memory for fetching instructions
	input logic [31:0] addr_i,
	output logic [31:0] inst_o
	);
	
	assign inst_o = addr_i;
	
endmodule

	