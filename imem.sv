module imem(input logic [31:0] a,
		output logic [31:0] rd);
	logic [31:0] RAM[256:0];
	initial
		$readmemh("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//CPU//PROYECTO-DIGITALES//instructions.hex",RAM);
	assign rd = RAM[a]; // word aligned
endmodule