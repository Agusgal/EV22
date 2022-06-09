module fetch
(
 input clk,
 input nreset,
 input[6:0] TYPE,
 input B1_OUT,
 input[10:0] PC_VAL, //El nuevo valor de PC, en caso de ser aplicable.
 output reg[10:0] PC //Le pongo 10 como máximo, pero se usan menos en el ROM. Sólo para ser consistente con el tamaño máximo de la dirección del opcode.
 );
	always @(posedge clk, negedge nreset) begin
		if (!nreset) begin
			if (clk) PC <= 0;
			else PC <= -1;
      end else if(TYPE[6] && B1_OUT) //Si el MSB de TYPE es 1, es una instrucción referida al PC.
			PC <= PC_VAL;
      else
			PC <= PC + 1;
    end
endmodule