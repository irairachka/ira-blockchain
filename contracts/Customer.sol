pragma solidity ^0.4.24;

import "./ParticipantData.sol";


contract Customer is ParticipantData {

    function isCustomer() constant public returns (bool _isCustomer){
        return true;
    }

}
