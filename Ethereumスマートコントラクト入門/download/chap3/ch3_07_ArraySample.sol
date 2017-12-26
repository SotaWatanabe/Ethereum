pragma solidity ^0.4.8;

contract ArraySample {
  uint[5] public fArray = [uint(10), 20, 30, 40, 50]; // 固定長配列の宣言と初期化
  uint[] public dArray;       // 可変長配列の宣言

  function getFixedArray() constant returns (uint[5]) {
    uint[5] a; // 長さ 5 の固定長配列を宣言
    // メソッド内はこの形では初期化できません
    // uint[5] b = [uint(1), 2, 3, 4, 5]
    for (uint i = 0; i < a.length; i++) { // 初期化
      a[i] = i + 1;
    }
    return a;                 // [1, 2, 3, 4, 5]を返す
  }
  function getFixedArray2() constant returns (uint[5]) {
    uint[5] b = fArray;       // 状態変数で初期化
    return b;                 // [10, 20, 30, 40, 50]を返す
  }
  function pushFixedArray(uint x) constant returns (uint) {
    // 以下はコンパイルエラーとなります
    // fArray.push(1);
    return fArray.length;
  }
  function pushDArray(uint x) returns (uint) {
    return dArray.push(x);    // 引数で渡された要素を追加し、更新後の要素数を返す
  }
  function getDArrayLength() returns (uint) {
    return dArray.length;     // 可変長配列の現在のサイズを返す
  }
  function initDArray(uint len) {
    dArray.length = len;      // 可変長配列のサイズを変更
    for (uint i = 0; i < len; i++) { // 初期化
      dArray[i] = i + 1;
    }
  }
  function getDArray() constant returns (uint[]) {
    return dArray;            // 可変長配列も返せます
  }
  function delDArray() returns (uint) {
    delete dArray;            // 可変長配列を削除
    return dArray.length;     // 0 を返す
  }
  function delFArray() returns (uint) {
    delete fArray;            // 固定長配列を削除。各要素は0になります
    return fArray.length;     // 長さは 5 のまま
  }
}
