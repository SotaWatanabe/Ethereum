pragma solidity ^0.4.19;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function createZombie(string _name, uint _dna) {
        /*
        struct Person {
        uint age;
        string name;
        }

        Person[] public people;
        さて、今度は新しいPersonを作成して、それをpeople配列に格納する方法を教えるぞ。

        // 新しいPersonを作る：
        Person satoshi = Person(172, "Satoshi");

        // それを配列に格納する：
        people.push(satoshi);
        全部まとめて1行で書けば、さらにスッキリできるぞ：

        people.push(Person(16, "Vitalik"));
        */
        zombies.push(Zombie(_name, _dna));
    }

}
