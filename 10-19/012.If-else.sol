// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract IfElse {
    function example(uint x) external pure returns (uint) {
        if ( x < 10){
            return 1;
        } 
        if (x < 20){
            return 2;
        }else{
            return 3;
        }
    }
} 
