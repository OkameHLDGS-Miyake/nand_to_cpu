`timescale 1ns/1ps

module tb_not2;
  logic a;
  logic y;

  not2 dut (
    .a(a),
    .y(y)
  );

  initial begin
    $dumpfile("waves/gates/not2.vcd");
    $dumpvars(0, tb_not2);

    a = 0; #10;
    if (y !== 1) begin $display("NG: a=0 expected=1 got=%0b", y); $fatal; end

    a = 1; #10;
    if (y !== 0) begin $display("NG: a=1 expected=0 got=%0b", y); $fatal; end

    $display("OK: not2 passed.");
    $finish;
  end
endmodule
