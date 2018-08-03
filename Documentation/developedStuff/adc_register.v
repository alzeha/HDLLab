module adc_register (clk, in, out );
	
	input clk;
	input [15:0] in;
	output [15:0] out;

	reg[3:0] counter;
	reg[15:0] out_reg;
	reg[15:0] in_reg;

	assign out = out_reg;

	initial begin
		counter = 0;
	end

	initial begin
		out_reg <= 0;
		in_reg <= 0;
	end

	always@(posedge clk) begin
		in_reg <= in;
		if (counter == 4'b1010) begin
			counter <= 4'b0;
			out_reg <= in_reg;
		end
		else begin
			counter <= counter +1;
		end
	end	

endmodule

