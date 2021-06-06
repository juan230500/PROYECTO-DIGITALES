module test_main();
	logic clock_50;
	logic reset;
	logic [0:7] red_out;
	logic [0:7] green_out;
	logic [0:7] blue_out;
	logic hsynce;
	logic vsynce;
	logic n_blanke;
	logic hsync;
	logic vsync;
	logic n_blank;
	logic vgaclock;
	logic [0:10] i;
	logic [0:10] j;
	integer R;
	integer G;
	integer B;

	main test( clock_50, red_out, green_out, blue_out, hsync, vsync, n_blank, vgaclock);
	initial begin
		reset = 0;
		R = $fopen("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//R_test.txt");
		G = $fopen("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//G_test.txt");
		B = $fopen("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//B_test.txt");

		for(j = 0; j < 524; j = j + 1) begin	
			n_blanke = 0;
			if(j<480)begin
				vsynce = 1;
			end
			else if(j>479 && j<491)begin 
				vsynce = 1;
				n_blanke = 1;
			end
			if(j>490 && j<493)begin 
				vsynce = 0;
				n_blanke = 1;
			end
			if(j>492)begin 
				vsynce = 1;
				n_blanke = 1;
			end
			for(i = 0; i < 800; i = i + 1) begin
				if(i<640)begin
					hsynce = 1;
				end
				else if(i>639 && i<656)begin 
					hsynce = 1;
					n_blanke = 1;
				end
				if(i>655 && i<752)begin 
					hsynce = 0;
					n_blanke = 1;
				end
				if(i>751)begin 
					hsynce = 1;
					n_blanke = 1;
				end
				clock_50 = 0;
				#1;
				clock_50 = 1;
				#1;
				$fdisplay(R,"%h", red_out);
				$fdisplay(G,"%h", green_out);
				$fdisplay(B,"%h", blue_out);
				//if ( !(( n_blank==0 || n_blanke == n_blank) && hsynce == hsync && vsync == vsynce))
				//	$error($sformatf("fallo para i = %d, j = %d", i, j));
				clock_50 = 0;
				#1;
				clock_50 = 1;
				#1;
			end
		end	
	end
endmodule
