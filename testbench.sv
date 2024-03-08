`timescale 1ns / 1ps

module testbench();

	logic [31:0] data1_i;
	logic [31:0] result_o;
	//integer N = 3;
	// logic clk_i;
	
	shift_left #(4) SL0(data1_i, result_o);
	
	
	initial begin
		data1_i <= 0;
		
		#10;
		
		data1_i <= $urandom_range(9999999);
		
		#5;
		
		
		data1_i <= $urandom_range(9999999);
		
		#15;
		
		
		data1_i <= $urandom_range(9999999);
		
		#20;
		
		
		data1_i <= $urandom_range(9999999);
	
		#10;
		
		data1_i <= $urandom_range(9999999);
		
		#10;
		
		data1_i <= $urandom_range(9999999);
		
		#10;
		
		data1_i <= $urandom_range(9999999);
		
		#10;
		
		$finish;
	end
	
	//always #5 clk_i = ~clk_i;
endmodule
