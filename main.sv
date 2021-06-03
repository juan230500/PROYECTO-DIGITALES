module main(input clock_50,
				input switch1,
				input switch2,
				input switch3,
				output [7:0] red_out,
				output [7:0] green_out,
				output [7:0] blue_out,
				output hsync,
				output vsync,
				output n_blank,
				output vgaclock);
	
	logic [0:7] char [0:10];
	logic clock_25;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	generate 
		clock25mh clock(clock_50, clock_25);				
		controlador_vga controlador(clock_25,
						0,
						char,
						red_out,
						green_out,
						blue_out,
						hsync, 
						vsync, 
						n_blank);
		
		top arm (clock_50, 
					0, 
					WriteData, 
					DataAdr, 
					MemWrite);
					
		TopRam TopRam (WriteData,
				clock_25,
				DataAdr,
				clock_50,
				MemWrite,
				char);
		assign vgaclock = clock_25;
	endgenerate
endmodule 