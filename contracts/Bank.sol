pragma solidity ^0.4.24;

import "./ParticipantData.sol";

contract Bank is ParticipantData{


    function isBank() constant public returns (bool _isBank){
        return true;
    }



}