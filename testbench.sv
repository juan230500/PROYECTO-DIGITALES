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

	// initialize test
	initial begin
	
		$display ("=============Prueba Negacion=============");
	
		switch4 = 1; switch5 = 0;
		reset <= 1; # 22; reset <= 0;
		for(i = 0; i<300; i++) begin
			if(MemWrite == 1 && DataAdr == 1)
				assert(WriteData == 67)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1 && DataAdr == 2)
				assert(WriteData == 65)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1 && DataAdr == 3)
				assert(WriteData == 83)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1 && DataAdr == 4)
				assert(WriteData == 65)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			clk <= 1; # 5; clk <= 0; # 5;
		end
				
		$display ("=============Prueba Suma=============");

		switch4 = 0; switch5 = 1;		
		reset <= 1; # 22; reset <= 0;
		for(i = 0; i<300; i++) begin
			if(MemWrite == 1 && DataAdr == 5)
				assert(WriteData == 77)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1 && DataAdr == 6) 
				assert(WriteData == 69)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1 && DataAdr == 7) 
				assert(WriteData == 83)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1 && DataAdr == 8) 
				assert(WriteData == 65)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			clk <= 1; # 5; clk <= 0; # 5;
		end
		
		
		$display ("=============Prueba XOR : 000 =============");
		
		switch4 = 0; switch5 = 0;
		switch1 = 0; switch2 = 0; switch3 = 0;
		reset <= 1; # 22; reset <= 0;
		for(i = 0; i<300; i++) begin
			if(MemWrite == 1  && DataAdr == 9)
				assert(WriteData == 76)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1  && DataAdr == 10) 
				assert(WriteData == 73)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1  && DataAdr == 11) 
				assert(WriteData == 66)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1  && DataAdr == 12) 
				assert(WriteData == 82)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1  && DataAdr == 13) 
				assert(WriteData == 79)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			clk <= 1; # 5; clk <= 0; # 5;
		end
		
		$display ("=============Prueba XOR : 010 =============");
		
		switch4 = 0; switch5 = 0;
		switch1 = 0; switch2 = 1; switch3 = 0;
		reset <= 1; # 22; reset <= 0;
		for(i = 0; i<300; i++) begin
			if(MemWrite == 1  && DataAdr == 14) 
				assert(WriteData == 67)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1  && DataAdr == 15) 
				assert(WriteData == 65)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1  && DataAdr == 16) 
				assert(WriteData == 83)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1  && DataAdr == 17) 
				assert(WriteData == 65)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			clk <= 1; # 5; clk <= 0; # 5;
		end
		
		
		$display ("=============Prueba XOR : 100 =============");
		
		switch4 = 0; switch5 = 0;
		switch1 = 1; switch2 = 0; switch3 = 0;
		reset <= 1; # 22; reset <= 0;
		for(i = 0; i<300; i++) begin
			if(MemWrite == 1 && DataAdr == 18) 
				assert(WriteData == 77)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1 && DataAdr == 19) 
				assert(WriteData == 69)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1 && DataAdr == 20) 
				assert(WriteData == 83)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			if(MemWrite == 1 && DataAdr == 21) 
				assert(WriteData == 65)
					$display ($sformatf("exito para Address: %d", DataAdr));
				else $error($sformatf("fallo para Address: %d, WriteData %b", DataAdr, WriteData));
			clk <= 1; # 5; clk <= 0; # 5;
		end

	end
endmodule