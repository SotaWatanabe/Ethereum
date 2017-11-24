// /Users/USERNAME/greeterApp/greeter/contracts/MetaCoin.sol
pragma solidity ^0.4.11;
contract Greeter {
  string greeting; //class variable that our greeter will say when poked
  function greeter(string _greeting) public { //sets class variable to argument
      greeting = _greeting;
  }

  function greet() constant returns (string) { //poking function
      return greeting;
  }
}

//original code is here https://ethereum.org/greeter 
