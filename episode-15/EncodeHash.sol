// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8;

contract EncodeSignatureKeccakBytes {
    function _hashName(string calldata NAME) external view returns (bytes16 x) {
        uint256 salt = block.timestamp + 15;
        x = bytes16(keccak256(bytes(abi.encodePacked(NAME, salt))));
    } 
}
contract EncodeSignatureKeccak {
    function _hashName(string calldata NAME) external view returns (bytes16 x) {
        uint256 salt = block.timestamp + 15;
        x = bytes16(keccak256(abi.encodePacked(NAME, salt)));
    } 
}
contract EncodeSignatureSha {
    function _hashName(string calldata NAME) external view returns (bytes16 x) {
        uint256 salt = block.timestamp + 15;
        x = bytes16(sha256(abi.encodePacked(NAME, salt)));
    } 
}

//  input: mosi
//  0xf798d356c7b2ddc5c963ef03ff0d1019
//  0xdb0aaa65fb9d87aa90729a0dce95583c
//  0xae4b019d1780f82346144cd121cd9dd4
