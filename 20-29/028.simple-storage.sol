// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract SimpleStorage {
    string public text; // Gas = 24.465 - 28758
    function set(string calldata value) external {
        text = value;
    }
    
    function get() // Gas = 24.517 - 28810
        external 
        view 
        returns 
    (string memory) {
        // solidity copy text into memory then return the value;
        return text;
    }
}

