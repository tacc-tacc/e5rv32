module pipereg_FD(input clk, reset, clear, dis,
            input [31:0] InstrF, PCPlus4F,
            output reg [31:0] InstrD, PCPlus4D);

    reg limpiando;

    always @(negedge clk)
    begin
        if (~reset | (~dis & clear))
        begin
        InstrD <= 0;
        PCPlus4D <= 0;
        limpiando <= 1;
        end
        
        else if (limpiando)
        limpiando <= 0;
        
        else if (~dis)
        begin
        InstrD <= InstrF;
        PCPlus4D <= PCPlus4F;
        
        end
    end

endmodule