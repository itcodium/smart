// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract VisibilityBase{
    uint private x = 0;
    uint internal y = 1;
    uint public z = 2;
    // only inside contract
    function pri() private pure returns (uint){    
        return 0;
    }

    // only inside contract and child contracts
    function inter() internal pure returns (uint) { 
        return 100;
    }

    // inside and outside contract
    function pub() public pure returns (uint) {     
        return 200;
    }
    // only from outside contract
    function ext() external pure returns (uint) {   
        return 300;
    }

    function examples() external view {
        x + y + z;
        pri();
        inter();
        pub();
        this.ext();
    }
}


contract VisibilityChild is VisibilityBase {
    
    function examples2() external view {   
        y + z;
        inter();
        pub();
        this.ext();
    }
}