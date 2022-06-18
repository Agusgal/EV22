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

endmodule