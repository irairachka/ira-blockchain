var myAppData = require('myapp/libs/data');
module.exports = function(deployer) {
    // Get the existing contract address before the deploy starts.
    var existingAddress = Contract.address;

    // Replace the version of Contract. deploy() will do this automatically
    // if it has previously been deployed in an earlier migration.
    deployer.deploy(Contract);
    deployer.then(function() {
        // Call the upgradeTo function on the existing contract.
        Contract.at(existingAddress).upgradeTo(Contract.address);
    }).then(function() {
        // Call the use() function on the new contract.
        // Remember: A new version was deployed in the previous step.
        Contract.deployed().use(myAppData.getParams());
    });
});