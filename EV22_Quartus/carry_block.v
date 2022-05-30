module carry_block ( input cy_out, 
							input clk, 
							input [3:0] aluc, 
							output reg cy);
	//Creo que esto lo que hace es preparar el carry para la próxima operación
	always @ (posedge clk) begin
		case(aluc)
			4'b0100: cy <= cy_out; //A+B
			4'b0101: cy <= cy_out; //A+B+CY
			4'b1011: cy <= cy_out; //CY=0
			4'b1100: cy <= cy_out; //CY=1
		endcase
	end
endmodule