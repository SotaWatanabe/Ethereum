pragma solidity ^0.4.8;

contract RandomNumber {
    function get(uint max) constant returns (uint, uint) {
        // (1) 最新のブロックが生成された時刻を整数値で取得
        uint block_timestamp = block.timestamp;

        // (2) それを max で割った余りを計算
        //     max = 6 の場合、余りは 0~5 の整数、+1 により 1~6 の整数となる
        uint mod = block_timestamp % max + 1;

        return (block_timestamp, mod);
    }
}
