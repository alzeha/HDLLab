//Verilog HDL for "HDL_Lab", "WAV_Reader" "functional"


module WAV_Reader( clk, out_L, out_R );
	
	input clk;
	output reg [23:0] out_L, out_R;
	integer fp,char,i;
	reg [7:0] A,B,C,D;
	reg [15:0] Sum_L,Sum_R;
	reg [31:0] Number_Samples = 0;
	reg [31:0] Return_Value;
	
	parameter source_File_Directory = "/home/vhdlp4/HDL_Lab_UMC_65/WAVE-Verilog/Example_Sounds/Ex_1.wav"; // Source Wav-File

	initial begin
		
		i = 0;
   		fp = $fopen(source_File_Directory, "r");
		
		out_L[23:0] = 32768;
		out_R[23:0] = 32768;
		A = 0;
		B = 0;
		C = 0;
		D = 0;
		
		char = 0;

		char = $fread(Return_Value,fp); //RIFF
		char = $fread(Return_Value,fp); //write subchunk2size
		char = $fread(Return_Value,fp); //WAVE
		char = $fread(Return_Value,fp); //FMT
		char = $fread(Return_Value,fp); //SUbchunk1Size
		char = $fread(Return_Value,fp); //Audio FOrmat/NumChannels
		char = $fread(Return_Value,fp); //Sample Rate
		char = $fread(Return_Value,fp); //Byte Rate
		char = $fread(Return_Value,fp); //Block Align
		char = $fread(Return_Value,fp); //Data
		char = $fread(A,fp); //read subchunk2size
		char = $fread(B,fp); //read subchunk2size
		char = $fread(C,fp); //read subchunk2size
		char = $fread(D,fp); //read subchunk2size
		Number_Samples = A +(B<<8) + (C << 16) + (D << 24); // length of audio file
		Number_Samples = Number_Samples/4;
	end
	
	always @(posedge clk) begin
		
		if(i < Number_Samples) begin
		
			// Left Channel
			char = $fread(A,fp);	
			char = $fread(B,fp);
		
			if(B[7] == 1)begin // signed to unsigned integer
				Sum_L = A + (B << 8) - 32768;		
			end
			else begin
				Sum_L = A + (B << 8) + 32768;
			end
			out_L = Sum_L;

			// Right Channel
			char = $fread(C,fp);
			char = $fread(D,fp);
			if(D[7] == 1)begin
				Sum_R = C + (D << 8) - 32768;
			end
			else begin
				Sum_R = C + (D << 8) + 32768;
			end
			out_R = Sum_R;
			i = i +1;
		end
	end

endmodule
