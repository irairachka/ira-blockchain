pragma solidity ^0.4.24;

import "./ParticipantData.sol";
import "./RoleUtils.sol";

contract Bank is ParticipantData, RoleUtils{

    address bankAccount;

    event NewBankCreated(bytes32 name, address theContractAddress, address theSenderAddress, uint timestamp);
    event BankDataPopulated(bytes32 name, address theContractAddress, address theSenderAddress, uint timestamp);

    constructor() public onlyAdmin{
        emit NewBankCreated(this.name, this, msg.sender, now);
    }

    function isBank() constant public returns (bool _isBank){
        return true;
    }


    function populateData (address _bankAccount, bytes32 _name, bytes32 _localAddress) public onlyAdmin{
        bankAccount = _bankAccount;
        name = _name;
        localAddress = _localAddress;
        isActive = true;

        emit BankDataPopulated(this.name, this, msg.sender, now);
    }


}