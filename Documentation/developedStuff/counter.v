module counter (clk, en, upnotdown, stepwidth_out, out);

	input clk, en, upnotdown;
	output [15:0] stepwidth_out;
	output[15:0] out;

	parameter integer STEPWIDTH = 100;

	reg[15:0] count;

	initial begin
		count = 0;
	end

	assign out = count;

	assign stepwidth_out = STEPWIDTH;

	always @(posedge clk) begin
		if(en) begin
			if (upnotdown) begin
				count <= (count+STEPWIDTH < (1<<16)) ? count + STEPWIDTH : count;
			end
			else begin
				count <= (count-STEPWIDTH > count) ? count : count - STEPWIDTH;
			end
		end
	end
 
endmodule
