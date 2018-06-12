pragma solidity ^0.4.24;

import "./Ownable.sol";

contract UserRolesConfigurator  is Ownable{

    address internal generalAdmin;

    struct User {
        address theAddress;
        bytes32 name;
        bool isActive;
    }

    event GeneralAdminCreated(string theMessage, address theAccount, address theContractAddress, address theSenderAddress, uint timestamp);

    constructor () public {
        generalAdmin = 0x5aeda56215b167893e80b4fe645ba6d5bab767de;
        emit GeneralAdminCreated("General Admin is created", generalAdmin, this, msg.sender, now);
    }


    mapping (address=>User) public environmentMakerGroupUsers;
    address[] usersByAddress; // this is like a whitepages of all users, by ethereum address


    event NewEnvironmentMakerCreated(string theMessage, bytes32 userName, address theUserAddress, address theSenderAddress, uint timestamp);

    function addNewEnvironmentMaker(address _userAddress , bytes32 _userName) onlyOwner public {

        // the user is not exist yet and the name not empty
        if(bytes32(environmentMakerGroupUsers[_userAddress].name).length == 0 && bytes32(_userName).length != 0){

            environmentMakerGroupUsers[_userAddress].theAddress = _userAddress;
            environmentMakerGroupUsers[_userAddress].name = _userName;
            environmentMakerGroupUsers[_userAddress].isActive = true;

            usersByAddress.push(_userAddress);
            emit NewEnvironmentMakerCreated("New EnvironmentMaker is created", _userName, _userAddress, msg.sender, now);
        }
    }

}
