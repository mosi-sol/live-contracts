// SPDX-License-Identifier: MIT

pragma solidity 0.8;

contract HashExample {
   function _hashName(string calldata NAME) private view returns (bytes16 x) {
        uint256 salt = block.timestamp + 15;
        x = bytes16(keccak256(abi.encodePacked(NAME, salt)));
    } 

    function hash(string calldata name) external view returns (bytes16) {
        return _hashName(name);
    }
}

// input: solidity     
// output: 0x11a37026c66de58f99cb8a2f34a31a78

