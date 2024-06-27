module deco_op(
	input [6:0] OpD,
	input [2:0] Fun3D,
	input [6:0] Fun7D,
	output [2:0] ImmSrcD,
	output [4:0] ALUControlD,
	output ALUSrcAD,
	output [1:0] ALUSrcBD,
	output ResultSrcD,	
	output RegWriteD,
	output FRegWriteD,
	output MemWriteD,
	output [1:0] JmpD,
	output FPUEnableD,
	output [1:0] FRegReadD,
	output ADDRSrcD
);

wire ALUDebeSumarD; 
wire [16:0] ctrl;
assign {ImmSrcD, ALUDebeSumarD, ALUSrcAD, ALUSrcBD, ResultSrcD, RegWriteD, FRegWriteD, MemWriteD, JmpD, FPUEnableD, FRegReadD, ADDRSrcD} = ctrl;
//Saltos: 00 -> desactivado, 01 -> relativo condicional, 10 -> jal, 11 -> jalr


wire shifti = ~Fun3D[1] & Fun3D[0]; //shift con valor inmediato -> trunco a los últimos 5 bits

always_comb
	case(OpD)
		// ImmSrcD_ALUDebeSumarD_ALUSrcAD_ALUSrcBD_ResultSrcD_RegWriteD_FRegWriteD_MemWriteD_JmpD_FPUEnableD_FRegReadD_ADDRSrcD
		7'b0000011: ctrl <= 17'b000_1_1_00_1_1_0_0_00_0_00_1; // lw
		7'b0100011: ctrl <= 17'b001_1_1_00_0_0_0_1_00_0_00_1; // sw
		7'b0110011: ctrl <= 17'bxxx_0_0_00_0_1_0_0_00_0_00_0; // R–type
		7'b1100011: ctrl <= 17'b010_0_0_00_x_0_0_0_01_0_00_0; // B-type
		7'b0010011: ctrl <= {shifti, shifti, 1'b0, 14'b0_0_01_0_1_0_0_00_0_00_0}; // I–type ALU
		7'b1101111: ctrl <= 17'b011_1_0_00_0_1_0_0_10_0_00_0; // jal
		7'b0010111: ctrl <= 17'b100_1_1_10_0_1_0_0_00_0_00_0; // auipc
		7'b0110111: ctrl <= 17'b100_1_1_01_0_1_0_0_00_0_00_0; // lui
		7'b1100111: ctrl <= 17'b000_1_0_01_0_1_0_0_11_0_00_1; // jalr
		7'b0000111: ctrl <= 17'bxxx_1_1_00_1_0_1_0_00_0_10_1; // FLW
		7'b0100111: ctrl <= 17'bxxx_1_1_00_0_0_0_1_00_0_10_1; // FSW
		7'b1010011: 
			case(Fun7D)
				7'b1101000: ctrl <= 17'bxxx_0_0_00_0_1_0_0_00_1_10_0; // FCVT.S.W
				7'b1100000: ctrl <= 17'bxxx_0_0_00_0_0_1_0_00_1_00_0; // FCVT.W.S
				7'b1110000: ctrl <= 17'bxxx_1_0_00_0_1_0_0_00_0_10_0; // FMV.X.w
				7'b1111000: ctrl <= 17'bxxx_1_0_00_0_0_1_0_00_0_00_0; // FMV.W.X
				default: ctrl <= 17'bxxx_0_0_00_0_0_1_0_00_1_11_0; // F-type
			endcase
		default: 	ctrl <= 17'bxxx_x_x_xx_x_0_0_0_00_0_00_0;
	endcase

	// Primer bit: si es tipo M o si es tipo I/R
	// Segundo bit: modifica la operación (alterna entre suma/resta, shift lógico/artimético, etc)
	assign ALUControlD [4:3] = {Fun7D[0] & OpD[5] & ~ALUDebeSumarD, Fun7D[5] & (OpD[5] | shifti) & ~ALUDebeSumarD};
	
	// Los últimos tres bits son Fun3, a menos que esté forzada la suma en la ALU
	assign ALUControlD [2:0] = ALUDebeSumarD ? 3'b000 : Fun3D;
endmodule