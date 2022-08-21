// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

// Function Modifier: reuse code before and/or after function
// Basic, inputs, sandwich

contract FunctionModifier {
    bool public paused;
    uint public count;

    function setPaused(bool value) external {
        paused = value;
    }   
    modifier whenNotPaused(){
        require(!paused, "paused");
        _;
    }

    function inc() external whenNotPaused{
        // require(!paused, "paused");
        count += 1;
    }   
    function dec() external whenNotPaused{
        // require(!paused, "paused"); 
        count -= 1;
    }

    modifier cap(uint value){
        require(value < 100, "value > 100");
        _;
    }

    function incBy(uint value) external whenNotPaused cap(value){
        count += value;
    }    

    modifier sandwich(){
        count += 10; // first
        _;
        count *= 2;  // third
    }
    function foo() external sandwich {
        count += 1; // second
    }
}