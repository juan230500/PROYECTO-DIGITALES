module asciiwriter(input [0:9] x, 
						 input [0:9] y,
						 input [0:7] character [0:10],
						 output logic [7:0] red,
						 output logic [7:0] green,
						 output logic [7:0] blue);
						
	parameter img_bytes = 20'd243207;	
	parameter img_cols = 10'd56;	
	parameter img_rows = 10'd101;
	parameter character_bytes = 5656;
	logic x0 = 10'd12;
	parameter y0 = (10'd480 - img_rows)/2;
	
	
	reg [7:0] fonts [0:img_bytes];
	
	logic [31:0] pixel_num;
	logic [5:0] i;
	
	initial begin
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//48.txt", fonts,0,5655);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//49.txt", fonts,5656,11311);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//50.txt", fonts,11312,16967);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//51.txt", fonts,16968,22623);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//52.txt", fonts,22624,28279);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//53.txt", fonts,28280,33935);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//54.txt", fonts,33936,39591);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//55.txt", fonts,39592,45247);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//56.txt", fonts,45248,50903);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//57.txt", fonts,50904,56559);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//65.txt", fonts,96152,101807);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//66.txt", fonts,101808,107463);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//67.txt", fonts,107464,113119);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//68.txt", fonts,113120,118775);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//69.txt", fonts,118776,124431);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//70.txt", fonts,124432,130087);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//71.txt", fonts,130088,135743);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//72.txt", fonts,135744,141399);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//73.txt", fonts,141400,147055);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//74.txt", fonts,147056,152711);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//75.txt", fonts,152712,158367);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//76.txt", fonts,158368,164023);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//77.txt", fonts,164024,169679);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//78.txt", fonts,169680,175335);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//79.txt", fonts,175336,180991);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//80.txt", fonts,180992,186647);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//81.txt", fonts,186648,192303);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//82.txt", fonts,192304,197959);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//83.txt", fonts,197960,203615);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//84.txt", fonts,203616,209271);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//85.txt", fonts,209272,214927);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//86.txt", fonts,214928,220583);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//87.txt", fonts,220584,226239);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//88.txt", fonts,226240,231895);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//89.txt", fonts,231896,237551);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//90.txt", fonts,237552,243207);
	end
	
	always_comb begin
		pixel_num = 0;
		red <= 8'hff;
		green <= 8'hff;
		blue <= 8'hff;	

		for(i = 0; i < 11; i++) begin
			if(img_cols + x0 + img_cols*i > x && img_rows + y0 > y && x>x0 + img_cols*i && y>y0 &&
				character[{i}]>8'd0) begin 
				pixel_num = character_bytes*(character[{i}]-8'd48) + (y-y0)*img_cols + (x-x0);
				red <= fonts[{pixel_num}];
				green <= fonts[{pixel_num}];
				blue <= fonts[{pixel_num}];	
			end
		end
	end
endmodule 
