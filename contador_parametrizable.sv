module contador_parametrizable #(parameter n = 5) 
						(input reloj,      
                  input reset,              
                  output reg [n-1:0] out);  
						
	reg     [n-1:0] contador = 0;
	always @ (posedge reloj) begin
		 if (reset)
			  contador <= 0;
		 else
			  contador <= contador + 1;
	end 
	assign out = contador;

endmodule
