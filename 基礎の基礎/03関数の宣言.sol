pragma solidity ^0.4.19;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        uint dna;
        string name;
    }

    Zombie[] public zombies;

    //グローバル変数と区別をつけるために、関数パラメーター変数名はアンダースコア(_)をつけるのが通例
    function createZombie(string _name, uint _dna){

    }

}
