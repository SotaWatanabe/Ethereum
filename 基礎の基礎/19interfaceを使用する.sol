//関数がpublic や externalである場合に限る。
//

pragma solidity ^0.4.19;

import "./zombiefactory.sol";

contract KittyInterface {
  function getKitty(uint256 _id) external view returns (
    bool isGestating,
    bool isReady,
    uint256 cooldownIndex,
    uint256 nextActionAt,
    uint256 siringWithId,
    uint256 birthTime,
    uint256 matronId,
    uint256 sireId,
    uint256 generation,
    uint256 genes
  );
}

contract ZombieFeeding is ZombieFactory {

  address ckAddress = 0x06012c8cf97BEaD5deAe237070F9587f8E7A266d;
  // `ckAddress`を使用してkittyContractをここで初期化。
  KittyInterface kittyContract = KittyInterface(ckAddress);

  function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    Zombie storage myZombie = zombies[_zombieId];
    _targetDna = _targetDna % dnaModulus;
    uint newDna = (myZombie.dna + _targetDna) / 2;
    _createZombie("NoName", newDna);
  }

}

/*
contract NumberInterface {
  function getNum(address _myAddress) public view returns (uint);
}
を別のコントラクト上で使う場合
contract MyContract {
  address NumberInterfaceAddress = 0xab38...;
  // ここは、イーサリアム上のFavoriteNumberコントラクトのアドレスが入る。
  NumberInterface numberContract = NumberInterface(NumberInterfaceAddress);
  // `numberContract`は他のコントラクトを指し示すものになっているぞ

  function someFunction() public {
    // コントラクトから`getNum`を呼ぶ：
    uint num = numberContract.getNum(msg.sender);
  }
}
*/
