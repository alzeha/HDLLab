//Verilog HDL for "HDL_lab", "stepwidth_gen_testbench_helperReg" "functional"


module stepwidth_gen_testbench_helperReg (clk, in, out);

	input clk;
	input[15:0] in;
	output[15:0] out;

	reg[15:0] out_reg;

	assign out = out_reg;

	initial begin
		out_reg = 0;
	end

	always@(posedge clk) begin
		out_reg <= in;
	end

endmodule
