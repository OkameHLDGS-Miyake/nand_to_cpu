module off(
  output wire y
);
  nand2 u_nand(.a(1'b1), .b(1'b1), .y(y));
endmodule
