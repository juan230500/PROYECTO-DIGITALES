module test_horizontal();
	logic clock;
	logic reset;
	logic cambio_linea;
	logic unsigned [0:9] j;
	logic unsigned [0:3] i;
	logic unsigned [0:9] cuenta;
	contador_horizontal test (clock, reset, cuenta, cambio_linea);	
	initial begin
		reset = 0;
		#1;
		for(i = 0; i < 2; i = i + 1) begin
			for(j = 0; j < 800; j = j + 1) begin	
				clock = 0;
				#1;
				assert (j==cuenta) 
					$display("noice");
				else $error($sformatf("fallo para j = %d", j));
				clock = 1;
				#1;
			end	
		end
	end

endmodule 