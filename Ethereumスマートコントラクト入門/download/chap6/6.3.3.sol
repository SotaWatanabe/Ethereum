pragma solidity ^0.4.8;

contract RandomNumber {
    address owner;
    uint numberMax;

    struct draw {
        // (1) 予約時の最新ブロック番号のみを保持
        uint blockNumber;
    }

    struct draws {
        uint numDraws;
        mapping (uint => draw) draws;
    }

    mapping (address => draws) requests;

    // (2) request() の返り値参照用のイベントに定義
    event ReturnNextIndex(uint _index);

    function RandomNumber(uint _max) {
        owner = msg.sender;
        numberMax = _max;
    }

    function request() returns (uint) {
        uint _nextIndex = requests[msg.sender].numDraws;
        requests[msg.sender].draws[_nextIndex].blockNumber = block.number;
        requests[msg.sender].numDraws = _nextIndex + 1;
        ReturnNextIndex(_nextIndex);
        return _nextIndex;
    }

    // (3) 乱数値の計算結果を保存しないように変更し、constant関数とする
    function get(uint _index) constant returns (int status, bytes32 blockhash, uint drawnNumber){
        if(_index >= requests[msg.sender].numDraws){
            return (-2, 0, 0);
        }else{
            uint _nextBlockNumber = requests[msg.sender].draws[_index]. blockNumber + 1;
            if (_nextBlockNumber >= block.number) {
                return (-1, 0, 0);
            }else{
                // (4) 毎回ブロック番号からブロックハッシュを参照して返す
                bytes32 _blockhash = block.blockhash(_nextBlockNumber);
                uint _drawnNumber = uint(_blockhash) % numberMax + 1;
                return (0, _blockhash, _drawnNumber);
            }
        }
    }
}
