pragma solidity ^0.4.8;     // (1) バージョンプラグマ

// (2) コントラクトの宣言
contract HelloWorld {
  // (3) 状態変数の宣言
  string public greeting;
  // (4) コンストラクタ
  function HelloWorld(string _greeting) {
    greeting = _greeting;
  }
  // (5) メソッドの宣言
  function setGreeting(string _greeting) {
    greeting = _greeting;
  }
  function say() constant returns (string) {
    return greeting;
  }
}
