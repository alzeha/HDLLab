//Verilog HDL for "HDL_lab", "counterWithAdjustableStepwidth" "functional"


module counterWithAdjustableStepwidth (clk, upnotdown, stepwidth_in, out);

	input clk, upnotdown;
	input [15:0] stepwidth_in;
	output[15:0] out;

	reg[15:0] count;

	initial begin
		count = 0;
	end

	assign out = count;

	always @(posedge clk) begin
	
		if (upnotdown) begin
			count <= (count+stepwidth_in < (1<<16)) ? count + stepwidth_in : count;
		end
		else begin
			count <= (count-stepwidth_in > count) ? count : count - stepwidth_in;
		end
	
	end

endmodule
