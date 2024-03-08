module shift_left #(parameter N = 1'b0)(
	input logic [31:0] value_i,
	output logic [31:0] value_o
	);
	
//	logic [31:0] temp [32];
//	logic cond;
//	logic [4:0] N_new;
//	
//	assign N_new = N;
//	assign cond = N_new[0] | N_new[1] | N_new[2] | N_new[3] | N_new[4]; // compare with 1
//	mux2to1_32bit MU0(.a_i(value_i), .b_i({value_i[30:1], 1'b0}), .se_i(cond), .c_o(temp[0]));
//	decrease1 D0(.N_i(N), .N_o(N_new));
	logic [31:0] cond;
	assign cond[N:0] = {1'b0, {N{1'b1}}};
	assign value_o = cond;
	
endmodule

//module decrease1(
//	input logic [4:0] N_i,
//	output logic [4:0] N_o
//	);
//	
//	logic [4:0] bor;
//	
//	full_subtractor SB0(.a_i(N_i[0]), .b_i(1'b1), .c_i(0), .d_o(N_o[0]), .b_o(bor[0]));
//	full_subtractor SB1(.a_i(N_i[1]), .b_i(1'b0), .c_i(bor[0]), .d_o(N_o[1]), .b_o(bor[1]));
//	full_subtractor SB2(.a_i(N_i[2]), .b_i(1'b0), .c_i(bor[1]), .d_o(N_o[2]), .b_o(bor[2]));
//	full_subtractor SB3(.a_i(N_i[3]), .b_i(1'b0), .c_i(bor[2]), .d_o(N_o[3]), .b_o(bor[3]));
//	full_subtractor SB4(.a_i(N_i[4]), .b_i(1'b0), .c_i(bor[3]), .d_o(N_o[4]), .b_o(bor[4]));
//	
//endmodule
