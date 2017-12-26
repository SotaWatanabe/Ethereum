pragma solidity ^0.4.8;

// ブラックリスト機能付き仮想通貨
contract OreOreCoin {
  // (1) 状態変数の宣言
  string public name; // トークンの名前
  string public symbol; // トークンの単位
  uint8 public decimals; // 小数点以下の桁数
  uint256 public totalSupply; // トークンの総量
  mapping (address => uint256) public balanceOf; // 各アドレスの残高
  mapping (address => int8) public blackList; // ブラックリスト
  address public owner; // オーナーアドレス

  // (2) 修飾子
  modifier onlyOwner() { if (msg.sender != owner) throw; _; }

  // (3) イベント通知
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Blacklisted(address indexed target);
  event DeleteFromBlacklist(address indexed target);
  event RejectedPaymentToBlacklistedAddr(address indexed from, address indexed to, uint256 value);
  event RejectedPaymentFromBlacklistedAddr(address indexed from, address indexed to, uint256 value);

  // (4) コンストラクタ
  function OreOreCoin(uint256 _supply, string _name, string _symbol, uint8 _decimals) {
    balanceOf[msg.sender] = _supply;
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _supply;
    owner = msg.sender; // オーナーアドレスをセット
  }

  // (5) アドレスをブラックリストに登録する
  function blacklisting(address _addr) onlyOwner {
    blackList[_addr] = 1;
    Blacklisted(_addr);
  }

  // (6) アドレスをブラックリストから削除する
  function deleteFromBlacklist(address _addr) onlyOwner {
    blackList[_addr] = -1;
    DeleteFromBlacklist(_addr);
  }

  // (7) 送金
  function transfer(address _to, uint256 _value) {
    // 不正送金チェック
    if (balanceOf[msg.sender] < _value) throw;
    if (balanceOf[_to] + _value < balanceOf[_to]) throw;

    // ブラックリストに存在するアドレスには入出金不可
    if (blackList[msg.sender] > 0) {
      RejectedPaymentFromBlacklistedAddr(msg.sender, _to, _value);
    } else if (blackList[_to] > 0) {
      RejectedPaymentToBlacklistedAddr(msg.sender, _to, _value);
    } else {
      balanceOf[msg.sender] -= _value;
      balanceOf[_to] += _value;
      Transfer(msg.sender, _to, _value);
    }
  }
}
