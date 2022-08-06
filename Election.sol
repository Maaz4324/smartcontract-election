// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract Election {
    struct Candidates {
        string name;
        address id;
    }

    mapping(address=>bool) public isParticipant;
    Candidates[] public candidatesArray;
    uint public noOfCandidates;

    mapping(address => uint256) public votesOf;
    mapping(address => bool) public isVoted;

    function participate(string memory _name) public {
        require(!isParticipant[msg.sender], "You are already participant");
        candidatesArray.push(Candidates(_name, msg.sender));
        noOfCandidates++;
        isParticipant[msg.sender] = true;
    }

    function makeVote(address _participantToVote) public {
        require(isParticipant[_participantToVote], "Not a participant");
        require(!isVoted[msg.sender], "You have already casted your vote");
        votesOf[_participantToVote] ++;
        isVoted[msg.sender] = true;
    }

    function showCandidatesArray() public view returns(Candidates [] memory) {
        return candidatesArray;
    }

    function showResults(address _voteof) public view returns(uint256){
        return votesOf[_voteof];
    }

}
