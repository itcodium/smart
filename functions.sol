// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

// pure = read only
// external = 
contract FunctionIntro {
    function add(uint x, uint y) external pure returns (uint){
        return x + y;
    }
    function sub(uint x, uint y) external pure returns (uint){
        return x - y;
    }
}