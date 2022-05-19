module reg8
(
 input[7:0] d,
 input clk,
 input nreset,
 input ena,
 output [7:0] qo
 );

	reg[7:0] q;
	wire reset;
	
	assign reset = ~nreset;
 
	always @(posedge clk, posedge reset) begin
		if (reset) begin
			q <= 0;
		end
		else if (clk && ena) begin
			q <= d;
		end
	end

	assign qo = q;


endmodule