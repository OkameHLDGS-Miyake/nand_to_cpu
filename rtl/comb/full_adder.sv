module full_adder(
    input  wire a,
    input  wire b,
    input  wire carry_in,
    output wire result,
    output wire carry_out
);
    wire ab_result, ab_carry;
    wire sum_carry;

    half_adder u1(.a(a),        .b(b),        .result(ab_result), .carry(ab_carry));
    half_adder u2(.a(carry_in), .b(ab_result), .result(result),   .carry(sum_carry));

    or2 u_or(.a(ab_carry), .b(sum_carry), .y(carry_out));
endmodule
