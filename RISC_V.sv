`include "define.sv"

module RISC_V(
	input logic clk_i
	);
	logic RegWEn_w, Bsel_w, MemRW_w, BrEq_w, BrLt_w, PCSel_w, BrUn_w, Asel_w;
	logic overf_pc_r;
	logic [31:0] pc_w, pc4_w, inst_w, dataWB_w, rs1_w, rs2_w, imm_w, rs2_pre_w, alu_w, dataW_w, mem_w;
	logic [31:0] pc_in_w, rs1_pre_w;
	logic [3:0] AluSel_w;
	logic [1:0] WBSel_w;
	logic [2:0] ImmSel_w;
	
	mux2to1_32bit M2(
		.a_i(pc4_w),
		.b_i(alu_w),
		.se_i(PCSel_w),
		.c_o(pc_in_w)
		);
	
	PC PC(
		.data_i(pc_in_w), 
		//.WE_i(WE_w), 
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
		.data1_o(rs1_pre_w),
		.data2_o(rs2_pre_w)
		);
		
	Branch_Comp BC(
		.rs1_i(rs1_pre_w),
		.rs2_i(rs2_pre_w),
		.BrUn_i(BrUn_w),
		.BrEq_o(BrEq_w),
		.BrLt_o(BrLt_w)
		);
		
	Imm_Gen IG(
		.inst_i(inst_w[31:7]),
		.ImmSel_i(ImmSel_w),
		.imm_o(imm_w)
		);
		
	mux2to1_32bit M0(
		.a_i(rs2_pre_w),
		.b_i(imm_w),
		.se_i(Bsel_w),
		.c_o(rs2_w)
		);
		
	mux2to1_32bit M3(
		.a_i(rs1_pre_w),
		.b_i(pc_w),
		.se_i(Asel_w),
		.c_o(rs1_w)
		);
		
	ALU ALU(
		.rs1_i(rs1_w),
		.rs2_i(rs2_w),
		.AluSel_i(AluSel_w),
		.Result_o(alu_w)
		);
		
	DMEM DMEM(
		.addr_i(alu_w),
		.dataW_i(rs2_pre_w),
		.MemRW_i(MemRW_w),
		.clk_i(clk_i),
		.dataR_o(mem_w)
		);
		
//	mux2to1_32bit M1(
//		.a_i(mem_w),
//		.b_i(alu_w),
//		.se_i(WBSel_w),
//		.c_o(dataWB_w)
//		);
	mux3to1_32bit M1(
		.a_i(mem_w),
		.b_i(alu_w),
		.c_i(pc4_w),
		.se_i(WBSel_w),
		.r_o(dataWB_w)
		);
		
	Control_Logic CL(
		.inst_i(inst_w),
		.BrEq_i(BrEq_w),
		.BrLt_i(BrLt_w),
		.RegWEn_o(RegWEn_w),
		.AluSel_o(AluSel_w),
		.Bsel_o(Bsel_w),
		.ImmSel_o(ImmSel_w),
		.MemRW_o(MemRW_w),
		.WBSel_o(WBSel_w),
		.BrUn_o(BrUn_w),
		.PCSel_o(PCSel_w),
		.Asel_o(Asel_w)
		);
	
endmodule








