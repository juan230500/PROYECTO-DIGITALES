module test_random();
	logic clk;
	logic reset;
	reg [8:0] Xcells;
	reg [8:0] Ocells;
	reg [3:0] random;
	
   random_generator     test
								(Xcells,
								 Ocells,
								 clk,
								 reset,
								 random
								);	
	initial begin
		clk = 0;
		reset = 0;
		#1
		reset = 1;
		clk = 1;
		#1;
		reset = 0;
		clk = 0; 
		#1;
		Xcells = 9'b111_111_110;
		Ocells = 9'b000_000_001;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;
		clk = 1;
		#1;
		clk = 0;
		#1;	
		clk = 1;
		#1;
	//	$display($sformatf("%d", random));

	end


endmodule