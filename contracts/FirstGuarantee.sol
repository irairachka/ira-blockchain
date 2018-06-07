pragma solidity ^0.4.24;

import "./BaseGuaranteeData.sol";
//import "./RoleUtils.sol";


//contract RoleUtils{
//
//   // modifier onlyAdmin{};
//    //modifier environmentMakerOnly;
//}



contract FirstGuarantee is BaseGuaranteeData {

    RoleUtils roleUtils;

    event FirstGuaranteeCreated(string theMessage, address theContractAddress, address theSenderAddress, uint timestamp);
    event FirstGuaranteePopulated(string theMessage, address theContractAddress, address theSenderAddress, uint timestamp);

    function getId() public constant returns (address _contract_id){
        return this;
    }


    constructor (address roleUtilsAddress) public {

        roleUtils = RoleUtils(roleUtilsAddress);

        emit FirstGuaranteeCreated("The FirstGuarantee created!!!", this, msg.sender, now);
    }


    //function populateBaseGuaranteeData(Municipality _municipality, Bank _bank, Customer _customer, bytes _guaranteeDocumentHash) public {
    function populateBaseGuaranteeData(address _municipality, address _bank, address _customer, bytes _guaranteeDocumentHash) public {
        BaseGuaranteeData.populateBaseGuaranteeData(_municipality, _bank, _customer, _guaranteeDocumentHash);

        emit FirstGuaranteePopulated("FirstGuaranty data populated", this, msg.sender, now);
    }

}
