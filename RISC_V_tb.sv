`timescale 10ns / 10ps

module RISC_V_tb();

`define clk 50

	logic clk_i = 1'b0;
	logic rst_ni;
	
	RISC_V CPU(
		.clk_i(clk_i),
		.rst_ni(rst_ni)
	);
	
	initial begin
		$dumpfile("Risc-v_processor.vcd");
		$dumpvars(0);
	end
	
	initial begin
		rst_ni <= 1'b0;
		#150;
		
		rst_ni <= 1'b1;
		#2000;
		$finish;
	end
	
	always #(`clk) clk_i = ~clk_i;

endmodule

