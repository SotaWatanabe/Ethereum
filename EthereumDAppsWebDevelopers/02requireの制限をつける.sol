//maxVoteCountを超えないようにをするために、requiteで制限をかける。

pragma solidity ^0.4.17;

contract Ballot{
    address public owner;
    string public proposal;
    uint public maxVoteCount;
    uint public totalVoteCount;
    uint public positiveVoteCount;
    uint public negativeVoteCount;

    function Ballot(string _proposal, uint _maxVoteCount){
        owner = msg.sender;
        proposal = _proposal;
        maxVoteCount = _maxVoteCount;
    }

    function vote(bool option){
        require(maxVoteCount > totalVoteCount);
        totalVoteCount++;
        if(option){
            positiveVoteCount++;
        }else{
            negativeVoteCount++;
        }
    }
}
