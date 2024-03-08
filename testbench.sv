`timescale 1ns / 1ps

module testbench();

	logic [31:0] data1_i, data2_i;
	logic [31:0] result_o;
	//logic [32:0] dif_o;
	//integer N = 3;
	// logic clk_i;
	
	set_less_than S0(data1_i, data2_i, result_o);
	
	
	initial begin
		data1_i <= 0;
		data2_i <= 0;
		
		#10;
		
		data1_i <= $random();
		data2_i <= $random();
		
		#5;
		
		
		data1_i <= $random();
		data2_i <= $random();
		
		#15;
		
		
		data1_i <= $random();
		data2_i <= $random();
		
		#20;
		
		
		data1_i <= $random();
		data2_i <= $random();
	
		#10;
		
		data1_i <= $random();
		data2_i <= $random();
		
		#10;
		
		data1_i <= $random();
		data2_i <= $random();
		
		#10;
		
		data1_i <= $random();
		data2_i <= $random();
		
		#10;
		
		data1_i <= $random();
		data2_i <= $random();
		
		#10;
		
		data1_i <= $random();
		data2_i <= $random();
		
		#10;
		
		data1_i <= $random();
		data2_i <= $random();
		
		#10;
		
		$finish;
	end
	
	//always #5 clk_i = ~clk_i;
endmodule
