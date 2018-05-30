pragma solidity ^0.4.24;

import "./Municipality.sol";
import "./Bank.sol";
import "./Customer.sol";
import "./Ownable.sol";

contract BaseGuaranteeData is Ownable{

    Municipality municipality;
    Bank bank;
    Customer customer;
    bytes guaranteeDocumentHash;

    // this is an  Abstract Contract
    constructor () internal {}
    function getId() constant public returns (address _contract_id);



    function populateBaseGuaranteeData(Municipality _municipality, Bank _bank, Customer _customer, bytes _guaranteeDocumentHash) public {
        municipality = _municipality;
        bank = _bank;
        customer = _customer;
        guaranteeDocumentHash = _guaranteeDocumentHash;
    }


    /*
    *   contract destruction by owner only
    */
    function deleteContract() public onlyOwner {
        selfdestruct(owner);
    }
}
