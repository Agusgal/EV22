module constant_reg ( input [7:0] k_in,
							 input byte_select,
							 input ena,
							 input clk,
							 output reg [15:0] k_out);
						 
	//always @ (clk) begin
	always @ (posedge clk) begin
		if(ena) begin
			if(byte_select)
				k_out = {k_in, k_out[7:0]};
			else
				k_out = {k_out[15:8], k_in};
		end
	end
	
endmodule