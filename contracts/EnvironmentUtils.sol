pragma solidity ^0.4.0;

import "./EnvironmentInitializer.sol";
import "./Municipality.sol";
import "./Bank.sol";
import "./Customer.sol";


contract EnvironmentUtils is EnvironmentInitializer{


    event GetBankCalled(bytes32 name, address theAccount, address theContractAddress, address theSenderAddress, uint timestamp);

    function getMunicipalityByAccount(address theAccount) returns (Municipality municipality) {
        return municipalitiesList[theAccount];
    }


    function getBankByAccount(address theAccount) public returns (Bank _bank) {
        Bank bank = banksList[theAccount];

        emit GetBankCalled(bank.name(), theAccount, bank, msg.sender, now);

        return bank;
    }

    function getCustomerByAccount(address theAccount) public returns (Customer customer) {
        return customersList[theAccount];
    }

}
