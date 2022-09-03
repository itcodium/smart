// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract TestDelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

// keep variables order

contract DelegateCall {
    uint public num;
    address public sender;
    uint public value;
    function setVars(address _test, uint _num) external payable {
    /*  Same functionality
        (bool success, ) = _test.delegateCall(abi.encodeWithSignature("setVars(uint256)", _num));
    */
        (bool success, ) = _test.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setVars.selector,_num)
        );
        require(success, "delegateCall failed");

    }
}