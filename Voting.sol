// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;
    address public admin;

    constructor(string[] memory candidateNames) {
        admin = msg.sender;
        for (uint i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate(candidateNames[i], 0));
        }
    }

    function vote(uint candidateIndex) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(candidateIndex < candidates.length, "Invalid candidate index.");
        candidates[candidateIndex].voteCount++;
        hasVoted[msg.sender] = true;
    }

    function getCandidate(uint index) public view returns (string memory, uint) {
        require(index < candidates.length, "Invalid index");
        return (candidates[index].name, candidates[index].voteCount);
    }

    function getTotalCandidates() public view returns (uint) {
        return candidates.length;
    }

    function getWinner() public view returns (string memory, uint) {
        uint maxVotes = 0;
        uint winnerIndex = 0;
        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winnerIndex = i;
            }
        }
        return (candidates[winnerIndex].name, maxVotes);
    }
}
