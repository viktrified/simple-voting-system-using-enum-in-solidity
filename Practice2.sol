// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AnEnumPole {
    // A multiple candidate simple voting contract.

    // A user can vote for one candidate at a time.
    // A user can change vote as much as they like, but only the latest vote is recorded.
    // Return the percentage of all votes.

    enum Candidate {
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday
    }

    uint256 public totalVotes = 1;

    mapping(Candidate => uint256) public votes;
    mapping(address => Candidate) public voteChoice;

    function vote(Candidate _candidate) public {
        if (
            totalVotes > 0 &&
            voteChoice[msg.sender] != Candidate.Monday &&
            voteChoice[msg.sender] != Candidate.Tuesday &&
            voteChoice[msg.sender] != Candidate.Wednesday &&
            voteChoice[msg.sender] != Candidate.Thursday &&
            voteChoice[msg.sender] != Candidate.Friday
        ) {
            totalVotes += 1;
        } else {
            Candidate previousCandidate = voteChoice[msg.sender];
            votes[previousCandidate] -= 1;
        }

        voteChoice[msg.sender] = _candidate;
        votes[_candidate] += 1;
    }

    function getPercentage(Candidate _candidate) public view returns (uint256) {
        if (totalVotes == 0) {
            return 0;
        }
        return (votes[_candidate] * 100) / totalVotes;
    }
}
