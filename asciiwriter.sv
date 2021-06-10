module fonts_ram(q, a, clk);
   output logic [7:0] q;
   input [31:0] a;
   input clk;
   reg [7:0] mem [0:15049];
	initial begin
		$readmemh ("fonts.txt", mem);
	end
   always @(posedge clk) begin
        q <= mem[a];
   end
endmodule



module asciiwriter(input clk,
						 input [0:9] x, 
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
	logic [7:0] font;
	logic [31:0] pixel_num;
	logic [10:0] i;
	
	fonts_ram fonts_ram (font, pixel_num, clk);
	
	
	always_comb begin
		pixel_num = 0;
		red <= 8'hff;
		green <= 8'hff;
		blue <= 8'hff;	

		for(i = 0; i < 40; i++) begin
			if(img_cols + x0 + img_cols*i > x && img_rows + y0 > y && x>x0 + img_cols*i && y>y0 &&
				character[{i}]>8'd0) begin 
				pixel_num = character_bytes*(character[{i}]-8'd48) + (y-i-y0)*img_cols + (x-x0);
				red <= font;
				green <= font;
				blue <= font;
			end
		end
	end
endmodule 
