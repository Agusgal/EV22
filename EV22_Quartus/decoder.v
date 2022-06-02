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
		
		case (OPCODE)
			//b00100xxx:	//JMP X: PC = X
			8'b00100000:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //JMP X
			8'b00100001:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //JMP X
			8'b00100010:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //JMP X
			8'b00100011:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //JMP X
			8'b00100100:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //JMP X
			8'b00100101:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //JMP X
			8'b00100110:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //JMP X
			8'b00100110:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //JMP X

			//b00101xxx:	//JZE X: IF W=0 THEN PC=X
			8'b00101000:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JZE X
			8'b00101001:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JZE X
			8'b00101010:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JZE X
			8'b00101011:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JZE X
			8'b00101100:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JZE X
			8'b00101101:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JZE X
			8'b00101110:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JZE X
			8'b00101110:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JZE X
			
			//b00110xxx:	//JNE X: IF W15=0 THEN PC=X
			8'b00110000:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JNE X
			8'b00110001:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JNE X
			8'b00110010:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JNE X
			8'b00110011:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JNE X
			8'b00110100:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JNE X
			8'b00110101:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JNE X
			8'b00110110:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JNE X
			8'b00110110:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000001; end //JNE X
			
			//b00111xxx:	//JCY X: IF CY THEN PC=X
			8'b00111000:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1010000; end //JCY X
			8'b00111001:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1010000; end //JCY X
			8'b00111010:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1010000; end //JCY X
			8'b00111011:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1010000; end //JCY X
			8'b00111100:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1010000; end //JCY X
			8'b00111101:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1010000; end //JCY X
			8'b00111110:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1010000; end //JCY X
			8'b00111110:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=35; Type=7'b1010000; end //JCY X

			//b000100yy:	//MOM Y,W: M(Y) = W
			8'b00010000:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=1; Sel_B=0; Sel_C=35; Type=7'b0000001; end //MOM Y,W
			8'b00010001:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=1; Sel_B=0; Sel_C=35; Type=7'b0000001; end //MOM Y,W
			8'b00010010:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=1; Sel_B=0; Sel_C=35; Type=7'b0000001; end //MOM Y,W
			8'b00010011:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=1; Sel_B=0; Sel_C=35; Type=7'b0000001; end //MOM Y,W
			
			//b000101yy:	//MOM W,Y: W = M(Y)
			8'b00010100:	begin ALUC=4'b0000; SH=0; KMux=0; MR=1; MW=0; Sel_B=0; Sel_C=35; Type=7'b0000010; end //MOM W,Y
			8'b00010101:	begin ALUC=4'b0000; SH=0; KMux=0; MR=1; MW=0; Sel_B=0; Sel_C=35; Type=7'b0000010; end //MOM W,Y
			8'b00010110:	begin ALUC=4'b0000; SH=0; KMux=0; MR=1; MW=0; Sel_B=0; Sel_C=35; Type=7'b0000010; end //MOM W,Y
			8'b00010111:	begin ALUC=4'b0000; SH=0; KMux=0; MR=1; MW=0; Sel_B=0; Sel_C=35; Type=7'b0000010; end //MOM W,Y

			//b000110ii:	//ADW Ri,Rj: Ri= W + Rj + CY
			8'b00011000:	begin ALUC=4'b0101; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0111101; end //ADW Ri,Rj
			8'b00011001:	begin ALUC=4'b0101; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0111101; end //ADW Ri,Rj
			8'b00011010:	begin ALUC=4'b0101; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0111101; end //ADW Ri,Rj
			8'b00011011:	begin ALUC=4'b0101; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0111101; end //ADW Ri,Rj

			//b000111ss:	//BSR S: Save PC; PC= PC + S
			8'b00011100:	begin ALUC=4'b0000; SH=0; KMux=0; MR=1; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //BSR S
			8'b00011101:	begin ALUC=4'b0000; SH=0; KMux=0; MR=1; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //BSR S
			8'b00011110:	begin ALUC=4'b0000; SH=0; KMux=0; MR=1; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //BSR S
			8'b00011111:	begin ALUC=4'b0000; SH=0; KMux=0; MR=1; MW=0; Sel_B=0; Sel_C=35; Type=7'b1000000; end //BSR S
			
			//b000010ii:	//MOV Ri,Rj: Ri = Rj
			8'b00001000:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001100; end //MOV Ri,Rj
			8'b00001001:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001100; end //MOV Ri,Rj
			8'b00001010:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001100; end //MOV Ri,Rj
			8'b00001011:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001100; end //MOV Ri,Rj
			//b00001011:	//MOV POi,Rj: POi = Rj (es un caso particular del anterior)
			//b000010ii:	//MOV POi,PIj: Ri = POj (es un caso particular del anterior)

			//b000011ii:	//MOV Ri,W: Ri = W
			8'b00001100:	begin ALUC=4'b0001; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001001; end //MOV Ri,W
			8'b00001101:	begin ALUC=4'b0001; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001001; end //MOV Ri,W
			8'b00001110:	begin ALUC=4'b0001; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001001; end //MOV Ri,W
			8'b00001111:	begin ALUC=4'b0001; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C={1'b0,Ri}; Type=7'b0001001; end //MOV Ri,W
			//b00001111:	//MMOV POi,W: POi = W (es un caso particular del anterior)

			//b00000100:	//MOK W,#K: Ri = W
			8'b00000100:	begin ALUC=4'b0000; SH=0; KMux=1; MR=0; MW=0; Sel_B=0; Sel_C=34; Type=7'b0000010; end //MOK W,#K
			
			//b00000101:	//ANK W,#K: W= W & K
			8'b00000101:	begin ALUC=4'b0111; SH=0; KMux=1; MR=0; MW=0; Sel_B=34; Sel_C=34; Type=7'b0000011; end //ANK W,#K

			
			//b00000110:	//ORK W,#K: W= W OR K
			8'b00000110:	begin ALUC=4'b0110; SH=0; KMux=1; MR=0; MW=0; Sel_B=34; Sel_C=34; Type=7'b0000011; end //ORK W,#K
			
			
			//b00000111:	//ADK W,#K: W= W + K + CY
			8'b00000111:	begin ALUC=4'b0101; SH=0; KMux=1; MR=0; MW=0; Sel_B=34; Sel_C=34; Type=7'b0110011; end //ADK W,#K
			
			
			//b00000010:	//MOV W,Rj: W= Rj
			8'b00000010:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=34; Type=7'b0000110; end //MOV W,Rj
			
			
			//b00000010:	//MOV W,PIj: W= PIj
			8'b01000000:	begin ALUC=4'b0000; SH=0; KMux=0; MR=0; MW=0; Sel_B=0; Sel_C=34; Type=7'b0000110; end //MOV W, PIj

			
			//b00000010:	//ANR W,Rj: W= W & Rj
			8'b00000010:	begin ALUC=4'b0111; SH=0; KMux=0; MR=0; MW=0; Sel_B=34; Sel_C=34; Type=7'b0000111; end //ANK W, Rj
			
			
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
