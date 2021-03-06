module controlador_vga(input clock_25,
							  input reset,
							  input [0:7] char [0:40],
							  output [7:0] red,
							  output [7:0] green,
							  output [7:0] blue,
							  output hsync,
							  output vsync,
							  output n_blank);
	logic [0:9] pixel_num;
	logic [0:9] linea_num;
	logic cambio_linea;
	//logic [0:7] char [0:10]='{ 8'd48, 8'd49, 8'd50, 8'd0, 8'd52, 8'd53, 8'd65, 8'd66, 8'd67, 8'd68, 8'd0};
   generate
		contador_horizontal contador_horizontal (clock_25, reset, pixel_num, cambio_linea);
		contador_vertical contador_vertical (cambio_linea, reset, linea_num);
		sincronizador sincronizador(pixel_num, linea_num, hsync, vsync, n_blank);
		asciiwriter ascii (clock_25, pixel_num, linea_num, char, red, green, blue);
	endgenerate
	
endmodule 