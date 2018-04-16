//solidityには変数を格納できる場所が2つある。StrageとMemory
//StrageはBlockchain上に永遠に格納される変数の格納場所
//Memoryは一時的に格納される場所

//関数外で宣言された変数の場合はデフォルトで storageで、ブロックチェーン上に永久に格納される。
//関数内で宣言された変数はmemoryとして扱われて関数の呼び出しが終われば消えるように設定されている。

//メモリ、ストレージに関しては確認する必要がある。

pragma solidity ^0.4.19;

import "./zombiefactory.sol";

contract ZombieFeeding is ZombieFactory {

  function feedAndMultiply(uint _zombieId, uint _targetDna) public {
      require(msg.sender == zombieToOwner[_zombieId]);
      Zombie storage myZombie = zombies[_zombieId];
  }

}
