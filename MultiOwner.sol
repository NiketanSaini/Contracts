pragma solidity ^0.6.0;

import "https://github.com/NiketanSaini/Contracts/Owner.sol";

contract MultiOwner is Owner {
    
    event AddOwner(address indexed _permitBy, address indexed _who);
    event OwnerDel(address indexed _deleteBy, address indexed _who);
    
    mapping(address => bool) private ownership;
    
    constructor()public{
        ownership[msg.sender]= true;
        emit AddOwner(address(0),msg.sender);
    }
    
    function isOneOfTheOwner() public view returns(bool){
        return ownership[msg.sender];
    }
    
    function isOneOfTheOwner(address _own) public view returns(bool){
        return ownership[_own];
    }
    
    function OwnerAdd(address _own) public onlyOwner{
        ownership[_own]=true;
        emit AddOwner(msg.sender,_own);
    }
    
    function delOwner(address _own) public onlyOwner{
        ownership[_own]=false;
        emit OwnerDel(msg.sender,_own);
    }
}