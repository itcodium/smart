// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract Constructor {
    uint public x;
    address public owner;

    constructor (uint _x)  {
        owner = msg.sender;
        x = _x;
    }    
}