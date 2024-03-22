module DMEM( // A memory for loading(read) or storing(write) data words
	input logic [31:0] addr_i, dataW_i,
	input logic MemRW_i,
	input logic clk_i,
	input logic rst_n_i,
	output logic [31:0] dataR_o
	);
	
	logic [31:0] mem [1023:0];
	
	always_ff @(posedge clk_i) begin
		if (MemRW_i) mem[addr_i] <= dataW_i;
	end
	
	assign dataR_o = (rst_n_i == 1'b0) ? 32'b0 : mem[addr_i];
	
endmodule
