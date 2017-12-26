pragma solidity ^0.4.8;

contract AddressSample {
  // 無名関数(送金されると実行される) payableを指定することでEtherの受付が可能
  function () payable {}
  function getBalance(address _target) constant returns (uint) {
    if (_target == address(0)) {      // _targetが0の場合は、コントラクト自身のアドレスをセットします
      _target = this;
    }
    return _target.balance; // 残高を返します
  }
  // 以降の送金メソッドを実行する前に、このコントラクトに対して送金しておいてください
  // 引数で指定されたアドレスにtransferを使用して送金する
  function transfer(address _to, uint _amount) {
    _to.transfer(_amount);            // 失敗すると例外が発生します
  }
  // 引数で指定されたアドレスにsendを使用して送金
  function send(address _to, uint _amount) {
    if (!_to.send(_amount)) {         // sendを使用する場合は戻り値をチェックしましょう
      throw;
    }
  }
  // 引数で指定されたアドレスにcallを使用して送金
  function call(address _to, uint _amount) {
    if (!_to.call.value(_amount).gas(1000000)()) {    // callも戻り値をチェックしましょう
      throw;
    }
  }
  // 引き出しパターン(transfer)
  function withdraw() {
    address to = msg.sender;          // メソッド実行者を宛先にします
    to.transfer(this.balance);        // 全額送金します
  }
  // 引き出しパターン(call)
  function withdraw2() {
    address to = msg.sender;          // メソッド実行者を宛先にします
    if (!to.call.value(this.balance).gas(1000000)()) {  // 全額送金します
      throw;
    }
  }
}
