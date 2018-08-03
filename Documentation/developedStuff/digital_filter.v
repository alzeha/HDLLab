//Verilog HDL for "HDL_lab", "digital_filter" "functional"
`define PI 3.1416

//y[n] = ALPHA*K*x[n] + (1-K) * y[n-1]
//K = Tsampling / (TAU + Tsampling) = 1 / (TAU * Fsampling + 1)

module digital_filter (clk, rst, in, out );
	input clk, rst;
	input[23:0] in;
	output [23:0] out;

/*	reg [23:0] out_reg;

	parameter integer ALPHA = 1;
	parameter integer CUT_FREQ = 11025;
	parameter integer SAMPLING_FREQ = 44100;
	
	assign out = out_reg;

	always @(posedge clk) begin

		if (rst) begin
			out_reg <= 0;
		end
		else begin
			out_reg <= ALPHA * 1/( (1/(CUT_FREQ * 2 * `PI)) * SAMPLING_FREQ + 1) * in + (1- (1/( (1/(CUT_FREQ * 2 * `PI)) * SAMPLING_FREQ + 1)) ) * out_reg;    
		end
	end
*/

	parameter integer ORDER = 10; //must be even
	reg[95:0] sum;
	reg[47:0] coeff;
	reg addnotsub;
	integer i,j;
	reg[31:0] counter;
	reg[23:0] out_reg;
	
	assign out = out_reg;

	/*shift register*/
/*	shift_register #(ORDER+1) shift_reg (
							.clk    	 (clk),  
							.data_in 	 (in), 
							.data_out    (shift_register_out)
						);
*/
	/* shift reg inline start */
	integer k,l;
	reg[47:0] registers [ORDER:0];


	always @(posedge clk) begin
		for (k=ORDER-1; k >= 0; k=k-1) begin
			registers[k+1] <= registers[k]; 
		end
		registers[0] <= in;
	
	/* shift reg inline end */

		if (rst) begin
			out_reg <= 0;
			counter <= 0;
		end
		else begin
			if (counter < ORDER) begin
				counter <= counter +1;
			end
			else begin : label
				sum = 0;
				coeff = 0;
				//$display("start calculating sum");
				for (i=0; i<ORDER+1; i=i+1) begin
					
					if (i == ORDER) begin coeff = 0.5 * (1 << 24); addnotsub = 1; end
					else if ((i-ORDER) % 4 == (-3)) begin coeff = (1/(`PI*(ORDER-i)) * (1 << 24)); addnotsub = 0; end
					else if ((i-ORDER) % 2 != 0) begin coeff = (1/(`PI*(ORDER-i)) * (1 << 24)); addnotsub = 1; end
					
					if (addnotsub)	sum = sum + ((registers[i] * (1 << 24) * coeff) >> 24);
					else sum = sum - ((registers[i] * (1 << 24) * coeff) >> 24);

					sum[95:48] = 0;
				end
				out_reg <= sum[47:24];
			end
		end
	end
endmodule

/*module shift_register (clk, data_in, data_out);

	parameter integer REGS_NUMBER = 10;
	
	input clk;
	input [23:0] data_in;
	output [REGS_NUMBER * 24-1:0] data_out;
	integer i,j;

	reg[23:0] registers [0:REGS_NUMBER-1];

	reg[REGS_NUMBER * 24-1:0] data_out_reg;

	assign data_out = data_out_reg;

	always @(posedge clk) begin
		for (i=REGS_NUMBER-2; i > 0; i=i-1) begin
			registers[i+1] <= registers[i]; 
		end
		registers[0] <= data_in;

		for (i=0; i < REGS_NUMBER; i=i+1) begin
			for (j=0; j < 24; j=j+1)
				data_out_reg[j+i*24] <= registers[i][j];
		end
	end

endmodule
*/















