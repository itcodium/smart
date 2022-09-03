// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract Account {
    address public bank;
    address public owner;
    
    constructor(address _owner) payable{
         bank = msg.sender;
         owner = _owner;
    }
   
}

contract AccountFactory {
    Account[] public accounts;
    function createAccount(address _owner) external payable{
        Account account = new Account{value: 111}(_owner);
        accounts.push(account);
    }
}

// 1. Deploy AccountFactory
// 2. Copy account address
// 3. createAccount, paste account address
// 4. add value: 200 wei
// 5. call createAccount
// 6. get account created address: call accounts, value =0  (accounts[0]) 
// 7 Copy address, select Account contract
// 8 Get account deploy at the selected address
