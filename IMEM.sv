module IMEM( // A read-only memory for fetching instructions
	input logic [31:0] addr_i,
	input logic rst_n_i,
	output logic [31:0] inst_o
	);
	
	logic [31:0] mem [1023:0];
	
	assign inst_o = (rst_n_i == 1'b0) ? 32'b0 : mem[addr_i];
	
/*
	initial begin
		// ADDI x15, x0, 50    imm=000000110010, rs1=00000, funt3=000, rd=01111, opcode=0010011
		$readmemh("memfile.txt", mem); 
	end
*/
	
	initial begin
		//mem[0] = 32'h0000_0000;
		mem[0] = 32'h0320_0793;
	end
	
endmodule

	