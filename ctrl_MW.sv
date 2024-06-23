module ctrl_MW (input clk, reset, 
                input [1:0] ResultSrcM,
                input RegWriteM,
                output reg [1:0] ResultSrcW,
                output reg RegWriteW);
					 
		reg limpiando;

    always @(negedge clk, negedge reset)
    begin
        if (~reset) 
        begin
            ResultSrcW <= 0;
            RegWriteW <= 0;
		    limpiando <= 1;
        end
        else if (limpiando)
            limpiando <= 0;

        else 
        begin
            ResultSrcW <= ResultSrcM;
            RegWriteW <= RegWriteM;
        end

    end

endmodule