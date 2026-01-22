`timescale 1ns/1ps

module tb_nand2;
    // 1) 入力信号
    logic a, b;

    // 2) 出力信号
    logic y;

    // 3) テスト対象
    nand2 dut(
        .a(a),
        .b(b),
        .y(y)
    );

    // 4) 波形表示
    initial begin
        $dumpfile("waves/gates/nand2.vcd");
        $dumpvars(0, tb_nand2);
    end

    task check(input logic aa, input logic bb, input logic expected);
        a = aa;
        b = bb;
        #1;

        if(y!==expected) begin
            $display("NG: a=%0b b=%0b expected=%0b got=%0b", aa, bb, expected, y);
            $fatal;
        end
    endtask

    // 5) テスト本体
    initial begin
        check(0,0,1);
        check(0,1,1);
        check(1,0,1);
        check(1,1,0);

        $display("OK: nand2 passed all tests.");
        $finish;
    end
endmodule