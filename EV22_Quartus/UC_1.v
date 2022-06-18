module UC_1(
input MR_IN,
input MW_IN,
input [5:0] SelC_in,
input [6:0] Type_in,
input HOLD,
input CK3,
output reg [5:0] SelC_out,
output reg [6:0] Type_out,
output reg MR_OUT,
output reg MW_OUT
);

//TODO chequear funcionamiento de MR y MW en caso de hold
always @(negedge CK3) begin
	if(!HOLD) begin
	SelC_out<= 35;	
	Type_out<= 6'b0;
	end
	else begin
	SelC_out <= SelC_in;
	Type_out <= Type_in;
	
	end
end

endmodule