// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract FunctionOutputs {
    function returnMany() public pure returns (uint, bool) {
        return (1, true);
    }
    function named() public pure returns (uint x, bool b) {
        return (1, true);
    }
    function assinged() public pure returns (uint x, bool b) {
        x = 1;
        b = true;
    }

    function destructingAssingments() public pure {
        (uint x, bool b) = returnMany();
    }
}