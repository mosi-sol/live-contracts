// SPDX-License-Identifier: MIT

pragma solidity 0.8;

contract Lottery {
    address payable[] public bidder;
    address payable public dealer;

    uint256 public ask; // as wei
    uint256 public commision; 
    uint private players;

    constructor (uint256 _ask, uint _players) {
        dealer = payable(msg.sender);
        ask = _ask;
        players = _players;
    }

    receive () external payable {
        revert();
    }

    fallback () external payable {
        revert();
    }

    function deposit () external payable {
        require(msg.value == ask, "try to currect value");
        require(msg.sender != dealer, "play by rule");
        bidder.push(payable(msg.sender));
    }

    // return the conract balance
    function _balanceOf () private view returns (uint) {
        return address(this).balance;
    }

    function balanceOf() external view returns (uint x) {
        x = _balanceOf();
    }

    // unsafe random generator -> miners risk
    function _random() internal view returns (uint) {
        return uint(keccak256(abi.encodePacked(
            block.timestamp, bidder.length
        )));
    }

    function pick () external {
        require(dealer == msg.sender, "only dealer allow to start the game");
        require(bidder.length >= players, "not enought players yet, wait for more comming");
        address payable lootWinner;
        lootWinner = bidder[_random() % bidder.length];
        bidder = new address payable[](0);
        // @Todo: send (value - commision) to the winner -> method: tranfer
    }
}
