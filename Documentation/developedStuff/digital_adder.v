//Verilog HDL for "HDL_lab", "digital_adder" "functional"


module digital_adder (in1,in2,upnotdown,out );

	input upnotdown;
	input [15:0] in1, in2;
	output [15:0] out;

	assign out = (upnotdown) ? 
						((((1 << 17) -1) > (in1 + in2)) ? (in1 + in2) : ((1 << 17) - 1)) :
						( (in1 >= (in1 - in2)) ? (in1 - in2) : 0 );

endmodule
