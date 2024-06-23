module ctrl_DE (input clk, reset, clear,
				input [2:0] Fun3D,
				input [6:0] Fun7D,
				input [4:0] ALUControlD,
				input ALUSrcAD,
				input [1:0] ALUSrcBD,
				input [1:0] ResultSrcD, 
				input RegWriteD, MemWriteD,
				input [1:0] JmpD,
				input FPUEnableD,
				output reg [2:0] Fun3E,
				output reg [6:0] Fun7E,
				output reg [4:0] ALUControlE,
				output reg ALUSrcAE,
				output reg [1:0] ALUSrcBE,
				output reg [1:0] ResultSrcE,
				output reg RegWriteE, MemWriteE,
				output reg [1:0] JmpE,
				output reg FPUEnableE);
		  
	reg limpiando;

	always @(negedge clk)
    begin
		if (~reset | clear)
        begin
			Fun3E <= 0;
			Fun7E <= 0;
			ALUControlE <= 0;
			ALUSrcAE <= 0;
			ALUSrcBE <= 0;
			ResultSrcE <= 0;
			RegWriteE <= 0;
			MemWriteE <= 0;
			JmpE <= 0;
			FPUEnableE <= 0;
			limpiando <= 1;
		end
		
		else if (limpiando)
        begin
			limpiando <= 0;
		end
		
		else
        begin
			Fun3E <= Fun3D;
			Fun7E <= Fun7D;
			ALUControlE <= ALUControlD; 
			ALUSrcAE <= ALUSrcAD;
			ALUSrcBE <= ALUSrcBD;
			ResultSrcE <= ResultSrcD;
			RegWriteE <= RegWriteD;
			MemWriteE <= MemWriteD;
			JmpE <= JmpD;
			FPUEnableE <= FPUEnableD;
		end			
	end
  
endmodule


    