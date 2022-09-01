// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract EtherWallet {
    address payable public owner;
    event Log(uint amount, uint gas);
    
    constructor(){
         owner = payable(msg.sender);
    }

    function withDraw(uint amount) external{
        require(msg.sender == owner, "caller is not owner." );
        payable(msg.sender).transfer(amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

     receive() external payable{
        emit Log(msg.value, gasleft());
    }
}