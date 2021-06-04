module clock25mh(input clock_50, output logic clock_25);

	logic [0:1] cuenta_clock;
	generate
		contador_parametrizable #(2) divisor_clock(clock_50, 0, cuenta_clock);
	endgenerate
	
	always_comb begin
		clock_25 = cuenta_clock[1];
	end

endmodule 