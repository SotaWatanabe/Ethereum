// ユーザーの年齢を格納するマッピングだ：
mapping (uint => uint) public age;

// ユーザーの年齢が一定の年齢より高いことを要件とする関数修飾子だ：
modifier olderThan(uint _age, uint _userId) {
  require (age[_userId] >= _age);
  _;
}

// 車の運転は１６歳以上だな（米国の場合だ。日本は１８歳だな）。
//  こういう場合に引数のある`olderThan`修飾子を使うのだ。こんな風に書けばいい：
function driveCar(uint _userId) public olderThan(16, _userId) {
  // 関数のロジックだ
}
