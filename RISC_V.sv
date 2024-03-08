module RISC_V(
	input logic [31:0] inst_i,
	input logic clk_i,
	output logic sig_o
	);
	
	logic WE_w; // write enable wire for PC
	logic [31:0] address_w; // address feed back for PC
	logic [31:0] pc_w; // wire contain PC value
	logic RegWEn_w; // write enable register signal from control logic
	logic [31:0] Reg1_w, Reg2_w; // values of reg1 and reg2 from register file
	logic [31:0] dataB_w; // data turn back from foreward stage
	logic [31:0] inst_w; // instruction from IMEM block
	logic [4:0] rsW_w, rsR1_w, rsR2_w; // addresses of registers
	logic [1:0] AluOp_w; // signal use to select operation of ALU block
	
	// Currently this module contain datapaths of cpu
	
	PC PC0(.WE_i(WE_w), .clk_i(clk_i), .data_i(address_w), .data_o(pc_w));
	Stage_IF IF0(.pc_i(pc_w), .pc_o(address_w));
	
	IMEM I0(.addr_i(pc_w), .inst_o(inst_w));
	Stage_ID ID0(.inst_i(inst_w), .rsW_o(rsW_w), .rsR1_o(rsR1_w), .rsR2_o(rsR2_w));
	
	Reg R0(.rsW_i(rsW_w), .rs1_i(rsR1_w), .rs2_i(rsR2_w),
			 .clk_i(clk_i), .RegWEn_i(RegWEn_w), .dataW_i(dataB_w),
			 .data1_o(Reg1_w), .data2_o(Reg2_w));
	ALU AL0(.a_i(Reg1_w), .b_i(Reg2_w), .AluOp_i(AluOp_w), .Result_o(dataB_w));
	
	//testing
	logic [31:0] N_w;
	//shift_left #(2) SL(.value_i(32'h0000_0111), .value_o(N_w));
	
endmodule
