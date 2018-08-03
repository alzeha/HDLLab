//Verilog HDL for "HDL_lab", "stepwidth_chooser_digital_out_mux" "functional"


module stepwidth_chooser_digital_out_mux (in1, in2, in3, select, out );

	input[15:0] in1, in2, in3;
	input[1:0] select;

	output[15:0] out;

	assign out = (select == 2'b0) ? 
									in1 :
									((select == 2'b11) ?
														in3 :
														in2);

endmodule
