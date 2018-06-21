pragma solidity ^0.4.24;

import "./BaseGuaranteeData.sol";


contract FirstGuarantee is BaseGuaranteeData {


    event FirstGuaranteeCreated(string theMessage, address theContractAddress, address theSenderAddress, uint timestamp);
    event FirstGuaranteeDataPopulated(string theMessage, address theContractAddress, address theSenderAddress, uint timestamp);

    function getId() public constant returns (address _contract_id){
        return this;
    }


    constructor (address roleUtilsAddress) public BaseGuaranteeData(roleUtilsAddress){

        emit FirstGuaranteeCreated("The FirstGuarantee created!!!", this, msg.sender, now);
    }


    function populateGuaranteeData(address _municipality, address _bank, address _customer, bytes _guaranteeDocumentHash) onlyAdmin public {
        populateBaseGuaranteeData(_municipality, _bank, _customer, _guaranteeDocumentHash);

        emit FirstGuaranteeDataPopulated("FirstGuaranty data populated", this, msg.sender, now);
    }

}
