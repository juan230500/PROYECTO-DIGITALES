module dmem(input logic clk, switch1, switch2, switch3, switch4, switch5,
		input logic [31:0] a,
		output logic [31:0] rd);
	//logic [31:0] RAM[63:0];
	logic [31:0] rd_aux;
	ROM memoria (a, ~clk, rd_aux);
	always_comb begin
		rd = 0;
		case(a)
			32'd254: 
				begin
					case({switch1, switch2, switch3})
						3'b000:  rd = 32'd0;
						3'b001:  rd = 32'b01001001;
						3'b010:  rd = 32'b10010010;
						3'b011:  rd = 32'b11011011;
						3'b100:  rd = 32'b00100100;
						3'b101:  rd = 32'b01101101;
						3'b110:  rd = 32'b10110110;
						3'b111:  rd = 32'b11111111;
					endcase
				end
			32'd255: 
				begin
					case({switch4, switch5})
							2'b00:  rd = 32'd0;
							2'b01:  rd = 32'b01;
							2'b10:  rd = 32'b10;
							2'b11:  rd = 32'b11;
					endcase
				end			
			default: rd = rd_aux;
			endcase
	end
	//assign rd = RAM[a[31:2]]; // word aligned
	//always_ff @(posedge clk)
	//	if (we) RAM[a[31:2]] <= wd;
endmodule
