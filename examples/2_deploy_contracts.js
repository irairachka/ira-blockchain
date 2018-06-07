
var RoleUtils = artifacts.require("./RoleUtils.sol");
var FirstGarantee = artifacts.require("./FirstGuarantee.sol");

module.exports = function(deployer, network, accounts) {

        deployer.then( function() {

            //return RoleUtils.deployed();
            return deployer.deploy(RoleUtils);

        }).then(function (roleUtilsInstance){
            var roleUtilsAddress = roleUtilsInstance.address;
            console.log("+++++++++++++++++++++++++++++ roleUtilsInstance: " + roleUtilsAddress);

            return deployer.deploy(FirstGarantee, roleUtilsAddress, {gas:6721975});
            //return deployer.deploy(FirstGarantee, roleUtilsInstance.address);

        }).catch(function(error) {
            console.error("+++++++++++++++++++++++++++++ Error detected during DEPLOYMENT: " + error);
        });

};

