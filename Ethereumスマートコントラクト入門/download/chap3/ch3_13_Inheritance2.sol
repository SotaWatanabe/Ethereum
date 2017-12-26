pragma solidity ^0.4.8;

contract A {
  uint public num = 10;   // 10で固定とします(publicのためアクセス可能)
  function getNum() constant returns (uint) {
    return num;
  }
}

contract B {
  A public a;
  address public addr;

  // 別途作成したAのアドレスをセットします
  function setA(A _a) {
    a = A(_a);            // Aにキャストしてセット
    addr = _a;            // アドレスのまま保持
  }
  // 状態変数numを直接取得
  function aNum() constant returns (uint) {
    return a.num();       // 10
  }
  // メソッドからnumを取得
  function aGetNum() constant returns (uint) {
    return a.getNum();    // 10
  }
  // 状態変数numを直接取得
  function aNum2() constant returns (uint) {
    return A(addr).num(); // 10 (使用時にキャストしてもOK)
  }
}
