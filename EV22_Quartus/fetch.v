module fetch
(
 input clk,
 input nreset,
 output reg[7:0] PC
 );
	always @(posedge clk, negedge nreset) begin
		if (!nreset) PC <= 0;
		else PC <= PC + 1;
	end
 
endmodule