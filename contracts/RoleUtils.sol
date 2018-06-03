pragma solidity ^0.4.0;

import "./UserRolesConfigurator.sol";

contract RoleUtils is UserRolesConfigurator{


    modifier onlyAdmin() {
        if (isAdmin(msg.sender))
            _;
    }


    modifier environmentMakerOnly() {
        if (environmentMakerGroupUsers[msg.sender].name == 0) _;
    }

}
