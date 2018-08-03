//Verilog HDL for "HDL_lab", "stepwidth_gen_reducetenpercent" "functional"


module stepwidth_gen_reducetenpercent (in, out);

	input[15:0] in;
	output[15:0] out;

	assign out = in >> 1;

endmodule
