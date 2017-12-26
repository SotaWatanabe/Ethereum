pragma solidity ^0.4.8;

contract OreOreCoin {
  // (1) 状態変数の宣言
  string public name;                             // トークンの名前
  string public symbol;                           // トークンの単位
  uint8 public decimals;                          // 小数点以下の桁数
  uint256 public totalSupply;                     // トークンの総量
  mapping (address => uint256) public balanceOf;  // 各アドレスの残高

  // (2) イベント通知
  event Transfer(address indexed from, address indexed to, uint256 value);

  // (3) コンストラクタ
  function OreOreCoin(uint256 _supply, string _name, string _symbol, uint8 _decimals) {
    balanceOf[msg.sender] = _supply;
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _supply;
  }

  // (4) 送金
  function transfer(address _to, uint256 _value) {
    // (5) 不正送金チェック
    if (balanceOf[msg.sender] < _value) throw;
    if (balanceOf[_to] + _value < balanceOf[_to]) throw;

    // (6) 送信アドレスと受信アドレスの残高を更新
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    // (7) イベント通知
    Transfer(msg.sender, _to, _value);
  }
}
