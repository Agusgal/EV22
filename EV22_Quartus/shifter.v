module shifter(input [15:0] ALU_OUT, 
					input [1:0] SH, 
					output [15:0] SH_OUT);
	
	reg [15:0] SH_OUT_REG;
	assign SH_OUT= SH_OUT_REG;
	always @ (*) begin
		case(SH)
		2'b00: SH_OUT_REG = ALU_OUT; //No Shift
		2'b01: SH_OUT_REG = ALU_OUT >> 1; //Logical Shift Right 1
		2'b10: SH_OUT_REG = ALU_OUT << 1; //Logical Shift Left 1
		2'b11: SH_OUT_REG = ALU_OUT >>> 1; //Arithmetic Shift Righ 1
		endcase
	end

	endmodule