// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract Struct {
    struct Car{
        string model;
        uint year;
        address owner;
    }

     Car public car;
     Car[] public cars;
     mapping(address => Car[]) public carsByOwner;

     function examples() external {
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        Car memory lambo = Car({ year: 1990, model: "Lamborghini", owner: msg.sender });
         
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);
        cars.push(Car("Ferrari", 2020, msg.sender));

        Car memory _car = cars[0];
        _car.year++;

        //  storage: update variable inside contract are saved
        Car storage _scar = cars[0];
        _scar.year = 1999;
        delete _scar.owner; // set value to default
        delete cars[1];
     }
     
}
