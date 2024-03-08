module Stage_IF( // stage instruction fetch
	input logic [31:0] pc_i,
	input logic [31:0] pc_o
	);
	
	logic overf; // this version has not processed the overerflow case yet
	adder_32bit A0(pc_i, 32'h0000_0004, pc_o, overf);
	
endmodule

