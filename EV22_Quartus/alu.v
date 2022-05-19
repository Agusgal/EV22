module alu
(
 input[7:0] busA,
 input[7:0] busB,
 input[3:0] op,
 output reg [7:0] out
 );

 
always @(busA, busB, op)
begin
	case (op)
		4'b0000:  out = 0;
		4'b0001:  out = 1;
		4'b0010:  out = busA + busB;
		4'b0011:  out = busA - busB;
		4'b0100:  out = busA + 1;
		4'b0101:  out = busA - 1;
		4'b1000:  out = busA;		
		4'b1001:  out = busB;		
	endcase 
end

 
endmodule
