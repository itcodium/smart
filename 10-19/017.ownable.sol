// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract Ownable {
    address public owner;

    constructor ()  {
        owner = msg.sender;
    }    
    modifier onlyOwner(){
        require(msg.sender == owner, "not owner");
        _;
    }

    function setOwner(address _newOwner) external onlyOwner{
        require( _newOwner != address(0), "invalid adress");
        owner = _newOwner;
    }

    function onlyOwnerCanCall() external onlyOwner{
    }
    function anyOneCanCall() external {
    }
}