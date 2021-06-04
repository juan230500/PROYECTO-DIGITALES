module test_img();
	logic [0:7] red;
	logic [0:7] green;
	logic [0:7] blue;
	logic [0:9] i;
	logic [0:9] j;
	logic [0:7] char [0:10]='{ 8'd50, 8'd49, 8'd50, 8'd0, 8'd52, 8'd53, 8'd65, 8'd66, 8'd67, 8'd68, 8'd0};
	//logic [0:7] char =  8'd50;
	integer R;
	integer G;
	integer B;

//	char[0] = 8b'48;
//	char[1] = 8b'49;
//	char[2] = 8b'50;
//	char[3] = 8b'51;
//	char[4] = 8b'52;
//	char[5] = 8b'53;
//	char[6] = 8b'54;
//	char[7] = 8b'65;
//	char[8] = 8b'66;
//	char[9] = 8b'67;
//	char[10] =  8b'68;

	parameter img_cols = 10'd800;	//Gimp has 80x80 pixels
	parameter img_rows = 10'd480;	//Gimp has 80x80 pixels

	asciiwriter test (i, j, char, red, green, blue);
	initial begin
		R = $fopen("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//R_test.txt");
		G = $fopen("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//G_test.txt");
		B = $fopen("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//B_test.txt");

		for(j = 0; j < img_rows; j = j + 1) begin	
			for(i = 0; i < img_cols; i = i + 1) begin
				#10
				$fdisplay(R,"%h", red);
				$fdisplay(G,"%h", green);
				$fdisplay(B,"%h", blue);
			end
		end
	end 
endmodule