module not2(
    input wire a,
    output wire y
);
    nand(y, a, a);
endmodule