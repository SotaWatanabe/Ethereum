//mapping
//単一のアカウントが何回も投票することを防ぐ

pragma solidity ^0.4.17;

contract Ballot{
    address public owner;
    string public proposal;
    uint public maxVoteCount;
    uint public totalVoteCount;
    uint public positiveVoteCount;
    uint public negativeVoteCount;
    mapping(address => bool) public voted;

    function Ballot(string _proposal, uint _maxVoteCount){
        owner = msg.sender;
        proposal = _proposal;
        maxVoteCount = _maxVoteCount;
    }

    function vote(bool option){
        require(maxVoteCount > totalVoteCount);
        //mappingをreqauireで呼び出すこともできる
        require(!voted[msg.sender]);
        totalVoteCount++;
        voted[msg.sender] = true;
        if(option){
            positiveVoteCount++;
        }else{
            negativeVoteCount++;
        }
    }
}
