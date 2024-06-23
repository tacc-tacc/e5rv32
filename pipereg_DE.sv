module pipereg_DE(input clk, reset, clear,
                input [31:0] RD1D, RD2D, 
                input [4:0] Rs1D, Rs2D, RdD, 
                input [31:0] ImmExtD, PCPlus4D,
                output reg [31:0] RD1E, RD2E, 
                output reg [4:0] Rs1E, Rs2E, RdE, 
                output reg [31:0] ImmExtE, PCPlus4E);
					 
	reg limpiando;

    always @(negedge clk) begin
        if (~reset | clear) begin
            RD1E <= 0;
            RD2E <= 0;
            Rs1E <= 0;
            Rs2E <= 0;
            RdE <= 0;
            ImmExtE <= 0;
            PCPlus4E <= 0;
            limpiando = 1;
        end
		  else if (limpiando)
				limpiando = 0;
        else begin
            RD1E <= RD1D;
            RD2E <= RD2D;
            Rs1E <= Rs1D;
            Rs2E <= Rs2D;
            RdE <= RdD;
            ImmExtE <= ImmExtD;
            PCPlus4E <= PCPlus4D;
        end
    end

endmodule