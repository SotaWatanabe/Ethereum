/requireはある条件を満たさない場合はエラーを投げて実行を止めることができるもの
function sayHiToVitalik(string _name) public returns (string) {
  // まず_nameが"Vitalik"と同じかどうか比較する。真でなければエラーを吐いて終了させる。
  // （注：Solidityはネイティブで文字列比較ができない。そこで文字列の比較を
  // するためにkeccak256 を使ってハッシュ同士を比較する方法を使うのだ。
  require(keccak256(_name) == keccak256("Vitalik"));
  // もし真ならば、関数を処理する：
  return "Hi!";
}

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

    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;

    function _createZombie(string _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(string _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
