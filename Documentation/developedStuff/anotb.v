//Verilog HDL for "HDL_lab", "anotb" "functional"


module anotb (a,b,out);

	input a,b;
	output out;

	assign out = a && ~b;

endmodule
