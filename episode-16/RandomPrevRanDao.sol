// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // <-- after version 0.8.18 using block.prevrandao. more safe!

contract Randomness {
    // for make rand beetwwen 1 to 6 , just salt = 6 (Dice)
    function randNum(uint _salt) external view returns(uint) {
    	return uint(
    		keccak256(abi.encodePacked(block.prevrandao, msg.sender))
    		) % _salt + 1;
    }
}
