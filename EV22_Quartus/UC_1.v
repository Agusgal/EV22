module UC_1(
input MR_IN,
input MW_IN,
input [5:0] SelC_in,
input [6:0] Type_in,
input HOLD,
output [5:0] SelC_out,
output [6:0] Type_out,
output MR_OUT,
output MW_OUT
);

	//TODO chequear funcionamiento de MR y MW en caso de hold
	assign SelC_out = F_SelC(HOLD, SelC_in);	
	assign Type_out = F_Type(HOLD, Type_in);
	assign MR_OUT = F_MR(HOLD, MR_IN);
	assign MW_OUT = F_MW(HOLD, MW_IN);
	
	
	function [5:0] F_SelC (input hold, input [5:0] sel);
		if(hold)
			F_SelC = 35;
		else
			F_SelC = sel;
	endfunction
	
	function [6:0] F_Type (input hold, input [6:0] type);
		if(hold)
			F_Type = 7'b0;
		else 
			F_Type = type;
	endfunction
	
	function F_MR(input hold, input mrin);
		if(hold)
			F_MR = 0;
		else
			F_MR = mrin;
	endfunction
	
	function F_MW(input hold, input mwin);
		if(hold)
			F_MW = 0;
		else
			F_MW = mwin;
	endfunction
			
endmodule