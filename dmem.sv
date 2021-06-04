module dmem(input logic clk, switch1, switch2,
		input logic [31:0] a,
		output logic [31:0] rd);
	//logic [31:0] RAM[63:0];
	//logic [31:0] rd_aux;
	ROM memoria (a, clk, rd);
//	always_comb begin
//		rd = 0;
//		case(a)
//			32'd256: 
//				begin
//					case({switch1, switch2})
//						2'b00:  rd = 2'b00;
//						2'b01:  rd = 2'b01;
//						2'b10:  rd = 2'b10;
//					endcase
//				end
//					
//			default: rd = rd_aux;
//			endcase
//	end
	//assign rd = RAM[a[31:2]]; // word aligned
	//always_ff @(posedge clk)
	//	if (we) RAM[a[31:2]] <= wd;
endmodule
