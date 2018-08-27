pragma solidity ^0.4.17;

contract Voting {
    bytes32[] public candidates;
    mapping (bytes32 => uint8) public votesFor;

    bool private stopped = false;
    address private owner;

    modifier isAdmin() {
        require(msg.sender == owner);
        _;
    }

    // constructor to initialize candidates
    constructor(bytes32[] candidateNames) public {
        candidates = candidateNames;
    }

    // Vote for a candidate
    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesFor[candidate] += 1;
    }

    // get the total count of votes for a candidate
    function totalVotesFor(bytes32 candidate) view public returns (uint) {
        require(validCandidate(candidate));
        return votesFor[candidate];
    }

    // Check whether a candidate is valid or not
    function validCandidate(bytes32 candidate) view public returns (bool) {
        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i] == candidate) {
                return true;
            }
        }
        return false;
    }

    // Get the total number of the candidates
    function totalCandidate() view public returns (uint){
        return candidates.length;
    }

    // Toggle the contract
    function toggleContractActive() isAdmin public {
        stopped = !stopped;
    }

    // Emergency stop the contract
    modifier stopInEmergency {
        require(stopped);
        _;
    }

    // Emergency restart the contract
    modifier onlyInEmergency {
        require(!stopped);
        _;
    }
}
