var Voting = artifacts.require('./Voting.sol')

module.exports = function (deployer) {
  deployer.deploy(Voting, ['Bitcoin', 'Ethereum', 'EOS']);
}
