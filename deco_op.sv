module deco_op(
	input [6:0] OpD,
	input [2:0] Fun3D,
	input [6:0] Fun7D,
	output [2:0] ImmSrcD,
	output [4:0] ALUControlD,
	output ALUSrcAD,
	output [1:0] ALUSrcBD,
	output [1:0] ResultSrcD,	
	output RegWriteD,
	output MemWriteD,
	output [1:0] JmpD,
	output FPUEnableD
);

wire ALUDebeSumarD; 
wire [13:0] ctrl;
assign {ImmSrcD, ALUDebeSumarD, ALUSrcAD, ALUSrcBD, ResultSrcD, RegWriteD, MemWriteD, JmpD, FPUEnableD} = ctrl;
//Saltos: 00 -> desactivado, 01 -> relativo condicional, 10 -> jal, 11 -> jalr


wire shifti = ~Fun3D[1] & Fun3D[0]; //shift con valor inmediato -> trunco a los últimos 5 bits

always_comb
	case(OpD)
		// ImmSrcD_ALUDebeSumarD_ALUSrcAD_ALUSrcBD_ResultSrcD_RegWriteD_MemWriteD_JmpD_FPUEnableD
		7'b0000011: ctrl <= 14'b000_1_0_01_01_1_0_00_0; // lw
		7'b0100011: ctrl <= 14'b001_1_0_01_00_0_1_00_0; // sw
		7'b0110011: ctrl <= 14'bxxx_0_0_00_00_1_0_00_0; // R–type
		7'b1100011: ctrl <= 14'b010_0_0_00_xx_0_0_01_0; // B-type
		7'b0010011: ctrl <= {shifti, shifti, 1'b0, 11'b0_0_01_00_1_0_00_0}; // I–type ALU
		7'b1101111: ctrl <= 14'b011_1_0_00_10_1_0_10_0; // jal
		7'b0010111: ctrl <= 14'b100_1_1_10_00_1_0_00_0; // auipc
		7'b0110111: ctrl <= 14'b100_1_1_01_00_1_0_00_0; // lui
		7'b1100111: ctrl <= 14'b000_1_0_01_10_1_0_11_0; // jalr
		7'b1010011: ctrl <= 14'bxxx_0_0_00_00_1_0_00_1; // F-type		
		default: 	ctrl <= 14'bxxx_x_x_xx_xx_0_0_00_0;
	endcase

	// Primer bit: si es tipo M o si es tipo I/R
	// Segundo bit: modifica la operación (alterna entre suma/resta, shift lógico/artimético, etc)
	assign ALUControlD [4:3] = {Fun7D[0] & OpD[5] & ~ALUDebeSumarD, Fun7D[5] & (OpD[5] | shifti) & ~ALUDebeSumarD};
	
	// Los últimos tres bits son Fun3, a menos que esté forzada la suma en la ALU
	assign ALUControlD [2:0] = ALUDebeSumarD ? 3'b000 : Fun3D;
endmodule