module half_adder(
    input  wire a,
    input  wire b,
    output wire result,
    output wire carry
);
    xor2 u_xor2(.a(a), .b(b), .y(result));
    and2 u_and2(.a(a), .b(b), .y(carry));
endmodule
