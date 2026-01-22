module on(
  output wire y
);
  nand2 u_nand(.a(1'b0), .b(1'b0), .y(y));
endmodule
