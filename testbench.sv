`timescale 1ns / 1ps

module testbench();

	logic [31:0] data1_i;
	logic [31:0] data2_i;
	logic [1:0] AluOp_i;
	logic [31:0] result_o;
	// logic clk_i;
	
	ALU Al0(data1_i, data2_i, AluOp_i, result_o);
	
	
	initial begin
		data1_i <= 32'b0;
		data2_i <= 32'b0;
		AluOp_i <= 2'b0;
		
		#10;
		
		data1_i <= $urandom_range(9999999);
		data2_i <= $urandom_range(9999999);
		AluOp_i <= $urandom_range(3);
		#5;
		
		
		data1_i <= $urandom_range(9999999);
		data2_i <= $urandom_range(9999999);
		AluOp_i <= $urandom_range(3);
		#15;
		
		
		data1_i <= $urandom_range(9999999);
		data2_i <= $urandom_range(9999999);
		AluOp_i <= $urandom_range(3);
		#20;
		
		
		data1_i <= $urandom_range(9999999);
		data2_i <= $urandom_range(9999999);
		AluOp_i <= $urandom_range(3);
		#10;
		
		data1_i <= $urandom_range(9999999);
		data2_i <= $urandom_range(9999999);
		AluOp_i <= $urandom_range(3);
		#10;
		
		data1_i <= $urandom_range(9999999);
		data2_i <= $urandom_range(9999999);
		AluOp_i <= $urandom_range(3);
		#10;
		
		data1_i <= $urandom_range(9999999);
		data2_i <= $urandom_range(9999999);
		AluOp_i <= $urandom_range(3);
		#10;
		
		$finish;
	end
	
	//always #5 clk_i = ~clk_i;
endmodule
