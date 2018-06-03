pragma solidity ^0.4.0;

import "./Ownable.sol";

contract UserRolesConfigurator  is Ownable{

    private address generalAdmin;

    struct User {
        address theAddress;
        string name;
        bool isActive;
    }

    constructor () public {
        generalAdmin = msg.sender;
        NewEnvironmentMakerCreated(admin.this, _name, msg.sender, _addr ,_name, block.timestamp);
    }

    function isAdmin(address _theAddress) return bool public {
        if (msg.sender == generalAdmin){
            return true;
        }

        return false;
    }

    mapping (address=>User) public environmentMakerGroupUsers;
    address[] usersByAddress; // this is like a whitepages of all users, by ethereum address

    event GeneralAdminCreated(address theAddress, bytes32 name, address theSenderAddress, uint timestamp);
    event NewEnvironmentMakerCreated(address theAddress, bytes32 name, address theSenderAddress, uint timestamp);


    function UserRolesConfigurator(address adminAddr , string adminName) {
        addOrUpdateAdmin(adminAddr, adminName);
    }

    function addNewEnvironmentMaker(address _userAddress , string _userName) onlyOwner public {

        // the user is not exist yet and the name not empty
        if(bytes(adminGroupUsers[_userAddress].name).length == 0 && bytes(_userName).length != 0){

            environmentMakerGroupUsers[_userAddress].theAddress = _userAddress;
            environmentMakerGroupUsers[_userAddress].name = _userName;
            environmentMakerGroupUsers[_userAddress].isActive = true;

            usersByAddress.push(_addr);
            NewEnvironmentMakerCreated(admin.this, _name, msg.sender, _addr ,_name, block.timestamp);
        }
    }

}
