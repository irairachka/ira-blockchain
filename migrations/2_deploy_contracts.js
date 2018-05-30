
var FirstGarantee = artifacts.require("./FirstGuarantee.sol");
//var Municipality = artifacts.require("./Municipality.sol");
//var Customer = artifacts.require("./Customer.sol");

module.exports = function(deployer) {

  	deployer.deploy(FirstGarantee, {gas:5700000});

};
