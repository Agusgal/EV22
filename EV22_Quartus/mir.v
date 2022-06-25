module MIR
(
input[3:0] ALUC_IN,
input[1:0] SH_IN,
input KMux_IN,
input MR_IN,
input MW_IN,
input[4:0] SelA_IN,
input[5:0] SelB_IN,
input[5:0] SelC_IN,
input[6:0] Type_IN,
input[9:0] DAdd_IN,
input CLK,
output reg[3:0] ALUC_OUT,
output reg[1:0] SH_OUT,
output reg KMux_OUT,
output reg MR_OUT,
output reg MW_OUT,
output reg[4:0] SelA_OUT,
output reg[5:0] SelB_OUT,
output reg[5:0] SelC_OUT,
output reg[6:0] Type_OUT,
output reg[9:0] DAdd_OUT
 );

 
 always @(posedge CLK) begin

	
	ALUC_OUT <= ALUC_IN;
	SH_OUT <= SH_IN;
	KMux_OUT <= KMux_IN;
	MR_OUT <= MR_IN;
	MW_OUT <= MW_IN;
	SelA_OUT <= SelA_IN;
	SelB_OUT <= SelB_IN;
	SelC_OUT <= SelC_IN;
	Type_OUT <= Type_IN;
	DAdd_OUT <= DAdd_IN;
	
end

endmodule
