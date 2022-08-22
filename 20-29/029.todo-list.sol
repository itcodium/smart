// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.13 and less than 0.9.0
pragma solidity ^0.8.13;

contract TodoList {
    struct Todo{
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata value) external {
        todos.push(Todo({ 
            text: value, 
            completed: false
        }));
    }
    function update(string calldata value, uint index) external {
        // Todo storage todo = todos[index];
        // todo.text = value; // x4 = 37.488
        todos[index].text = value; // x4 = 38.160
    }

    function get(uint index) external view returns (string memory, bool)  {
        Todo memory todo = todos[index];
        return (todo.text, todo.completed);
    }

    function toggleCompleted(uint index) external{
        todos[index].completed = !todos[index].completed;
    }
}

