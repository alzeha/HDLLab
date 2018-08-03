// VerilogA for HDL_lab, dac, veriloga

`include "constants.vams"
`include "disciplines.vams"

//Convention : LSB = bit 0
module dac (clk, in, out);

	parameter integer BIT_WIDTH = 16;
	parameter real REF_VOLTAGE = 1.2;

	input clk;
	input [BIT_WIDTH-1:0] in;
	output out;


	electrical [BIT_WIDTH-1:0] in;
	electrical clk;
	electrical out;

	integer sum;
	
	analog begin : label
		genvar i;
		@(cross(V(clk), +1)) begin
			sum = 0;

			for(i=0;i<BIT_WIDTH;i=i+1) begin
				sum = sum + (1<<i)*V(in[i])/1.2;
			end
		end 
		V(out) <+ sum * REF_VOLTAGE;
	end
endmodule

