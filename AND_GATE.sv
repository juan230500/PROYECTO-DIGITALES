	
module AND_GATE #(parameter WIDTH = 8)(
    input logic a, b,
    output logic c
);

assign c = a & b;
endmodule
