pragma solidity ^0.6.0;

contract Owner{
    
    address private _owner;
    
    event MoveOwnership(address indexed prevOwner, address indexed newowner);
    
    constructor () public{
        _owner = msg.sender;
        emit MoveOwnership(address(0),_owner);
    }
    
    function whoIsOwner() public view returns(address){
        return _owner;
    }
    
    function isOwner() public view returns(bool){
        if(_owner == msg.sender){
            return true;
        }
        else{
            return false;
        }
    } 
    
    function isOwner(address _own) public view returns(bool){
        if(_owner == _own){
            return true;
        }
        else{
            return false;
        }
    } 
    modifier onlyOwner(){
        require(_owner == msg.sender,"Only owner can call");
        _;
    }
    
    function ownershipTransfer(address _newaddress) public onlyOwner{
        emit MoveOwnership(_owner,_newaddress);
        _owner = _newaddress;
    }
}