module register_bank
(
 input[4:0] Sel_A,
 input[5:0] Sel_B,
 input[5:0] Sel_C,
 input[15:0] Data_C,
 input clk,
 input nreset,
 input MR,
 input MW,
 input[15:0] W_IN,
 input[15:0] Input_Port_0,
 input[15:0] Input_Port_1,
 output reg[15:0] Data_A,
 output reg[15:0] Data_B,
 output reg[15:0] Output_Port_0,
 output reg[15:0] Output_Port_1,
 output reg[15:0] Working_Reg
 );

	reg[15:0] r0; reg[15:0] r1; reg[15:0] r2; reg[15:0] r3; reg[15:0] r4; reg[15:0] r5; reg[15:0] r6; reg[15:0] r7;
	reg[15:0] r8; reg[15:0] r9; reg[15:0] r10; reg[15:0] r11; reg[15:0] r12; reg[15:0] r13; reg[15:0] r14; reg[15:0] r15;
	reg[15:0] r16; reg[15:0] r17; reg[15:0] r18; reg[15:0] r19; reg[15:0] r20; reg[15:0] r21; reg[15:0] r22; reg[15:0] r23;
	reg[15:0] r24; reg[15:0] r25; reg[15:0] r26; reg[15:0] r27;
	
	wire reset;
	assign reset = ~nreset;
	
//	always @ (posedge clk, posedge reset) begin
	always @ (Sel_A, Sel_B, MR, MW, reset) begin

	if (reset) begin
				r0  <= 0;  r1 <= 0;  r2 <= 0;  r3 <= 0;  r4 <= 0;  r5 <= 0;  r6 <= 0;  r7 <= 0;  r8 <= 0;  r9 <= 0;
				r10 <= 0; r11 <= 0; r12 <= 0; r13 <= 0; r14 <= 0; r15 <= 0; r16 <= 0; r17 <= 0; r18 <= 0; r19 <= 0;
				r20 <= 0; r21 <= 0; r22 <= 0; r23 <= 0; r24 <= 0; r25 <= 0; r26 <= 0; r27 <= 0;
				Output_Port_0 <= 0; Output_Port_1 <= 0; Working_Reg <= 0;
//				ab_or_c <= 0;
		end
	else if(MR)
			Working_Reg = W_IN;
	else begin //Si es MW entonces no me interesan ninguno de estos casos, sólo quiero escribir W en memoria.
			case(Sel_A)
				0: 		Data_A = r0;
				1: 		Data_A = r1;
				2: 		Data_A = r2;
				3: 		Data_A = r3;
				4: 		Data_A = r4;
				5: 		Data_A = r5;
				6: 		Data_A = r6;
				7: 		Data_A = r7;
				8: 		Data_A = r8;
				9: 		Data_A = r9;
				10: 		Data_A = r10;
				11: 		Data_A = r11;
				12: 		Data_A = r12;
				13: 		Data_A = r13;
				14: 		Data_A = r14;
				15: 		Data_A = r15;
				16: 		Data_A = r16;
				17: 		Data_A = r17;
				18: 		Data_A = r18;
				19: 		Data_A = r19;
				20: 		Data_A = r20;
				21: 		Data_A = r21;
				22: 		Data_A = r22;
				23: 		Data_A = r23;
				24: 		Data_A = r24;
				25: 		Data_A = r25;
				26: 		Data_A = r26;
				27: 		Data_A = r27;
				28: 		Data_A = Input_Port_0;
				29: 		Data_A = Input_Port_1;
				30: 		Data_A = Output_Port_0;
				31: 		Data_A = Output_Port_1;
				
			endcase
			
			case(Sel_B)
				0: 		Data_B = r0;
				1: 		Data_B = r1;
				2: 		Data_B = r2;
				3: 		Data_B = r3;
				4: 		Data_B = r4;
				5: 		Data_B = r5;
				6: 		Data_B = r6;
				7: 		Data_B = r7;
				8: 		Data_B = r8;
				9: 		Data_B = r9;
				10: 		Data_B = r10;
				11: 		Data_B = r11;
				12: 		Data_B = r12;
				13: 		Data_B = r13;
				14: 		Data_B = r14;
				15: 		Data_B = r15;
				16: 		Data_B = r16;
				17: 		Data_B = r17;
				18: 		Data_B = r18;
				19: 		Data_B = r19;
				20: 		Data_B = r20;
				21: 		Data_B = r21;
				22: 		Data_B = r22;
				23: 		Data_B = r23;
				24: 		Data_B = r24;
				25: 		Data_B = r25;
				26: 		Data_B = r26;
				27: 		Data_B = r27;
				28: 		Data_B = Input_Port_0;
				29: 		Data_B = Input_Port_1;
				30: 		Data_B = Output_Port_0;
				31: 		Data_B = Output_Port_1;
					
				34: 		Data_B = Working_Reg;
					
					//default: Data_B = Working_Reg; Lo comento por las dudas
			endcase
		
		end
	end
	/*
			case(Sel_C)
				0: 		r0 = Data_C;
				1: 		r1 = Data_C;
				2: 		r2 = Data_C;
				3: 		r3 = Data_C;
				4: 		r4 = Data_C;
				5: 		r5 = Data_C;
				6: 		r6 = Data_C;
				7: 		r7 = Data_C;
				8: 		r8 = Data_C;
				9: 		r9 = Data_C;
				10: 		r10 = Data_C;
				11: 		r11 = Data_C;
				12: 		r12 = Data_C;
				13: 		r13 = Data_C;
				14: 		r14 = Data_C;
				15: 		r15 = Data_C;
				16: 		r16 = Data_C;
				17: 		r17 = Data_C;
				18: 		r18 = Data_C;
				19: 		r19 = Data_C;
				20: 		r20 = Data_C;
				21: 		r21 = Data_C;
				22: 		r22 = Data_C;
				23: 		r23 = Data_C;
				24: 		r24 = Data_C;
				25: 		r25 = Data_C;
				26: 		r26 = Data_C;
				27: 		r27 = Data_C;
				//28: No es posible escribir sobre un puerto de entrada
				//29: No es posible escribir sobre un puerto de entrada
				30: 		Output_Port_0 = Data_C;
				31: 		Output_Port_1 = Data_C;
				
				34: 		Working_Reg = Data_C; //W_DATA <= Data_C; end
				
				//default: begin Working_Reg = Data_C;  W_OUT = Data_C; end
				//Lo comenté por el siguiente bug:
				//Quería probar JNE X. Para eso, cargaba una cte K en W, la cual pasaba por A y salía por C. Luego, cuando quería actually hacer el salto, el opcode de JNE X...
				//...ponía a la ALU en 0000, y KMux en 0. Entonces, el registro por defecto que entraba a A valía 0 y luego salía 0 por C ya que Z = A por el aluc = 0000.
				// Luego, como C = 0 y el código C_BUS del opcode es 35, por defecto el register bank cargaba Working_Reg = DATA_C = 0. Entonces, no lograba hacer saltar al código porque W ya no valía K, si no 0.
				//Comenté el default y anduvo.
			endcase
		end
*/
	
endmodule
