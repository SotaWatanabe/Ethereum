//関数を実行する為に、コントラクトへいくらかイーサを要求することもできる
contract OnlineStore {
  function buySomething() external payable {
    // Check to make sure 0.001 ether was sent to the function call:
    require(msg.value == 0.001 ether);
    // If so, some logic to transfer the digital item to the caller of the function:
    transferThing(msg.sender);
  }
}

//ここで、msg.valueは、コントラクトにどのくらいEtherが送られたかを見るやり方で、etherは組み込み単位
//web3.jsではこう呼び出す
OnlineStore.buySomething({from: web3.eth.defaultAccount, value: web3.utils.toWei(0.001)})
