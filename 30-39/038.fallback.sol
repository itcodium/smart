// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

/*  Fallback: executes when 
    - function does't exists
    - Directly send ETH

    Ether is sent to contract

    is msg.data empty?
        Si: receive() exists?
                si: receive()   
                no: fallback()
        No: fallback()                  
*/

contract Fallback {
    event Log(string func, address sender, uint value, bytes data);
    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }
    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }

}
