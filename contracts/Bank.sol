pragma solidity ^0.4.24;

import "./ParticipantData.sol";

contract Bank is ParticipantData{

    address public bankAccount;

    event NewBankCreated(address theContractAddress, address theSenderAddress, uint timestamp);
    event BankDataPopulated(string name, address theAccount, address theContractAddress, address theSenderAddress, uint timestamp);

    constructor() public {
        emit NewBankCreated(this, msg.sender, now);
    }

    function isBank() pure public returns (bool){
        return true;
    }


    function populateBankData (address _bankAccount, string _name, string _localAddress) public {
        bankAccount = _bankAccount;
        participantName = _name;
        localAddress = _localAddress;
        isActive = true;

        emit BankDataPopulated(_name, _bankAccount, this, msg.sender, now);
    }


}