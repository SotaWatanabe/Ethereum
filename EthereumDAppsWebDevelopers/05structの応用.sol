//structの応用

pragma solidity ^0.4.17;

contract Ballot{

    struct Vote{
        bool voted;
        bool option;
    }

    address public owner;
    string public proposal;
    uint public maxVoteCount;
    mapping(bool => uint) public optionsVoteCount;
    mapping(address => Vote) public votes;

    function Ballot(string _proposal, uint _maxVoteCount){
        owner = msg.sender;
        proposal = _proposal;
        maxVoteCount = _maxVoteCount;
    }

    function vote(bool option){
        require(maxVoteCount > totalVoteCount);
        //ここ注意
        require(!votes[msg.sender].voted);
        totalVoteCount++;
        votes[msg.sender].voted = true;
        votes[msg.sender].option = option;
        optionsVoteCount[option]++;
    }
}
