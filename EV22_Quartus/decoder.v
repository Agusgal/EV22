module decoder
(
 input[7:0] OPCODE,
 input[4:0] Ri,
 input[4:0] Rj,
 output reg [3:0] ALUC,
 output reg [1:0] SH,
 output reg KMux,
 output reg MR,
 output reg MW,
 output reg [4:0] Sel_A,
 output reg [5:0] Sel_B,
 output reg [5:0] Sel_C,
 output reg [6:0] Type
 );
	 
	always @(OPCODE)
	begin
		
		Sel_A = Rj;
		
		casex (OPCODE)
			//b00100xxx:	//JMP X: PC = X
			8'b00100xxx:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //JMP X

			//b00101xxx:	//JZE X: IF W=0 THEN PC=X
			8'b00101xxx:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JZE X

			//b00110xxx:	//JNE X: IF W15=0 THEN PC=X
			8'b00110xxx:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JNE X
			
			//b00111xxx:	//JCY X: IF CY THEN PC=X
			8'b00111xxx:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1010000; end //JCY X


			//b000100yy:	//MOM Y,W: M(Y) = W
			8'b000100xx:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=1; Sel_B=0; Sel_C=35; Type=7'b0000001; end //MOM Y,W

			//b000101yy:	//MOM W,Y: W = M(Y)
			8'b000101xx:	begin ALUC=4'b0000; SH=0; KMux=0; MR=1; MW=0; Sel_B=0; Sel_C=35; Type=7'b0000010; end //MOM W,Y

			//b000110ii:	//ADW Ri,Rj: Ri= W + Rj + CY
			8'b000110xx:	begin ALUC=4'b0101; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0111101; end //ADW Ri,Rj

			//b000111ss:	//BSR S: Save PC; PC= PC + S
			8'b000111xx:	begin ALUC=4'b0000; SH=0; KMux=0; MR=1; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //BSR S

			
			//b000010ii:	//MOV Ri,Rj: Ri = Rj y variaciones con puertos y working register
			8'b000010xx:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001100; end //MOV Ri,Rj
			//b00001011:	//MOV POi,Rj: POi = Rj (es un caso particular del anterior)
			//b000010ii:	//MOV POi,PIj: Ri = POj (es un caso particular del anterior)

			//b000011ii:	//MOV Ri,W: Ri = W
			8'b000011xx:	begin ALUC=4'b0001; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001001; end //MOV Ri,W
			//b00001111:	//MMOV POi,W: POi = W (es un caso particular del anterior)

			//b00000100:	//MOK #K_LSB: K_LSB = k
			8'b00000100:	begin ALUC=4'b0000; SH=0; KMux=1; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b0000010; end //MOK #K_LSB

			//b10000100:	//MOK W,#K: K_MSB = k; W = K
			8'b10000100:	begin ALUC=4'b0000; SH=0; KMux=1; MR=0; MW=0; Sel_B=0; Sel_C=34; Type=7'b0000010; end //MOK W,#K
			
			//b10000101:	//ANK W,#K: W= W & K
			8'b10000101:	begin ALUC=4'b0111; SH=0; KMux=1; MR=0; MW=0; Sel_B=34; Sel_C=34; Type=7'b0000011; end //ANK W,#K

			//b01000110:	//ORK W,#K: W= W OR K
			8'b10000110:	begin ALUC=4'b0110; SH=0; KMux=1; MR=0; MW=0; Sel_B=34; Sel_C=34; Type=7'b0000011; end //ORK W,#K
						
			//b10000111:	//ADK W,#K: W= W + K + CY
			8'b10000111:	begin ALUC=4'b0101; SH=0; KMux=1; MR=0; MW=0; Sel_B=34; Sel_C=34; Type=7'b0110011; end //ADK W,#K
			
			//b00000010:	//MOV W,Rj: W= Rj
			8'b00000010:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=34; Type=7'b0000110; end //MOV W,Rj
			
			//b00000010:	//MOV W,PIj: W= PIj - Caso particular del de arriba
			//8'b01000000:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=34; Type=7'b0000110; end //MOV W, PIj

			//b01000010:	//ANR W,Rj: W= W & Rj
			8'b01000010:	begin ALUC=4'b0111; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C=34; Type=7'b0000111; end //ANK W, Rj

			//b00000011:	//ORR W,Rj: W= W OR Rj
			8'b00000011:	begin ALUC=4'b0110; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C=34; Type=7'b0000111; end //ORR W, Rj
	
			//b01000011:	//ADR W,Rj: W= W + Rj + Cy
			8'b01000011:	begin ALUC=4'b0101; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C=34; Type=7'b0110111; end //ADR W, Rj
			
			//b00000000:	//CPL W: W= \W
			8'b00000000:	begin ALUC=4'b0011; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C=34; Type=7'b0000011; end //CPL W
			
			//b00000000:	//CLR CY=0
			8'b01000000:	begin ALUC=4'b1011; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b0100000; end //CLR CY
			
			//b00000001:	//SET CY=1
			8'b00000001:	begin ALUC=4'b1100; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b0100000; end //SET CY
			
			//b01000001:	//RET PC= Last Restored PC+1
			8'b01000001:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //RET
		endcase 
	end

endmodule
