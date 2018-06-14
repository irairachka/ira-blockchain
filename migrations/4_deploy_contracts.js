
var EnvironmentInitializer = artifacts.require("./EnvironmentInitializer.sol");

module.exports = function(deployer, network, accounts) {

        deployer.then( function() {

            return deployer.deploy(EnvironmentInitializer,  {gas:6721975});

        }).catch(function(error) {
            console.error("+++++++++++++++++++++++++++++ Error detected during Initializer DEPLOYMENT: " + error);
        });

};
