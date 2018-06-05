pragma solidity ^0.4.24;

import "./ParticipantData.sol";


contract Customer is ParticipantData {

    function isCustomer() pure public returns (bool _isCustomer){
        return true;
    }

}
