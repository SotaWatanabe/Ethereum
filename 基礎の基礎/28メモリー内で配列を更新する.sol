//solodityでstrageコストは高くかかる
//絶対に必要でない限り、strageにデータは書き込まない
function getArray() external pure returns(uint[]) {
  // 長さ3の新しい配列をメモリ内にインスタンス化する
  uint[] memory values = new uint[](3);
  // 値を追加しよう
  values.push(1);
  values.push(2);
  values.push(3);
  // 配列を返す
  return values;
}
