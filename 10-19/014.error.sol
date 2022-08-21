// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

// require, revert, assert
// -gas refund, state updates are reverted
// custom error - save gas

contract FunctionIntro {
    function testRequired(uint i) public pure {
        require( i<=10, " i > 10");
    }

    function testRevert(uint i) public pure {
        if ( i > 10){
            revert(" i > 10");
        }
    }

    uint public num = 123;
    function testAssert() public view {
        assert (num == 123);
    }

    function foo() public {
        num += 1;
    }

    function fa(uint i) public {
        num += 1;
        require( i<=10); // if i> 10 changes in variable num will be undone
    }

    function testError(uint i) public pure {
        // the longer the message more gas it is used
        require( i < 10, " i > 10 long long long long long long long long error error error error error error error");
    }

    error MyError(address caller, uint i);
    function testCustomError(uint i) public view {
         if ( i > 10){
             revert MyError(msg.sender, i);
            
        }
        
    }
}