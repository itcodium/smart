// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract ValueTypes {
    bool public b = true;
    uint public u = 123; // unit = uint256 to 2**256-1
    int public i = -123; // int = int256 to -2**255 to 2**256-1
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = 0xe5CBacF682c2BCF0d77351cC9e78176438aeB2e5;
    bytes32 public b32 = 0xe5CBacF682c2BCF0d77351cC9e78176438aeB2e5000000000000000061626364;

}
