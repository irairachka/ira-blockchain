

var Web3 = require('web3');
var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:9545"));
console.log("set provider: HttpProvider(http://localhost:9545)");


console.log("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
var versionVal = web3.version.node;
console.log("+++++++++++++++++++ NODE : " + versionVal);
versionVal = web3.version.network;
console.log("+++++++++++++++++++ NETWORK : " + versionVal);
versionVal = web3.version.ethereum;
console.log("+++++++++++++++++++ ETHEREUM : " + versionVal);
versionVal = web3.net.peerCount;
console.log("+++++++++++++++++++ PEER_COUNT : " + versionVal);
versionVal = web3.eth.defaultAccount;
console.log("+++++++++++++++++++ DEFAULT_ACCOUNT : " + versionVal);
versionVal = web3.eth.defaultBlock;
console.log("+++++++++++++++++++ DEFAULT_BLOCK : " + versionVal);
versionVal = web3.eth.syncing;
console.log("+++++++++++++++++++ SYNCING : " + versionVal);
versionVal = web3.eth.coinbase;
console.log("+++++++++++++++++++ COINBASE : " + versionVal);
versionVal = web3.eth.gasPrice;
console.log("+++++++++++++++++++ GAS_PRICE : " + versionVal);
var accounts = web3.eth.accounts;
console.log("+++++++++++++++++++ ACCOUNTS : ");
for(i=0; i<accounts.length; i++)
{
    console.log("    account " + i + ": " + accounts[i]);
}

console.log("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
var blockNum = web3.eth.blockNumber;
console.log("+++++++++++++++++++ CURRENT_BLOCK_NUMBER : " + blockNum);
var currentBlockInfo = web3.eth.getBlock(blockNum);
console.log("+++++++++++++++++++ CURRENT_BLOCK_INFO : " )
    console.log("           number: " + currentBlockInfo.number);
    console.log("           hash: " + currentBlockInfo.hash);
    console.log("           parentHash: " + currentBlockInfo.parentHash);
    console.log("           size: " + currentBlockInfo.size);
    console.log("           gasLimit: " + currentBlockInfo.gasLimit);
    console.log("           gasUsed: " + currentBlockInfo.gasUsed);

versionVal = web3.eth.getBlockTransactionCount(blockNum);
console.log("+++++++++++++++++++ CURRENT_BLOCK_TR_NUMBER : " + versionVal);
console.log("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

var FirstGuarantee = artifacts.require("./FirstGuarantee.sol");
var RoleUtils = artifacts.require("./RoleUtils.sol");
var Bank = artifacts.require("./Bank.sol");
var Customer = artifacts.require("./Customer.sol");
var Municipality = artifacts.require("./Municipality.sol");
var EnvironmentUtils = artifacts.require("./EnvironmentUtils.sol");

var sha3_512 = require('js-sha3').sha3_512;

//const SHA3 = require('sha3');

contract("FirstGuarantee", function(accounts) {
    var first_account = accounts[0];


    it("-------- This is FirstGuarantee test ---------", function() {

        console.log("first_account in Quorum: " + first_account);

        var globalFirstGuarantee;
        var newFirstGuarantee;
        var environmentUtils;

        return FirstGuarantee.deployed().then(function(instance) {
            globalFirstGuarantee = instance;
            console.log("Global Events - first execution:");

            return getContractHistoryEvents(globalFirstGuarantee);

        }).then(function () {

            return globalFirstGuarantee.getOwner.call();

        }).then(function (ownerAddress) {
            account = ownerAddress;
            console.log("ownerAddress: "+ ownerAddress);

            return globalFirstGuarantee.roleUtils.call();

        }).then(function (roleUtils) {

            console.log("global roleUtils: " + roleUtils);

            return globalFirstGuarantee.getId.call();

        }).then(function (guaranteeAddress) {
            console.log("guaranteeAddress: " + guaranteeAddress);

            return RoleUtils.deployed();

        }).then(function (roleUtilsInstance){

            console.log("roleUtilsAddress: " + roleUtilsInstance.address);

            //return FirstGuarantee.new(constructorParam1] [, constructorParam2], {from: first_account});
            return FirstGuarantee.new(roleUtilsInstance.address, {from: first_account});
        }).then(function (newContractInstance){
            console.log("New guarantee CREATED !!!");
            console.log("New guarantee specific Events - first execution:");

            newFirstGuarantee = newContractInstance;

            return EnvironmentUtils.deployed();

        }).then(function (_environmentUtils) {
            environmentUtils = _environmentUtils;
            console.log("environmentUtils: " + environmentUtils.address);

            return environmentUtils.getBankByAccount(0xf17f52151ebef6c7334fad080c5704d77216b732);

        }).then(function () {

            return getContractHistoryEvents(environmentUtils);

        }).then(function (bankHapoalim) {

            console.log("bankHapoalim: " + bankHapoalim.address);

            var customer = Customer.at('0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef');
            var municipality = Municipality.at('0x821aea9a577a9b44299b9c15c88cf3087f3b5544');
            var pdfHash = sha3_512("this is a pdf file content");

            return newFirstGuarantee.populateGuaranteeData.sendTransaction(municipality.address, bankHapoalim.address, customer.address, pdfHash);
        }).then(function () {

            console.log("Guarantee data is populated !!!!!!");

            //recall ne guarantee
            var recalled_FirstGuarantee = FirstGuarantee.at(newFirstGuarantee.address);

            return recalled_FirstGuarantee.bank.call();
            //return newFirstGuarantee.bank.call();

            return getContractHistoryEvents(recalled_FirstGuarantee);
        }).then(function (bank) {
            console.log("bank in the new guarantee: " + bank.address);

            console.log("Global Events - second execution:");

            return FirstGuarantee.deployed();

        }).then(function (secondGlobalFirstGuarantee){

            return getContractHistoryEvents(secondGlobalFirstGuarantee);
        }).then(function (replay) {
            logBlockchainStatusAfterGaranteeCreation();

        }).catch(function(error) {
            console.error(error);
            assert.equal(error.toString(),'', 'Error detected')
        });
    });



    getContractHistoryEvents = (theRelevantContract) => {

        return new Promise((resolve) => {

            var contractEventsArray = [];
            var contractAddress = theRelevantContract.address;
            var allContractEvents = theRelevantContract.allEvents({fromBlock: 0, toBlock: 'latest'});

            return allContractEvents.get(function (error, result) {

                console.log("events array length: " + result.length);

                for (var i = result.length - 1; i >= 0; i--) {
                    var cur_result = result[i];

                    console.log("event [" + i + "] name: " + cur_result.event);

                    contractEventsArray.push(populateHistoryLineData(cur_result.event, cur_result.args));
                }

                var replay =
                    {
                        shortguarantee: contractAddress,
                        log: contractEventsArray
                    };

                resolve(replay);

            })
        })
    };


    populateHistoryLineData=(event, args)=> {

        var theMessage = args.theMessage;
        var theAccount = args.theAccount;
        const theContractAddress = args.theContractAddress;
        const theSenderAddress = args.theSenderAddress;
        const theDate = (new Date(args.timestamp.valueOf() * 1000) ).toDateString();
        const theOriginDate = args.timestamp;

        console.log("         theMessage: " + theMessage);
        console.log("         theAccount: " + theAccount);
        console.log("         theContractAddress: " + theContractAddress);
        console.log("         theSenderAddress: " + theSenderAddress);
        console.log("         theDate: " + theDate);
        console.log("         theOriginDate: " + theOriginDate);

        var ask = {
            eventname: event,
            message: theMessage,
            contractAddress: theContractAddress,
            senderAddress: theSenderAddress,
            date: theDate
        };

        return ask;
    };


    logBlockchainStatusAfterGaranteeCreation=()=> {

        console.log("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        var blockNum = web3.eth.blockNumber;
        console.log("+++++++++++++++++++ CURRENT_BLOCK_NUMBER : " + blockNum);
        var currentBlockInfo = web3.eth.getBlock(blockNum);
        console.log("+++++++++++++++++++ CURRENT_BLOCK_INFO : ")
        console.log("           number: " + currentBlockInfo.number);
        console.log("           hash: " + currentBlockInfo.hash);
        console.log("           parentHash: " + currentBlockInfo.parentHash);
        console.log("           size: " + currentBlockInfo.size);
        console.log("           gasLimit: " + currentBlockInfo.gasLimit);
        console.log("           gasUsed: " + currentBlockInfo.gasUsed);

        versionVal = web3.eth.getBlockTransactionCount(blockNum);
        console.log("+++++++++++++++++++ CURRENT_BLOCK_TR_NUMBER : " + versionVal);
        console.log("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    }

});


