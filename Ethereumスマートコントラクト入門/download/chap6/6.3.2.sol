pragma solidity ^0.4.8;

contract RandomNumber {
    address owner;
    // (1) 1~numberMax の乱数値を生成するよう設定するための変数
    uint numberMax;

    // (2) 予約オブジェクト
    struct draw {
        uint blockNumber;
        uint drawnNumber;
    }

    // (3) 予約オブジェクトの配列
    struct draws {
        uint numDraws;
        mapping (uint => draw) draws;
    }

    // (4) ユーザ (address) ごとに予約の配列を管理
    mapping (address => draws) requests;

    // (5) イベント(用途については後述)
    event ReturnNextIndex(uint _index);
    event ReturnDraw(int _status, bytes32 _blockhash, uint _drawnNumber);

    // (6) コンストラクタ
    function RandomNumber(uint _max) {
        owner = msg.sender;
        numberMax = _max;
    }

    // (7) 乱数生成の予約を追加する
    function request() returns (uint) {
        // (8) 現在の予約個数を取得
        uint _nextIndex = requests[msg.sender].numDraws;
        // (9) 最新ブロックのブロック番号を記録
        requests[msg.sender].draws[_nextIndex].blockNumber = block.number;
        // (10) 予約個数をカウントアップ
        requests[msg.sender].numDraws = _nextIndex + 1;
        // (11) 予約番号を返す
        ReturnNextIndex(_nextIndex);
        return _nextIndex;
    }

    // (12) 予約された乱数生成結果の取得を試みる
    function get(uint _index) returns (int status, bytes32 blockhash, uint drawnNumber){
        // (13) 存在しない予約番号の場合
        if(_index >= requests[msg.sender].numDraws){
            ReturnDraw(-2, 0, 0);
            return (-2, 0, 0);
        // (14) 予約番号が存在
        }else{
            // (15) 予約時に記録した block.number の次のブロック番号を計算する
            uint _nextBlockNumber = requests[msg.sender].draws[_index]. blockNumber + 1;
            // (16) まだ次のブロックが採掘されていない場合
            if (_nextBlockNumber >= block.number) {
                ReturnDraw(-1, 0, 0);
                return (-1, 0, 0);
            // (17) 次のブロックが採掘されているので乱数値の計算を行う
            }else{
                // (18) ブロックハッシュ値を取得
                bytes32 _blockhash = block.blockhash(_nextBlockNumber);
                // (19) ブロックハッシュ値から乱数値の計算
                uint _drawnNumber = uint(_blockhash) % numberMax + 1;
                // (20) 計算された乱数値を保存
                requests[msg.sender].draws[_index].drawnNumber = _drawnNumber;
                // (21) 結果を返す
                ReturnDraw(0, _blockhash, _drawnNumber);
                return (0, _blockhash, _drawnNumber);
            }
        }
    }
}
