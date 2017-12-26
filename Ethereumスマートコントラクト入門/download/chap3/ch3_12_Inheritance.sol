pragma solidity ^0.4.8;

contract A {
  uint public a;
  function setA(uint _a) {
    a = _a;
  }
  function getData() constant returns (uint) {
    return a;             // a のまま返します
  }
}

contract B is A {         // B は、Aのサブコントラクト
  function getData() constant returns (uint) {
    return a * 10;        // a を 10倍して返します
  }
}

contract C {
  A[] public c;           // データ型をコントラクトAとした可変長配列 c を宣言
  // コントラクトの作成
  function makeContract() {
    c.length = 2;         // c の長さを 2 にします
    A a = new A();        // コントラクトAを作成
    a.setA(1);            // 1をセット
    c[0] = a;             // 配列の一つ目の要素に代入
    B b = new B();        // コントラクトBを作成
    b.setA(1);            // 同じく 1 をセット
    c[1] = b;             // 配列の二つ目の要素に代入
  }
  // コントラクトのデータを返す
  function getData() constant returns (uint, uint) {
    if (c.length == 2) {    // コントラクト作成済みであること
      return (c[0].getData(), c[1].getData()); // (1, 10)を返す
    }
  }
}
