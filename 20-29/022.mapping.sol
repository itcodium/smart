// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;
// Mapping
// Set, get, delete

// ["alice", "bob","charlie"]
// {"alice": true, "bob": true,"charlie": true }

contract Mapping {
    mapping(address => uint) public balances;
    mapping(address =>  mapping(address => bool)) public isFriend;
    function examples() external {
        balances[msg.sender] = 123;
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)];

        balances[msg.sender] = bal2 + bal;
        balances[address(1)] = bal2 + bal;

        delete balances[msg.sender];
        isFriend[msg.sender][address(this)] = true;
    }    

}
