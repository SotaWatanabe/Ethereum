pragma solidity ^0.4.8;

// (1) 取引ログコントラクトの宣言
contract TransactionLogNG {
    // (2) 格納先定義
    mapping (bytes32 => mapping (bytes32 => string)) public tranlog;

    // (3) トランザクションを登録する
    function setTransaction(bytes32 user_id, bytes32 project_id, string tran_data) {
        // (4) 登録
        tranlog[user_id][project_id] = tran_data;
    }
    
    // (5)ユーザ、プロジェクト毎のトランザクションレコードを取得する
    function getTransaction(bytes32 user_id, bytes32 project_id) 
                            constant returns (string tran_data) {
        return tranlog[user_id][project_id];
    }
}
