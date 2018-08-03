//Verilog HDL for "HDL_lab", "stepwidth_gen_addtenpercent" "functional"


module stepwidth_gen_addtenpercent (in, out);

	input[15:0] in;
	output[15:0] out;

	assign out = (in < 128) ? (16'd128) : (in << 1);

endmodule
