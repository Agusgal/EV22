module Block3(
					input updateBlock,
					input[4:0] Sel_A,
					input[5:0] Sel_B,
					input[15:0] Working_Register, //AKA r34
					input[15:0] r0, input[15:0] r1, input[15:0] r2, input[15:0] r3, input[15:0] r4, input[15:0] r5, input[15:0] r6, input[15:0] r7,
					input[15:0] r8, input[15:0] r9, input[15:0] r10, input[15:0] r11, input[15:0] r12, input[15:0] r13, input[15:0] r14, input[15:0] r15,
					input[15:0] r16, input[15:0] r17, input[15:0] r18, input[15:0] r19, input[15:0] r20, input[15:0] r21, input[15:0] r22, input[15:0] r23,
					input[15:0] r24, input[15:0] r25, input[15:0] r26, input[15:0] r27, /*input[15:0] r28, input[15:0] r29,*/ input[15:0] r32, input[15:0] r33,				
					output[15:0] Data_A,
					output[15:0] Data_B
				);	

	assign Data_A = mux_a(Sel_A, Working_Register, r0, r1, r2, r3, r4, r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r32,r33);
	assign Data_B = mux_b(Sel_B, Working_Register, r0, r1, r2, r3, r4, r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,r20,r21,r22,r23,r24,r25,r26,r27,r32,r33);
				
	function [15:0] mux_a(	input [4:0] Sel_A, input[15:0] Working_Register, //AKA r34
					input[15:0] r0, input[15:0] r1, input[15:0] r2, input[15:0] r3, input[15:0] r4, input[15:0] r5, input[15:0] r6, input[15:0] r7,
					input[15:0] r8, input[15:0] r9, input[15:0] r10, input[15:0] r11, input[15:0] r12, input[15:0] r13, input[15:0] r14, input[15:0] r15,
					input[15:0] r16, input[15:0] r17, input[15:0] r18, input[15:0] r19, input[15:0] r20, input[15:0] r21, input[15:0] r22, input[15:0] r23,
					input[15:0] r24, input[15:0] r25, input[15:0] r26, input[15:0] r27, /*input[15:0] r28, input[15:0] r29,*/ input[15:0] r32, input[15:0] r33
					);
					
		case (Sel_A)
				0: 		mux_a = r0;
				1: 		mux_a = r1;
				2: 		mux_a = r2;
				3: 		mux_a = r3;
				4: 		mux_a = r4;
				5: 		mux_a = r5;
				6: 		mux_a = r6;
				7: 		mux_a = r7;
				8: 		mux_a = r8;
				9: 		mux_a = r9;
				10: 		mux_a = r10;
				11: 		mux_a = r11;
				12: 		mux_a = r12;
				13: 		mux_a = r13;
				14: 		mux_a = r14;
				15: 		mux_a = r15;
				16: 		mux_a = r16;
				17: 		mux_a = r17;
				18: 		mux_a = r18;
				19: 		mux_a = r19;
				20: 		mux_a = r20;
				21: 		mux_a = r21;
				22: 		mux_a = r22;
				23: 		mux_a = r23;
				24: 		mux_a = r24;
				25: 		mux_a = r25;
				26: 		mux_a = r26;
				27: 		mux_a = r27;
//				28: 		mux_a = r28; //PI0
//				29: 		mux_a = r29; //PI1
// 			30: 		mux_a = Output_Port_0;
//				31: 		mux_a = Output_Port_1;
		endcase
	endfunction

	function [15:0] mux_b(	input [5:0] Sel_B, input[15:0] Working_Register, //AKA r34
					input[15:0] r0, input[15:0] r1, input[15:0] r2, input[15:0] r3, input[15:0] r4, input[15:0] r5, input[15:0] r6, input[15:0] r7,
					input[15:0] r8, input[15:0] r9, input[15:0] r10, input[15:0] r11, input[15:0] r12, input[15:0] r13, input[15:0] r14, input[15:0] r15,
					input[15:0] r16, input[15:0] r17, input[15:0] r18, input[15:0] r19, input[15:0] r20, input[15:0] r21, input[15:0] r22, input[15:0] r23,
					input[15:0] r24, input[15:0] r25, input[15:0] r26, input[15:0] r27, /*input[15:0] r28, input[15:0] r29,*/ input[15:0] r32, input[15:0] r33
					);
					
		case (Sel_B)
				0: 		mux_b = r0;
				1: 		mux_b = r1;
				2: 		mux_b = r2;
				3: 		mux_b = r3;
				4: 		mux_b = r4;
				5: 		mux_b = r5;
				6: 		mux_b = r6;
				7: 		mux_b = r7;
				8: 		mux_b = r8;
				9: 		mux_b = r9;
				10: 		mux_b = r10;
				11: 		mux_b = r11;
				12: 		mux_b = r12;
				13: 		mux_b = r13;
				14: 		mux_b = r14;
				15: 		mux_b = r15;
				16: 		mux_b = r16;
				17: 		mux_b = r17;
				18: 		mux_b = r18;
				19: 		mux_b = r19;
				20: 		mux_b = r20;
				21: 		mux_b = r21;
				22: 		mux_b = r22;
				23: 		mux_b = r23;
				24: 		mux_b = r24;
				25: 		mux_b = r25;
				26: 		mux_b = r26;
				27: 		mux_b = r27;
//				28: 		mux_b = r28; //PI0
//				29: 		mux_b = r29; //PI1
//				30: 		mux_b = Output_Port_0;
//				31: 		mux_b = Output_Port_1;
				34: 		mux_b = Working_Register;
		endcase
	endfunction
				
endmodule	
				
/*	always @ (updateBlock, Sel_A, Sel_B) begin
			
		case(Sel_A)
				0: 		Data_A <= r0;
				1: 		Data_A <= r1;
				2: 		Data_A <= r2;
				3: 		Data_A <= r3;
				4: 		Data_A <= r4;
				5: 		Data_A <= r5;
				6: 		Data_A <= r6;
				7: 		Data_A <= r7;
				8: 		Data_A <= r8;
				9: 		Data_A <= r9;
				10: 		Data_A <= r10;
				11: 		Data_A <= r11;
				12: 		Data_A <= r12;
				13: 		Data_A <= r13;
				14: 		Data_A <= r14;
				15: 		Data_A <= r15;
				16: 		Data_A <= r16;
				17: 		Data_A <= r17;
				18: 		Data_A <= r18;
				19: 		Data_A <= r19;
				20: 		Data_A <= r20;
				21: 		Data_A <= r21;
				22: 		Data_A <= r22;
				23: 		Data_A <= r23;
				24: 		Data_A <= r24;
				25: 		Data_A <= r25;
				26: 		Data_A <= r26;
				27: 		Data_A <= r27;
//				28: 		Data_A <= r28; //PI0
//				29: 		Data_A <= r29; //PI1
				//30: 		Data_A = Output_Port_0;
				//31: 		Data_A = Output_Port_1;
			endcase
			
			case(Sel_B)
				0: 		Data_B <= r0;
				1: 		Data_B <= r1;
				2: 		Data_B <= r2;
				3: 		Data_B <= r3;
				4: 		Data_B <= r4;
				5: 		Data_B <= r5;
				6: 		Data_B <= r6;
				7: 		Data_B <= r7;
				8: 		Data_B <= r8;
				9: 		Data_B <= r9;
				10: 		Data_B <= r10;
				11: 		Data_B <= r11;
				12: 		Data_B <= r12;
				13: 		Data_B <= r13;
				14: 		Data_B <= r14;
				15: 		Data_B <= r15;
				16: 		Data_B <= r16;
				17: 		Data_B <= r17;
				18: 		Data_B <= r18;
				19: 		Data_B <= r19;
				20: 		Data_B <= r20;
				21: 		Data_B <= r21;
				22: 		Data_B <= r22;
				23: 		Data_B <= r23;
				24: 		Data_B <= r24;
				25: 		Data_B <= r25;
				26: 		Data_B <= r26;
				27: 		Data_B <= r27;
//				28: 		Data_B <= r28; //PI0
//				29: 		Data_B <= r29; //PI1
				//30: 		Data_B = Output_Port_0;
				//31: 		Data_B = Output_Port_1;		
				34: 		Data_B <= Working_Register;
			endcase	
	end		
			
*/	