module add8(
  input  wire [7:0] a,
  input  wire [7:0] b,
  input  wire       carry_in,
  output wire [7:0] result,
  output wire       carry_out
);
  wire [8:0] c;
  assign c[0] = carry_in;
  assign carry_out = c[8];

  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) begin : GEN_FA
      full_adder u_fa (
        .a(a[i]),
        .b(b[i]),
        .carry_in(c[i]),
        .result(result[i]),
        .carry_out(c[i+1])
      );
    end
  endgenerate
endmodule
