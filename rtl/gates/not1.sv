module not1(
    input wire a,
    output wire y
);
    nand2 u_nand(
        .a(a),
        .b(a),
        .y(y)
    );
endmodule