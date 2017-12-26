pragma solidity ^0.4.8;

contract SelfDestructSample {
  address public owner = msg.sender; // コントラクトをデプロイしたアドレスをオーナーとします

  // 送金を受け付けます(close()後に呼ぶと送金もできなくなります)
  function () payable {}

  // コントラクトを破棄するメソッドです
  function close() {
  if (owner != msg.sender) throw; // 送信者がオーナーでない場合は例外を投げます
    selfdestruct(owner);          // コントラクトを破棄します
  }

  // コントラクトの残高を返すメソッドです
  function getBalance() constant returns (uint) { // close()後に呼ぶとエラーになります
    return this.balance;
  }
}
