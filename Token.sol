pragma solidity ^0.6.0;

contract ERC20Interface {

    uint public supply;
    address public founder;
    
    mapping(address => uint) public balances;
    
    event Transfer(address indexed from, address indexed to, uint tokens);


    constructor() public{
        supply = 300000000000000000000000;
        founder = msg.sender;
        balances[founder] = supply;
    }
   function totalSupply() public view returns (uint){
        return supply;
    }
    
    function balanceOf(address tokenOwner) public view returns (uint balance){
         return balances[tokenOwner];
     }
     
    //transfer from the owner balance to another address
    function transfer(address to, uint tokens) public returns (bool success){
         require(balances[msg.sender] >= tokens && tokens > 0);
         
         balances[to] += tokens;
         balances[msg.sender] -= tokens;
         emit Transfer(msg.sender, to, tokens);
         return true;
     }
    
}



