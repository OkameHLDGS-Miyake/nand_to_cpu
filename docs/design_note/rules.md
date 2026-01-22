# ルール

- `rtl/primitives/` は NAND のみ
- `rtl/gate/` は primitivesの組み合わせのみ(演算子でズルはしない)
- 各ゲートは真理値表の全パターンでテストする
- 失敗したら波形で途中信号まで追う