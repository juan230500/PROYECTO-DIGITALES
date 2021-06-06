module register #(parameter n = 5) (input [n-1:0] A, input clk, 
												input rst, output reg [n-1:0] out);
												
	always_ff@(posedge clk, posedge rst)
		if(rst)
			out = {(n){1'b0}};
		else
			out = A;
	
endmodule 