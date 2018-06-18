pragma solidity ^0.4.0;

import "./EnvironmentInitializer.sol";
import "./Municipality.sol";
import "./Bank.sol";
import "./Customer.sol";


contract EnvironmentUtils is EnvironmentInitializer{


    event GetBankCalled(string name, address theAccount, address theContractAddress, address theSenderAddress, uint timestamp);

    function getMunicipalityByAccount(address theAccount) returns (Municipality municipality) {
        return municipalitiesList[theAccount];
    }


    function getBankByAccount(address theAccount) public returns (address) {
        Bank bank = banksList[theAccount];
        address bankAddress = address(bank);

        emit GetBankCalled(bank.participantName(), bank.bankAccount(), bankAddress , msg.sender, now);

        return bankAddress;
    }

    function getCustomerByAccount(address theAccount) public returns (Customer customer) {
        return customersList[theAccount];
    }

}
