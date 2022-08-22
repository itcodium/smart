// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract DataLocations {
    struct MyStruct{
        uint foo;
        string text;
    }
    mapping(address => MyStruct) public myStructs;

    function examples(uint[] calldata y, string calldata s ) external returns (uint[] memory ) {
        myStructs[msg.sender] = MyStruct({ foo: 123, text: "bar" });
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        MyStruct memory myStructReadOnly = myStructs[msg.sender];
        myStructReadOnly.foo = 456;  // after the function is executed this value doesn't exists      
        myStructReadOnly.text = s;

        _internal(y);

        uint[] memory arr = new uint[](3);
        arr[0] = 789;
        return arr;
        
    }

    function _internal(uint[] calldata y) private pure {
        uint x = y[0];
        x++;
    }
}
 
