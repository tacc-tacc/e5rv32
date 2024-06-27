module pipereg_EM(input clk, reset,
                input [31:0] ResultE, ADDRTargetE,
                input [4:0] RdE,
                output reg [31:0] ResultM, ADDRTargetM,
                output reg [4:0] RdM);
					 
    reg limpiando;

    always_ff @(negedge clk, negedge reset) begin 
        if (~reset)
        begin
            ResultM <= 0;
            ADDRTargetM <= 0;
            RdM <= 0;
            limpiando <= 1;
        end

        else if(limpiando)
            limpiando <= 0;

        else
        begin
            ResultM <= ResultE;
            ADDRTargetM <= ADDRTargetE;
            RdM <= RdE;   
        end
        
    end

endmodule

