pragma solidity ^0.4.8;

contract DataTypeSample {
  function getValueType() constant returns (uint) {
    uint a;         // uint型の変数 a を宣言。この時点では、a は 0 で初期化されます
    a = 1;          // a の値が 1 になります
    uint b = a;     // 変数 b に a の値の 1 が代入されます
    b = 2;          // b の値が 2 になります
    return a;       // a の値の 1 が返ります
  }

  function getReferenceType() constant returns (uint[2]) {
    uint[2] a;      // uint型の長さ 2 のデータ領域のアドレスを格納する変数 a を宣言
    a[0] = 1;       // 一つ目の要素の値が 1 になります。配列の一つ目の要素のインデックスは、0 です
    a[1] = 2;       // 二つ目の要素の値が 2 になります
    uint[2] b = a;  // b に a の値を代入。a はデータ領域のアドレスのため、b は a と同じデータ領域を参照する
    b[0] = 10;      // b と a は同じデータ領域を参照するため、a[0]も 10 になります
    b[1] = 20;      // 同様に、a[1] も 20 になります
    return a;       // 10, 20 が返ります
  }
}
