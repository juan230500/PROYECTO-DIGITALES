module controlador_vertical(input [0:7] lineas[0:479][0:639][0:2], 					
									input [0:8] linea_num,
									output [0:7] linea[0:639][0:2],
									output vsync,
									output n_blank);
	logic back_porch;
	logic front_porch;
	logic sync;
	
	generate 
		comparador_mayor #(9) comparador_front_porch(linea_num, 479, front_porch);
		comparador_mayor #(9) comparador_sync(linea_num, 490, sync);
		comparador_mayor #(9) comparador_back_porch(linea_num, 492, back_porch);
		assign vsync = sync ^ back_porch;
		assign n_blank = front_porch;
		assign linea = lineas[linea_num];
	endgenerate
endmodule 