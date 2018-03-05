pragma solidity ^0.4.19;

contract ZombieFactory {

    // eventは、ブロックチェーンで何かが生じたときに、コントラクトがアプリのフロントエンドに伝えることができる。しかも特定のイベントを'listening'状態にして、何かあった時にアクションを起こすこともできる。
    event NewZombie(uint _zombieId, string _name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna))-1;
        NewZombie(id, _name, _dna)
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
