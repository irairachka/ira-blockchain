require('babel-register');
var request = require('request');

module.exports = {
    networks: {
        develop: {
            host: "127.0.0.1",
            port: 9545,
            network_id: "*", // Match any network id
            gas: 6721975,
            gasPrice: 0
            //from: "0x627306090abab3a6e1400e9345bc60c78a8bef57"
        },
        live: {
            host: "127.0.0.1", // Random IP for example purposes (do not use)
            port: 22000,
            network_id: 1        // Ethereum public network
            // optional config values:
            // gas
            // gasPrice
            // from - default address to use for any transaction Truffle makes during migrations
            // provider - web3 provider instance Truffle should use to talk to the Ethereum network.
            //          - function that returns a web3 provider instance (see below.)
            //          - if specified, host and port are ignored.
        }
    }
};