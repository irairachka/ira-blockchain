pragma solidity ^0.4.24;


contract ParticipantData {

    bytes32 public name;
    bytes32 public localAddress;
    bool public isActive;

    constructor (bytes32 _name, bytes32 _localAddress) internal {
        name = _name;
        localAddress = _localAddress;
        isActive = false;
    }


    function getData() public view returns(string _name, string _localAddress, bool _isActive){
        _name = name;
        _localAddress = localAddress;
        _isActive = isActive;
    }

    function deactivate() public {
        isActive = false;
    }

    function activate() public {
        isActive = true;
    }
}