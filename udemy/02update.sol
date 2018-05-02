pragma solidity ^0.4.8;

contract MyContract{

    uint myVariable;
    address owner;

    function MyContract() payable {
        myVariable = 5;
        owner = msg.sender;
    }

    function setMyVariable(uint myNewVariable){
        if(msg.sender==owner){
          myVariable = myNewVariable;
        }
    }

    function getMyVariable() constant returns(uint){
        return myVariable;
    }

    function getMyContractBalance() constant returns(uint){
        return this.balance;
    }

    function kill(){
        if(msg.sender == owner){
            suicide(owner);
        }else{
            throw;
        }
    }

    function () payable{

    }
}
