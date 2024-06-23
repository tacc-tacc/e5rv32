module pipehazard(input [4:0] Rs1D, Rs2D, Rs1E, Rs2E,
                input [4:0] RdE, RdM, RdW,
                input RegWriteM, RegWriteW,
					input ResultSrcE0, PCJmpE,
					input FPUOkE,
                output [1:0] ForwardAE, ForwardBE,
                output StallD, StallF, FlushD, FlushE);

	wire lwStall;
    always_comb
    begin
        if ((Rs1E == RdM) & (RegWriteM) & (Rs1E != 0))
            ForwardAE <= 2'b10;
        else if ((Rs1E == RdW) & (RegWriteW) & (Rs1E != 0))
            ForwardAE <= 2'b01;
        else
            ForwardAE <= 2'b00;
            
        if ((Rs2E == RdM) & (RegWriteM) & (Rs2E != 0))
            ForwardBE <= 2'b10;
        else if ((Rs2E == RdW) & (RegWriteW) & (Rs2E != 0))
            ForwardBE <= 2'b01;
        else
            ForwardBE <= 2'b00;	  
	end

	// load word, espero al writeback
    assign lwStall = (ResultSrcE0 == 1) & ((RdE == Rs1D) | (RdE == Rs2D));
	assign StallF = lwStall;
	assign StallD = lwStall;
	
	//branch
	assign FlushE = lwStall | PCJmpE;
	assign FlushD = PCJmpE;

endmodule



    

