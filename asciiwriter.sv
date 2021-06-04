module asciiwriter(input [0:9] x, 
						 input [0:9] y,
						 input [0:7] character [0:40],
						 output logic [7:0] red,
						 output logic [7:0] green,
						 output logic [7:0] blue);
						
	parameter img_bytes = 20'd15049;	
	parameter img_cols = 10'd14;	
	parameter img_rows = 10'd25;
	parameter character_bytes = 350;
	logic x0 = 10'd12;
	parameter y0 = (10'd480 - img_rows)/2;
	
	
	reg [7:0] fonts [0:img_bytes];
	
	logic [31:0] pixel_num;
	logic [10:0] i;
	
	initial begin
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//48.txt", fonts,0,349);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//49.txt", fonts,350,699);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//50.txt", fonts,700,1049);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//51.txt", fonts,1050,1399);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//52.txt", fonts,1400,1749);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//53.txt", fonts,1750,2099);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//54.txt", fonts,2100,2449);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//55.txt", fonts,2450,2799);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//56.txt", fonts,2800,3149);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//57.txt", fonts,3150,3499);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//65.txt", fonts,5950,6299);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//66.txt", fonts,6300,6649);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//67.txt", fonts,6650,6999);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//68.txt", fonts,7000,7349);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//69.txt", fonts,7350,7699);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//70.txt", fonts,7700,8049);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//71.txt", fonts,8050,8399);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//72.txt", fonts,8400,8749);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//73.txt", fonts,8750,9099);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//74.txt", fonts,9100,9449);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//75.txt", fonts,9450,9799);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//76.txt", fonts,9800,10149);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//77.txt", fonts,10150,10499);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//78.txt", fonts,10500,10849);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//79.txt", fonts,10850,11199);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//80.txt", fonts,11200,11549);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//81.txt", fonts,11550,11899);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//82.txt", fonts,11900,12249);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//83.txt", fonts,12250,12599);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//84.txt", fonts,12600,12949);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//85.txt", fonts,12950,13299);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//86.txt", fonts,13300,13649);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//87.txt", fonts,13650,13999);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//88.txt", fonts,14000,14349);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//89.txt", fonts,14350,14699);
		$readmemh ("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//hex//90.txt", fonts,14700,15049);
	end
	
	always_comb begin
		pixel_num = 0;
		red <= 8'hff;
		green <= 8'hff;
		blue <= 8'hff;	

		for(i = 0; i < 40; i++) begin
			if(img_cols + x0 + img_cols*i > x && img_rows + y0 > y && x>x0 + img_cols*i && y>y0 &&
				character[{i}]>8'd0) begin 
				pixel_num = character_bytes*(character[{i}]-8'd48) + (y-i-y0)*img_cols + (x-x0);
				red <= fonts[{pixel_num}];
				green <= fonts[{pixel_num}];
				blue <= fonts[{pixel_num}];	
			end
		end
	end
endmodule 
