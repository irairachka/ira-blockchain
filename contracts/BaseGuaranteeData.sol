pragma solidity ^0.4.24;

import "./Municipality.sol";
import "./Bank.sol";
import "./Customer.sol";
import "./Ownable.sol";
import "./RoleUtils.sol";

contract BaseGuaranteeData is Ownable{

    Municipality municipality;
    Bank public bank;
    Customer customer;

    bytes guaranteeDocumentHash;

    // for user roles validations
    RoleUtils public roleUtils;

    event BaseGuaranteeCreated(string theMessage, address theContractAddress, address theSenderAddress, uint timestamp);
    event BaseGuaranteePopulated(string theMessage, address theContractAddress, address theSenderAddress, uint timestamp);
    event RoleUtilsAdded(string theMessage, address theContractAddress, address theSenderAddress, uint timestamp);

    // this is an  Abstract Contract
    constructor (address roleUtilsAddress) internal {
        roleUtils = RoleUtils(roleUtilsAddress);
        emit BaseGuaranteeCreated("The BaseGuarantee created!!!", this, msg.sender, now);
        emit RoleUtilsAdded("The RoleUtils address is ", roleUtils, msg.sender, now);
    }


    modifier onlyAdmin() {
        if (roleUtils.isAdmin(msg.sender))
            _;
    }


    modifier environmentMakerOnly() {
        if (roleUtils.isEnvironmentMaker(msg.sender))
            _;
    }


    function getId() constant public returns (address _contract_id);



    function setBaseGuaranteeData(Municipality _municipality, Bank _bank, Customer _customer, bytes _guaranteeDocumentHash) onlyAdmin internal{
        municipality = _municipality;
        bank = _bank;
        customer = _customer;
        guaranteeDocumentHash = _guaranteeDocumentHash;

        emit BaseGuaranteePopulated("BaseGuarantee data populated", this, msg.sender, now);
    }

    function populateBaseGuaranteeData(address _municipality, address _bankAccount, address _customer, bytes _guaranteeDocumentHash) onlyAdmin public {
        Municipality municipality = Municipality(_municipality);
        Bank bank = Bank(_bank);
        Customer customer = Customer(_customer);

        setBaseGuaranteeData(municipality, bank, customer, guaranteeDocumentHash);
    }


    /*
    *   contract destruction by owner only
    */
    function deleteContract() public onlyOwner {
        selfdestruct(owner);
    }
}

