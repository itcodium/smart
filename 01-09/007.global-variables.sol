// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

// Global Variables: provides information about the blockchain

contract GlobalVariables   {
       function globalVars() external view returns (address, uint, uint) {
           address sender = msg.sender;
           uint timestamp = block.timestamp;
           uint blockNum = block.number;
           return (sender,timestamp, blockNum);
       }
}
