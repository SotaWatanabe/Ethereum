pragma solidity ^0.4.8;

// 文字列格納コントラクト
contract KeyValueStore {
    // キーの状態変数定義
    uint256 keyIndex; 

    // 値の状態変数定義
    struct values {
        string value1;
        string value2; 
    }

    // (1) キーと値のマッピング定義
    mapping (uint256 => values) Obj;

    // (2) キーに対する値1と値2を登録する関数
    function setValue(string _value1, string _value2) constant returns (uint256) {
        Obj[keyIndex].value1 = _value1;
        Obj[keyIndex].value2 = _value2;
        keyIndex++;
        return keyIndex;
    }
    // (3) キーに対応する値1を取得する関数
    function getValue1(uint _key) constant returns (string) {
        return Obj[_key].value1;
    }

    // (4) キーに対応する値2を取得する関数
    function getValue2(uint _key) constant returns (string) {
        return Obj[_key].value2;
    }
}
