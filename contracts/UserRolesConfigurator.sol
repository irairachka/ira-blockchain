pragma solidity ^0.4.0;

import "./Ownable.sol";

contract UserRolesConfigurator  is Ownable{

    address private generalAdmin;

    struct User {
        address theAddress;
        bytes32 name;
        bool isActive;
    }

    constructor () public {
        generalAdmin = msg.sender;
        emit GeneralAdminCreated(msg.sender, block.timestamp);
    }

    function isAdmin(address _theAddress) public view returns(bool _isAdmin){
        if (_theAddress == generalAdmin){
            _isAdmin = true;
        }

        _isAdmin = false;
    }

    mapping (address=>User) public environmentMakerGroupUsers;
    address[] usersByAddress; // this is like a whitepages of all users, by ethereum address

    event GeneralAdminCreated(address theSenderAddress, uint timestamp);
    event NewEnvironmentMakerCreated(address theAddress, bytes32 name, address theSenderAddress, uint timestamp);


    function addNewEnvironmentMaker(address _userAddress , bytes32 _userName) onlyOwner public {

        // the user is not exist yet and the name not empty
        if(bytes32(environmentMakerGroupUsers[_userAddress].name).length == 0 && bytes32(_userName).length != 0){

            environmentMakerGroupUsers[_userAddress].theAddress = _userAddress;
            environmentMakerGroupUsers[_userAddress].name = _userName;
            environmentMakerGroupUsers[_userAddress].isActive = true;

            usersByAddress.push(_userAddress);
            emit NewEnvironmentMakerCreated(_userAddress, _userName, msg.sender, block.timestamp);
        }
    }

}
