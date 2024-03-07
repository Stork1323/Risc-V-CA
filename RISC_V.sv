module RISC_V(
	input logic [31:0] a_i, b_i,
	input logic se_i,
	input logic clk_i,
	output logic [31:0] c_o
	);

	mux2to1_32bit MU0(.*);
	
endmodule
