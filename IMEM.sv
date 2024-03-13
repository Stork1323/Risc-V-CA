module IMEM( // A read-only memory for fetching instructions
	input logic [31:0] addr_i,
	output logic [31:0] inst_o
	);
	
	logic [31:0] mem [1023:0];
	
	assign inst_o = mem[addr_i];
	
	//initial begin
	// upload memory file
	//end
	
endmodule

	