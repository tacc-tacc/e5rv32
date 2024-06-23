module immbuilder(input [31:7] instr, input [2:0] immsrc, output wire [31:0] immext);
	parameter [2:0] ITYPE = 3'b000, STYPE = 3'b001, BTYPE = 3'b010, JTYPE = 3'b011, UTYPE = 3'b100, SHTYPE = 3'b110;
	always_comb
		case(immsrc)
			ITYPE: immext = {{20{instr[31]}}, instr[31:20]};
			STYPE: immext = {{20{instr[31]}}, instr[31:25], instr[11:7]};
			BTYPE: immext = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
			JTYPE: immext = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
			UTYPE: immext = {instr[31:12], 12'b0};
			SHTYPE: immext = {27'b0, instr[24:20]};
			default: immext = 32'bx;
		endcase
endmodule