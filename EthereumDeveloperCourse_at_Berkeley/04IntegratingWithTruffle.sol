// To prepare greeter for poking we need to change some things in
// /greeterApp/greeter/migrations/deploy_contracts.js
var Greeter = artifacts.require("./Greeter.sol"); //creates an artifact
module.exports = function(deployer) { //exports and deploys greeter
  deployer.deploy(Greeter);
};

//take a look at truffle and change a little bit
module.exports = {
networks: {
 development: {
     host: "localhost",
     port: 8545,
     network_id: "*" // Match any network id
 }
  }
};

/*Lets start up our Testrpc now by typing testrpc in an empty terminal window. In a few seconds you’ll see a list of 10 accounts, their private keys, a 12 word pneumonic, and the fact that our Testrpc is listening on localhost:8545 , the same place that we are migrating our contract to!
Let’s do it: navigate to /greeterApp/greeter/ and type:*/
//Then
$ truffle compile
$ truffle migrate

$ truffle console
// open truffle(development)>
truffle(development)> Greeter.address
//'0x004298fee228dec7625c8904ac8864690e18eb00
truffle(development)> let contract = Greeter.at(Greeter.address)
truffle(development)> contract.greeter("Hello!")
truffle(development)> contract.greet()
//"Hello"
