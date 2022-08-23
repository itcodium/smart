// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract Payable {
    address payable public owner;

    constructor(){
         owner = payable(msg.sender);
    }
    function deposit() external payable{
        
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}