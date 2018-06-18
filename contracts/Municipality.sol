pragma solidity ^0.4.24;

import "./ParticipantData.sol";

contract Municipality is ParticipantData{


    address municipalityAccount;

    event NewMunicipalityCreated(address theContractAddress, address theSenderAddress, uint timestamp);
    event MunicipalityDataPopulated(string name, address theAccount, address theContractAddress, address theSenderAddress, uint timestamp);

    function isMunicipality() pure public returns (bool _isMunicipality){
        return true;
    }

    constructor() public {
        emit NewMunicipalityCreated(this, msg.sender, now);
    }



    function populateMunicipalityData (address _municipalityAccount, string _name, string _localAddress) public {
        municipalityAccount = _municipalityAccount;
        participantName = _name;
        localAddress = _localAddress;
        isActive = true;

        emit MunicipalityDataPopulated(_name, _municipalityAccount, this, msg.sender, now);
    }

}
