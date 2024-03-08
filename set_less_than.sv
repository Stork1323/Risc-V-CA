module set_less_than(
	input logic [31:0] rs1_i, rs2_i,
	output logic [31:0] rd_o
	);
	
	logic [31:0] dif_v;
	//logic overf_v; // overflow of the result from subtractor
	//logic ans_v; // answer of operation
	subtractor_sign SUB0(rs1_i, rs2_i, dif_v);
	assign rd_o = {{30{1'b0}}, dif_v[31]};
	
	
endmodule

//module mux2to1_1(
//	input logic a_i, b_i,
//	input logic se_i,
//	output logic result_o
//	);
//	
//	assign result_o = (a_i & (~se_i)) | (b_i & se_i);
//	
//endmodule
