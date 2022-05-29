module constant_reg ( input [7:0] k_in,
							 input byte_select,
							 output reg [15:0] k_out);
						 
	always @ (byte_select) begin
		if(byte_select)
			k_out = {k_in, k_out[7:0]};
		else
			k_out = {k_out[15:8], k_in};
	end
	
endmodule