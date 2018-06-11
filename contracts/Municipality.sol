pragma solidity ^0.4.24;

import "./ParticipantData.sol";

contract Municipality is ParticipantData{


    address municipalityAccount;

    event NewMunicipalityCreated(address theContractAddress, address theSenderAddress, uint timestamp);
    event MunicipalityDataPopulated(bytes32 name, address _municipalityAccount, address theContractAddress, address theSenderAddress, uint timestamp);

    function isMunicipality() pure public returns (bool _isMunicipality){
        return true;
    }

    constructor() public {
        emit NewMunicipalityCreated(this, msg.sender, now);
    }



    function populateMunicipalityData (address _municipalityAccount, bytes32 _name, bytes32 _localAddress) public {
        municipalityAccount = _municipalityAccount;
        name = _name;
        localAddress = _localAddress;
        isActive = true;

        emit MunicipalityDataPopulated(_name, _municipalityAccount, this, msg.sender, now);
    }

}
