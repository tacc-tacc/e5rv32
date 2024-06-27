module ctrl_DE (input clk, reset, clear,
				input [2:0] Fun3D,
				input [6:0] Fun7D,
				input [4:0] ALUControlD,
				input ALUSrcAD,
				input [1:0] ALUSrcBD,
				input ResultSrcD, 
				input RegWriteD, FRegWriteD, MemWriteD,
				input [1:0] JmpD,
				input FPUEnableD,
				input [1:0] FRegReadD,
				input ADDRSrcD,
				output reg [2:0] Fun3E,
				output reg [6:0] Fun7E,
				output reg [4:0] ALUControlE,
				output reg ALUSrcAE,
				output reg [1:0] ALUSrcBE,
				output reg ResultSrcE,
				output reg RegWriteE, FRegWriteE, MemWriteE,
				output reg [1:0] JmpE,
				output reg FPUEnableE,
				output reg [1:0] FRegReadE,
				output reg ADDRSrcE);
		  
	reg limpiando;

	always @(negedge clk, negedge reset)
    begin
		if (~reset)
        begin
			Fun3E <= 0;
			Fun7E <= 0;
			ALUControlE <= 0;
			ALUSrcAE <= 0;
			ALUSrcBE <= 0;
			ResultSrcE <= 0;
			RegWriteE <= 0;
			FRegWriteE <= 0;
			MemWriteE <= 0;
			JmpE <= 0;
			FPUEnableE <= 0;
			limpiando <= 1;
			FRegReadE <= 0;
			ADDRSrcE <= 0;
		end
		
		else if (clear)
		begin
			Fun3E <= 0;
			Fun7E <= 0;
			ALUControlE <= 0;
			ALUSrcAE <= 0;
			ALUSrcBE <= 0;
			ResultSrcE <= 0;
			RegWriteE <= 0;
			FRegWriteE <= 0;
			MemWriteE <= 0;
			JmpE <= 0;
			FPUEnableE <= 0;
			limpiando <= 1;
			FRegReadE <= 0;
			ADDRSrcE <= 0;		
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
			FRegWriteE <= FRegWriteD;
			MemWriteE <= MemWriteD;
			JmpE <= JmpD;
			FPUEnableE <= FPUEnableD;
			FRegReadE <= FRegReadD;
			ADDRSrcE <= ADDRSrcD;
		end			
	end
  
endmodule


    