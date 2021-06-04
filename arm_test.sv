module arm_test();
	logic clk, reset;
	logic [31:0] PC;
	logic [31:0] Instr;
	logic MemWrite;
	logic [31:0] ALUResult, WriteData;
	logic [31:0] ReadData;
	arm arm(clk, reset, PC, Instr,  MemWrite, ALUResult, WriteData, ReadData);
	
	initial begin
		clk = 0;
		PC = 32'b0;
		Instr = 32'hE3A00000;
		#10;
		clk=1;
		#10;
		clk=0;
		PC = 32'b0;
		Instr = 32'hE3A0100A;
		#10;
		clk=1;
		#10;
		clk=0;
		PC = 32'b0;
		Instr = 32'hE5801000;
		#10;
		clk=1;
		#10;
		clk=0;
		PC = 32'b0;
		Instr = 32'hEAFFFFFB;
		#10;
		clk=1;
		#10;
		clk=0;
	end

endmodule 