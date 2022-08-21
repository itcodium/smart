// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract ForAndWhileLoops {
    function loops() external pure {
        for(uint i = 0; i<10; i++){
            // code
            if (i == 3){
                continue; // goes from here to the next loop
            }
            // more code
            if (i == 5){
                break;
            }
        }

        uint j = 0;
        while (j < 10) {
            // code
            j++;
        }
    }

    function sum(uint n) external pure returns (uint) {
        uint s;
        for(uint i = 0; i<=n; i++){
            s += i;
        }
        return s;
    }
}