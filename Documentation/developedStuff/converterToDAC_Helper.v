//Verilog HDL for "HDL_lab", "converterToDAC_Helper" "functional"


module converterToDAC_Helper (in, out );

	input [23:0] in;
	output[15:0] out;

	assign out = in[23:8];

endmodule
