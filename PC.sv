module PC( // Program Counter
	input logic [31:0] data_i,
	//input logic WE_i, // Write Enable
	input logic clk_i,
	input logic rst_n_i,
	output logic [31:0] data_o
	);
	
	//logic [31:0] mem;
	//logic [31:0] pc;
	
	//mux2to1_32bit MU0(mem, data_i, WE_i, pc);
	
	always_ff @(posedge clk_i) begin
		//if (WE_i) data_o <= data_i;
		if (~rst_n_i) data_o <= 32'b0;
		else data_o <= data_i;
		//mem <= data_o;
	end
	
endmodule
