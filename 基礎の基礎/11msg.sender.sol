/*
Solidityは、常に外部の呼び出し元から関数を実行しなければならないという決まりがある。
その関数を呼び出すまでは、コントラクトはブロックチェーン上で何もせずに、ただそこにあるだけ。
だから何かをするときには常にmsg.senderを使用する。
*/

//msg.senderを使用すると、その関数を呼び出したユーザー（またはスマートコントラクト）の addressを参照できる。

mapping(address => int) favoriteNumber;

function setMyNumber(uint _myNumber) public{
    favoriteNumber[msg.sender] = _myNumber;
}
function whatIsMyNumber() public view returns (uint){
    returns favoriteNumber[msg.sender];
}
