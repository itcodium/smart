// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract S {
    string public name;
    constructor(string memory value){
        name = value;
    }
}

contract T {
    string public text;
    constructor(string memory value){
        text = value;
    }
}

contract U is S("s"), T("t") {
    constructor(string memory value){
        text = value;
    }
}

contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text){
    }
}