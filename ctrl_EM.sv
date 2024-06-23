module ctrl_EM (input clk, reset,
                input [1:0] ResultSrcE, 
                input RegWriteE, MemWriteE,
                output reg [1:0] ResultSrcM,
                output reg RegWriteM, MemWriteM);

	reg limpiando;
    always @(negedge clk, negedge reset)
    begin
        if (~reset)
        begin
            ResultSrcM <= 0;
            RegWriteM <= 0;
            MemWriteM <= 0;
			limpiando <= 1;
        end
        else if (limpiando)
            limpiando <= 0;
        else
        begin
            ResultSrcM <= ResultSrcE; 
            RegWriteM <= RegWriteE;
            MemWriteM <= MemWriteE;
        end
        
    end

endmodule