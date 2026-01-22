module or2(
    input  wire a,
    input  wire b,
    output wire y
);
    wire not_a, not_b;

    not1 u_not_a(.a(a), .y(not_a));
    not1 u_not_b(.a(b), .y(not_b));

    nand2 u_nand2(.a(not_a), .b(not_b), .y(y));
endmodule
