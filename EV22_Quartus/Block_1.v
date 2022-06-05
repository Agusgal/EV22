module Block1
(
	input[1:0] OPCODES, //B13...B12
	input CY,
	input[15:0] W,
	output reg B1OUT
);

	always @ (OPCODES, CY, W) begin
	
		if(OPCODES[1] && OPCODES[0]) //JCY X
				if(CY)
					B1OUT <= 1;
				else
					B1OUT <= 0;
		else
			if(OPCODES[1] && !OPCODES[0]) //JNE X 
					if(W[15] == 1) //MSB representa al signo del valor guardado en W.
						B1OUT <= 1; //Salta si W vale uno.
					else
						B1OUT <= 0;	
		else
				if(!OPCODES[1] && OPCODES[0])//JZE X
					if(W == 0) //Salta si W vale cero. 
						B1OUT <= 1;
					else
						B1OUT <= 0;
		else
				if(!OPCODES[1] && !OPCODES[0]) //JMP X
					B1OUT <= 1;		
	end 
endmodule

						
					
				