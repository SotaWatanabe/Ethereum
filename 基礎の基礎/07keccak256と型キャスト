pragma solidity ^0.4.19;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
        /*型キャスト
        uint8 a = 5;
        uint b = 6;
        a * b はuint8ではなくuintで返すから、エラーになる：
        uint8 c = a * b;
        正しく動作させるために、bをuint8に型キャストさせる：
        uint8 c = a * uint8(b);
        この例ではa * bはuintを返すが、uint8で格納しようとしているから、問題が発生することになる。
        uint8にキャストすることで、正常に動作する上にコンパイラもエラーを吐き出すことがなくなる。
        */
    }

}
