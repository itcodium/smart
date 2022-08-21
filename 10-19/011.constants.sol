// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract Constants {
    uint public constant MY_UINT = 123; // 	21371 gas 
    address public constant MY_ADDRESS = 0x0000000000000000000000000000000000000000;   // 21442 gas
    address public MY_ADDRESS2 = 0x2000000000000000000000000000000000000002;  // Gas = 23553
} 