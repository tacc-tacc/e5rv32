module ctrl_EM (input clk, reset,
                input ResultSrcE, 
                input RegWriteE, FRegWriteE, MemWriteE,
                output reg ResultSrcM,
                output reg RegWriteM, FRegWriteM, MemWriteM);

	reg limpiando;
    always_ff @(negedge clk, negedge reset)
    begin
        if (~reset)
        begin
            ResultSrcM <= 0;
            RegWriteM <= 0;
            FRegWriteM <= 0;
            MemWriteM <= 0;
			limpiando <= 1;
        end
        else if (limpiando)
            limpiando <= 0;
        else
        begin
            ResultSrcM <= ResultSrcE; 
            RegWriteM <= RegWriteE;
            FRegWriteM <= FRegWriteE;
            MemWriteM <= MemWriteE;
        end
        
    end

endmodule