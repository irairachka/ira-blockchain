pragma solidity ^0.4.24;

import "./BaseGuaranteeData.sol";


contract FirstGuarantee is BaseGuaranteeData {


    event FirstGuaranteeCreated(string theMessage, address theContractAddress, address theSenderAddress, uint timestamp);
    event FirstGuaranteePopulated(string theMessage, address theContractAddress, address theSenderAddress, uint timestamp);

    function getId() public constant returns (address _contract_id){
        return this;
    }


    constructor () public {

        emit FirstGuaranteeCreated("The FirstGuarantee created!!!", this, msg.sender, now);
    }


    function populateBaseGuaranteeData(Municipality _municipality, Bank _bank, Customer _customer, bytes _guaranteeDocumentHash) onlyAdmin public {
        BaseGuaranteeData.populateBaseGuaranteeData(_municipality, _bank, _customer, _guaranteeDocumentHash);

        emit FirstGuaranteePopulated("FirstGuaranty data populated", this, msg.sender, now);
    }

}
