module address_3to12(input [18:0] address_3, output [15:0] address_24);
	
	assign address_24 = address_3 >> 2;
	
endmodule