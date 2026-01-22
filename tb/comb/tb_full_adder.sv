`timescale 1ns/1ps

module tb_full_adder;
  logic a, b, carry_in;
  logic result, carry_out;

  full_adder dut (
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .result(result),
    .carry_out(carry_out)
  );

  initial begin
    $dumpfile("waves/comb/full_adder.vcd");
    $dumpvars(0, tb_full_adder);
  end

  task check(input logic aa, input logic bb, input logic ci,
             input logic exp_result, input logic exp_carry);
    a = aa;
    b = bb;
    carry_in = ci;
    #10;
    if (result !== exp_result || carry_out !== exp_carry) begin
      $display("NG: a=%0b b=%0b cin=%0b exp_res=%0b got_res=%0b exp_carry=%0b got_carry=%0b",
               aa, bb, ci, exp_result, result, exp_carry, carry_out);
      $fatal;
    end
  endtask

  initial begin
    check(0,0,0, 0,0);
    check(0,0,1, 1,0);
    check(0,1,0, 1,0);
    check(0,1,1, 0,1);
    check(1,0,0, 1,0);
    check(1,0,1, 0,1);
    check(1,1,0, 0,1);
    check(1,1,1, 1,1);

    $display("OK: full_adder passed all tests.");
    $finish;
  end
endmodule
