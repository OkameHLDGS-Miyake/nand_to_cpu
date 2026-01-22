`timescale 1ns/1ps

module tb_not1;
  logic a;
  logic y;

  not1 dut (
    .a(a),
    .y(y)
  );

  initial begin
    $dumpfile("waves/gates/not1.vcd");
    $dumpvars(0, tb_not1);

    a = 0; #10;
    if (y !== 1) begin $display("NG: a=0 expected=1 got=%0b", y); $fatal; end

    a = 1; #10;
    if (y !== 0) begin $display("NG: a=1 expected=0 got=%0b", y); $fatal; end

    $display("OK: not1 passed.");
    $finish;
  end
endmodule
