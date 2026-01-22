`timescale 1ns/1ps

module tb_add8;
  logic [7:0] a, b;
  logic carry_in;
  logic [7:0] result;
  logic carry_out;

  add8 dut (
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .result(result),
    .carry_out(carry_out)
  );

  initial begin
    $dumpfile("waves/comb/add8.vcd");
    $dumpvars(0, tb_add8);
  end

  task check(input logic [7:0] aa, input logic [7:0] bb, input logic ci);
    logic [8:0] exp;
    begin
      a = aa;
      b = bb;
      carry_in = ci;
      #10;

      exp = {1'b0, aa} + {1'b0, bb} + ci;

      if ({carry_out, result} !== exp) begin
        $display("NG: a=%0d b=%0d cin=%0b exp=%0d got=%0d (carry=%0b result=%0d)",
                 aa, bb, ci, exp, {carry_out, result}, carry_out, result);
        $fatal;
      end
    end
  endtask

  initial begin
    check(8'd0,   8'd0,   1'b0);
    check(8'd1,   8'd2,   1'b0);
    check(8'd255, 8'd0,   1'b0);
    check(8'd255, 8'd1,   1'b0);
    check(8'd200, 8'd55,  1'b0);
    check(8'd200, 8'd55,  1'b1);
    check(8'd123, 8'd45,  1'b0);
    check(8'd123, 8'd45,  1'b1);

    $display("OK: add8 passed all tests.");
    $finish;
  end
endmodule
