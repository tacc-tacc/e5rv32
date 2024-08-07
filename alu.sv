module alu(input [31:0] a, 
			input [31:0] b, 
			input [4:0] ctrl, 
			output [31:0] res, 
			output N, Z, C, V);
			
	parameter [2:0]
		ADD_SUB = 3'b000,
		SLL = 3'b001,
		SLT = 3'b010,
		SLTU = 3'b011,
		XOR = 3'b100,
		SRL_SRA = 3'b101,
		OR = 3'b110,
		AND = 3'b111,
		MUL = 3'b000,
		MULH = 3'b001,
		MULHSU = 3'b010,
		MULHU = 3'b011,
		DIV = 3'b100,
		DIVU = 3'b101,
		REM = 3'b110,
		REMU = 3'b111;
	
    wire Mtype = ctrl[4];
    wire invertir = ctrl[3];
    wire [2:0] operacion = ctrl[2:0];

    wire [31:0] b_comp = ~b + 1;
    wire [31:0] suma = a + b;
    wire [31:0] suma_inv;

    assign N = suma_inv[31];
    assign Z = ~(|suma_inv);
    assign {C, suma_inv} = a + b_comp;
    assign V = (~a[31] & ~b_comp[31] & N) | (a[31] & b_comp[31] & ~N);

    wire signed [63:0] prodSS = $signed(a) * $signed(b);
    wire unsigned [63:0] prodUU = $unsigned(a) * $unsigned(b);
    wire signed [63:0] prodSU = $signed(a) * $unsigned(b);

    always_comb
    begin
        if (Mtype)
        begin
            case(operacion)
                MUL: res <= prodSS[31:0];
                MULH: res <= prodSS[63:32];
                MULHSU: res <= prodSU[63:32];
                MULHU: res <= prodUU[63:32];
                DIV: res <= $signed($signed(a) / $signed(b));
                DIVU: res <= $unsigned(a) / $unsigned(b);
                REM: res <= $signed($signed(a) % $signed(b));
                REMU: res <= $unsigned(a) % $unsigned(b);
                default: res <= 32'bx;
            endcase
        end
        else	
        begin
            case(operacion)
                ADD_SUB: res <= invertir ? suma_inv : suma;
                SLL: res <= a << b;
                SLT: res <= {31'b0, (N ^ V)};
                SLTU: res <= {31'b0, ~C};
                XOR: res <= a ^ b;
                SRL_SRA: res <= invertir ? $signed($signed(a) >>> b) : a >> b; // shift aritmético : shift lógico
                OR: res <= a | b;
                AND: res <= a & b;
                default: res <= 32'bx;			
            endcase
        end	
    end
endmodule
		
	