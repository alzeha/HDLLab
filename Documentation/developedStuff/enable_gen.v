//Verilog HDL for "HDL_lab", "enable_gen" "functional"


module enable_gen (a,b,c,out);

	input a,b,c;
	output out;

	assign out = a && b || ~b && ~c ;

endmodule
