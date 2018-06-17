
var RoleUtils = artifacts.require("./RoleUtils.sol");
var FirstGarantee = artifacts.require("./FirstGuarantee.sol");

module.exports = function(deployer, network, accounts) {

        deployer.then( function() {

            return deployer.deploy(RoleUtils);

        }).then(function (roleUtilsInstance){
            var roleUtilsAddress = roleUtilsInstance.address;
            console.log("+++++++++++++++++++++++++++++ roleUtilsInstance: " + roleUtilsAddress);

            //return FirstGarantee.deployed(roleUtilsAddress, {gas:6721975});
            return deployer.deploy(FirstGarantee, roleUtilsInstance.address);

        }).then(function (firtsGuarantyInstance){
            console.log("+++++++++++++++++++++++++++++ firtsGuarantyInstance: " + firtsGuarantyInstance.address);

        }).catch(function(error) {
            console.error("+++++++++++++++++++++++++++++ Error detected during DEPLOYMENT: " + error);
        });

};

