pragma solidity ^0.4.8;

// キャッシュバック機能付き仮想通貨
contract OreOreCoin {
  // (1) 状態変数の宣言
  string public name;                             // トークンの名前
  string public symbol;                           // トークンの単位
  uint8 public decimals;                          // 小数点以下の桁数
  uint256 public totalSupply;                     // トークンの総量
  mapping (address => uint256) public balanceOf;  // 各アドレスの残高
  mapping (address => int8) public blackList;     // ブラックリスト
  mapping (address => int8) public cashbackRate;  // 各アドレスのキャッシュバック率
  address public owner;                           // オーナーアドレス

  // 修飾子
  modifier onlyOwner() { if (msg.sender != owner) throw; _; }

  // (2) イベント通知
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Blacklisted(address indexed target);
  event DeleteFromBlacklist(address indexed target);
  event RejectedPaymentToBlacklistedAddr(address indexed from, address indexed to, uint256 value);
  event RejectedPaymentFromBlacklistedAddr(address indexed from, address indexed to, uint256 value);
  event SetCashback(address indexed addr, int8 rate);
  event Cashback(address indexed from, address indexed to, uint256 value);

  // コンストラクタ
  function OreOreCoin(uint256 _supply, string _name, string _symbol, uint8 _decimals) {
    balanceOf[msg.sender] = _supply;
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _supply;
    owner = msg.sender;
  }

  // アドレスをブラックリストに登録する
  function blacklisting(address _addr) onlyOwner {
    blackList[_addr] = 1;
    Blacklisted(_addr);
  }

  // アドレスをブラックリストから削除する
  function deleteFromBlacklist(address _addr) onlyOwner {
    blackList[_addr] = -1;
    DeleteFromBlacklist(_addr);
  }

  // (3) キャッシュバック率を設定する
  function setCashbackRate(int8 _rate) {
    if (_rate < 1) {
      _rate = -1;
    } else if (_rate > 100) {
      _rate = 100;
    }
    cashbackRate[msg.sender] = _rate;
    if (_rate < 1) {
      _rate = 0;
    }
    SetCashback(msg.sender, _rate);
  }

  // 送金
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
      // (4) キャッシュバックの額を計算(宛先ごとのレートを使用)
      uint256 cashback = 0;
      if(cashbackRate[_to] > 0) cashback = _value / 100 * uint256(cashbackRate[_to]);

      balanceOf[msg.sender] -= (_value - cashback);
      balanceOf[_to] += (_value - cashback);

      Transfer(msg.sender, _to, _value);
      Cashback(_to, msg.sender, cashback);
    }
  }
}