// SPDX-License-Identifier: MIT

pragma solidity 0.8;

contract Lottery {
    // state variables
    uint private players;
    uint private avaliblePlayers;

    address payable[] public bidder; // players
    address payable public dealer; // game manager

    uint256 public ask; // as wei
    uint256 public commision; // percent of loot
    uint256 public gameTableId; // default argument is zero

    mapping(uint => address payable) public winners; // iterate for history

    // init at deploy
    constructor (uint256 _ask, uint _players) {
        dealer = payable(msg.sender); // admin/owner/game manager(gm)
        ask = _ask; //set the table bid, using wei
        players = _players; // how much player need for start the game
        gameTableId = 0; // once time set
    }

    // events
    event Deposit(uint256 _value, uint256 _playerNumber, address indexed _newPlayer);
    event partFinish(uint256 indexed _tableId, address indexed _partWinner);
    event Commision(uint256 _amountPercent);

    // make error: just players can deposit by calling deposit function
    receive () external payable {
        revert();
    }

    // make error: just players can deposit by calling deposit function
    fallback () external payable {
        revert();
    }

    // use by players / value must equal the ask
    function deposit () external payable {
        require(msg.value == ask, "try to currect value");
        require(msg.sender != dealer, "play by rule");
        bidder.push(payable(msg.sender)); // players
        avaliblePlayers += 1;
        emit Deposit(msg.value, avaliblePlayers, msg.sender);
    }

    // dealer set the commision before start the game
    function setCommision(uint percent) external {
        require(dealer == msg.sender, "only dealer allow to set");
        commision = percent / 100;
        emit Commision(commision);
    }

    // return the conract balance
    function _balanceOf () private view returns (uint) {
        return address(this).balance;
    }

    function balanceOf() external view returns (uint x) {
        x = _balanceOf();   
    }

    // get who in bidder
    function bidders() external view returns (address payable[] memory) {
        return bidder;
    }

    // view history
    function history(uint gameId) external view returns (address payable) {
        return winners[gameId];
    }

    // unsafe random generator -> miners risk
    function _random() internal view returns (uint) {
        return uint(keccak256(abi.encodePacked(
            block.timestamp, bidder.length
        )));
    }

    // start the game by dealer account
    function pick () external {
        require(dealer == msg.sender, "only dealer allow to start the game");
        require(bidder.length >= players, "not enought players yet, wait for more comming");
        // address payable lootWinner;
        uint id = _random() % avaliblePlayers;
        bidder[id].transfer(address(this).balance); // -commision
        gameTableId += 1;
        winners[gameTableId] = bidder[id]; // save history of winners/gametable
        emit partFinish(gameTableId, winners[gameTableId]);
        // player counter & joined finished game leave
        avaliblePlayers = 0;
        bidder = new address payable[](0);
    }
}

// finish the game by using todo`s on your code
///@todo: winner value - commision percent => winner
///@todo: commision percent => dealer
///@todo: make reentrancy guard
///@todo: make modifier for require statments
///@todo: put the logic`s on other contract, then import here
///@todo: make random number by using oracle
///@todo: custom = make a cancel function before start the game for leaving players
