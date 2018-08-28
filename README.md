# Project Description
This is decentralized voting web application. People can vote the favorite cryptocurrencies.

# Project Setup
##### Prerequisite
nodejs, npm, ganache-cli, metamask chrome plugin are installed

##### start ganache (make sure using teh default port 8545)
$ ganache-cli

copy one of the private key and in metamask click "Import Account" and paste the private key


#### Execute the following command in the root of project
$ npm install

$ truffle compile

$ truffle migrate

$ npm run dev

Then use http://127.0.0.1:8080/

Enter one of "Bitcoin", "Ethereum", "EOS" can click vote. The data will write to the blockchain. Refresh the page to see the result.
In the metamask, make sure "localhost 8545" is selected as the network. Make sure the gas is at least 5 wei.


# Testing

run the following command in the project directory

$ truffle test tests/TestVoting.sol 

# Security Tools / Common Attacks
Pitfalls in Race Condition Solutions¶
Since race conditions can occur across multiple functions, and even multiple contracts, any solution aimed at preventing reentry will not be sufficient.
