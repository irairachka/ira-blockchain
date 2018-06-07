pragma solidity ^0.4.24;

import "./ParticipantData.sol";

contract Bank is ParticipantData{

    address bankAccount;

    event NewBankCreated(address theContractAddress, address theSenderAddress, uint timestamp);
    event BankDataPopulated(bytes32 name, address theContractAddress, address theSenderAddress, uint timestamp);

    constructor() public {
        emit NewBankCreated(this, msg.sender, now);
    }

    function isBank() pure public returns (bool _isBank){
        _isBank = true;
    }


    function populateData (address _bankAccount, bytes32 _name, bytes32 _localAddress) public {
        bankAccount = _bankAccount;
        name = _name;
        localAddress = _localAddress;
        isActive = true;

        emit BankDataPopulated(_name, this, msg.sender, now);
    }


}