pragma solidity ^0.4.19;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    }

    /*
    string greeting = "What's up dog";
    function sayHello() public returns (string) {
    return greeting;
    }
    */
    /*
    このケースではview関数を宣言できる。これはつまりデータの読み取り専用で編集できないということだ：
    function sayHello() public view returns (string) {
    Solidityにはpure関数がある。これを使うとアプリ内のデータにすらアクセスできない。次のコードを考えてみよう：

    function _multiply(uint a, uint b) private pure returns (uint) {
      return a * b;
    }
    この関数はアプリから読み込むことすらできない。つまり戻り値が関数のパラメーターのみに依存することになる。この場合pure関数として宣言することができる。
    */
    
    function _generateRandomDna(string _str) private view returns (uint){

    }

}
