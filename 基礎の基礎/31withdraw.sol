//コントラクトに送られたetherはコントラクトのアドレスに貯められる
//コントラクトから引き出す関数を設定しなければいけない
contract GetPaid is Ownable {
  function withdraw() external onlyOwner {
    owner.transfer(this.balance);
  }
}
//transferを使えば、どんなイーサリアムのアドレスにも送金可能
//あるアイテムに対する支払いが多すぎた場合に、Etherをmsg.senderに送り返す関数を作ることもできる
uint itemFee = 0.001 ether;
msg.sender.transfer(msg.value - itemFee);

function withdraw() external onlyOwner {
    owner.transfer(this.balance);
  }

function setLevelUpFee(uint _fee) external onlyOwner {
    levelUpFee = _fee;
  }
