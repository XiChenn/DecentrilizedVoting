# Project Description
This is decentralized voting web application. People can vote the favorite cryptocurrencies.

# Project Setup
##### start ganache (make sure using teh default port 8545)
$ ganache-cli

$ truffle compile

$ truffle migrate

$ npm run dev

Then use http://127.0.0.1:8080/

# Testing
truffle test tests/TestVoting.sol 

# Security Tools / Common Attacks
Pitfalls in Race Condition Solutions¶
Since race conditions can occur across multiple functions, and even multiple contracts, any solution aimed at preventing reentry will not be sufficient.
