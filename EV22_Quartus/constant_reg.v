module constant_reg ( input [7:0] k_in,
							 input byte_select,
							 input ena,
							 input clk,
							 input nreset,
							 output reg [15:0] k_out);
						 
						 
		
	wire reset;
	assign reset = ~nreset;
						 
	//always @ (clk) begin
	always @ (posedge clk, posedge reset) begin
		if(reset) begin
			k_out = 0;
		end else if(ena) begin
			if(byte_select)
				k_out = {k_in, k_out[7:0]};
			else
				k_out = {k_out[15:8], k_in};
		end
	end
	
endmodule