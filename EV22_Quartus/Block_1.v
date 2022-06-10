module Block1
(
	input[2:0] OPCODES, //B13...B11
	input CY,
	input[15:0] W,
	output reg B1OUT,
	output reg SR_OUT		//Subrutina
);

	always @ (OPCODES, CY, W) begin
	
		case(OPCODES)
			3'b111: 	begin //JCY X
							if(CY) begin
								B1OUT <= 1;
								SR_OUT <=	0;
							end else begin
								B1OUT <= 0;
								SR_OUT <=	0;
							end
						end
			3'b110: 	begin //JNE X 
							if(W[15] == 1) begin //MSB representa al signo del valor guardado en W.
								B1OUT <= 1; //Salta si W vale uno.
								SR_OUT <=	0;
							end else begin
								B1OUT <= 0;	
								SR_OUT <=	0;
							end
						end
			3'b101: 	begin //JZE X
							if(W == 0) begin //Salta si W vale cero. 
								B1OUT <= 1;
								SR_OUT <=	0;
							end else begin
								B1OUT <= 0;
								SR_OUT <=	0;
							end
						end
			3'b100: 	begin //JMP X
							B1OUT <= 1;		
							SR_OUT <=	0;
						end
			3'b011: 	begin //BSR S
							B1OUT <= 1;
							SR_OUT <=	1;
						end
			3'b000: 	begin //RET
							B1OUT <= 0;
							SR_OUT <= 1;
						end
		endcase
	end 
endmodule

						
					
				