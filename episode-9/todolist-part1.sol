// SPDX-License-Identifier: MIT

pragma solidity 0.8;

// todolist by rules & terms conditions -- live video at 20Feb 2022
contract TodoList {
    struct Todo {
        uint256 id;
        string text;
        Status state;
        uint256 date;
    }
    Todo[] public todos;

    uint256 ID = 1;

    enum Status {
        START,
        REVIEW,
        FINISH
    }
    Status public status; 

    mapping (address => uint256) public creator;
    address public owner;
    string private dappName;

    constructor (string memory _name) {
        dappName = _name;
        owner = msg.sender;
        status = Status.FINISH;
    }

    modifier editor() {
        require(msg.sender == owner, "you are not editor");
        _;
    }

    modifier started(uint _pos) {
        if(_pos == 0) {
            require(status == Status.START, "need to START progress");
        }
        else if(_pos == 1) {
            require(status == Status.REVIEW, "need to REVIEW progress");
        }
        else if(_pos == 2) {
            require(status == Status.FINISH, "need to FINISH progress");
        }
        else {
            revert("0=START, 1=REVIEW, 2=FINISH, nothing else");
        }
         _;
    }


    function add(string calldata _content) external {
        status = Status.START;
        todos.push(Todo({
            id: ID,
            text: _content,
            state: status,
            date: block.timestamp
        }));
        ID += 1;
    }
    
    function get(uint256 _index) external view returns (uint256, string memory, Status, uint256) {
        Todo memory todo = todos[_index];
        return (todo.id, todo.text, todo.state, todo.date);
    }
    
    function modifyText(uint256 _index, string calldata _content) external started(0) {
        todos[_index].text = _content;
    }
    
    function modifyStatus(uint256 _index, Status _pos) external editor {
        todos[_index].state = _pos;
    }
}
