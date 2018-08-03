//Verilog HDL for "HDL_lab", "converterFromADC" "functional"


module converterFromADC (in, out );

	input [15:0] in;
	output [23:0] out;

	assign out[15:0] = in;
	assign out[23:16] = 8'h00;

endmodule
