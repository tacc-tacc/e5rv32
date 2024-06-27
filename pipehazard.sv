module pipehazard(input [4:0] Rs1D, Rs2D, Rs1E, Rs2E,
                input [4:0] RdE, RdM, RdW,
                input [1:0] FRegReadE,
					 input RegWriteM, FRegWriteM, RegWriteW, FRegWriteW,
					input ResultSrcE, ResultSrcM, ResultSrcW, PCJmpE,
					input FPUOkE,
                output [1:0] ForwardAE, ForwardBE,
                output StallD, StallF, FlushD, FlushE);

	wire lwStall;
    always_comb
    begin
        if ((Rs1E == RdM) & ((RegWriteM & ~FRegReadE[0]) | (FRegWriteM & FRegReadE[0])))
            ForwardAE <= 2'b10;
        else if ((Rs1E == RdW) & ((RegWriteW & ~FRegReadE[0]) | (FRegWriteW & FRegReadE[0])))
            ForwardAE <= 2'b01;
        else
            ForwardAE <= 2'b00;
            
        if ((Rs2E == RdM) & ((RegWriteM & ~FRegReadE[1]) | (FRegWriteM & FRegReadE[1])))
            ForwardBE <= 2'b10;
        else if ((Rs2E == RdW) & ((RegWriteW & ~FRegReadE[1]) | (FRegWriteW & FRegReadE[1])))
            ForwardBE <= 2'b01;
        else
            ForwardBE <= 2'b00;	  
	end

	// load word, espero al writeback
    assign lwStall = ((ResultSrcE == 1) & ((RdE == Rs1D) | (RdE == Rs2D))) | ((ResultSrcM == 1) & ((RdM == Rs1D) | (RdM == Rs2D))) | ((ResultSrcW == 1) & ((RdW == Rs1D) | (RdW == Rs2D)));
	assign StallF = lwStall | ~FPUOkE;
	assign StallD = lwStall | ~FPUOkE;
	
	//branch
	assign FlushE = lwStall | PCJmpE;
	assign FlushD = PCJmpE;

endmodule



    

