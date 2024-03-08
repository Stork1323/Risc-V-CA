module DMEM( // A memory for loading(read) or storing(write) data words
	input logic [31:0] addr_i, dataW_i,
	input logic MemWR_i,
	input logic clk_i,
	output logic [31:0] dataR_o
	);
	
	logic [31:0] temp;
	mux2to1_32bit M0(addr_i, dataW_i, MemWR_i, temp);
	assign dataR_o = temp;
	
	always_ff @(posedge clk_i) begin
		dataR_o <= temp;
	end
	
endmodule
