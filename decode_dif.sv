// this module will decode the value of N to N value of 1

module decode_dif(
	input logic [4:0] N_i,
	output logic [31:0] Y_o
	);
	
//	assign Y_o[0] = N_i[0] | N_i[1] | N_i[2] | N_i[3] | N_i[4];
//	assign Y_o[1] = N_i[1] | N_i[2] | N_i[3] | N_i[4];
//	assign Y_o[2] = (N_i[0] & N_i[1]) | N_i[2] | N_i[3] | N_i[4];
//	assign Y_o[3] = N_i[2] | N_i[3] | N_i[4];
//	assign Y_o[4] = (N_i[0] & N_i[2]) | (N_i[1] & N_i[2]) | N_i[3] | N_i[4];
//	assign Y_o[5] = (N_i[1] & N_i[2]) | N_i[3] | N_i[4];
//	assign Y_o[6] = (N_i[0] & N_i[1] & N_i[2]) | N_i[3] | N_i[4] | ((~N_i[0]) & (~N_i[1]) & (~N_i[2]));
//	assign Y_o[7] = N_i[3] | N_i[4];
//	assign Y_o[8] = (N_i[0] & N_i[3]) | (N_i[1] & N_i[3]) | (N_i[2] & N_i[3]) | N_i[4];
//	assign Y_o[9] = (N_i[1] & N_i[3]) | (N_i[2] & N_i[3]) | N_i[4];
//	assign Y_o[10] = (N_i[0] & N_i[1] & N_i[3]) | (N_i[2] & N_i[3]) | N_i[4];
//	assign Y_o[11] = (N_i[2] & N_i[3]) | N_i[4];

endmodule

	
	
	