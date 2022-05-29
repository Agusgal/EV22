module ALU ( input [15:0] b,
				 input [15:0] a,
				 input [3:0] aluc,
				 input cy_in,
				 output reg cy_out,
				 output reg [15:0] z);
	
	always @ (b, a, aluc, cy_in) begin
		case(aluc)
			4'b0000 : z = a;
			4'b0001 : z = b;
			4'b0010 : z = ~a;
			4'b0011 : z = ~b;
			4'b0100 : {cy_out, z} = a + b;
			4'b0101 : {cy_out, z} = a + b + cy_in;
			4'b0110 : z = a | b;
			4'b0111 : z = a & b;
			4'b1000 : z = 0;
			4'b1001 : z = 1;
			4'b1010 : z = 16'hFFFF;
			4'b1011 : cy_out = 0;
			4'b1100 : cy_out = 1;
			default : {cy_out, z} = 0;
		endcase
	end		
				 
endmodule