module Block3(
					input[4:0] Sel_A,
					input[5:0] Sel_B,
					input[15:0] Working_Register, //AKA r34
					input[15:0] r0, input[15:0] r1, input[15:0] r2, input[15:0] r3, input[15:0] r4, input[15:0] r5, input[15:0] r6, input[15:0] r7,
					input[15:0] r8, input[15:0] r9, input[15:0] r10, input[15:0] r11, input[15:0] r12, input[15:0] r13, input[15:0] r14, input[15:0] r15,
					input[15:0] r16, input[15:0] r17, input[15:0] r18, input[15:0] r19, input[15:0] r20, input[15:0] r21, input[15:0] r22, input[15:0] r23,
					input[15:0] r24, input[15:0] r25, input[15:0] r26, input[15:0] r27, input[15:0] r28, input[15:0] r29, input[15:0] r32, input[15:0] r33,				
					output reg[15:0] Data_A,
					output reg[15:0] Data_B
				);	


	always @ (Sel_A, Sel_B) begin
			
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
				28: 		Data_A = r28; //PI0
				29: 		Data_A = r29; //PI1
				//30: 		Data_A = Output_Port_0;
				//31: 		Data_A = Output_Port_1;
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
				28: 		Data_B = r28; //PI0
				29: 		Data_B = r29; //PI1
				//30: 		Data_B = Output_Port_0;
				//31: 		Data_B = Output_Port_1;		
				34: 		Data_B = Working_Register;
			endcase	
	end		
endmodule				