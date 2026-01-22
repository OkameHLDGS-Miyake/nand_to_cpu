`timescale 1ns/1ps

module tb_or2;
  logic a, b;
  logic y;

  or2 dut (
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    $dumpfile("waves/gates/or2.vcd");
    $dumpvars(0, tb_or2);
  end

  task check(input logic aa, input logic bb, input logic expected);
    a = aa;
    b = bb;
    #10;
    if (y !== expected) begin
      $display("NG: a=%0b b=%0b expected=%0b got=%0b", aa, bb, expected, y);
      $fatal;
    end
  endtask

  initial begin
    check(0, 0, 0);
    check(0, 1, 1);
    check(1, 0, 1);
    check(1, 1, 1);
    $display("OK: or2 passed all tests.");
    $finish;
  end
endmodule
