module xor2(
  input  wire a,
  input  wire b,
  output wire y
);
  wire n1, n2, n3;

  nand2 u1(.a(a),  .b(b),  .y(n1));
  nand2 u2(.a(a),  .b(n1), .y(n2));
  nand2 u3(.a(b),  .b(n1), .y(n3));
  nand2 u4(.a(n2), .b(n3), .y(y));
endmodule
