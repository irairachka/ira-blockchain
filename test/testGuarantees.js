

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
//var FirstGuaranteestr = FirstGuarantee.

contract("FirstGuarantee", function(accounts) {
    var first_account = accounts[0];


    it("-------- This is FirstGuarantee test ---------", function() {

        console.log("first_account in Quorum: " + first_account);

        var globalFirstGuarantee;

        return FirstGuarantee.deployed().then(function(instance) {
            globalFirstGuarantee = instance;
            console.log("Global Events - first execution:");

            return getGuaranteeHistoryEvents(globalFirstGuarantee);

        }).then(function () {

            return globalFirstGuarantee.getOwner.call();

        }).then(function (ownerAddress) {
            account = ownerAddress;
            console.log("ownerAddress: "+ ownerAddress);

            return globalFirstGuarantee.getId.call();

        }).then(function (guaranteeAddress) {
            console.log("guaranteeAddress: " + guaranteeAddress);

            //return FirstGuarantee.new(constructorParam1] [, constructorParam2], {from: first_account});
            return FirstGuarantee.new({from: first_account});
        }).then(function (newContractInstance){
            console.log("New guarantee CREATED !!!");
            console.log("New guarantee specific Events - first execution:");

            return getGuaranteeHistoryEvents(newContractInstance);
        }).then(function () {
            console.log("Global Events - second execution:");

            return getGuaranteeHistoryEvents(globalFirstGuarantee);
        }).then(function (replay) {


        }).catch(function(error) {
            console.error(error);
            assert.equal(error.toString(),'', 'Error detected')
        });
    });



    getGuaranteeHistoryEvents = (theRelevantGuarantee) => {

        return new Promise((resolve) => {

            var guarantyEventsArray = [];
            var guaranteeAddress = theRelevantGuarantee.address;
            var allGuaranteeEvents = theRelevantGuarantee.allEvents({fromBlock: 0, toBlock: 'latest'});

            return allGuaranteeEvents.get(function (error, result) {

                console.log("events array length: " + result.length);

                for (var i = result.length - 1; i >= 0; i--) {
                    var cur_result = result[i];

                    console.log("event [" + i + "] name: " + cur_result.event);

                    guarantyEventsArray.push(populateHistoryLineData(cur_result.event, cur_result.args));
                }

                var replay =
                    {
                        shortguarantee: guaranteeAddress,
                        log: guarantyEventsArray
                    };

                resolve(replay);

            })
        })
    };


    populateHistoryLineData=(event, args)=> {

        var theMessage = args.theMessage;
        const theContractAddress = args.theContractAddress;
        const theSenderAddress = args.theSenderAddress;
        const theDate = (new Date(args.timestamp.valueOf() * 1000) ).toDateString();

        console.log("         theMessage: " + theMessage);
        console.log("         theContractAddress: " + theContractAddress);
        console.log("         theSenderAddress: " + theSenderAddress);
        console.log("         theDate: " + theDate);

        var ask = {
            eventname: event,
            message: theMessage,
            contractAddress: theContractAddress,
            senderAddress: theSenderAddress,
            date: theDate
        };

        return ask;
    };


});
