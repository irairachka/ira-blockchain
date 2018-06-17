pragma solidity ^0.4.0;

import "./EnvironmentInitializer.sol";


contract EnvironmentUtils is EnvironmentInitializer{


    function getMunicipalityByAccount(address theAccount) returns (Municipality municipality) {
        return municipalitiesList.get(theAccount);
    }

    function getBankByAccount(address theAccount) returns (Bank bank) {
        return bankList.get(theAccount);
    }

    function getCustomerByAccount(address theAccount) returns (Customer customer) {
        return customerList.get(theAccount);
    }

}
