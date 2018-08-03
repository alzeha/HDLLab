//Verilog HDL for "HDL_lab", "converterToDAC" "functional"


module converterToDAC (in, out );

	input [23:0] in;
	output [15:0] out;

	assign out = in[15:0];	

endmodule
