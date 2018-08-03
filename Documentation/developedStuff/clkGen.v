//Verilog HDL for "HDL_lab", "clkGen" "functional"
`timescale 100ns/100ps

module clkGen (clk, rst);

	parameter integer FKHZ = 1000;
	localparam real I_MAX = 1000/(FKHZ);

	output clk,rst;
	reg clk,rst;
	initial 
	begin
	clk = 1;
	rst = 1;
	end

	integer i;
	always begin
		for (i=0; i<(I_MAX*10); i=i+2) begin
			#1;
		end
	rst = 0;
	clk = ~clk;
	end

endmodule
