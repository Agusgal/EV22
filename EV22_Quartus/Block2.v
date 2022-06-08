module Block2(
					input clk,
					input[15:0] W_IN,
					input[15:0] W_MEM_IN,
					input MR,
					input MW,
					input[15:0] Data_C,
					input[5:0] Sel_C,
					output reg[15:0] W_MEM_OUT,
					output reg[15:0] DATA,
					output reg[5:0] SEL_REG			
					);

	reg[15:0] prevData = 0;
				
	always @ (posedge clk) begin
		if(MR) begin
			SEL_REG <= 6'b100010; //Reg 34, working register. Hardcodeado porque el opcode pone SEL_C en 35, pero necesito de alguna forma indicarle al bloque que pase esto al registro W.
			DATA <= W_MEM_IN; //Le paso al working register lo que leí de memoria.
		end else if(MW) begin
			W_MEM_OUT <= W_IN; //Le paso a la memoria lo que tengo en W.
			SEL_REG <= 6'b100011; //r35, que se usa para no escribir en ningun lado.
		end else begin
			SEL_REG <= Sel_C;
			if(Sel_C != 35)
				DATA <= Data_C;
		end
	end		
endmodule				