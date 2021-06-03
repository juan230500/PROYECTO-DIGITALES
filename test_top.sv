`timescale 1ns/1ns
module test_top();
	logic clk;
	logic reset;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	// instantiate device to be tested
	top dut(clk,  reset, 0, 0, WriteData, DataAdr, MemWrite);
	// initialize test
	initial
	begin
		reset <= 1; # 22; reset <= 0;
	end
	// generate clock to sequence tests
	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
endmodule