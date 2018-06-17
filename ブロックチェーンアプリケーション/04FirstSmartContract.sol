//ブロックチェーンにデプロイするというのは、厳密に言うと、ブロック内にEVMバイトコードを保存すること。
//コントラクトへのアクセス。ユーザーはブラウザーやコンソールからブロックチェーン上のEVMバイトコードにJSON-RPCでアクセスする。

pragma solidity ^0.4.8;

contract HelloWorld{
    string public greeting;

    //これはコンストラクタ
    function HelloWorld(string _greeting){
        greeting = _greeting;
    }

    //ここからメソッド
    function setGreeting(string _greeting){
        greeting = _greeting;
    }

    function say() constant returns (string){
        return greeting;
    }
}

//コンストラクタはコントラクトと同じ名前のメソッドでデプロイ時のみ実行可能
