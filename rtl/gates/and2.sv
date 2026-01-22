module and2(
    input wire a,
    input wire b,
    output wire y
);
    wire n;

    nand2 u_nand2 (.a(a), .b(b), .y(n));
    not1  u_not1  (.a(n), .y(y));
endmodule
