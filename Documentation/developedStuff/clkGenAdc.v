//Verilog HDL for "HDL_lab", "clkGenAdc" "functional"
`timescale 100ns/100ps

module clkGenAdc (clk);

	output clk;
	reg clk;
	initial 
	begin
	clk = 1;
	end

	always 
	begin
	#1 clk = ~clk;
	end

endmodule
