module pipereg_MW(input clk, reset,
                input [31:0] ResultM, ReadDataM,
                input [4:0] RdM,
                output reg [31:0] ResultW, ReadDataW,
                output reg [4:0] RdW);
					 
    reg limpiando;

    always @(negedge clk) begin 
        if (~reset)
        begin
            ResultW <= 0;
            ReadDataW <= 0;
            RdW <= 0;
            limpiando <= 1;
        end
        else if (limpiando)
            limpiando <= 0;

        else 
        begin
            ResultW <= ResultM;
            ReadDataW <= ReadDataM;
            RdW <= RdM;
        end
        
    end

endmodule