module contador_horizontal(input reloj, 
									input reset, 
									output [0:9] numero_pixel, 
									output cambio_linea);
	logic reset_interno;
	logic [0:9] maxColumnas;
	generate 
		contador_parametrizable #(10) contador(reloj, reset_interno, numero_pixel);
		comparador_igual #(10) comparador_igual(maxColumnas, numero_pixel, cambio_linea);
		assign maxColumnas = 10'd799;
		assign reset_interno = reset || cambio_linea;
	endgenerate
endmodule 