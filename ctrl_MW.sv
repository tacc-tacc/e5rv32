module ctrl_MW (input clk, reset, 
                input ResultSrcM,
                input RegWriteM, FRegWriteM,
                output reg ResultSrcW,
                output reg RegWriteW, FRegWriteW);
					 
		reg limpiando;

    always_ff @(negedge clk, negedge reset)
    begin
        if (~reset) 
        begin
            ResultSrcW <= 0;
            RegWriteW <= 0;
            FRegWriteW <= 0;
		    limpiando <= 1;
        end
        else if (limpiando)
            limpiando <= 0;

        else 
        begin
            ResultSrcW <= ResultSrcM;
            RegWriteW <= RegWriteM;
            FRegWriteW <= FRegWriteM;
        end

    end

endmodule