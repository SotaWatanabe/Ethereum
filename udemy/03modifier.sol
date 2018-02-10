pragma solidity ^0.4.8;

contract MyContract{

    uint myVariable;
    address owner;

    modifier onlyowner(){
        if(owner == msg.sender){
            _;
        }else{
            throw;
        }
    }

    function MyContract() payable {
        myVariable = 5;
        owner = msg.sender;
    }

    function setMyVariable(uint myNewVariable) onlyowner{
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
