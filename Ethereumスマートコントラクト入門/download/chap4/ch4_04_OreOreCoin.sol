pragma solidity ^0.4.8;

// 所有者管理用コントラクト
contract Owned {
  // 状態変数
  address public owner;     // オーナーアドレス

  // オーナーの移転時のイベント
  event TransferOwnership(address oldaddr, address newaddr);

  // オーナー限定メソッド用の修飾子
  modifier onlyOwner() { if (msg.sender != owner) throw; _; }

  // コンストラクタ
  function Owned() {
    owner = msg.sender;     // 最初はコントラクト作成アドレスをオーナーとする
  }

  // (1) オーナーの移転
  function transferOwnership(address _new) onlyOwner {
    address oldaddr = owner;
    owner = _new;
    TransferOwnership(oldaddr, owner);
  }
}

// (2) 会員管理用コントラクト
contract Members is Owned {
  // (3) 状態変数の宣言
  address public coin;            // トークン(仮想通貨)アドレス
  MemberStatus[] public status;   // 会員ステイタスの配列
  mapping(address => History) public tradingHistory;      // 会員ごとの取引履歴

  // (4) 会員ステイタス用構造体
  struct MemberStatus {
    string name;          // ステイタス名
    uint256 times;        // 最低取引回数
    uint256 sum;          // 最低取引額
    int8 rate;            // キャッシュバック率
  }
  // 取引履歴用構造体
  struct History {
    uint256 times;        // 取引回数
    uint256 sum;          // 取引額
    uint256 statusIndex;  // ステイタスインデックス
  }

  // (5) トークン限定メソッド用の修飾子
  modifier onlyCoin() { if (msg.sender == coin) _; }

  // (6) トークンアドレスのセット
  function setCoin(address _addr) onlyOwner {
    coin = _addr;
  }

  // (7) 会員ステイタスの追加
  function pushStatus(string _name, uint256 _times, uint256 _sum, int8 _rate)
    onlyOwner
  {
    status.push(MemberStatus({
      name: _name,
      times: _times,
      sum: _sum,
      rate: _rate
    }));
  }

  // (8) 会員ステイタスの内容変更
  function editStatus(uint256 _index, string _name, uint256 _times, uint256 _sum, int8 _rate)
    onlyOwner
  {
    if (_index < status.length) {
      status[_index].name = _name;
      status[_index].times = _times;
      status[_index].sum = _sum;
      status[_index].rate = _rate;
    }
  }

  // (9) 取引履歴の更新
  function updateHistory(address _member, uint256 _value) onlyCoin {
    tradingHistory[_member].times += 1;
    tradingHistory[_member].sum += _value;
    // 新しい会員ステイタスの決定(取引ごとに実行する)
    uint256 index;
    int8 tmprate;
    for (uint i = 0; i < status.length; i++) {
      // 最低取引回数、取引額を満たし、最もキャッシュバック率が良いステイタスとする
      if (tradingHistory[_member].times >= status[i].times &&
          tradingHistory[_member].sum >= status[i].sum &&
          tmprate < status[i].rate) {
            index = i;
      }
    }
    tradingHistory[_member].statusIndex = index;
  }

  // (10) キャッシュバック率の取得(所属する会員ステイタスの率とする)
  function getCashbackRate(address _member) constant returns (int8 rate) {
    rate = status[tradingHistory[_member].statusIndex].rate;
  }
}

// (11) 会員管理機能付き仮想通貨
contract OreOreCoin is Owned{
  // 状態変数の宣言
  string public name;         // トークンの名前
  string public symbol;       // トークンの単位
  uint8 public decimals;      // 小数点以下の桁数
  uint256 public totalSupply; // トークンの総量
  mapping (address => uint256) public balanceOf;  // 各アドレスの残高
  mapping (address => int8) public blackList;     // ブラックリスト
  mapping (address => Members) public members;    // 各アドレスの会員情報

  // イベント通知
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Blacklisted(address indexed target);
  event DeleteFromBlacklist(address indexed target);
  event RejectedPaymentToBlacklistedAddr(address indexed from, address indexed to, uint256 value);
  event RejectedPaymentFromBlacklistedAddr(address indexed from, address indexed to, uint256 value);
  event Cashback(address indexed from, address indexed to, uint256 value);

  // コンストラクタ
  function OreOreCoin(uint256 _supply, string _name, string _symbol, uint8 _decimals) {
    balanceOf[msg.sender] = _supply;
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _supply;
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

  // 会員管理コントラクトを設定する
  function setMembers(Members _members) {
    members[msg.sender] = Members(_members);
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
      // (12) キャッシュバックの額を計算(宛先ごとの会員情報のレートを使用)
      uint256 cashback = 0;
      if(members[_to] > address(0)) {
        cashback = _value / 100 * uint256(members[_to].getCashbackRate(msg.sender));
        members[_to].updateHistory(msg.sender, _value);
      }

      balanceOf[msg.sender] -= (_value - cashback);
      balanceOf[_to] += (_value - cashback);

      Transfer(msg.sender, _to, _value);
      Cashback(_to, msg.sender, cashback);
    }
  }
}

