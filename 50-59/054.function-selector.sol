// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
// https://www.youtube.com/watch?v=Mn4e4w8h6n8&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=54
pragma solidity ^0.8.13;

contract Receiver {
    event Log(bytes data);
    function transfer(address _to, uint _amount) external {
         emit Log(msg.data);
    }
}

contract FunctionSelector {
    function getSelector(string calldata _func) external pure returns(bytes4){
        return bytes4(keccak256(bytes(_func)));
    }
}


/*
1. Deploy the contract
2. copy the address and pass it to function transfer + amount
3. copy data: 

    0xa9059cbb0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4000000000000000000000000000000000000000000000000000000000000000b
    function to call: 0xa9059cbb
    parameter 1: 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc
    parameter 2: 4000000000000000000000000000000000000000000000000000000000000000b

4. deploy contract FunctionSelector
5. call getSelector
    params: "transfer(address, uint256)"
6. result: 0xa9059cbb


 */