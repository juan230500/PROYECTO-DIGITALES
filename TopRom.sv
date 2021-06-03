module TopRom(input clk, 
				  input rst,
				  output logic [7:0] q,
				  output logic [7:0] address);
	
	ROM memoria (address, clk, q);
	Counter counter (clk, rst, 1'b1, address);
		
			
endmodule 