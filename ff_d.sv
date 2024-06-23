module ff_d (input clk, reset, dis,
			input [31:0] d,
			output reg [31:0] q);
	
	always @(negedge clk)		
		if (~reset)
			q <= 0;
		else if (~dis) 
            q <= d;
	
endmodule