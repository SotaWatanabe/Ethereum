//ブロックチェーン上の他のコントラクトとやり取りを行うには、最初にinterfaceを宣言すればよい。
//interfaceをdappに埋め込むことで、自分のコントラクトから他のコントラクトの関数がどのようなもので、どのように呼び出すか、応答はどのようなものかを判断できる

/*
contract LuckyNumber {
  mapping(address => uint) numbers;

  function setNum(uint _num) public {
    numbers[msg.sender] = _num;
  }

  function getNum(address _myAddress) public view returns (uint) {
    return numbers[_myAddress];
  }
}

外部コントラクトを持っていて、このコントラクトから、gem関数でコントラクトの中身を呼び出したいとする。
その場合、LuckyNumberコントラクトのinterfaceを定義する。

contract NumberInterface {
  function getNum(address _myAddress) public view returns (uint);
}

getNumのみを定義して他の状態にはふれない。
関数自体を定義しない。;を使う。

*/

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
) {
    Kitty storage kit = kitties[_id];

    // if this variable is 0 then it's not gestating
    isGestating = (kit.siringWithId != 0);
    isReady = (kit.cooldownEndBlock <= block.number);
    cooldownIndex = uint256(kit.cooldownIndex);
    nextActionAt = uint256(kit.cooldownEndBlock);
    siringWithId = uint256(kit.siringWithId);
    birthTime = uint256(kit.birthTime);
    matronId = uint256(kit.matronId);
    sireId = uint256(kit.sireId);
    generation = uint256(kit.generation);
    genes = kit.genes;
}

//このようなソースコードからgetKitty関数を呼び出す。

pragma solidity ^0.4.19;

import "./zombiefactory.sol";
//ここがinterface
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
