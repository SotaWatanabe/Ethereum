//uintは量、データを定義、確認するときに使う
uint x;

//256bitのintはインスタンス化以降は変更不可
//intが定義される場合は256bit
int constant a = 8;
uint constant VERSION_ID = 0x1234;
//constantで定義される数字はコンパイラ時に毎回数字に置き換えられる

//intとuintは8〜256に対応
uint8 b;
int24 c;
uint248 d;

//アカウントアドレス 20byte/160bit
address public owner;

//全てのアドレスはEtherを送れる
owner.send(SOME_BALANCE);

//アドレスのバランスを確認
<address>.balance(uint256)

//送金
<address>.transfer(uint256 amount)

//byte 1〜32まで
byte a;
bytes2 b;
bytes32 c;

//データ構造
//Array
bytes32[5] nicknames; //static Array
bytes32[] names; //dynamic Array
uint newLength = name.push("John") //arrayにJohnを追加

//長さの確認
names.length;

//dictionalies
mapping(string=>uint) public balances;
balances["harles"] = 1;
console.log(balances["ada"]);
contractName.balances("charles"); //→1

//削除
delate balances["John"];
delate balances; //→全アカウントが0になる。

//stracrs
struct Bank{
    address owner;
    uint balance;
}

Bank b = Bank({
    owner : msg.sender,
    balance : 5
});
//or
Bank c = Bank(msg.sender, 5);
c.amount = 5; //set new value

//Enums
enum State {Created, Locked, Inactive};
State public state; //enumから変数の宣言
//enumはintへの変更も可能
state = State.Created;

//operator
//exponential
**
//or
^
//bitwise negation
~
 
