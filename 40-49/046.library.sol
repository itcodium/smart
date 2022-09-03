// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

library Math {
    function max(uint x, uint y) internal pure returns (uint){
        return x >= y ? x : y;
    }
}
library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint){
        for(uint i=0; i< arr.length; i++) {
            if (arr[i]==x) {
                return i;
            }
        }
        revert("Not found");
    }
}

contract Test {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

contract TestArray {
    using ArrayLib for uint[];
    uint[] public arr = [3, 2, 1];

    function testFind() external view returns (uint i) {
    //  return ArrayLib.find(arr, 2); // without using ArrayLib
        return arr.find(2);           // with using ArrayLib
    }
}