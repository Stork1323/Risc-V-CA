module PC( // Program Counter
	input logic [31:0] data_i,
	input logic WE_i, // Write Enable
	input logic clk_i,
	output logic [31:0] data_o
	);
	
	logic [31:0] mem;
	
	mux2to1_32bit MU0(32'b0, data_i, WE_i, mem);
	
	always_ff @(posedge clk_i) begin
		data_o <= data_i;
	end
	
endmodule
