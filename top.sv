module top(input logic clk, reset, switch1, switch2, switch3, switch4, switch5,
		output logic [31:0] WriteData, DataAdr,
		output logic MemWrite);
	logic [31:0] PC, Instr, ReadData;
	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,
		WriteData, ReadData);
	imem imem(PC, Instr);
	dmem dmem(clk, switch1, switch2, switch3, switch4, switch5, DataAdr, ReadData);
endmodule 