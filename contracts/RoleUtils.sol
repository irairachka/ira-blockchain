pragma solidity ^0.4.0;

import "./UserRolesConfigurator.sol";

contract RoleUtils is UserRolesConfigurator{


    function isAdmin(address _theAddress) public view returns(bool _isAdmin){

        if (_theAddress == generalAdmin){
            _isAdmin = true;
        }else{
            _isAdmin = false;
        }
    }


    function isEnvironmentMaker(address _theAddress) public view returns(bool _isEnvironmentMaker){

        if (!isAdmin(_theAddress) && bytes32(environmentMakerGroupUsers[_theAddress].name).length == 0){
            _isEnvironmentMaker = false;
        }else{
            _isEnvironmentMaker = true;
        }
    }


}
