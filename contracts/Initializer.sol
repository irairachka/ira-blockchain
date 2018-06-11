pragma solidity ^0.4.24;

import "./Municipality.sol";
import "./Bank.sol";
import "./Customer.sol";

contract Initializer {

    event BankListInitialized (address[] banks);
    event CustomerListInitialized (address[] customers);
    event MunicipalityListInitialized (address [] Municipalities);

    constructor() public{

        createInitialBankList();

    }


    function createInitialBankList() internal  { //returns (address[])

        //address[] storage banks = new address[](3);
        Bank poalimBank = new Bank();
        poalimBank.populateBankData(0xf17f52151ebef6c7334fad080c5704d77216b732, "Bank Ha Poalim", "Ha Negev 11, Tel Aviv");
        //banks[0] = poalimBank;

        //return banks;
    }


    function createInitialCustomerList() public {
        Customer customer = new Customer();
        customer.po

    }


    function createInitialMunicipalityList() public {

    }


}
