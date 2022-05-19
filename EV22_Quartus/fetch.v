module fetch
(
 input[7:0] currPC,
 input clk,
 input nreset,
 output [7:0] nextPC
 );

	reg[7:0] q;
	 
	always @(posedge clk, negedge nreset) begin
		if (!nreset) q <= 0;
		else q <= currPC + 1;
	end

	assign nextPC = q;
 
endmodule