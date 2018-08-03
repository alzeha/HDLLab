//Verilog HDL for "HDL_lab", "downsampling" "functional"


module downsampling (clk, rst, in, out );

	input clk, rst;
	input [23:0] in;
	output [23:0] out;

	reg [23:0] hold;

	reg flag;

	assign out = hold;

	always@(posedge clk) begin
		if (rst) begin
			flag <= 1;
			hold <= 0;
		end
		else begin
			if (flag) begin
				hold <= in;
			end
			flag <= ~flag;
		end

	end

endmodule
