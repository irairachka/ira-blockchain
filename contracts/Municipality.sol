pragma solidity ^0.4.24;

import "./ParticipantData.sol";

contract Municipality is ParticipantData{

    function isMunicipality() pure public returns (bool _isMunicipality){
        return true;
    }

}
