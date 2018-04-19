//ownableはコントラクト所有者が特別な権限を持つ

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() public {
    owner = msg.sender;
  }
  //特別な関数で、コントラクトと同じ名前。コントラクトが最初に作成された時に、1度だけ実行される。

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
}

//Ownableコントラクトは以下のようになる
//コントラクトが作られた時にコンストラクタfunctionはownerをmsg.senderに設定する
//onlyOwnerを修飾子として設定してownerだけが特定の関数のアクセス可能にする
//新しいオーナーに権限を移譲することもできる
