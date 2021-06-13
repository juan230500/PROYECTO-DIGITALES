`timescale 1ns/1ns
module testbench();
	logic clk;
	logic reset;
	logic [7:0] WriteData, DataAdr;
	logic MemWrite;
	logic switch1;
	logic switch2;
	logic switch3;
	logic switch4;
	logic switch5;

	// instantiate device to be tested
	top arm(clk, reset, switch1, switch2, switch3, switch4, switch5, WriteData, DataAdr, MemWrite);

	logic [20:0] i;
	logic [20:0] correctWords;

	// initialize test
	initial begin
	
		$display ("=============Prueba Negacion=============");
	
		switch4 = 1; switch5 = 0;
		reset <= 1; # 22; reset <= 0;
		correctWords = 0;
		for(i = 0; i<300; i++) begin
			if(MemWrite == 1 && WriteData == 67 && DataAdr == 1) correctWords+=1;
			if(MemWrite == 1 && WriteData == 65 && DataAdr == 2) correctWords+=1;
			if(MemWrite == 1 && WriteData == 83 && DataAdr == 3) correctWords+=1;
			if(MemWrite == 1 && WriteData == 65 && DataAdr == 4) correctWords+=1;
			clk <= 1; # 5; clk <= 0; # 5;
		end
		
		assert (correctWords == 4) 
			$display ($sformatf("exito para Prueba Negacion"));
		else $error($sformatf("fallo para Prueba Negacion"));

		
		$display ("=============Prueba Suma=============");

		switch4 = 0; switch5 = 1;		
		reset <= 1; # 22; reset <= 0;
		correctWords = 0;
		for(i = 0; i<300; i++) begin
			if(MemWrite == 1 && WriteData == 77 && DataAdr == 5) correctWords+=1;
			if(MemWrite == 1 && WriteData == 69 && DataAdr == 6) correctWords+=1;
			if(MemWrite == 1 && WriteData == 83 && DataAdr == 7) correctWords+=1;
			if(MemWrite == 1 && WriteData == 65 && DataAdr == 8) correctWords+=1;
			clk <= 1; # 5; clk <= 0; # 5;
		end
		
		assert (correctWords == 4) 
			$display ($sformatf("exito para Prueba Suma"));
		else $error($sformatf("fallo para Prueba Suma"));
		
		
		$display ("=============Prueba XOR : 000 =============");
		
		switch4 = 0; switch5 = 0;
		switch1 = 0; switch2 = 0; switch3 = 0;
		reset <= 1; # 22; reset <= 0;
		correctWords = 0;
		for(i = 0; i<300; i++) begin
			if(MemWrite == 1 && WriteData == 76 && DataAdr == 9) correctWords+=1;
			if(MemWrite == 1 && WriteData == 73 && DataAdr == 10) correctWords+=1;
			if(MemWrite == 1 && WriteData == 66 && DataAdr == 11) correctWords+=1;
			if(MemWrite == 1 && WriteData == 82 && DataAdr == 12) correctWords+=1;
			if(MemWrite == 1 && WriteData == 79 && DataAdr == 13) correctWords+=1;
			clk <= 1; # 5; clk <= 0; # 5;
		end
		
		assert (correctWords == 5) 
			$display ($sformatf("exito para Prueba XOR : 000"));
		else $error($sformatf("fallo para Prueba XOR : 000"));

		$display ("=============Prueba XOR : 010 =============");
		
		switch4 = 0; switch5 = 0;
		switch1 = 0; switch2 = 1; switch3 = 0;
		reset <= 1; # 22; reset <= 0;
		correctWords = 0;
		for(i = 0; i<300; i++) begin
			if(MemWrite == 1 && WriteData == 67 && DataAdr == 14) correctWords+=1;
			if(MemWrite == 1 && WriteData == 65 && DataAdr == 15) correctWords+=1;
			if(MemWrite == 1 && WriteData == 83 && DataAdr == 16) correctWords+=1;
			if(MemWrite == 1 && WriteData == 65 && DataAdr == 17) correctWords+=1;
			clk <= 1; # 5; clk <= 0; # 5;
		end
		
		assert (correctWords == 4) 
			$display ($sformatf("exito para Prueba XOR : 010"));
		else $error($sformatf("fallo para Prueba XOR : 010"));
		
		
		$display ("=============Prueba XOR : 100 =============");
		
		switch4 = 0; switch5 = 0;
		switch1 = 1; switch2 = 0; switch3 = 0;
		reset <= 1; # 22; reset <= 0;
		correctWords = 0;
		for(i = 0; i<300; i++) begin
			if(MemWrite == 1 && WriteData == 77 && DataAdr == 18) correctWords+=1;
			if(MemWrite == 1 && WriteData == 69 && DataAdr == 19) correctWords+=1;
			if(MemWrite == 1 && WriteData == 83 && DataAdr == 20) correctWords+=1;
			if(MemWrite == 1 && WriteData == 65 && DataAdr == 21) correctWords+=1;
			clk <= 1; # 5; clk <= 0; # 5;
		end

		assert (correctWords == 4) 
			$display ($sformatf("exito para Prueba XOR : 100"));
		else $error($sformatf("fallo para Prueba XOR : 100"));
	end
endmodule