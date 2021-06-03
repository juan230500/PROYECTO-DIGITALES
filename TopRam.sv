module TopRam(
	input	[7:0] data,
	input rdclock,
	input	[7:0] wraddress,
	input wrclock,
	input wren,
	output char [0:10]);

	logic	[7:0] q;
	logic [7:0] rdaddress;
	
	RAM RAM (data,
				rdaddress,
				rdclock,
				wraddress,
				wrclock,
				wren,
				q);
				
	Counter counter (rdclock, rst, 1'b1, rdaddress);
	
	always_ff@(posedge rdclock) begin
		char[{rdaddress}] = q;
	end					
endmodule 