module r32x32(input clk,
					input we3,
					input [4:0] a1, a2, a3,
					input [31:0] wd3,
					output [31:0] rd1, rd2);
					//output [31:0] r1_, r2_, r3_, r4_, r5_, r6_, r7_, r8_, r9_, r10_, r11_, r12_, r13_, r14_, r15_, r16_, r17_, r18_, r19_, r20_, r21_, r22_, r23_, r24_, r25_, r26_, r27_, r28_, r29_, r30_, r31_);
					
	reg [31:0] rf[31:0]; 	// banco
	
	/*
	assign r1_ = rf[1];
	assign r2_ = rf[2];
	assign r3_ = rf[3];
	assign r4_ = rf[4];
	assign r5_ = rf[5];
	assign r6_ = rf[6];
	assign r7_ = rf[7];
	assign r8_ = rf[8];
	assign r9_ = rf[9];
	assign r10_ = rf[10];
	assign r11_ = rf[11];
	assign r12_ = rf[12];
	assign r13_ = rf[13];
	assign r14_ = rf[14];
	assign r15_ = rf[15];
	assign r16_ = rf[16];
	assign r17_ = rf[17];
	assign r18_ = rf[18];
	assign r19_ = rf[19];
	assign r20_ = rf[20];
	assign r21_ = rf[21];
	assign r22_ = rf[22];
	assign r23_ = rf[23];
	assign r24_ = rf[24];
	assign r25_ = rf[25];
	assign r26_ = rf[26];
	assign r27_ = rf[27];
	assign r28_ = rf[28];
	assign r29_ = rf[29];
	assign r30_ = rf[30];
	assign r31_ = rf[31];
	*/
	
	assign rd1 = (a1 != 0 ) ? rf[a1] : 0;
	assign rd2 = (a2 != 0 ) ? rf[a2] : 0;
	
	always @(posedge clk)
		if (we3) rf[a3] <= wd3;

endmodule