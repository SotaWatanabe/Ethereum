pragma solidity ^0.4.19;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    // 2要素の固定長の配列の場合：uint[2] fixedArray;
    // 別の固定長配列の例。5つの文字列を格納できる：string[5] stringArray;
    // 可変長配列 - 決まったサイズはないので、格納し続けることができるぞ：uint[] dynamicArray;
    Zombie[] public zombies;
}
