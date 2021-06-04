module sincronizador(input [0:9] pixel_num,
										input [0:9] linea_num,
										output hsync,
										output vsync,
										output n_blank);
	logic hback_porch;
	logic hfront_porch;
	logic hsync_aux;
	logic vback_porch;
	logic vfront_porch;
	logic vsync_aux;
	
	generate 
		//comparaciones horizontales
		comparador_mayor #(10) comparador_hfront_porch(pixel_num, 10'd639, hfront_porch);
		comparador_mayor #(10) comparador_hsync(pixel_num, 10'd655, hsync_aux);
		comparador_mayor #(10) comparador_hback_porch(pixel_num, 10'd751, hback_porch);
		//comparaciones verticales
		comparador_mayor #(10) comparador_vfront_porch(linea_num, 10'd479, vfront_porch);
		comparador_mayor #(10) comparador_vsync(linea_num, 10'd490, vsync_aux);
		comparador_mayor #(10) comparador_vback_porch(linea_num, 10'd492, vback_porch);
		
		assign vsync = ~(vsync_aux ^ vback_porch);
		assign hsync = ~(hsync_aux ^ hback_porch);
		assign n_blank = ~(hfront_porch || vfront_porch);
		
	endgenerate
endmodule 