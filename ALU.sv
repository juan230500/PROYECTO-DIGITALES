	module ALU #(parameter WIDTH = 32)( 
    input [WIDTH-1:0] A,
	 input [WIDTH-1:0] B,
	 input [1:0] sel,
    output logic [WIDTH-1:0] Out,
	 output logic [3:0] flags
);

	 logic N;
	 logic Z;
	 logic V;
	 logic C;

	//=============SUMADOR=============

	logic [WIDTH-1:0] OutSumador;
	logic CSumador,VSumador;

	Adder_Substractor #(.WIDTH( WIDTH )) Sumador(A,B,OutSumador,sel[0],CSumador,VSumador);

		
	//=============MULTIPLICADOR=============
	
	logic [WIDTH-1:0] OutMultiplicador;
	logic CMultiplicador,VMultiplicador;

	multiplicador #( WIDTH ) Multiplicador(A,B,OutMultiplicador,VMultiplicador,CMultiplicador);
	
	//=============DIVISOR=============
	
	logic [WIDTH-1:0] OutDivisor;
	logic CDivisor,VDivisor;

	divisor #( WIDTH ) Divisor(A,B,OutDivisor,VDivisor,CDivisor);
	
	//=============MODULO=============
	
	logic [WIDTH-1:0] OutModulo;
	logic CModulo,VModulo;

	modulo #( WIDTH ) Modulo(A,B,OutModulo,VModulo,CModulo);
	
	//=============AND=============
	
	logic [WIDTH-1:0] OutAND;
	logic CAND,VAND;

	and_modulo #( WIDTH ) AND(A,B,OutAND,VAND,CAND);
	
	//=============OR=============
	
	logic [WIDTH-1:0] OutOR;
	logic COR,VOR;

	or_modulo #( WIDTH ) OR(A,B,OutOR,VOR,COR);
	
	//=============XOR=============
	
	logic [WIDTH-1:0] OutXOR;
	logic CXOR,VXOR;

	xor_modulo #( WIDTH ) XOR(A,B,OutXOR,VXOR,CXOR);
	
	
	//=============SHIFTL=============
	
	logic [WIDTH-1:0] OutShiftL;
	logic CShiftL,VShiftL;

	shiftL_modulo #( WIDTH ) ShiftL(A,OutShiftL,VShiftL,CShiftL);
	
	//=============SHIFTR=============
	
	logic [WIDTH-1:0] OutShiftR;
	logic CShiftR,VShiftR;

	shiftR_modulo #( WIDTH ) ShiftR(A,OutShiftR,VShiftR,CShiftR);
	

	always_comb begin  
	
      case (sel)  
         4'b00,
			4'b01 : begin
				Out = OutSumador;
				C <= CSumador;
				V <= VSumador;
				
			end
			4'b10 : begin
				Out = OutAND;
				C <= CAND;
				V <= VAND;
				
				
			end
			4'b11 :begin
				Out = OutOR;
				C <= COR;
				V <= VOR;
			end
      endcase 
	
		N <= Out[WIDTH-1];
		Z <= ~|Out;
		
		
   end
	
	assign flags = {N,Z,C,V};
	
endmodule