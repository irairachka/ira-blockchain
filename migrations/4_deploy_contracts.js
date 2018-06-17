
var EnvironmentUtils = artifacts.require("./EnvironmentUtils.sol");

module.exports = function(deployer, network, accounts) {

        deployer.then( function() {

            return deployer.deploy(EnvironmentUtils,  {gas:6721975});

        }).catch(function(error) {
            console.error("+++++++++++++++++++++++++++++ Error detected during Initializer DEPLOYMENT: " + error);
        });

};
