pragma solidity ^0.4.19;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    // 金融系のアプリの場合、ユーザーのアカウントの残高にuintを格納する
    //mapping (address => uint) public accountBalance;
    // もしくは、ユーザーIdを基にユーザー名を参照・格納するために使用する
    //mapping (uint => string) userIdToName;
    //マッピングは本質的にはデータの保管と参照のためのキーバリューストア。最初の例で言えば、キーはaddress で、バリュー（値）はuintだ。２番目の例だと、キーは uint で、バリューは string
    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;
    //格納しているイメージ

    function _createZombie(string _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        NewZombie(id, _name, _dna);
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
