pragma solidity ^0.4.24;

import "./BaseGuaranteeData.sol";


contract FirstGuarantee is BaseGuaranteeData {

    event FirstGuaranteeCreated(string theMessage, address theContractAddress, address theSenderAddress, uint timestamp);
    event FirstGuarantePopulated(string theMessage, address theContractAddress, address theSenderAddress, uint timestamp);

    function getId() public constant returns (address _contract_id){
        return this;
    }


    constructor () public{

        emit FirstGuaranteeCreated("The FirstGuarantee created!!!", this, msg.sender, now);
    }


    function populateBaseGuaranteeData(Municipality _municipality, Bank _bank, Customer _customer, bytes _guaranteeDocumentHash) public {
        emit FirstGuarantePopulated("FirstGuaranty data populated", this, msg.sender, now);
    }

}
