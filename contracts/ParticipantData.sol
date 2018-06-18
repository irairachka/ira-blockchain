pragma solidity ^0.4.24;


contract ParticipantData {

    string public participantName;
    string public localAddress;
    bool public isActive = false;

    function populateData (string _name, string _localAddress) public {
        participantName = _name;
        localAddress = _localAddress;
    }


    function getData() public view returns(string _name, string _localAddress, bool _isActive){
        _name = participantName;
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