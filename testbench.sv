`timescale 1ns / 1ps

module testbench();

	logic [31:0] data_i;
	logic [31:0] result_o;
	//integer N = 3;
	// logic clk_i;
	
	shift_right_arithmetic #(5) SR0 (data_i, result_o);
	
	
	initial begin
		data_i <= 0;
		
		#10;
		
		data_i <= $urandom_range(999999);
		
		#5;
		
		
		data_i <= $urandom_range(999999);
		
		#15;
		
		
		data_i <= $urandom_range(999999);
		
		#20;
		
		
		data_i <= $urandom_range(999999);
	
		#10;
		
		data_i <= $urandom_range(999999);
		
		#10;
		
		data_i <= $urandom_range(999999);
		
		#10;
		
		data_i <= $urandom_range(999999);
		
		#10;
		
		$finish;
	end
	
	//always #5 clk_i = ~clk_i;
endmodule
