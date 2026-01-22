`timescale 1ns/1ps

module tb_half_adder;
  logic a, b;
  logic result, carry;

  half_adder dut (
    .a(a),
    .b(b),
    .result(result),
    .carry(carry)
  );

  initial begin
    $dumpfile("waves/comb/half_adder.vcd");
    $dumpvars(0, tb_half_adder);
  end

  task check(input logic aa, input logic bb, input logic exp_result, input logic exp_carry);
    a = aa;
    b = bb;
    #10;
    if (result !== exp_result || carry !== exp_carry) begin
      $display("NG: a=%0b b=%0b exp_result=%0b got_result=%0b exp_carry=%0b got_carry=%0b",
               aa, bb, exp_result, result, exp_carry, carry);
      $fatal;
    end
  endtask

  initial begin
    check(0, 0, 0, 0);
    check(0, 1, 1, 0);
    check(1, 0, 1, 0);
    check(1, 1, 0, 1);
    $display("OK: half_adder passed all tests.");
    $finish;
  end
endmodule
