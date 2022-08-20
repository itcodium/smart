// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

// State Variables: save on the block chain

contract StateVariables {
    uint public myUint = 123;
    function foo() external pure returns (uint) {
        uint notStableVariable = 456;            
        return notStableVariable;
    }
}
