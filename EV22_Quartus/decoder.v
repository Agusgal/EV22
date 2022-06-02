module decoder
(
 input[7:0] OPCODE,
 input[4:0] Ri,
 output reg [3:0] ALUC,
 output reg [1:0] SH,
 output reg KMux,
 output reg MR,
 output reg MW,
 output reg [5:0] Sel_B,
 output reg [5:0] Sel_C,
 output reg [6:0] Type
 );
	 
	always @(OPCODE)
	begin
		case (OPCODE)
			8'b00000100:	begin ALUC=4'b0000; SH=0; KMux=1; MR=0; MW=0; Sel_B=0; Sel_C=34; Type=7'b0000010; end //W = K
			8'b00000100:	begin ALUC=4'b0000; SH=0; KMux=1; MR=0; MW=0; Sel_B=0; Sel_C=34; Type=7'b0000010; end //W = K
			
			//b000011ii:	//Ri = W
			8'b00001100:	begin ALUC=4'b0001; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001001; end //Ri = W
			8'b00001101:	begin ALUC=4'b0001; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001001; end //Ri = W
			8'b00001110:	begin ALUC=4'b0001; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001001; end //Ri = W
			8'b00001111:	begin ALUC=4'b0001; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001001; end //Ri = W
		endcase 
	end

endmodule
