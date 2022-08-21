// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract Enum {
    enum Status{
        None,           // index 0
        Pending,        // index 1
        Shipped,        // index 2
        Completed,      // index 3
        Rejected,       // index 4
        Canceled        // index 5
    }

    Status public status;
    
    struct Order {
        address buyer;
        Status status;
    }
    Order[] public orders;

    function get() view external returns (Status) {
        return status;
    }
     function set(Status _status) external {
        status = _status;
    }

    function shio() external {
        status = Status.Shipped;
    }

    function reset() external {
        delete status;
    }
}
