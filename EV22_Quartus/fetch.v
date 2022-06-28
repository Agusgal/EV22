module fetch
(
 input clk,
 input nreset,
 input[6:0] TYPE,
 input B1_OUT,
 input[10:0] PC_VAL, 	//El nuevo valor de PC, en caso de ser aplicable.
 input SR_IN,				//Indica si la instruccion es BSR o RET
 output reg[10:0] PC 	//Le pongo 11 como máximo, pero se usan menos en el ROM. Sólo para ser consistente con el tamaño máximo de la dirección del opcode.
 );
	reg [10:0] stack[0:3];
	
	integer tos = 0;	//Top of Stack
 
	always @(posedge clk, negedge nreset) begin
		if (!nreset) begin
			if (clk) PC <= 0;
			else PC <= -1;
      end else if(TYPE[6]) begin	//Si el MSB de TYPE es 1, es una instrucción referida al PC.
			if(!SR_IN) begin
				if(B1_OUT)				
					PC <= PC_VAL;
				else
					PC <= PC + 1;
			end else begin
				if(B1_OUT && tos != 3) begin	//BSR S
					stack[tos] = PC;
					tos = tos + 1;
					PC = PC + PC_VAL[9:0];
				end else if(tos != 0) begin	//RET
					PC = stack[tos-1]+1;
					tos = tos - 1;
				end
			end
      end else begin
			PC <= PC + 1;
		end
    end
endmodule