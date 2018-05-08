pragma solidity ^0.4.17;

contract Ballot{
    address piblic owner;
    string public proposal;
    uint public maxVoteCount;
    uint public positiveVoteCount;
    uint public negativeVoteCount;

    function Ballot(string _proposal, uint _maxVoteCount){
        owner = msg.sender;
        proposal = _proposal;
        maxVoteCount = _maxVoteCount;
    }

    function vote(bool option){
        if(option){
            positiveVoteCount++;
        }else{
            negativeVoteCount--;
        }
    }
}
