module UC2
(
input [4:0]SelA2,
input [5:0]SelB2,
input [6:0]Type2,
input [6:0]Type3,
input [5:0]SelC3,
input [6:0]Type4,
input [5:0]SelC4,
input [6:0]Type5,
input [5:0]SelC5,
input MR,
input nreset,
output reg HOLD
 );


	parameter WR_read = 0;
	parameter WR_write = 1;
	parameter R_read = 2;
	parameter R_write = 3;
	parameter C_read = 4;
	parameter C_write = 5;
	parameter Jump = 6;

 
	/*assign HOLD = F_HOLD(SelA2, SelB2, Type2, Type3, SelC3, Type4, SelC4, Type5, SelC5, MR);	
	
	
	function F_HOLD (input [4:0] sela2, input [5:0] selb2, input [6:0 ] type2, input [6:0] type3, input [5:0] selc3, input [6:0] type4, input [5:0] selc4, input [6:0] type5, input [5:0] selc5, input mr);		
		//F_HOLD = 0;
		
		if((type2[Jump] && (type3 | type4 | type5))) begin   //Saltos
			F_HOLD = 1'b1;
		end
		else if(mr && (type4[WR_write] || type5[WR_write])) begin //Que no haya problemas leyendo en memoria, TODO: chequear timings
			F_HOLD = 1'b1;
		end
		else if (type2[WR_read] && (type3[WR_write] || type4[WR_write] || type5[WR_write])) begin //Que no se pisen las instrucciones de leer y escribir en el WR, dudoso en type5
			F_HOLD = 1'b1;
		end
		else if (type2[C_read] && (type3[C_write] || type4[C_write] || type5[C_write])) begin	// Que el carry no se necesite usar.
			F_HOLD = 1;
		end
		else if (type2[R_read] && type3[R_write] && sela2 == selc3[4:0]) begin //Conflictos de lectura escritura en registros ij
			F_HOLD = 1;
		end
		else if (type2[R_read] && type4[R_write] && sela2 == selc4[4:0]) begin
			F_HOLD = 1;
		end
		else if (type2[R_read] && type5[R_write] && sela2 == selc5[4:0]) begin
			F_HOLD = 1;
		end
		else begin
			F_HOLD = 1'b0;
		end
	endfunction*/
	
	
 
always @(*) begin

	
	
	//Sltos: chequear que este bien planteada
	//if(Type1[Jump] && ((Type1(C_read) && (Type2(C_write) || Type4(C_write) || Type5(C_write))) || (Type1(WR_read) && (Type2(WR_write) || Type4(WR_write) || Type5(WR_write)))))
	//	HOLD <= 1;
	

	if((Type2[Jump]) && (Type3 | Type4 | Type5))   //Saltos tiene Bug :ccccc
		HOLD = 1'b1;
	else if( MR && (Type4[WR_write] || Type5[WR_write])) //Que no haya problemas leyendo en memoria, TODO: chequear timings
		HOLD = 1'b1;
	else if(Type2[WR_read] && (Type3[WR_write] || Type4[WR_write] || Type5[WR_write]))	//Que no se pisen las instrucciones de leer y escribir en el WR, dudoso en type5
		HOLD = 1'b1;
	else if(Type2[C_read] && (Type3[C_write] || Type4[C_write] || Type5[C_write]))	// Que el carry no se necesite usar.
		HOLD = 1'b1;
	else if(Type2[R_read] && Type3[R_write] && SelA2 == SelC3[4:0])					// Conflictos de lectura-escritura en el registr
		HOLD = 1'b1;
	else if(Type2[R_read] && Type4[R_write] && SelA2 == SelC4[4:0])
		HOLD = 1'b1;
	else if(Type2[R_read] && Type5[R_write] && SelA2 == SelC5[4:0])
		HOLD = 1'b1;
	else
		HOLD = 1'b0;
	
	
end

endmodule
