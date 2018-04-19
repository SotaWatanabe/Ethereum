//関数修飾子modifier

/**
 * @dev Throws if called by any account other than the owner.
 */
modifier onlyOwner() {
  require(msg.sender == owner);
  _;
}
この修飾子を次のように使う。

contract MyContract is Ownable {
  event LaughManiacally(string laughter);

  //`onlyOwner`の使い方を確認せよ：
  function likeABoss() external onlyOwner {
    LaughManiacally("Muahahahaha");
  }
}

//function likeABossで先にonlyOwnerが実行される
//onlyOwner modifierのrequireが実行されて、_;に来た時に、
//function likeABossが実行される
