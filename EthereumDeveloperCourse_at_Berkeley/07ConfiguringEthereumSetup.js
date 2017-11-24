//Make a new file in /greeterApp/greeterui/src called EthereumSetup.js
//Import web3 so we can use the api
//Set our Ethereum client testrpc
//Set our greeterABI and greeterAddress
//Set our greeterContract variable and export it
import Web3 from 'web3';
const ETHEREUM_CLIENT = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"))
var greeterABI = [{"constant":true,"inputs":[],"name":"greet","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_greeting","type":"string"}],"name":"greeter","outputs":[],"payable":false,"type":"function"}]
//this address should be different from this one. It is mined by yourself.
var greeterAddress = '0x004298fee228dec7625c8904ac8864690e18eb00';
const greeterContract = ETHEREUM_CLIENT.eth.contract(greeterABI).at(greeterAddress);
export {greeterContract};
