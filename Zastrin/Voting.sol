//version of compiler
pragma solidity ^0.4.18;

contract Voting {
    //mapping : candidateの名前はbytes32で表現。
    //publicはvisibility specifierと呼ばれる。自分以外の人にコードが使われたくなければ
    //plivateを使う。
    mapping (bytes32 => uint8) public votesReceived;
    bytes32[] public candidateList;

    function Voting(bytes32[] candidateNames) public {
        candidateList = candidateNames;
    }

    function totalVotesFor(bytes32 candidate) view public return (uint8) {
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }

    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] +=1;
    }

    function validCandidate(bytes32 candidate) view public returns (bool) {
        for(uint i = 0; i < candidateList.length; i++){
            if(candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
        }
 }
