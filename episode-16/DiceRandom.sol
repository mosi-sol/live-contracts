// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8;

contract Randomness {
    // for make rand beetwwen 1 to 6 , just salt = 6 (Dice)
    function randNum(uint _salt) external view returns(uint) {
    	return uint(
    		keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))
    		) % _salt + 1;
    }
}
