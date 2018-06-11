
//var RoleUtils = artifacts.require("./RoleUtils.sol");
var FirstGarantee = artifacts.require("./FirstGuarantee.sol");

module.exports = function(deployer, network, accounts) {

        deployer.then( function() {

            return deployer.deploy(FirstGarantee,  {gas:6721975});

        }).catch(function(error) {
            console.error("+++++++++++++++++++++++++++++ Error detected during DEPLOYMENT: " + error);
        });

};
