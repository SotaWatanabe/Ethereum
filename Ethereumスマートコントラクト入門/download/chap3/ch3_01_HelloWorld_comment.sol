pragma solidity ^0.4.20;     // 2017/12/27時

//コントラクトの宣言 Hallo Worldは名前
contract HelloWorld {
  //状態変数の宣言 publicは誰でもアクセス可能という意味
  string public greeting;
  //コンストラクタ 慣習としてメソッドの先頭をアンダースコアにする
  //デプロイ時のみ実行可能な特殊なメソッド
  function HelloWorld(string _greeting) {
    greeting = _greeting;
  }
  //メソッドの宣言
  function setGreeting(string _greeting) {
    greeting = _greeting;
  }
  //ブロックチェーンで保持しているデータの変更を伴わない場合はconstantをつける
  function say() constant returns (string) {
    return greeting;
  }
}
