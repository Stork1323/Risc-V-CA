
module Reg( // Register File
	input logic [31:0] dataW_i,
	input logic [4:0] rsW_i, rs1_i, rs2_i,
	input logic RegWEn_i,
	input logic clk_i,
	output logic [31:0] data1_o, data2_o
	);
	
	logic [31:0] Regs [31:0]; // 32 bit register
	//assign Regs[0] = {{32{1'b0}}};
	
	// Write data on register
	logic [31:0] temp;
	mux2to1_32bit M0(Regs[rsW_i], dataW_i, RegWEn_i, temp);
	
	
	
	always_ff @(posedge clk_i) begin
		Regs[rsW_i] <= temp;
	end
	
	// Update data output
	assign data1_o = Regs[rs1_i];
	assign data2_o = Regs[rs2_i];
	
endmodule

	