module imem(input logic [31:0] a,
		output logic [31:0] rd);
	logic [31:0] RAM[88:0];
	initial
		$readmemh("C://Users//alfab//Google Drive//I-SEM 2021//Taller De Diseno Digital//Proyecto//CPU//PROYECTO-DIGITALES//memfile.hex",RAM);
	assign rd = RAM[a[31:2]]; // word aligned
endmodule