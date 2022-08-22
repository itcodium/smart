// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract Event {
    event Log(string message, uint val);
    event IndexedLog(address indexed sender, uint val);

    function example() external {
        emit Log("foo", 1234);
        emit IndexedLog(msg.sender, 789);
    }
    
    event Message(address indexed _from, address indexed _to, string message);
    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}

