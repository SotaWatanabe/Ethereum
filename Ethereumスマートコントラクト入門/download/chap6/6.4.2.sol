pragma solidity ^0.4.8;

contract RandomNumber {
    address owner;
    uint numberMax;

    struct draw {
        uint blockNumber;
    }

    struct draws {
        uint numDraws;
        mapping (uint => draw) draws;
    }

    mapping (address => draws) requests;

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

    // (1) デバッグ用に、blockhashとseed値を返すように変更
    function get(uint _index) constant returns (int status, bytes32 blockhash, bytes32 seed, uint drawnNumber){
        if(_index >= requests[msg.sender].numDraws){
            return (-2, 0, 0, 0);
        }else{
            uint _nextBlockNumber = requests[msg.sender].draws[_index]. blockNumber + 1;
            if (_nextBlockNumber >= block.number) {
                return (-1, 0, 0, 0);
            }else{
                bytes32 _blockhash = block.blockhash(_nextBlockNumber);
                // (2) ブロックハッシュ値、ユーザのアドレス、予約番号を元にseed値を計算
                bytes32 _seed = sha256(_blockhash, msg.sender, _index);
                // (3) seed値を元に乱数を計算
                uint _drawnNumber = uint(_seed) % numberMax + 1;
                // (4) ステータス、ブロックハッシュ値、乱数計算の元となったseed値、計算された乱数を返す
                return (0, _blockhash, _seed, _drawnNumber);
            }
        }
    }
}
