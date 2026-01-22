module nand2(
    input wire a,
    input wire b,
    output wire y
);
    nand (y, a, b);
endmodule