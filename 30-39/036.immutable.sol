// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract Immutable {
    address public immutable owner = msg.sender;
    uint public x;
    function foo() external {
        require(msg.sender == owner);
        x += 1;
    }
}