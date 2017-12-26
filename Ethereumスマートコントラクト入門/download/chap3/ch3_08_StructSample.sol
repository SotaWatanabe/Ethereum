pragma solidity ^0.4.8;

contract StructSample {
  struct User {             // 構造体を宣言(C系の言語と同様)
    address addr;
    string name;
  }
  User[] public userList;   // 構造体の配列も宣言できます
  // ユーザ追加
  function addUser(string _name) returns (uint) {
    uint id = userList.push(User({    // 配列の末尾に追加します
      addr: msg.sender,
      name: _name
    }));
    return (id - 1);
  }
  // ユーザ追加
  function addUser2(string _name) returns (uint) {
    userList.length += 1;             // 配列の長さを+1します
    uint id = userList.length - 1;
    userList[id].addr = msg.sender;
    userList[id].name = _name;
    return id;
  }
  function editUser(uint _id, string _name) {
    if (userList.length <= _id ||         // idが配列の長さ以上
        userList[_id].addr != msg.sender) // アドレスが登録されたものと異なります
    {
      throw; // 例外を投げる
    }
    userList[_id].name = _name;
  }
  // 構造体は直接返せないため、次のメソッドはコンパイルエラーになります
  // function getUser(uint _id) constant returns (User) {
  // return userList[_id];
  // }
  // これならOK
  function getUser(uint _id) constant returns (address, string) {
    return (userList[_id].addr, userList[_id].name) ;
  }
}
