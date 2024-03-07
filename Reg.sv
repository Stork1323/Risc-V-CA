module Reg( // Register File
	input logic [31:0] dataW_i,
	input logic [4:0] rsW_i, rs1_i, rs2_i,
	input logic RegWEn_i,
	input logic clk_i,
	output logic [31:0] data1_o, data2_o
	);
	
	logic [31:0] reg_r0; // 32 bit register
	logic [31:0] reg_r1;
	logic [31:0] reg_r2;
	logic [31:0] reg_r3;
	logic [31:0] reg_r4;
	logic [31:0] reg_r5;
	logic [31:0] reg_r6;
	logic [31:0] reg_r7;
	logic [31:0] reg_r8;
	logic [31:0] reg_r9;
	logic [31:0] reg_r10;
	logic [31:0] reg_r11;
	logic [31:0] reg_r12;
	logic [31:0] reg_r13;
	logic [31:0] reg_r14;
	logic [31:0] reg_r15;
	logic [31:0] reg_r16;
	logic [31:0] reg_r17;
	logic [31:0] reg_r18;
	logic [31:0] reg_r19;
	logic [31:0] reg_r20;
	logic [31:0] reg_r21;
	logic [31:0] reg_r22;
	logic [31:0] reg_r23;
	logic [31:0] reg_r24;
	logic [31:0] reg_r25;
	logic [31:0] reg_r26;
	logic [31:0] reg_r27;
	logic [31:0] reg_r28;
	logic [31:0] reg_r29;
	logic [31:0] reg_r30;
	logic [31:0] reg_r31;
	
	always_ff @(posedge clk_i) begin
	
	end
	
endmodule

	