// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
// https://www.youtube.com/watch?v=ajCsPRl5S3Q&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=50
pragma solidity ^0.8.13;

contract Kill {
    address payable public owner;
    
    function kill() external {
        selfdestruct(payable(msg.sender));
        
    } 
    function testCall() external pure returns (uint){
        return 123;
    }
  
}


contract Helper{
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    function kill(Kill _kill) external{
        _kill.kill();
    }
}