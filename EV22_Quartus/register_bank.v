module register_bank
(
 input[4:0] Sel_A,
 input[5:0] Sel_B,
 input[5:0] Sel_C,
 input[15:0] Data_C,
 input clk,
 input nreset,
 output reg[15:0] Data_A,
 output reg[15:0] Data_B
 );

	wire[15:0] r0; wire[15:0] r1; wire[15:0] r2; wire[15:0] r3; wire[15:0] r4; wire[15:0] r5; wire[15:0] r6; wire[15:0] r7;
	wire[15:0] r8; wire[15:0] r9; wire[15:0] r10; wire[15:0] r11; wire[15:0] r12; wire[15:0] r13; wire[15:0] r14; wire[15:0] r15;
	wire[15:0] r16; wire[15:0] r17; wire[15:0] r18; wire[15:0] r19; wire[15:0] r20; wire[15:0] r21; wire[15:0] r22; wire[15:0] r23;
	wire[15:0] r24; wire[15:0] r25; wire[15:0] r26; wire[15:0] r27; wire[15:0] r28; wire[15:0] r29; wire[15:0] r30; wire[15:0] r31;
	wire[15:0] r34;
	
	wire[15:0] q0; wire[15:0] q1; wire[15:0] q2; wire[15:0] q3; wire[15:0] q4; wire[15:0] q5; wire[15:0] q6; wire[15:0] q7;
	wire[15:0] q8; wire[15:0] q9; wire[15:0] q10; wire[15:0] q11; wire[15:0] q12; wire[15:0] q13; wire[15:0] q14; wire[15:0] q15;
	wire[15:0] q16; wire[15:0] q17; wire[15:0] q18; wire[15:0] q19; wire[15:0] q20; wire[15:0] q21; wire[15:0] q22; wire[15:0] q23;
	wire[15:0] q24; wire[15:0] q25; wire[15:0] q26; wire[15:0] q27; wire[15:0] q28; wire[15:0] q29; wire[15:0] q30; wire[15:0] q31;
	wire[15:0] q34;
	
	wire[34:0] enable_bits = 35'b0000000000000000000000000000000001 << Sel_C;
 
	reg16 reg16_0(r0, clk, nreset, enable_bits[0], q0);
	reg16 reg16_1(r1, clk, nreset, enable_bits[1], q1);
	reg16 reg16_2(r2, clk, nreset, enable_bits[2], q2);
	// TO-DO: Completar el resto
	reg16 reg16_34(r34, clk, nreset, enable_bits[34], q34);
	
	always @ (Sel_A, Sel_B, Sel_C) begin
		case(Sel_A)
			0: 		Data_A = q0;
			1: 		Data_A = q1;
			2: 		Data_A = q2;
			// TO-DO: Completar el resto
			34: 		Data_A = q34;
			default: Data_A = q3;
		endcase
		
		case(Sel_B)
			0: 		Data_B = q0;
			1: 		Data_B = q1;
			2: 		Data_B = q2;
			// TO-DO: Completar el resto
			34: 		Data_B = q34;
			default: Data_B = q0;
		endcase
	end
	
endmodule

