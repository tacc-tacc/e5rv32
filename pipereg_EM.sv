module pipereg_EM(input clk, reset,
                input [31:0] ResultE, ReadDataE,
                input [4:0] RdE,
                output reg [31:0] ResultM, ReadDataM,
                output reg [4:0] RdM);
					 
    reg limpiando;

    always @(negedge clk) begin 
        if (~reset)
        begin
            ResultM <= 0;
            ReadDataM <= 0;
            RdM <= 0;
            limpiando <= 1;
        end

        else if(limpiando)
            limpiando <= 0;

        else
        begin
            ResultM <= ResultE;
            ReadDataM <= ReadDataE;
            RdM <= RdE;   
        end
        
    end

endmodule

