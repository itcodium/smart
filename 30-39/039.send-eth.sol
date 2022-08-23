// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

/*  Three ways to send Ether
    - transfer - 2300 gas revert
    - send 2300 gas, returns bool
    - call - all gas - retruns bool and data
*/

contract SendEther {

    constructor() payable {}
    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123);
        require(sent, "sent failed");
    }

    // lower gas
    function sendViaCall(address payable _to) external payable {
        (bool success, ) =_to.call{ value: 123} ("");
        require(success, "sent failed");
    }
}


contract EtherReceiver {
    event Log(uint amount, uint gas);
    receive() external payable{
        emit Log(msg.value, gasleft());
    }

}