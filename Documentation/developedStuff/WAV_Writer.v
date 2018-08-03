//Verilog HDL for "HDL_Lab", "WAV_Writer" "functional"


module WAV_Writer( clk, in_L, in_R );
	
	input clk;
	input [23:0] in_L, in_R;
	integer fw;
	reg [23:0] Sig_L,Sig_R;

	

	parameter File_Directory = "/home/vhdlp4/Desktop/Ergebnis.wav"; // Directory writing File
	parameter integer Recording_Time_ms = 1000;
	parameter integer Sample_Rate_Hz = 44100; //Hz
	reg [31:0] Samples;

	initial begin

   		
		fw = $fopen(File_Directory, "w"); // Write File open
		
		Samples = Recording_Time_ms*4*Sample_Rate_Hz; // Bytes per ms
		
		$fwrite(fw,"%u",32'h46464952); //RIFF
		$fwrite(fw,"%u",Samples+36); //write subchunk2size
		$fwrite(fw,"%u",32'h45564157); //WAVE
		$fwrite(fw,"%u",32'h20746d66); //FMT
		$fwrite(fw,"%u",32'h00000010); //SUbchunk1Size
		$fwrite(fw,"%u",32'h00020001); //Audio FOrmat/NumChannels
		$fwrite(fw,"%u",Sample_Rate_Hz); //Sample Rate
		$fwrite(fw,"%u",Sample_Rate_Hz*4); //Byte Rate
		$fwrite(fw,"%u",32'h00100004); //Block Align
		$fwrite(fw,"%u",32'h61746164); //Data
		$fwrite(fw,"%u",Samples); //write subchunk2size


	end
	
	always @(posedge clk) begin
		
		if(in_L > 32767) begin
			Sig_L = in_L-32768;
			$fwrite(fw,"%c",Sig_L[7:0]);
			$fwrite(fw,"%c",Sig_L[15:8]);
		end
		else begin
			Sig_L = in_L+32768;
			$fwrite(fw,"%c",Sig_L[7:0]);
			$fwrite(fw,"%c",Sig_L[15:8]);

		end
		if(in_R > 32767)begin
			Sig_R = in_R-32768;
			$fwrite(fw,"%c",Sig_R[7:0]);
			$fwrite(fw,"%c",Sig_R[15:8]);

		end
		else begin
			Sig_R = in_R+32768;
			$fwrite(fw,"%c",Sig_R[7:0]);
			$fwrite(fw,"%c",Sig_R[15:8]);

		end
		
	end

endmodule
