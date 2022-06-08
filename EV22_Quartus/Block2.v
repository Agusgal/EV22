module Block2(
					input clk,
					input[15:0] W_IN,
					input[15:0] W_MEM_IN,
					input MR,
					input MW,
					input[15:0] DATA_C,
					input[5:0] SEL_C,
					output reg[15:0] W_MEM_OUT,
					output reg[15:0] DATA,
					output reg[5:0] SEL_REG
				//	output[15..0] Working_Register, //AKA r34
				//	output reg[15:0] r0, output reg[15:0] r1, output reg[15:0] r2, output reg[15:0] r3, output reg[15:0] r4, output reg[15:0] r5, output reg[15:0] r6, output reg[15:0] r7,
				//	output reg[15:0] r8, output reg[15:0] r9, output reg[15:0] r10, output reg[15:0] r11, output reg[15:0] r12, output reg[15:0] r13, output reg[15:0] r14, output reg[15:0] r15,
				//	output reg[15:0] r16, output reg[15:0] r17, output reg[15:0] r18, output reg[15:0] r19, output reg[15:0] r20, output reg[15:0] r21, output reg[15:0] r22, output reg[15:0] r23,
				//	output reg[15:0] r24, output reg[15:0] r25, output reg[15:0] r26, output reg[15:0] r27, output reg[15:0] r30, output reg[15:0] r31, output reg[15:0] r32, output reg[15:0] r33,
				//	output WR_R1, output WR_R2, output WR_R3, output WR_R4, output WR_R5, output WR_R6, output WR_R7, output WR_R8, output WR_R9, output WR_R10, output WR_R11, output WR_R12, output WR_R13, 
				//	output WR_R14, output WR_R15, output WR_R16, output WR_R17, output WR_R18, output WR_R19, output WR_R20, output WR_R21, output WR_22, output WR_R23, output WR_R24, output WR_R25, output WR_R26, 
				//	output WR_R27, output WR_RPO0, output WR_RPO1, output WR_RAu0, output WR_RAu1, output WR_W
				);


	always @ (posedge clk) begin
		if(MR) begin
			SEL_REG <= 5'b100010; //Reg 34, working register. Hardcodeado porque el opcode pone SEL_C en 35, pero necesito de alguna forma indicarle al bloque que pase esto al registro W.
			DATA <= W_MEM_IN; //Le paso al working register lo que leí de memoria.
		end else if(MW) begin
			W_MEM_OUT <= W_IN; //Le paso a la memoria lo que tengo en W.
			SEL_REG <=  5'b100011; //r35, que es usa para no escribir en ningun lado.
		end else begin
			SEL_REG <= SEL_C;
			DATA <= DATA_C;
		end
	end		
endmodule				