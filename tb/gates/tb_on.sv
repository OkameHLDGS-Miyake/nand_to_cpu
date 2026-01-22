`timescale 1ns/1ps

module tb_on;
  logic y;

  on dut (
    .y(y)
  );

  initial begin
    $dumpfile("waves/gates/on.vcd");
    $dumpvars(0, tb_on);

    #10;
    if (y !== 1'b1) begin
      $display("NG: expected=1 got=%0b", y);
      $fatal;
    end

    $display("OK: on passed.");
    $finish;
  end
endmodule
