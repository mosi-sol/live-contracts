// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8;

// make a CRUD app
contract UserConfig {
    // config user arguments
    struct User {
        uint256 id;     // user id
        uint256 join;   // date of join
        uint256 expire; // date of expire
        address who;    // customer address
        uint8 level;    // level in community (ranking)
    }
    // users storage
    User[] private users;
    // set id for users for init
    uint256 ID = 0;
    // contract manager
    address private admin;

    // initializing smartcontract
    constructor() {
        admin = msg.sender;
    }

    // validate the manager
    modifier onlyAdmin() {
        require(msg.sender == admin, "you are not valid to run action");
        _;
    }

    // event setup
    event NewUser(uint256 id, address who, uint256 join);
    event LevelUp(uint256 id, address who, uint8 level);
    event Again(uint256 id, address who, uint256 expire);

    // CREATE : new user
    function newUser(address _user) public onlyAdmin {
        ID += 1;
        users.push(User({
             id: ID,
             who: _user,
             join: block.timestamp,
             expire: block.timestamp + (60*60*24*7*365),
             level: 0
        }));
        emit NewUser(ID, _user, block.timestamp);
    }

    // UPDAE : setup new level to user from community
    function levelUp(uint256 _id, uint8 _level) public onlyAdmin {
        users[_id].level = _level;
        emit LevelUp(_id, users[_id].who, _level);
    }

    // UPDATE : refresh expie time of user
    function again(uint256 _id) public onlyAdmin {
        if(users[_id].expire > block.timestamp) {
            users[_id].join = block.timestamp;
            users[_id].expire = block.timestamp + (60*60*24*7*365);
            emit Again(_id, users[_id].who, users[_id].expire);
        }
        else {
            revert("not expire date yet");
        }
    }

    // READ : find important values of an user
    function who(uint256 _id) public view onlyAdmin returns (address, uint256, uint256, uint8) {
        return (users[_id].who, users[_id].join, users[_id].expire, users[_id].level);
    }

    // DELETE : remove a user from db
    function remove(uint256 _id) public onlyAdmin {
        delete users[_id];
    }
}
