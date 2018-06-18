pragma solidity ^0.4.24;

import "./ParticipantData.sol";


contract Customer is ParticipantData {


    address customerAccount;

    event NewCustomerCreated(address theContractAddress, address theSenderAddress, uint timestamp);
    event CustomerDataPopulated(string name, address theAccount, address theContractAddress, address theSenderAddress, uint timestamp);

    function isCustomer() pure public returns (bool){
        return true;
    }

    constructor() public {
        emit NewCustomerCreated(this, msg.sender, now);
    }



    function populateCustomerData (address _customerAccount, string _name, string _localAddress) public {
        customerAccount = _customerAccount;
        participantName = _name;
        localAddress = _localAddress;
        isActive = true;

        emit CustomerDataPopulated(_name, _customerAccount, this, msg.sender, now);
    }


}
