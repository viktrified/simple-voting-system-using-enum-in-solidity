// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AnEnumPole {
    // a multiple candidate simple voting contract.

    // a user can only vote for one candidate
    // a user can change vote
    // return the percentage of all votes

    enum Candidate {
        monday,
        tuesday,
        wednesday,
        thursday,
        friday
    }

    Candidate public candidate;
    uint256 public user;

    mapping(address => bool) hasVoted;

    function voteMonday() public {
        // require(!hasVoted[msg.sender], "you have already voted!");

        candidate = Candidate.monday;
        hasVoted[msg.sender] = true;
    }

    function voteTuesday() public {
        // require(!hasVoted[msg.sender], "you have already voted!");

        candidate = Candidate.tuesday;
        hasVoted[msg.sender] = true;
    }

    function voteWednesday() public {
        // require(!hasVoted[msg.sender], "you have already voted!");

        candidate = Candidate.wednesday;
        hasVoted[msg.sender] = true;
    }

    function voteThursday() public {
        // require(!hasVoted[msg.sender], "you have already voted!");

        candidate = Candidate.thursday;
        hasVoted[msg.sender] = true;
    }

    function voteFriday() public {
        // require(!hasVoted[msg.sender], "you have already voted!");

        candidate = Candidate.friday;
        hasVoted[msg.sender] = true;
    }
}
