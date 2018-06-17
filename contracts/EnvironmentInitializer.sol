pragma solidity ^0.4.24;

import "./Municipality.sol";
import "./Bank.sol";
import "./Customer.sol";

contract EnvironmentInitializer {


    mapping (address=>Bank) internal banksList;
    mapping (address=>Municipality) internal municipalitiesList;
    mapping (address=>Customer) internal customersList;


    constructor(){
        createInitialBankList();
        createInitialCustomerList();
        createInitialMunicipalityList();
    }



    function createInitialBankList() public  returns (Bank theBank){

        Bank theBank = new Bank();
        theBank.populateBankData(0xf17f52151ebef6c7334fad080c5704d77216b732, "Bank Ha Poalim", "Ha Negev 11, Tel Aviv");
        banksList.push(0xf17f52151ebef6c7334fad080c5704d77216b732, theBank);
    }


    function createInitialCustomerList() public {
        Customer customer = new Customer();
        customer.populateCustomerData(0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef, "Customer Ira Eidelman", "Ha Ganim, Kyriat Ono");
        customersList.push(0xf17f52151ebef6c7334fad080c5704d77216b732, customer);
    }


    function createInitialMunicipalityList() public {
        Municipality municipality = new Municipality();
        municipality.populateMunicipalityData(0x821aea9a577a9b44299b9c15c88cf3087f3b5544, "Customer Ira Eidelman", "Ha Ganim, Kyriat Ono");
        municipalitiesList.push(0xf17f52151ebef6c7334fad080c5704d77216b732, customer);
    }


}
