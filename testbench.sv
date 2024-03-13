`timescale 1ns / 1ps

module testbench();

	logic [31:0] rs1_i, rs2_i;
	logic [3:0] funct;
	logic [31:0] rd_o;
	
	ALU ALU0(rs1_i, rs2_i, funct, rd_o);
	
	
	initial begin
		rs1_i <= 0;
		rs2_i <= 0;
		funct <= 0;
		
		
		
		#10; // add
		funct <= 4'b0000;
		rs1_i <= $random();
		rs2_i <= $random();
		
		#10; // sub !!!!!!!!!!!!!!!!!!!!
		funct <= 4'b1000;
		rs1_i <= $random();
		rs2_i <= $random();
		
		#10; // sll
		funct <= 4'b0001;
		rs1_i <= $random();
		rs2_i <= $urandom_range(31);
		
		#10; // slt !!!!!!!!!!!!!!!
		funct <= 4'b0010;
		rs1_i <= $random();
		rs2_i <= $random();
		
		#10; // sltu
		funct <= 4'b0011;
		rs1_i <= $urandom_range(999999);
		rs2_i <= $urandom_range(999999);
		
		#10; // xor
		funct <= 4'b0100;
		rs1_i <= $random();
		rs2_i <= $random();
		
		#10; // srl
		funct <= 4'b0101;
		rs1_i <= $random();
		rs2_i <= $urandom_range(31);
		
		#10; // sra
		funct <= 4'b1101;
		rs1_i <= $random();
		rs2_i <= $urandom_range(31);
		
		
		
		
		
		#10; // or
		funct <= 4'b0110;
		rs1_i <= $random();
		rs2_i <= $random();
		
		#10; // and
		funct <= 4'b0111;
		rs1_i <= $random();
		rs2_i <= $random();
		
		#10
		
		$finish;
	end
	
	//always #5 clk_i = ~clk_i;
endmodule

//module testbench();
//
//	logic [31:0] rs1_i, rs2_i;
//	logic [31:0] rd_o;
//	
//	subtractor_sign SBS0(rs1_i, rs2_i, rd_o);
//	
//	initial begin
//		rs1_i <= 0;
//		rs2_i <= 0;
//		
//		#5
//		rs1_i <= $random();
//		rs2_i <= $random();
//		
//		#5
//		rs1_i <= $random();
//		rs2_i <= $random();
//		
//		#5
//		rs1_i <= $random();
//		rs2_i <= $random();
//		
//		#5
//		rs1_i <= $random();
//		rs2_i <= $random();
//		
//		#5
//		rs1_i <= $random();
//		rs2_i <= $random();
//		
//		#5
//		rs1_i <= 12345;
//		rs2_i <= 245;
//		
//		#5
//		$finish;
//		
//	end
//
//endmodule

//module testbench();
//
//	logic [31:0] a_i, b_i, c_i;
//	logic [1:0] se_i;
//	logic [31:0] ans_o;
//	
//	mux3to1_32bit MU0(a_i, b_i, c_i, se_i, ans_o);
//	
//	initial begin
//		a_i <= 0;
//		b_i <= 0;
//		c_i <= 0;
//		se_i <= 3'b00;
//		
//		#5;
//		a_i <= $random();
//		b_i <= $random();
//		c_i <= $random();
//		se_i <= 3'b00;
//		
//		#5;
//		a_i <= $random();
//		b_i <= $random();
//		c_i <= $random();
//		se_i <= 3'b01;
//		
//		#5;
//		a_i <= $random();
//		b_i <= $random();
//		c_i <= $random();
//		se_i <= 3'b10;
//		
//		#5;
//		a_i <= $random();
//		b_i <= $random();
//		c_i <= $random();
//		se_i <= 3'b011;
//		
//	end
//
//endmodule
