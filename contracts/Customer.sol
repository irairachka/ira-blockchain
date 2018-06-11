pragma solidity ^0.4.24;

import "./ParticipantData.sol";


contract Customer is ParticipantData {


    address customerAccount;

    event NewCustomerCreated(address theContractAddress, address theSenderAddress, uint timestamp);
    event CustomerDataPopulated(bytes32 name, address _customerAccount, address theContractAddress, address theSenderAddress, uint timestamp);

    function isCustomer() pure public returns (bool){
        return true;
    }

    constructor() public {
        emit NewCustomerCreated(this, msg.sender, now);
    }



    function populateCustomerData (address _customerAccount, bytes32 _name, bytes32 _localAddress) public {
        customerAccount = _customerAccount;
        name = _name;
        localAddress = _localAddress;
        isActive = true;

        emit CustomerDataPopulated(_name, _customerAccount, this, msg.sender, now);
    }


}
