module RISC_V(
	input logic clk_i
	);
	logic WE_w, RegWEn_w, Bsel_w, ImmSel_w;
	logic overf_pc_r;
	logic [31:0] pc_w, pc4_w, inst_w, dataWB_w, rs1_w, rs2_w, imm_w, rs2_pre_w;
	logic [3:0] AluOp_w;
	
	PC PC(
		.data_i(pc4_w), 
		.WE_i(WE_w), 
		.clk_i(clk_i), 
		.data_o(pc_w)
		);
	
	adder_32bit PC_add4(
		.a_i(pc_w),
		.b_i(32'h04),
		.re_o(pc4_w),
		.c_o(overf_pc_r)
		);
	
	IMEM IMEM(
		.addr_i(pc_w),
		.inst_o(inst_w)
		);
		
	Reg Reg(
		.dataW_i(dataWB_w),
		.rsW_i(inst_w[11:7]),
		.rs1_i(inst_w[19:15]),
		.rs2_i(inst_w[24:20]),
		.RegWEn_i(RegWEn_w),
		.clk_i(clk_i),
		.data1_o(rs1_w),
		.data2_o(rs2_pre_w)
		);
		
	Imm_Gen IG(
		.inst_i(inst_w[31:20]),
		.ImmSel_i(ImmSel_w),
		.imm_o(imm_w)
		);
		
	mux2to1_32bit M0(
		.a_i(rs2_pre_w),
		.b_i(imm_w),
		.se_i(Bsel_w),
		.c_o(rs2_w)
		);
		
	ALU ALU(
		.rs1_i(rs1_w),
		.rs2_i(rs2_w),
		.AluOp_i(AluOp_w),
		.Result_o(dataWB_w)
		);
		
	
	
endmodule








