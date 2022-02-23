// SPDX-License-Identifier: MIT

pragma solidity 0.8;
// when & why owner would be payable
// 5 minute in solidity series

contract EasyDonation {
    
    // declare an address
    address payable owner;
    
    // init that address
    constructor() {
        owner = payable(msg.sender);
    }

    // pay to that address
    // value in gwei (1e-18 eth)
    function buyMeACafee() external payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success);
    }

}
