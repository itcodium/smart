// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
// https://www.youtube.com/watch?v=ajCsPRl5S3Q&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=50
pragma solidity ^0.8.13;

// 1. anyone would be a able to send eth to this contract 
// the owner would be able to widhtdraw from this contract

contract PiggyBank {
    address public owner;
    event Deposit(uint amount);
    event Withdraw(uint amount);

    receive() external payable{
        emit Deposit(msg.value);
    }
    
    function withdraw() external {
        require(msg.sender == owner, "No owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
        
    } 
}

/*

1. Deploy de contract
2. Send eth to the contract calling: low level interactions
    - select Ether
    - set value = 1    
    - switch account to another. (not the owner)
    - click transact
    - call withdraw, result = error (is not the owner)

3. switch back to the owner account
    - call withdraw, result = ok
4. finally the contract is deleted from the blockchain



*/