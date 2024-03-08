module Stage_ID( // stage instruction decode + read register
	input logic [31:0] inst_i,
	output logic [4:0] rsW_o, rsR1_o, rsR2_o
	);
	
	assign rsW_o = inst_i[11:7];
	assign rsR1_o = inst_i[19:15];
	assign rsR2_o = inst_i[24:20];
	
	
	
endmodule
