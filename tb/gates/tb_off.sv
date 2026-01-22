`timescale 1ns/1ps

module tb_off;
  logic y;

  off dut (
    .y(y)
  );

  initial begin
    $dumpfile("waves/gates/off.vcd");
    $dumpvars(0, tb_off);

    #10;
    if (y !== 1'b0) begin
      $display("NG: expected=0 got=%0b", y);
      $fatal;
    end

    $display("OK: off passed.");
    $finish;
  end
endmodule

