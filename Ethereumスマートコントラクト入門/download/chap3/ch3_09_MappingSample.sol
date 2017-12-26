pragma solidity ^0.4.8;

contract MappingSample {
  struct User {
    string name;
    uint age;
  }
  mapping(address=>User) public userList; // valueを構造体(User)とします

  function setUser(string _name, uint _age) {
    userList[msg.sender].name = _name;    // keyを指定してアクセスします
    userList[msg.sender].age = _age;
  }

  function getUser() returns (string, uint) {
    User u = userList[msg.sender];
    return (u.name, u.age);
  }
}
