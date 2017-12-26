pragma solidity ^0.4.8;

contract IntSample {
  function division() constant returns (uint) {
    uint a = 3;
    uint b = 2;
    uint c = a / b * 10;    // a / b の結果は切り捨てられ、1 になります
    return c;               // 10 が返ります
  }
  function divisionLiterals() constant returns (uint) {
    uint c = 3 / 2 * 10;    // リテラルのため、a / b の結果は切り捨てられません
    return c;               // 15 が返ります
  }
  function divisionByZero() constant returns (uint) {
    uint a = 3;
    uint c = a / 0;         // コンパイルは通りますが、実行時に例外がスローされます
    return c;               // uint c = 3 / 0 とすると、コンパイルも通りません
  }
  function shift() constant returns (uint[2]) {
    uint[2] a;
    a[0] = 16 << 2;         // 16 * 2 ** 2 = 64
    a[1] = 16 >> 2;         // 16 / 2 ** 2 = 4
    return a;               // 64, 4 が返ります
  }
}
