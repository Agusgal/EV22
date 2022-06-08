module super_register_bank(
									input MR,
									input MW,
									input[15:0] W_MEM_IN, //Desearía que inout funcionase pero es lo que hay.
									input[15:0] Data_C,
									input[5:0] Sel_C,
									input clk,
									input nreset,
									input[4:0] Sel_A,
									input[5:0] Sel_B,
									input[15:0] PI0,
									input[15:00] PI1,
									output reg[15:0] W_MEM_OUT,
									output reg[15:0] Data_A,
									output reg[15:0] Data_B,
									output reg[15:0] Working_register,
									output reg[15:0] PO0,
									output reg[15:0] PO1,
									output[15:0] DATA,
									output[5:0] SEL_REG,
									output[15:0] DATA_A_net,
									output[15:0] Data_B_net
									);
									
	wire updateFlag;
//	wire SEL_REG;
	wire W_MEM_OUT_net;

//	wire Data_A_net;
//	wire Data_B_net;
	
	wire reset;
	assign reset = ~nreset;
				
	reg[15:0] r0; reg[15:0] r1; reg[15:0] r2; reg[15:0] r3; reg[15:0] r4; reg[15:0] r5; reg[15:0] r6; reg[15:0] r7;
	reg[15:0] r8; reg[15:0] r9; reg[15:0] r10; reg[15:0] r11; reg[15:0] r12; reg[15:0] r13; reg[15:0] r14; reg[15:0] r15;
	reg[15:0] r16; reg[15:0] r17; reg[15:0] r18; reg[15:0] r19; reg[15:0] r20; reg[15:0] r21; reg[15:0] r22; reg[15:0] r23;
	reg[15:0] r24; reg[15:0] r25; reg[15:0] r26; reg[15:0] r27;  reg[15:0] r28;  reg[15:0] r29; //Los outputs son declarados en las salidas del modulo
	reg[15:0] r32;  reg[15:0] r33;

				
	Block2 block2(.clk(clk), .W_IN(Working_register), .W_MEM_IN(W_MEM_IN), .MR(MR), .MW(MW), .Data_C(Data_C), .Sel_C(Sel_C), .W_MEM_OUT(W_MEM_OUT_net), .DATA(DATA), .SEL_REG(SEL_REG));
	Block3 block3(.Sel_A(Sel_A), .Sel_B(Sel_B), .Working_Register(Working_register), .r0(r0), .r1(r1),  .r2(r2),  .r3(r3),  .r4(r4),  .r5(r5),  .r6(r6),  .r7(r7),  .r8(r8),  .r9(r9),  .r10(r10),  .r11(r11),  .r12(r12),  .r13(r13),   .r14(r14), .r15(r15), .r16(r16), .r17(r17), .r18(r18), .r19(r19), .r20(r20), .r21(r21), .r22(r22), .r23(r23), .r24(r24), .r25(r25), .r26(r26), .r27(r27), .r28(PI0),  .r29(PI1),  .r32(r32),  .r33(r33), .Data_A(Data_A_net), .Data_B(Data_B_net));

	always @ (Data_A_net, Data_B_net, SEL_REG, nreset) begin
	
	Data_A <= Data_A_net;
	Data_B <= Data_B_net;
	W_MEM_OUT <= W_MEM_OUT_net;
	
	if (reset) begin
				r0  <= 0;  r1 <= 0;  r2 <= 0;  r3 <= 0;  r4 <= 0;  r5 <= 0;  r6 <= 0;  r7 <= 0;  r8 <= 0;  r9 <= 0;
				r10 <= 0; r11 <= 0; r12 <= 0; r13 <= 0; r14 <= 0; r15 <= 0; r16 <= 0; r17 <= 0; r18 <= 0; r19 <= 0;
				r20 <= 0; r21 <= 0; r22 <= 0; r23 <= 0; r24 <= 0; r25 <= 0; r26 <= 0; r27 <= 0;
				PO0 <= 0; PO1 <= 0; Working_register <= 0;
	end else begin
		case(SEL_REG)
				0: 		r0 <= DATA;
				1: 		r1 <= DATA;
				2: 		r2 <= DATA;
				3: 		r3 <= DATA;
				4: 		r4 <= DATA;
				5: 		r5 <= DATA;
				6: 		r6 <= DATA;
				7: 		r7 <= DATA;
				8: 		r8 <= DATA;
				9: 		r9 <= DATA;
				10: 		r10 <= DATA;
				11: 		r11 <= DATA;
				12: 		r12 <= DATA;
				13: 		r13 <= DATA;
				14: 		r14 <= DATA;
				15: 		r15 <= DATA;
				16: 		r16 <= DATA;
				17: 		r17 <= DATA;
				18: 		r18 <= DATA;
				19: 		r19 <= DATA;
				20: 		r20 <= DATA;
				21: 		r21 <= DATA;
				22: 		r22 <= DATA;
				23: 		r23 <= DATA;
				24: 		r24 <= DATA;
				25: 		r25 <= DATA;
				26: 		r26 <= DATA;
				27: 		r27 <= DATA;
				//28: No es posible escribir sobre un puerto de entrada
				//29: No es posible escribir sobre un puerto de entrada
				30: 		PO0 <= DATA; //Output 0
				31: 		PO1 <= DATA; //Output 1
				34: 		Working_register <= DATA; //W_DATA <= Data_C; end
				
				//default: begin Working_Reg = Data_C;  W_OUT = Data_C; end
				//Lo comenté por el siguiente bug:
				//Quería probar JNE X. Para eso, cargaba una cte K en W, la cual pasaba por A y salía por C. Luego, cuando quería actually hacer el salto, el opcode de JNE X...
				//...ponía a la ALU en 0000, y KMux en 0. Entonces, el registro por defecto que entraba a A valía 0 y luego salía 0 por C ya que Z = A por el aluc = 0000.
				// Luego, como C = 0 y el código C_BUS del opcode es 35, por defecto el register bank cargaba Working_Reg = DATA_C = 0. Entonces, no lograba hacer saltar al código porque W ya no valía K, si no 0.
				//Comenté el default y anduvo.
			endcase
		end
	end
									
endmodule
									