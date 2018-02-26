pragma solidity ^0.4.19;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    //関数はデフォルトでpublic。
    //要するに別のコントラクトからでもコントラクトの関数を呼び出して、実行できる。
    //自分が使う関数はデフォルトでprivateにして、公開しても構わない関数だけをpublicに設定する。

    /*
    プライベート関数の宣言方法
    uint[] numbers;

    function _addToArray(uint _number) private {
        numbers.push(_number) {
    }
    このように書くと、この関数はコントラクト内の他の関数からだけ呼び出して、numbers配列に格納できる。
    関数のパラメータと同様にアンダースコアをつけるのが慣習
    */

    Zombie[] public zombies;

    //誰でも以下の関数を呼び出してzombieを作っていいわけではないのでprivateにする
    function _createZombie(string _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    }

}
