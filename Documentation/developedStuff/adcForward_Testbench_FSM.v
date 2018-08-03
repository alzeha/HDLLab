//Verilog HDL for "HDL_lab", "adcForward_Testbench_FSM" "functional"
`timescale 100ns/100ps

module adcForward_Testbench_FSM (status_in, v_actual, v_signal, status_out);

	input status_in;
	output[1:0] status_out;
	output[15:0] v_actual, v_signal;

	reg[1:0] current_state;
	reg[15:0] v_actual_reg, v_signal_reg;

	always @(posedge status_in) begin
		current_state <= current_state+1;	
	end

	always @(current_state) begin
		case (current_state)
			2'b00: begin
						v_actual_reg <= 16'h1;
						v_signal_reg <= 16'h1;
					end
			2'b01:begin
						v_actual_reg <= 16'h6;
						v_signal_reg <= 16'h2;
					end
			2'b10:begin
						v_actual_reg <= 16'h6;
						v_signal_reg <= 16'h1;
					end
			2'b11:begin
						v_actual_reg <= 16'h4;
						v_signal_reg <= 16'h1;
					end
		endcase
	end

	assign v_actual = v_actual_reg;
	assign v_signal = v_signal_reg;
	assign status_out = current_state;
	
	initial begin
		current_state <=2'b0;
		
	end


endmodule
