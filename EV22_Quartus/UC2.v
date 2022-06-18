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
output reg HOLD
 );

 
 //Condiciones para Hold: 


parameter WR_read = 0;
parameter WR_write = 1;
parameter R_read = 2;
parameter R_write = 3;
parameter C_read = 4;
parameter C_write = 5;
parameter Jump = 6;

 
always @(*) begin

	HOLD <= 0;
	
	
	//Sltos: chequear que este bien planteada
	//if(Type1[Jump] && ((Type1(C_read) && (Type2(C_write) || Type4(C_write) || Type5(C_write))) || (Type1(WR_read) && (Type2(WR_write) || Type4(WR_write) || Type5(WR_write)))))
	//	HOLD <= 1;
	
	if((Type2[Jump] && (Type3 | Type4 | Type5)))   //Saltos
		HOLD <= 1;
	
	
	if( MR && (Type4[WR_write] || Type5[WR_write])) //Que no haya problemas leyendo en memoria, TODO: chequear timings
		HOLD <= 1;
	
	
	if(Type2[WR_read] && (Type3[WR_write] || Type4[WR_write] || Type5[WR_write]))	//Que no se pisen las instrucciones de leer y escribir en el WR, dudoso en type5
		HOLD <= 1;

	
	if(Type2[C_read] && (Type3[C_write] || Type4[C_write] || Type5[C_write]))	// Que el carry no se necesite usar.
		HOLD <= 1;
		
	
	if(Type2[R_read] && Type3[R_write] && SelA2 == SelC3[4:0])					// Conflictos de lectura-escritura en el registr
		HOLD <= 1;
	
	if(Type2[R_read] && Type4[R_write] && SelA2 == SelC4[4:0])
		HOLD <= 1;

	if(Type2[R_read] && Type5[R_write] && SelA2 == SelC5[4:0])
		HOLD <= 1;


end

endmodule
