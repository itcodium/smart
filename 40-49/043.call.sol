// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract TestCall {
    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log("fallback was called");
    }

    function foo(
        string memory _message, uint _x ) external payable returns (bool, uint) {
        message = _message;
        x = _x;
        return (true, 888);
    }

    receive() external payable{
        emit Log("Test receive");
    }
}

contract Call {
    bytes public data;
    function CallFoo(address _test) external payable{
        (bool success, bytes memory _data) = _test.call{value: 111, gas: 5000}(abi.encodeWithSignature(
            "foo(string, uint256)", "call foo", 123
        ));
        require(success, "call failed");
        data = _data;
    }

    function callDoesNotExist(address _test) external {
        (bool success, ) = _test.call(abi.encodeWithSignature("doesNotExists(string, uint256)"));
        require(success, "call failed");
    }
}