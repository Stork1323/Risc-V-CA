`timescale 1ns / 1ps

module testbench();

	logic [2:0] data1_i;
	logic [7:0] result_o;
	//logic [32:0] dif_o;
	//integer N = 3;
	// logic clk_i;
	
	decode3to8 D0(data1_i,  result_o);
	
	
	initial begin
		data1_i <= 0;
		
		#10;
		
		data1_i <= $urandom_range(7);
		#5;
		
		
		data1_i <= $urandom_range(7);
		
		#15;
		
		
		data1_i <= $urandom_range(7);
		
		#20;
		
		
		data1_i <= $urandom_range(7);
	
		#10;
		
		data1_i <= $urandom_range(7);
		
		#10;
		
		data1_i <= $urandom_range(7);
		
		#10;
		
		data1_i <= $urandom_range(7);
		
		#10;
		
		data1_i <= $urandom_range(7);
		#10;
		
		data1_i <= $urandom_range(7);
		
		#10;
		
		data1_i <= $urandom_range(7);
		
		#10;
		
		$finish;
	end
	
	//always #5 clk_i = ~clk_i;
endmodule
