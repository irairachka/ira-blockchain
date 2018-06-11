pragma solidity ^0.4.24;

import "./ParticipantData.sol";

contract Bank is ParticipantData{

    address bankAccount;

    event NewBankCreated(address theContractAddress, address theSenderAddress, uint timestamp);
    event BankDataPopulated(bytes32 name, address _bankAccount, address theContractAddress, address theSenderAddress, uint timestamp);

    constructor() public {
        emit NewBankCreated(this, msg.sender, now);
    }

    function isBank() pure public returns (bool){
        return true;
    }


    function populateBankData (address _bankAccount, bytes32 _name, bytes32 _localAddress) public {
        bankAccount = _bankAccount;
        name = _name;
        localAddress = _localAddress;
        isActive = true;

        emit BankDataPopulated(_name, _bankAccount, this, msg.sender, now);
    }


}