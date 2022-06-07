module shifter(input [15:0] ALU_OUT, 
					input [1:0] SH, 
					output [15:0] SH_OUT);
					
	assign SH_OUT = f(ALU_OUT, SH);
	
	
	function [15:0] f(	input [15:0] ALU_OUT, 
							input [1:0] SH);
	case (SH)
		 2'b00: 		f = ALU_OUT;
		 2'b01: 		f = ALU_OUT >> 1;
		 2'b10:		f = ALU_OUT << 1;
		 2'b11: 		f = ALU_OUT >>> 1;
		 default:	f = 0;
	endcase
	endfunction
	
endmodule