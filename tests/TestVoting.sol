pragma solidity ^0.4.23;

import "truffle/DeployedAddresses.sol";
import "truffle/Assert.sol";
import "../contracts/Voting.sol";

contract TestVoting {
    // Test to make sure the total 3 crypto currencies were initialized
    function testInitialVoting() public {
        Voting voting = Voting(DeployedAddresses.Voting());
        Assert.equal(voting.totalCandidate(), 3, "3 crypto currencies were initialized");
    }

    // Test to make sure validCandidate method can return correctly for valid candidate
    function testValidCandidate() public {
        Voting voting = Voting(DeployedAddresses.Voting());
        Assert.equal(voting.validCandidate('EOS'), true, "EOS is a valid candidate");
    }

    // Test to make sure validCandidate method can return correctly for invalid candidate
    function testInvalidCandidate() public {
        Voting voting = Voting(DeployedAddresses.Voting());
        Assert.equal(voting.validCandidate('ZEC'), false, "ZEC is not a valid candidate");
    }

    // Test to make sure totalVotesFor method works as expected.
    function testTotalVotesFor() public {
        Voting voting = Voting(DeployedAddresses.Voting());
        uint count = voting.totalVotesFor('Bitcoin');
        voting.voteForCandidate('Bitcoin');
        Assert.equal(voting.totalVotesFor('Bitcoin'), count + 1, "Vote for Bitcoin increases by 1");
    }

    // Test to make sure voteForCandidate method works as expected.
    function testVoteForCandidate() public {
        Voting voting = Voting(DeployedAddresses.Voting());
        uint count = voting.totalVotesFor('EOS');

        voting.voteForCandidate('EOS');
        voting.voteForCandidate('EOS');
        Assert.equal(voting.totalVotesFor('EOS'), count + 2, "Vote for EOS increases by 2");
    }
}
