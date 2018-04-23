//乱数の設定
//solidityにおけるベストなランダム関数生成はkeccak256

//1から100までの乱数を生成する
uint randNonce = 0;
uint random = uint(keccak256(now, msg.sender, randNonce)) % 100;
randNonce++;
uint random2 = uint(keccak256(now, msg.sender, randNonce)) % 100;

//keccakでこれら入力値をランダムなハッシュ値に変換、そしてそのハッシュ値をuint型に変換したら、その末尾２桁のみ残すように% 100をする。
//この方法は不誠実なノードの攻撃に対して脆弱である。

//対応策のスレッド
//https://ethereum.stackexchange.com/questions/191/how-can-i-securely-generate-a-random-number-in-my-smart-contract
//oracleが安全な乱数生成になる？
