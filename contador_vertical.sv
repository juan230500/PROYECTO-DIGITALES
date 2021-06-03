module contador_vertical(input reloj, input reset, output [0:9] numero_linea);
	logic cambio_linea;
	logic reset_interno;
	logic [0:9] maxFilas;
	logic maxAlcanzado;
	generate 
		contador_parametrizable #(10) contador(reloj, reset_interno, numero_linea);
		comparador_igual #(10) comparador_igual(maxFilas, numero_linea, maxAlcanzado);
		assign maxFilas = 10'd523;
		assign reset_interno = reset || maxAlcanzado;
	endgenerate
endmodule 