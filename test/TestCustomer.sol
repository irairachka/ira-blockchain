pragma solidity ^0.4.18;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/FirstGuarantee.sol";

contract TestCustomer {

    uint public initialBalance = 1 ether;
    FirstGuarantee public newFirstGuarantee;

    event print_FirstGuarantee(FirstGuarantee theGuarantee);
    event print_Address(address theAddress);

    function beforeEach() public {
        newFirstGuarantee = new FirstGuarantee();
    }

    function testGuaranteeCreation() public {

        FirstGuarantee theFirstContract = FirstGuarantee(DeployedAddresses.FirstGuarantee());
        address testVal = newFirstGuarantee.getId();

        // perform an action which sends value to myContract, then assert.
        //theFirstContract.send();

        //console.log(theFirstContract.this);
        emit print_FirstGuarantee(theFirstContract);
        emit print_Address(testVal);

       // Assert.equal(initialBalance, testVal, "this is a test ONLY");
    }
}
