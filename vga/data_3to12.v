module data_3to12(input [18:0] address_3, input [23:0] data_24, output reg [2:0] data_3);
	
	always @(address_3, data_24) begin
		case(address_3[2:0])
			0: data_3 = data_24[2:0];
			1: data_3 = data_24[5:3];
			2: data_3 = data_24[8:6];
			3: data_3 = data_24[11:9];
			4: data_3 = data_24[14:12];
			5: data_3 = data_24[17:15];
			6: data_3 = data_24[20:18];
			7: data_3 = data_24[23:21];
		endcase
	end
	
endmodule