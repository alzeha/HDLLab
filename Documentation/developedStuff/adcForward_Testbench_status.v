//Verilog HDL for "HDL_lab", "adcForward_Testbench_status" "functional"


module adcForward_Testbench_status (clk,status_in,count_in , status_change);

	input clk;
	input[1:0] status_in;
	input[15:0] count_in;
	output status_change;
	reg status_out;
	reg flag_state_0, flag_state_1, flag_state_2, flag_state_3;
	reg [15:0] counter_helper;

	assign status_change = status_out;

	initial begin
		status_out <= 1'b0;
		flag_state_0 <= 1'b0;
		flag_state_1 <= 1'b0;
		flag_state_2 <= 1'b0;
		flag_state_3 <= 1'b0;
	end

	always @(posedge clk) begin
		case (status_in)

			2'b00: begin
					if (~flag_state_0) begin
						counter_helper <= count_in;
						flag_state_3 <= 1'b0;
						flag_state_0 <= 1'b1;
						status_out <= 1'b0;
					end
					if (count_in >=counter_helper+100) begin
						status_out <= 1'b1;
					end 
				    else status_out <= 1'b0;
				   end

			2'b01: begin
						if(~flag_state_1) begin
							counter_helper <= 16'h0;
							flag_state_0 <= 1'b0;
							flag_state_1 <= 1'b1;
							status_out <= 1'b0;
						end
						else if(counter_helper < 100) begin
							 status_out <= 1'b0;
							counter_helper <= counter_helper + 1;
						end
						else status_out <= 1'b1;
				   end

			2'b10: begin
					if (~flag_state_2) begin
						counter_helper <= count_in;
						flag_state_1 <= 1'b0;
						flag_state_2 <= 1'b1;
						status_out <= 1'b0;
					end
					if (count_in <=counter_helper-100) begin
						status_out <= 1'b1;
					end 
					else  status_out <= 1'b0;
				   end
			2'b11: begin
						if(~flag_state_3) begin
							counter_helper <= 16'h0;
							flag_state_2 <= 1'b0;
							flag_state_3 <= 1'b1;
							status_out <= 1'b0;					
						end
						else if(counter_helper < 100) begin
							 status_out <= 1'b0;
							counter_helper <= counter_helper + 1;
						end
						else status_out <= 1'b1;
				   end
		endcase
	end	

endmodule
