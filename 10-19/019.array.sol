// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract Array {
    uint[] public nums = [1, 2, 3];
    uint[3] public numsFixed = [4, 5, 6];
    function examples() external {
        nums.push(4);
        uint x = nums[1];
        nums[2] = 777;
        delete nums[1]; // [1, 0, 777, 4]
        nums.pop(); // [1, 0, 777]
        uint len = nums.length;

        // create array in memory

        uint[] memory a = new uint[](5);
        a[1] = x;
        a[3] = len;
    }

    // the bigger the array the more gas it will use
    function returnArray() external view returns (uint[] memory) {
        return nums;
    }
}
