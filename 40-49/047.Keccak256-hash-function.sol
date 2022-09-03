// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract HashFunc {
    function hash(string memory text, uint num, address addr) external pure returns (bytes32){
        return keccak256(abi.encodePacked(text, num, addr));
    }
   
    function encode(string memory text0, string memory text1) external pure returns (bytes memory){
        return abi.encode(text0, text1);
    }

    function encodePacked(string memory text0, string memory text1) external pure returns (bytes memory){
        return abi.encodePacked(text0, text1);
    }

    function collision(string memory text0, string memory text1) external pure returns (bytes32){
        return keccak256(abi.encodePacked(text0, text1));
    }
    function collisionNO(string memory text0,uint x, string memory text1) external pure returns (bytes32){
        return keccak256(abi.encodePacked(text0, x, text1));
    }
} 

/*
    1. hash:
        "AAA", 123, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    2. encode:
        "AAA", "BBB"
    3. encodePacked:
        "AAA", "BBB"
    4. collision
        "AAA", "ABBB" y "AAAA", "BBB"  input doesn't change
    5. collision
        "AAA", 0, "ABBB" y "AAAA", 0 , "BBB" 
*/