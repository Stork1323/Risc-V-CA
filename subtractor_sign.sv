module subtractor_sign(
	input logic [31:0] rs1_i, rs2_i,
	output logic [31:0] rd_o
	);
	
	logic overf1, overf2, overf3, overf4, overf5, overf6;
	logic [31:0] ans1, ans2, ans3;
	logic [31:0] rs1_ne, rs2_ne;
	logic [31:0] temp1, temp2;
	
	adder_32bit AD0((~rs1_i), 32'b1, rs1_ne, overf1);
	adder_32bit AD1((~rs2_i), 32'b1, rs2_ne, overf2);
	
	
	subtractor_32bit SB0(rs1_i, rs2_i, ans1, overf3);
	adder_32bit AD2(rs1_i, rs2_ne, ans2, overf4);
	adder_32bit AD3(rs1_ne, rs2_i, temp1, overf5);
	adder_32bit AD4((~temp1), 32'b1, ans3, overf6);
	
	//mux2to1_32bit MU0(ans1, ans2, (rs1_i[31] ^ rs2_i[31]), ans4);
	mux3to1_32bit MU1(ans1, ans2, ans3, {rs1_i[31], rs2_i[31]}, temp2); // only 3 cases 
	mux2to1_32bit MU2(temp2, ans1, (rs1_i[31] & rs2_i[31]), rd_o); // left case
	
	
endmodule
