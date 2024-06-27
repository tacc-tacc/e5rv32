module ff_d (input clk, reset, dis,
			input [31:0] d,
			output reg [31:0] q);
			
	reg [31:0] qa;
	
	always_ff @(negedge clk, negedge reset)		
		if (~reset)
			begin
				q <= 0;
				qa <= 0;
			end
		else if (dis)
			begin
				q <= qa;
				qa <= qa;
			end
		else
			begin
				qa <= d - 32'd4;
            q <= d;
			end
endmodule