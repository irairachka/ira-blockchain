pragma solidity ^0.4.0;

import "./UserRolesConfigurator.sol";

contract RoleUtils is UserRolesConfigurator{


    function isAdminInternal(address _theAddress) internal view returns(bool _isAdmin){

        if (_theAddress == generalAdmin){
            _isAdmin = true;
        }else{
            _isAdmin = false;
        }
    }


    function isAdmin(address _theAddress) public view returns(bool _isAdmin){
        return isAdminInternal(_theAddress);
    }

    function isEnvironmentMaker(address _theAddress) public view returns(bool _isEnvironmentMaker){

        if (!isAdminInternal(_theAddress) && bytes32(environmentMakerGroupUsers[_theAddress].name).length == 0){
            _isEnvironmentMaker = false;
        }else{
            _isEnvironmentMaker = true;
        }
    }


}
